package edu.scu.my_shop.entity;

import java.util.Date;

public class Message {
    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column message.message_id
     *
     * @mbg.generated Tue Mar 20 16:20:42 CST 2018
     */
    private String messageId;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column message.sender_id
     *
     * @mbg.generated Tue Mar 20 16:20:42 CST 2018
     */
    private String senderId;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column message.recv_id
     *
     * @mbg.generated Tue Mar 20 16:20:42 CST 2018
     */
    private String recvId;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column message.message_content
     *
     * @mbg.generated Tue Mar 20 16:20:42 CST 2018
     */
    private String messageContent;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column message.send_time
     *
     * @mbg.generated Tue Mar 20 16:20:42 CST 2018
     */
    private Date sendTime;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column message.is_read
     *
     * @mbg.generated Tue Mar 20 16:20:42 CST 2018
     */
    private Boolean isRead;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column message.message_id
     *
     * @return the value of message.message_id
     *
     * @mbg.generated Tue Mar 20 16:20:42 CST 2018
     */
    public String getMessageId() {
        return messageId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column message.message_id
     *
     * @param messageId the value for message.message_id
     *
     * @mbg.generated Tue Mar 20 16:20:42 CST 2018
     */
    public void setMessageId(String messageId) {
        this.messageId = messageId == null ? null : messageId.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column message.sender_id
     *
     * @return the value of message.sender_id
     *
     * @mbg.generated Tue Mar 20 16:20:42 CST 2018
     */
    public String getSenderId() {
        return senderId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column message.sender_id
     *
     * @param senderId the value for message.sender_id
     *
     * @mbg.generated Tue Mar 20 16:20:42 CST 2018
     */
    public void setSenderId(String senderId) {
        this.senderId = senderId == null ? null : senderId.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column message.recv_id
     *
     * @return the value of message.recv_id
     *
     * @mbg.generated Tue Mar 20 16:20:42 CST 2018
     */
    public String getRecvId() {
        return recvId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column message.recv_id
     *
     * @param recvId the value for message.recv_id
     *
     * @mbg.generated Tue Mar 20 16:20:42 CST 2018
     */
    public void setRecvId(String recvId) {
        this.recvId = recvId == null ? null : recvId.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column message.message_content
     *
     * @return the value of message.message_content
     *
     * @mbg.generated Tue Mar 20 16:20:42 CST 2018
     */
    public String getMessageContent() {
        return messageContent;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column message.message_content
     *
     * @param messageContent the value for message.message_content
     *
     * @mbg.generated Tue Mar 20 16:20:42 CST 2018
     */
    public void setMessageContent(String messageContent) {
        this.messageContent = messageContent == null ? null : messageContent.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column message.send_time
     *
     * @return the value of message.send_time
     *
     * @mbg.generated Tue Mar 20 16:20:42 CST 2018
     */
    public Date getSendTime() {
        return sendTime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column message.send_time
     *
     * @param sendTime the value for message.send_time
     *
     * @mbg.generated Tue Mar 20 16:20:42 CST 2018
     */
    public void setSendTime(Date sendTime) {
        this.sendTime = sendTime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column message.is_read
     *
     * @return the value of message.is_read
     *
     * @mbg.generated Tue Mar 20 16:20:42 CST 2018
     */
    public Boolean getIsRead() {
        return isRead;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column message.is_read
     *
     * @param isRead the value for message.is_read
     *
     * @mbg.generated Tue Mar 20 16:20:42 CST 2018
     */
    public void setIsRead(Boolean isRead) {
        this.isRead = isRead;
    }


    @Override
    public String toString() {
        return "Message{" +
                "messageId='" + messageId + '\'' +
                ", senderId='" + senderId + '\'' +
                ", recvId='" + recvId + '\'' +
                ", messageContent='" + messageContent + '\'' +
                ", sendTime=" + sendTime +
                ", isRead=" + isRead +
                '}';
    }
}