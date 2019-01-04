package edu.scu.my_shop.result;

import java.util.List;

public class PageResult<T> {

    /**
     * 总页数
     */
    private int totalPages;

    /**
     * 总的元素个数
     */
    private long totalElements;

    /**
     * 第几页
     */
    private int number;

    /**
     * 当前页的元素个数
     */
    private int numberOfElements;

    /**
     * 存储的内容
     */
    private List<T> content;

    public int getTotalPages() {
        return totalPages;
    }

    public void setTotalPages(int totalPages) {
        this.totalPages = totalPages;
    }

    public long getTotalElements() {
        return totalElements;
    }

    public void setTotalElements(long totalElements) {
        this.totalElements = totalElements;
    }

    public int getNumber() {
        return number;
    }

    public void setNumber(int number) {
        this.number = number;
    }

    public int getNumberOfElements() {
        return numberOfElements;
    }

    public void setNumberOfElements(int numberOfElements) {
        this.numberOfElements = numberOfElements;
    }

    public List<T> getContent() {
        return content;
    }

    public void setContent(List<T> content) {
        this.content = content;
    }

}
