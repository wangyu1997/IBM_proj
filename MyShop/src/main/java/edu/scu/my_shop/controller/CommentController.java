package edu.scu.my_shop.controller;

import edu.scu.my_shop.entity.Comment;
import edu.scu.my_shop.entity.SecurityUser;
import edu.scu.my_shop.service.CommentService;
import org.apache.ibatis.annotations.Param;
import org.springframework.security.core.context.SecurityContextImpl;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.Date;

@Controller
public class CommentController {
    private final CommentService commentService;

    public CommentController(CommentService commentService) {
        this.commentService = commentService;
    }

    @RequestMapping("/sendComment")
    public String sendMessage(@Param("comment") Comment comment, HttpSession session) {
        SecurityContextImpl securityContext = (SecurityContextImpl) session.getAttribute("SPRING_SECURITY_CONTEXT");
        SecurityUser user = (SecurityUser) securityContext.getAuthentication().getPrincipal();
        comment.setUserId(user.getUserId());
        comment.setCommentDate(new Date());
        commentService.insertComment(comment);

        return "productdetails";
    }

}
