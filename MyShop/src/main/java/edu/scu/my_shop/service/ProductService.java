package edu.scu.my_shop.service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import edu.scu.my_shop.dao.ProductMapper;
import edu.scu.my_shop.dao.SecondCategoryMapper;
import edu.scu.my_shop.entity.Product;
import edu.scu.my_shop.entity.ProductExample;
import edu.scu.my_shop.entity.SecondCategory;
import edu.scu.my_shop.exception.ProductException;
import edu.scu.my_shop.result.PageResult;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import static edu.scu.my_shop.exception.ProductException.*;

@Service
public class ProductService {

    private final SqlSessionFactory sqlSessionFactory;

    private final FileService fileService;

    @Autowired
    public ProductService(SqlSessionFactory sqlSessionFactory, FileService fileService) {
        this.sqlSessionFactory = sqlSessionFactory;
        this.fileService = fileService;
    }

    /**
     * Validate all information that a product needs <b>EXCEPT</b> ID.
     *
     * @param product
     * @return
     */
    private boolean validateProductExceptID(Product product) {

        if (product == null) {
            throw new ProductException(PRODUCT_IS_NULL_MESSAGE, PRODUCT_IS_NULL);
        }

        String name = product.getProductName();
        if (name == null || name.equals("")) {
            throw new ProductException(PRODUCT_NAME_EMPTY_MESSAGE, PRODUCT_NAME_EMPTY);
        }

        Double price = product.getProductPrice();
        if (price == null) {
            throw new ProductException(PRODUCT_PRICE_EMPTY_MESSAGE, PRODUCT_PRICE_EMPTY);
        }

        Integer total = product.getProductLeftTotals();
        if (total == null) {
            throw new ProductException(PRODUCT_TOTAL_EMPTY_MESSAGE, PRODUCT_TOTAL_EMPTY);
        }

        if (total < 0) {
            throw new ProductException(PRODUCT_NUMBER_WRONG_MESSAGE, PRODUCT_NUMBER_WRONG);
        }

        String secondCategoryID = product.getSecondCategoryId();
        if (secondCategoryID == null || secondCategoryID.equals("")) {
            throw new ProductException(PRODUCT_CATEGORY_EMPTY_MESSAGE, PRODUCT_CATEGORY_EMPTY);
        }

        SqlSession sqlSession = sqlSessionFactory.openSession();
        SecondCategoryMapper secondCategoryMapper = sqlSession.getMapper(SecondCategoryMapper.class);
        SecondCategory secondCategory = secondCategoryMapper.selectByPrimaryKey(secondCategoryID);
        if (secondCategory == null) {
            sqlSession.close();
            throw new ProductException(PRODUCT_CATEGORY_ERROR_MESSAGE, PRODUCT_CATEGORY_ERROR);
        }

        sqlSession.close();
        return true;
    }

    /**
     * Insert product object from browser to database.
     * Automatically generate product id.
     * Duplicate insert will be treated as two different insert with different product id.
     *
     * @param product
     */
    @Transactional
    public void insertProduct(Product product) {

        validateProductExceptID(product);

        // currently use UUID as product ID
        // duplicate insert will be treated as two different insert with different p_id
        product.setProductId(UUID.randomUUID().toString());

        // insert product into database, sqlSession already opened
        SqlSession sqlSession = sqlSessionFactory.openSession();
        ProductMapper productMapper = sqlSession.getMapper(ProductMapper.class);
        productMapper.insertSelective(product);
        sqlSession.close();
    }

    /**
     * Delete product from database by primary key.
     * Automatically ignore product that not exist.
     * Theoretically pid cannot be null, otherwise it will not compile.
     *
     * @param pid
     */
    @Transactional
    public void deleteProduct(String pid) {
        // validate product id
        if (pid == null || pid.equals("")) {
            throw new ProductException(PRODUCT_ID_EMPTY_MESSAGE, PRODUCT_ID_EMPTY);
        }

        // TODO: delete product image

        // delete product from database
        SqlSession sqlSession = sqlSessionFactory.openSession();
        ProductMapper productMapper = sqlSession.getMapper(ProductMapper.class);
        productMapper.deleteByPrimaryKey(pid);
        sqlSession.close();
    }

    /**
     * Delete product from database by primary key.
     * Automatically ignore product that not exist.
     * Theoretically product cannot be null, otherwise it will not compile.
     *
     * @param product
     */
    @Transactional
    public void deleteProduct(Product product) {
        // validate product data
        if (product == null) {
            throw new ProductException(PRODUCT_IS_NULL_MESSAGE, PRODUCT_IS_NULL);
        }

        deleteProduct(product.getProductId());
    }

    /**
     * Update product selectively(All can be null <b>EXCEPT ID</b>).
     * Automatically ignore product that not exist.
     * No need to validate every data since it update selectively.
     *
     * @param product
     */
    @Transactional
    public void updateProduct(Product product) {

        // validate product data
        if (product == null) {
            throw new ProductException(PRODUCT_IS_NULL_MESSAGE, PRODUCT_IS_NULL);
        }
        String productID = product.getProductId();
        if (productID == null || productID.equals("")) {
            throw new ProductException(PRODUCT_ID_EMPTY_MESSAGE, PRODUCT_ID_EMPTY);
        }

        // TODO: update image

        // update database
        SqlSession sqlSession = sqlSessionFactory.openSession();
        ProductMapper productMapper = sqlSession.getMapper(ProductMapper.class);
        productMapper.updateByPrimaryKeySelective(product);
        sqlSession.close();
    }

    /**
     * Selete all product records in database.
     *
     * @return
     */
    public List<Product> getAllProducts() {

        SqlSession sqlSession = sqlSessionFactory.openSession();
        ProductMapper productMapper = sqlSession.getMapper(ProductMapper.class);

        List<Product> productList = productMapper.selectByExample(new ProductExample());

        //判断查询结果是否为null
        if (null == productList || productList.isEmpty()) {

            //抛出查询结果为空异常
            throw new ProductException(SEARCH_RESULT_IS_NULL_MESSAGE, ProductException.SEARCH_RESULT_IS_NULL);
        }

        sqlSession.close();
        return productList;
    }

    /**
     * Search for a product by its ID.
     * It's deprecated since no one can know the auto-generated UUID.
     *
     * @param productID
     * @return
     */
    @Deprecated
    public Product searchProductByID(String productID) {
        SqlSession sqlSession = sqlSessionFactory.openSession();
        ProductMapper productMapper = sqlSession.getMapper(ProductMapper.class);
        Product product = productMapper.selectByPrimaryKey(productID);
        sqlSession.close();
        return product;
    }

    /**
     * Search for database to check whether product exists.
     *
     * @param productID
     * @return
     */
    public boolean productExists(String productID) {
        SqlSession sqlSession = sqlSessionFactory.openSession();
        ProductMapper productMapper = sqlSession.getMapper(ProductMapper.class);
        Product product = productMapper.selectByPrimaryKey(productID);
        sqlSession.close();
        return product != null;
    }

    /**
     * 根据传入的产品名称进行模糊查询,分页
     *
     * @param productName
     * @param pageNum
     * @param pageSize
     * @return
     */
    @Deprecated
    public PageResult<Product> searchProductByName(String productName, int pageNum, int pageSize) {

        //检查输入
        if (null == productName) {

            throw new ProductException(ProductException.INVALID_INPUT_MESSAGE, ProductException.INVALID_INPUT);
        }

        //启动分页
        Page page = PageHelper.startPage(pageNum, pageSize);

        SqlSession sqlSession = sqlSessionFactory.openSession();
        ProductMapper productMapper = sqlSession.getMapper(ProductMapper.class);

        ProductExample productExample = new ProductExample();
        productExample.createCriteria().andProductNameLike("%" + productName + "%");

        //查询
        List<Product> products = productMapper.selectByExample(productExample);

        //判断查询结果是否为null
        if (null == products || products.isEmpty()) {

            //抛出查询结果为空异常
            throw new ProductException(SEARCH_RESULT_IS_NULL_MESSAGE, ProductException.SEARCH_RESULT_IS_NULL);
        }

        //封装分页结果
        PageResult<Product> productPageResult = new PageResult<>();
        productPageResult.setContent(products);//放入某页内容
        productPageResult.setNumber(page.getPageNum());//第几页
        productPageResult.setNumberOfElements(page.getPageSize());//当前页的元素个数
        productPageResult.setTotalElements(page.getTotal());//总个数
        productPageResult.setTotalPages(page.getPages());//总页数

        sqlSession.close();
        return productPageResult;
    }


    /**
     * 根据传入的产品名称进行模糊查询,不分页
     *
     * @param productName
     * @return
     */
    public List<Product> searchProductByName(String productName) {
        System.out.println("test test " + productName);
        //检查输入
        if (null == productName) {
            throw new ProductException(ProductException.INVALID_INPUT_MESSAGE, ProductException.INVALID_INPUT);
        }

        SqlSession sqlSession = sqlSessionFactory.openSession();
        ProductMapper productMapper = sqlSession.getMapper(ProductMapper.class);

        ProductExample productExample = new ProductExample();
        productExample.createCriteria().andProductNameLike("%" + productName + "%");
        System.out.println("test test " + productExample.getOrderByClause());

        //查询
        List<Product> products = productMapper.selectByExample(productExample);
        System.out.println("test test "+products.size());
        //判断查询结果是否为null
        if (products.isEmpty()) {
            //抛出查询结果为空异常
            products = null;
        }

        //获取商品图片
        List<String> images;
        for (Product product : products) {
            product.setIamges(fileService.getProductImagesURL(product.getProductId()));
        }

        sqlSession.close();
        return products;
    }

    /**
     * 分类查找商品
     *
     * @param category
     * @return
     */
    public List<Product> searchProductByCategory(String category) {


        SqlSession sqlSession = sqlSessionFactory.openSession();
        ProductMapper productMapper = sqlSession.getMapper(ProductMapper.class);

        ProductExample productExample = new ProductExample();
        productExample.createCriteria().andSecondCategoryIdEqualTo(category);

        //查询
        List<Product> products = productMapper.selectByExample(productExample);

        //判断查询结果是否为null
        if (null == products || products.isEmpty()) {

            //抛出查询结果为空异常
            throw new ProductException(SEARCH_RESULT_IS_NULL_MESSAGE, ProductException.SEARCH_RESULT_IS_NULL);
        }

        sqlSession.close();
        return products;
    }

    /**
     * 根据多个分类ID得到一个数组
     *
     * @param category
     * @param pageNum
     * @param pageSize
     * @return
     */
    public List<List<Product>> searchProductByCategorys(String[] category, int pageNum, int pageSize) {

        SqlSession sqlSession = sqlSessionFactory.openSession();
        List<List<Product>> products = new ArrayList<>();

        for (String id : category) {
            //启动分页
            PageHelper.startPage(pageNum, pageSize);

            // sqlSession = sqlSessionFactory.openSession();
            ProductMapper productMapper = sqlSession.getMapper(ProductMapper.class);


            ProductExample productExample = new ProductExample();
            productExample.createCriteria().andSecondCategoryIdEqualTo(id);

            //查询
            List<Product> product = productMapper.selectByExample(productExample);

            //判断查询结果是否为null
            if (null == product || product.isEmpty()) {

                //抛出查询结果为空异常
                throw new ProductException(SEARCH_RESULT_IS_NULL_MESSAGE, ProductException.SEARCH_RESULT_IS_NULL);
            }
            products.add(product);
        }


        sqlSession.close();
        return products;
    }
}
