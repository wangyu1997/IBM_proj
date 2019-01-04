package edu.scu.my_shop.service;

import edu.scu.my_shop.dao.CartMapper;
import edu.scu.my_shop.dao.ProductMapper;
import edu.scu.my_shop.dao.UserMapper;
import edu.scu.my_shop.entity.Cart;
import edu.scu.my_shop.entity.CartExample;
import edu.scu.my_shop.entity.Product;
import edu.scu.my_shop.entity.User;
import edu.scu.my_shop.exception.CartException;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

import static edu.scu.my_shop.entity.CartExample.Criteria;
import static edu.scu.my_shop.exception.CartException.*;

@Service
public class CartService {

    private final SqlSessionFactory sqlSessionFactory;

    @Autowired
    public CartService(SqlSessionFactory sqlSessionFactory) {
        this.sqlSessionFactory = sqlSessionFactory;
    }

    /**
     * 函数会检查所有参数是否为空
     * 若为空，则不合法
     * 用户必须可以在database中被找到
     *
     * @param user 用户
     */
    private void checkParams(User user) {
        // 数据验证
        if (user == null) {
            throw new CartException(USER_EMPTY_MESSAGE, USER_EMPTY);
        }

        SqlSession sqlSession = sqlSessionFactory.openSession();
        UserMapper userMapper = sqlSession.getMapper(UserMapper.class);

        // 检查用户是否合法
        String userID = user.getUserId();
        if (userID == null || userID.equals("")) {
            sqlSession.close();
            throw new CartException(USER_EMPTY_MESSAGE, USER_EMPTY);
        }
        User userInDB = userMapper.selectByPrimaryKey(userID);
        if (userInDB == null) {
            sqlSession.close();
            throw new CartException(USER_EMPTY_MESSAGE, USER_EMPTY);
        }

        sqlSession.close();
    }

    /**
     * 检查用户和商品id是否为空
     * 用户在数据库中必须存在👎商品id不为空
     *
     * @param user          用户
     * @param productIDList 商品id列表
     */
    private void checkParams(User user, List<String> productIDList) {
        checkParams(user);

        if (productIDList == null) {
            throw new CartException(PRODUCT_EMPTY_MESSAGE, PRODUCT_EMPTY);
        }
    }

    /**
     * 检查用户和商品id是否为空
     * 用户在数据库中必须存在👎商品id不为空
     * 若商品id数量不等于购买数量 则报错
     *
     * @param user          用户
     * @param productIDList 商品id列表
     * @param numberList    加入购物车数量
     */
    private void checkParams(User user, List<String> productIDList, List<Integer> numberList) {
        checkParams(user, productIDList);

        if (numberList == null) {
            throw new CartException(NUMBMER_EMPTY_MESSAGE, NUMBER_EMPTY);
        }
        if (productIDList.size() != numberList.size()) {
            throw new CartException(PRODUCT_NUMBER_NOT_MATCH_MESSAGE, PRODUCT_NUMBER_NOT_MATCH);
        }
    }

    /**
     * 向购物车中加入一定数量的商品
     *
     * @param user          用户
     * @param productIDList 商品id列表
     * @param numberList    购买数量列表
     */
    @Transactional
    public void insertProducts(User user, List<String> productIDList, List<Integer> numberList) {

        checkParams(user, productIDList, numberList);

        String userID = user.getUserId();
        SqlSession sqlSession = sqlSessionFactory.openSession();
        ProductMapper productMapper = sqlSession.getMapper(ProductMapper.class);
        CartMapper cartMapper = sqlSession.getMapper(CartMapper.class);

        //  更新数据库操作
        for (int i = 0; i < productIDList.size(); i++) {
            String productID = productIDList.get(i);
            Integer number = numberList.get(i);

            // 如果商品id为空，则忽略
            if (productID == null || number == null || productID.equals("")) {
                continue;
            }
            Product product = productMapper.selectByPrimaryKey(productID);
            if (product == null) continue;
            if (number == 0) continue;

            // 如果库存不够 则报错
            if (product.getProductLeftTotals() < number) {
                sqlSession.close();
                // TODO: throw exception OR return error message?
                throw new CartException(NO_MORE_PRODUCT_MESSAGE, NO_MORE_PRODUCT);
            }

            // 检查商品是否存咋
            CartExample cartExample = new CartExample();
            Criteria criteria = cartExample.createCriteria();
            criteria.andUserIdEqualTo(userID).andProductIdEqualTo(productID);
            List<Cart> productInCart = cartMapper.selectByExample(cartExample);

            // 如果商品存在购物车中
            if (productInCart != null && !productInCart.isEmpty()) {
                // 如果购物车中相同的商品出现一次以上，则报错
                if (productInCart.size() != 1) {
                    sqlSession.close();
                    throw new CartException(DUPLICATE_SAME_PRODUCT_MESSAGE, DUPLICATE_SAME_PRODUCT);
                }
                // 更新商品
                Cart cartToUpdate = productInCart.get(0);
                Integer originNumber = cartToUpdate.getTotals();
                cartToUpdate.setTotals(originNumber + number);
                cartMapper.updateByExample(cartToUpdate, cartExample);
            }
            // 如果商品不存在购物车
            else {
                // 购物车中插入商品
                Cart cartToInsert = new Cart();
                cartToInsert.setTotals(number);
                cartToInsert.setUserId(userID);
                cartToInsert.setProductId(productID);
                cartMapper.insertSelective(cartToInsert);
            }
        }

        sqlSession.close();
    }

    /**
     * 更新购物车商品
     *
     * @param user          用户
     * @param productIDList 商品id
     * @param numberList    对应的购买数量
     */
    @Transactional
    public void updateProducts(User user, List<String> productIDList, List<Integer> numberList) {

        checkParams(user, productIDList, numberList);

        String userID = user.getUserId();
        SqlSession sqlSession = sqlSessionFactory.openSession();
        ProductMapper productMapper = sqlSession.getMapper(ProductMapper.class);
        CartMapper cartMapper = sqlSession.getMapper(CartMapper.class);

        // 更新数据库
        for (int i = 0; i < productIDList.size(); i++) {
            String productID = productIDList.get(i);
            Integer number = numberList.get(i);

            // 如果商品为空 则忽略
            if (productID == null || number == null || productID.equals("")) {
                continue;
            }
            Product product = productMapper.selectByPrimaryKey(productID);
            if (product == null) continue;

            // 检查库存是够满足
            if (product.getProductLeftTotals() < number) {
                sqlSession.close();
                throw new CartException(NO_MORE_PRODUCT_MESSAGE, NO_MORE_PRODUCT);
            }

            // 检查购买数量是否合理
            if (number <= 0) {
                sqlSession.close();
                throw new CartException(WRONG_PRODUCT_NUMBER_MESSAGE, WRONG_PRODUCT_NUMBER);
            }

            // 更新数据
            Cart cart = new Cart();
            cart.setProductId(productID);
            cart.setUserId(user.getUserId());
            cart.setTotals(number);
            CartExample cartExample = new CartExample();
            Criteria criteria = cartExample.createCriteria();
            criteria.andProductIdEqualTo(productID).andUserIdEqualTo(userID);
            cartMapper.updateByExample(cart, cartExample);
        }

        sqlSession.close();
    }

    /**
     * 删除购物车信息
     *
     * @param user          用户
     * @param productIDList 商品id列表
     */
    @Transactional
    public void deleteProducts(User user, List<String> productIDList) {
        // 检查合法性
        checkParams(user, productIDList);

        String userID = user.getUserId();
        SqlSession sqlSession = sqlSessionFactory.openSession();
        CartMapper cartMapper = sqlSession.getMapper(CartMapper.class);

        for (String productID : productIDList) {
            CartExample cartExample = new CartExample();
            Criteria criteria = cartExample.createCriteria();
            criteria.andUserIdEqualTo(userID).andProductIdEqualTo(productID);
            cartMapper.deleteByExample(cartExample);
        }

        sqlSession.close();
    }

    /**
     * 获取用户购物车信息
     *
     * @param user 用户
     * @return 购物车中所有的商品
     */
    @Transactional
    public List<Product> getAllProducts(User user) {
        checkParams(user);

        // 查询购物车中所有商品的id信息
        String userID = user.getUserId();
        CartExample cartExample = new CartExample();
        Criteria criteria = cartExample.createCriteria();
        criteria.andUserIdEqualTo(userID);

        SqlSession sqlSession = sqlSessionFactory.openSession();
        CartMapper cartMapper = sqlSession.getMapper(CartMapper.class);
        ProductMapper productMapper = sqlSession.getMapper(ProductMapper.class);
        List<Cart> cartList = cartMapper.selectByExample(cartExample);

        List<Product> productList = new ArrayList<>();
        // 提取商品信息
        for (Cart cart : cartList) {
            String productID = cart.getProductId();
            Product product = productMapper.selectByPrimaryKey(productID);

            Integer productLeft = product.getProductLeftTotals();
            Integer productInCart = cart.getTotals();
            if (productLeft < productInCart) {
                cart.setTotals(productLeft);
                CartExample updateExample = new CartExample();
                Criteria updateCriteria = updateExample.createCriteria();
                updateCriteria.andUserIdEqualTo(userID).andProductIdEqualTo(productID);

                cartMapper.updateByExample(cart, updateExample);
            }

            product.setProductLeftTotals(cart.getTotals());
            productList.add(product);
        }

        sqlSession.close();
        return productList;
    }

}
