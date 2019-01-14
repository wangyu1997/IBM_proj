package edu.scu.my_shop.controller;

import edu.scu.my_shop.entity.SecurityUser;
import edu.scu.my_shop.service.FileService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@Controller
public class FileController {

    private final FileService fileService;

    @Autowired
    public FileController(FileService fileService) {
        this.fileService = fileService;
    }

    /**
     * get file upload page
     * @return
     */
    @RequestMapping("file")
    public String file(){
        return "/file";
    }

    @RequestMapping("multifile")
    public String multifile() {
        return "/multifile";
    }

    /**
     * process file upload request
     * @param file uploaded by browser
     * @return
     */
    @RequestMapping("fileUpload")
    public String uploadUserImage(@RequestParam("fileName") MultipartFile file){
        SecurityUser userDetails =  (SecurityUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String userID = userDetails.getUserId();
        fileService.uploadUserImage(userID, file);

        return "redirect:userInfoPage?kw=user-info";
    }


    @RequestMapping("multifileUpload")
//    @ResponseBody
    public void  uploadProductImages(@RequestParam("fileName")List<MultipartFile> files, @RequestParam("productID") String productID) {
        fileService.insertProductImages(productID, files);
        // TODO: redirect to new page
//        return "redirect:userInfoPage?kw=user-info";
    }

    @RequestMapping("productImageUpload")
    @ResponseBody
    public String  uploadProductImage(@RequestParam("fileName")MultipartFile file, @RequestParam("productID") String productID) {
        System.out.println(productID+"++++"+file.getName());
        System.out.println(file.getSize()+"===");
        fileService.insertProductImage(productID, file);
        // TODO: redirect to new page
        return "redirect:product/toEdit.html?productID="+productID;
    }

    @RequestMapping("multifileUpdate")
    @ResponseBody
    public String updateProductImages(@RequestParam("fileName")List<MultipartFile> files, @RequestParam("productID") List<String> productIDs) {
        fileService.updateProductImages(productIDs, files);

        // TODO: redirect to new page
        return "TODO: redirect to new page";
    }

    /**
     * Return an image of the product.
     * @param productID
     * @return
     */
    @GetMapping("productImageInCart")
    @ResponseBody
    public String productImageInCart(@RequestParam("productID")String productID) {
        List<String> urlList = fileService.getProductImagesURL(productID);
        if (urlList.isEmpty()) {
            return null;
        }
        return urlList.get(urlList.size()-1);
    }
}
