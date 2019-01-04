package edu.scu.my_shop.exception;

/**
 * 登录异常
 */
public class GeneralException extends RuntimeException {

    public static int NO_PRIORITY_CODE = 109;


    public static String NO_PRIORITY = "无管理员权限";

    /**
     * 错误码
     */
    private Integer code;


    public GeneralException(String message, int code) {
        super(message);
        this.code = code;
    }

    public Integer getCode() {
        return code;
    }
}
