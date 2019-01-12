package edu.scu.my_shop.controller;

import edu.scu.my_shop.entity.Message;
import edu.scu.my_shop.entity.SecurityUser;
import edu.scu.my_shop.service.MessageService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Random;

@Controller
public class MessageController {
    private final MessageService messageService;

    @Autowired
    public MessageController(MessageService messageService) {
        this.messageService = messageService;
    }

    @RequestMapping("/message")
    public String message() {
        return "message";
    }

    @RequestMapping("/send")
    public String send() {
        return "sendMessage";
    }

    @RequestMapping(value = "/serverMessage")
    public SseEmitter pushMessage() {
        SecurityUser userDetails = (SecurityUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String userID = userDetails.getUserId();
        Random random = new Random();
        SseEmitter emitter = new SseEmitter();
        List<Message> messageList = messageService.getUnreadMessage(userID);
        try {
            emitter.send(messageList);
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            emitter.complete();
        }
        return emitter;
    }

    @RequestMapping("/sendMessage")
    public String sendMessage(@Param("message") Message message) {
        System.out.println(message.toString());
        if (message.getSendTime() == null)
            message.setSendTime(new Date());
        message.setIsRead(false);
        messageService.insertMessage(message);
        return "account";
    }

    @RequestMapping("getUserMessage")
    @ResponseBody
    public List<Message> getUserMessage() {
        SecurityUser userDetails = (SecurityUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String userID = userDetails.getUserId();
        List<Message> messages = messageService.getUnreadMessage(userID);
        for (Message message:messages){
            message.setIsRead(true);
            messageService.updateMessage(message);
            System.out.println(message.toString());
        }
        System.out.println(messages.size());
        return messages;
    }
}
