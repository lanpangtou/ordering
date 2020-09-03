package cn.lanpangtou.pojo;

import cn.lanpangtou.util.DateUtils;

import java.util.Date;
import java.util.List;

public class OrderDetail {
    private Integer id;//订单详情id
    private String orderId;//订单id
    private Integer foodId;//菜品id
    private Integer count;//数量
    private Integer status;//订单状态。1，已支付，2未支付，
    private String statusStr;
    private Date createTime;//创建订单时间
    private String creatTimeStr;
    private Date endTime;//交易完成时间
    private String endTimeStr;
    private Date closeTime;//交易关闭时间你
    private Order order;
    private Food food;

    public String getCreatTimeStr() {
        if (createTime != null){
            creatTimeStr = DateUtils.dateToString(createTime,"yyyy-MM-dd HH:mm:ss");
        }
        return creatTimeStr;
    }

    public void setCreatTimeStr(String creatTimeStr) {
        this.creatTimeStr = creatTimeStr;
    }

    public String getEndTimeStr() {
        if (endTime != null){
            endTimeStr = DateUtils.dateToString(endTime,"yyyy-MM-dd HH:mm:ss");
        }
        return endTimeStr;
    }

    public void setEndTimeStr(String endTimeStr) {
        this.endTimeStr = endTimeStr;
    }

    public String getStatusStr() {
        if (status == 1){
            statusStr = "已支付";
        }
        if (status == 2){
            statusStr = "未支付";
        }
        return statusStr;
    }

    public void setStatusStr(String statusStr) {
        this.statusStr = statusStr;
    }

    public Food getFood() {
        return food;
    }

    public void setFood(Food food) {
        this.food = food;
    }

    public Order getOrder() {
        return order;
    }

    public void setOrder(Order order) {
        this.order = order;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId;
    }

    public Integer getFoodId() {
        return foodId;
    }

    public void setFoodId(Integer foodId) {
        this.foodId = foodId;
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }

    public Date getCloseTime() {
        return closeTime;
    }

    public void setCloseTime(Date closeTime) {
        this.closeTime = closeTime;
    }


    @Override
    public String toString() {
        return "OrderDetail{" +
                "id=" + id +
                ", orderId='" + orderId + '\'' +
                ", foodId=" + foodId +
                ", count=" + count +
                ", status=" + status +
                ", createTime=" + createTime +
                ", endTime=" + endTime +
                ", closeTime=" + closeTime +
                ", order=" + order +
                ", food=" + food +
                '}';
    }
}
