package edu.scu.my_shop.service;

import edu.scu.my_shop.dao.ImageMapper;
import edu.scu.my_shop.dao.ProductMapper;
import edu.scu.my_shop.dao.UserMapper;
import edu.scu.my_shop.entity.Image;
import edu.scu.my_shop.entity.ImageExample;
import edu.scu.my_shop.entity.User;
import edu.scu.my_shop.exception.FileException;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import static edu.scu.my_shop.entity.ImageExample.Criteria;
import static edu.scu.my_shop.exception.FileException.*;

@Service
public class FileService {

    @Value("${image.user-image-folder-path}")
    private String userImageFolderPath;

    @Value("${image.user-image-relate-path}")
    private String userImageRelatePath;

    @Value("${image.product-image-folder-path}")
    private String productImageFolderPath;

    @Value("${image.product-image-relate-path}")
    private String productImageRelatePath;

    @Autowired
    private SqlSessionFactory sqlSessionFactory;

    /**
     * 上传用户头像并刷新数据库
     *
     * @param userID 用户id
     * @param file   文件
     */
    public void uploadUserImage(String userID, MultipartFile file) {

        // 使用当点用户的id作为图片名
        String fileName = userID;

        // 文件重命名
        String fileAbsolutePath = userImageFolderPath + "/" + fileName;
        System.out.println(fileAbsolutePath);

        // 文件写入磁盘
        uploadFile(fileAbsolutePath, file);

        // 更新数据库
        SqlSession sqlSession = sqlSessionFactory.openSession();
        UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
        User user = userMapper.selectByPrimaryKey(userID);
        user.setHeadImg(userID);
        userMapper.updateByPrimaryKey(user);
        sqlSession.close();
    }

    /**
     * 将文件保存到本地
     *
     * @param productID 商品id
     * @param files     文件
     */
    public void insertProductImages(String productID, List<MultipartFile> files) {

        //  检查文件是否为空
        if (files == null || files.isEmpty()) {
            throw new FileException(EMPTY_FILE_MESSAGE, EMPTY_FILE);
        }

        SqlSession sqlSession = sqlSessionFactory.openSession();
        ProductMapper productMapper = sqlSession.getMapper(ProductMapper.class);
        ImageMapper imageMapper = sqlSession.getMapper(ImageMapper.class);

        for (MultipartFile file : files) {
            // 文件重命名
            String fileName = UUID.randomUUID().toString();
            String fileAbsolutePath = productImageFolderPath + "/" + fileName;
            uploadFile(fileAbsolutePath, file);

            // 保存到数据库
            Image image = new Image();
            image.setImageId(fileName);
            image.setImageUrl(fileName);
            image.setProductId(productID);
            imageMapper.insert(image);
        }

        sqlSession.close();
    }


    public void insertProductImage(String productID, MultipartFile file) {

        //  检查文件是否为空
        if (file == null){
            throw new FileException(EMPTY_FILE_MESSAGE, EMPTY_FILE);
        }

        SqlSession sqlSession = sqlSessionFactory.openSession();
        ProductMapper productMapper = sqlSession.getMapper(ProductMapper.class);
        ImageMapper imageMapper = sqlSession.getMapper(ImageMapper.class);

        // 文件重命名
        String fileName = UUID.randomUUID().toString();
        String fileAbsolutePath = productImageFolderPath + "/" + fileName;
        uploadFile(fileAbsolutePath, file);

        // 保存到数据库
        Image image = new Image();
        image.setImageId(fileName);
        image.setImageUrl(fileName);
        image.setProductId(productID);
        imageMapper.insert(image);

        sqlSession.close();
    }


    /**
     * 重新替换图片
     *
     * @param imageIDs 原图片id
     * @param files    文件
     */
    public void updateProductImages(List<String> imageIDs, List<MultipartFile> files) {

        //  验证数据是否合理
        if (imageIDs == null || imageIDs.isEmpty()) {
            throw new FileException(IMAGE_ID_EMPTY_MESSAGE, IMAGE_ID_EMPTY);
        }
        if (files == null || files.isEmpty()) {
            throw new FileException(EMPTY_FILE_MESSAGE, EMPTY_FILE);
        }
        if (imageIDs.size() != files.size()) {
            throw new FileException(IMAGE_ID_FILE_NOT_MATCH_MESSAGE, IMAGE_ID_FILE_NOT_MATCH);
        }

        SqlSession sqlSession = sqlSessionFactory.openSession();
        ImageMapper imageMapper = sqlSession.getMapper(ImageMapper.class);

        for (int i = 0; i < imageIDs.size(); i++) {
            Image image = imageMapper.selectByPrimaryKey(imageIDs.get(i));
            MultipartFile file = files.get(i);

            // 如果图片不存在则忽略
            if (image == null) continue;

            // 如果文件为空或不存在则忽略
            if (file == null || file.isEmpty()) continue;

            // 写入本地磁盘
            String fileName = image.getImageUrl();
            String fileAbsolutePath = productImageFolderPath + "/" + fileName;
            uploadFile(fileAbsolutePath, file);
        }

        sqlSession.close();
    }

    /**
     * 删除商品图片
     *
     * @param image 图片
     */
    public void deleteProductImage(Image image) {
        String imageID = image.getImageId();
        String imageURL = image.getImageUrl();

        // 验证图片合法性
        if (imageID == null || imageID.equals("")) {
            throw new FileException(IMAGE_ID_EMPTY_MESSAGE, IMAGE_ID_EMPTY);
        }
        if (imageURL == null || imageURL.equals("")) {
            throw new FileException(IMAGE_URL_EMPTY_MESSAGE, IMAGE_URL_EMPTY);
        }

        // 删除文件
        String fileAbsolutePath = productImageFolderPath + "/" + imageURL;
        deleteFile(fileAbsolutePath);

        // 更新数据库
        SqlSession sqlSession = sqlSessionFactory.openSession();
        ImageMapper imageMapper = sqlSession.getMapper(ImageMapper.class);
        imageMapper.deleteByPrimaryKey(imageID);
        sqlSession.close();
    }

    /**
     * 根据图片id自动删除图片
     *
     * @param imageID 图片id
     */
    public void deleteProductImage(String imageID) {
        // validate data
        if (imageID == null || imageID.equals("")) {
            throw new FileException(IMAGE_ID_EMPTY_MESSAGE, IMAGE_ID_EMPTY);
        }

        // 从数据库中查询image
        SqlSession sqlSession = sqlSessionFactory.openSession();
        ImageMapper imageMapper = sqlSession.getMapper(ImageMapper.class);
        Image image = imageMapper.selectByPrimaryKey(imageID);
        sqlSession.close();

        // 删除文件并且自动更新数据库
        deleteProductImage(image);
    }

    /**
     * 删除图片
     *
     * @param imageList 图片列表
     */
    public void deleteProductImages(List<Image> imageList) {
        // 验证数据
        if (imageList == null) {
            return;
        }

        for (Image image : imageList) {
            deleteProductImage(image);
        }
    }

    /**
     * 删除所有产品的图片
     *
     * @param productID 产品编号
     */
    public void deleteAllProductImages(String productID) {
        // 验证数据
        if (productID == null || productID.equals("")) {
            throw new FileException(QUERY_PID_ERROR_MESSAGE, QUERY_PID_ERROR);
        }

        // 创建查询实例
        ImageExample imageExample = new ImageExample();
        Criteria criteria = imageExample.createCriteria();
        criteria.andProductIdEqualTo(productID);

        // 查询所有图片
        SqlSession sqlSession = sqlSessionFactory.openSession();
        ImageMapper imageMapper = sqlSession.getMapper(ImageMapper.class);
        List<Image> imageList = imageMapper.selectByExample(imageExample);
        sqlSession.close();

        for (Image image : imageList) {
            deleteProductImage(image);
        }
    }

    /**
     * 返回用户头像的相关url
     *
     * @param userID 用户id
     * @return 用户头像的相对url地址
     */
    public String getUserImageURL(String userID) {
        if (userID == null || userID.equals("")) {
            throw new FileException(EMPTY_USER_MESSAGE, EMPTY_USER);
        }

        SqlSession sqlSession = sqlSessionFactory.openSession();
        UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
        User user = userMapper.selectByPrimaryKey(userID);
        if (user == null) {
            throw new FileException(EMPTY_USER_MESSAGE, EMPTY_USER);
        }

        String userImageURL = user.getHeadImg();
        sqlSession.close();

        return userImageRelatePath + "/" + userImageURL;
    }

    /**
     * 获取产品的所有图片
     * It <b>WILL NOT</b> return null but an empty list.
     *
     * @param productID 产品id
     * @return 产品的图片地址
     */
    public List<String> getProductImagesURL(String productID) {
        if (productID == null || productID.equals("")) {
            throw new FileException(QUERY_PID_ERROR_MESSAGE, QUERY_PID_ERROR);
        }

        // 获取url
        List<Image> images = getProductImages(productID);
        List<String> pathList = new ArrayList<>();
        for (Image image : images) {
            pathList.add(productImageRelatePath + "/" + image.getImageUrl());
        }

        return pathList;
    }

    /**
     * 通过产品id查询图片
     *
     * @param productID 产品id
     * @return 产品的图片
     */
    private List<Image> getProductImages(String productID) {
        if (productID == null || productID.equals("")) {
            throw new FileException(QUERY_PID_ERROR_MESSAGE, QUERY_PID_ERROR);
        }

        // 数据库查询
        ImageExample imageExample = new ImageExample();
        Criteria criteria = imageExample.createCriteria();
        criteria.andProductIdEqualTo(productID);
        SqlSession sqlSession = sqlSessionFactory.openSession();
        ImageMapper imageMapper = sqlSession.getMapper(ImageMapper.class);
        List<Image> images = imageMapper.selectByExample(imageExample);
        sqlSession.close();

        return images;
    }

    /**
     * 文件写入本地.
     *
     * @param fileAbsolutePath: 文件绝对路径
     * @param file:             从浏览器获取的文件
     */
    private void uploadFile(String fileAbsolutePath, MultipartFile file) {
        if (fileAbsolutePath == null || fileAbsolutePath.equals("")) {
            throw new FileException(IO_EXCEPTION_MESSAGE, IO_EXCEPTION);
        }
        if (file.isEmpty()) {
            throw new FileException(EMPTY_FILE_MESSAGE, EMPTY_FILE);
        }

        // 检查文件是否存在
        File fileToSave = new File(fileAbsolutePath);
        if (!fileToSave.getParentFile().exists()) {
            fileToSave.getParentFile().mkdir();
        }

        // 写入文件
        try {
            file.transferTo(fileToSave);
        } catch (IOException e) {
            String error = "不能写入文件: " + e.getMessage();
            throw new FileException(IO_EXCEPTION_MESSAGE + error, IO_EXCEPTION);
        }
    }

    /**
     * 删除文件.
     *
     * @param fileAbsolutePath 文件绝对路径
     */
    private void deleteFile(String fileAbsolutePath) {
        if (fileAbsolutePath == null || fileAbsolutePath.equals("")) {
            throw new FileException(IO_EXCEPTION_MESSAGE, IO_EXCEPTION);
        }

        File fileToDelete = new File(fileAbsolutePath);
        // 如果文件不错在或者是文件夹
        if (!fileToDelete.exists() || !fileToDelete.isFile()) {
            return;
        }

        fileToDelete.delete();
    }
}
