package edu.scu.my_shop.controller;

import edu.scu.my_shop.entity.*;
import edu.scu.my_shop.service.CategoryService;
import edu.scu.my_shop.service.ManageUserService;
import edu.scu.my_shop.service.OrderService;
import edu.scu.my_shop.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextImpl;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;


@Controller
public class AdminController {
    private final ManageUserService manageUserService;

    private final ProductService productService;

    private final OrderService orderService;

    private final CategoryService categoryService;

    @Autowired
    public AdminController(ManageUserService manageUserService, ProductService productService, OrderService orderService, CategoryService categoryService) {
        this.manageUserService = manageUserService;
        this.productService = productService;
        this.orderService = orderService;
        this.categoryService = categoryService;
    }

    @RequestMapping("/admin")
    public String admin(ModelMap map, HttpSession session) {
        SecurityContextImpl securityContext = (SecurityContextImpl) session.getAttribute("SPRING_SECURITY_CONTEXT");
        SecurityUser user = (SecurityUser) securityContext.getAuthentication().getPrincipal();
        if (!user.getRole()) {
            map.put("err_msg", "权限不足，无法访问管理员后台页面");
            return "error";
        } else {
            map.put("user_name", user.getUsername());
            return "admin";
        }
    }

    @RequestMapping("user/toList.html")
    public String userToList() {
        return "user/toList";
    }

    @RequestMapping("user/toEdit.html")
    public String userToEdit() {
        return "user/toEdit";
    }

    @RequestMapping("product/toList.html")
    public String productToList() {
        return "product/toList";
    }

    @RequestMapping("product/toEdit.html")
    public String productToEdit(ModelMap map, String productID) {
        Product product = productService.searchProductByID(productID);
        map.addAttribute("product", product);
        return "product/toEdit";
    }

    @RequestMapping("product/toAdd.html")
    public String productToAdd() {
        return "product/toAdd";
    }

    @RequestMapping("order/toList.html")
    public String orderToList() {
        return "order/toList";
    }

    @RequestMapping("classification/toList.html")
    public String classificationToList() {
        return "classification/toList";
    }

    @RequestMapping("classification/toEdit.html")
    public String classificationToEdit() {
        return "classification/toEdit";
    }

    @RequestMapping("getAllUser")
    @ResponseBody
    public List<User> getAllUser() {
        return manageUserService.getAllUser();
    }

    @RequestMapping("getAllProduct")
    @ResponseBody
    public List<Product> getAllProduct() {
        return productService.getAllProducts();
    }

    @RequestMapping("getAllOrder")
    @ResponseBody
    public List<Order> getAllOrder() {
        return orderService.getAllOrder();
    }

    @RequestMapping("setAdmin")
    @ResponseBody
    public String setAdmin(String userID) {
        manageUserService.appointSuperUser(userID);
        return "";
    }

    @RequestMapping("deleteUser")
    @ResponseBody
    public String deleteUser(String userID) {
        manageUserService.deleteUser(userID);
        return "";
    }

    @RequestMapping("getAllCategory")
    @ResponseBody
    public List<SecondCategory> getAllCategory() {
        return categoryService.getAllSecondCategory();
    }
}
