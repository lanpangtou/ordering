package cn.lanpangtou.pojo;

public class Order {
    private String id;//订单id
    private Integer totalPay;//总金额
    private Integer actualPay;//实付金额
    private Integer paymentType;//支付类型,1微信支付，2支付宝支付
    private String paymentTypeStr;
    private String buyerMessage;//买家备注留言
    private String consignee;//收货人
    private Integer userId;//下单人id
    private String address;//收货地址
    private String phone;//收货人手机号


    public String getPaymentTypeStr() {
        if (paymentType == 1){
            paymentTypeStr = "微信支付";
        }
        if (paymentType == 2){
            paymentTypeStr = "支付宝支付";
        }
        return paymentTypeStr;
    }

    public void setPaymentTypeStr(String paymentTypeStr) {
        this.paymentTypeStr = paymentTypeStr;
    }


    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Integer getTotalPay() {
        return totalPay;
    }

    public void setTotalPay(Integer totalPay) {
        this.totalPay = totalPay;
    }

    public Integer getActualPay() {
        return actualPay;
    }

    public void setActualPay(Integer actualPay) {
        this.actualPay = actualPay;
    }

    public Integer getPaymentType() {
        return paymentType;
    }

    public void setPaymentType(Integer paymentType) {
        this.paymentType = paymentType;
    }

    public String getBuyerMessage() {
        return buyerMessage;
    }

    public void setBuyerMessage(String buyerMessage) {
        this.buyerMessage = buyerMessage;
    }

    public String getConsignee() {
        return consignee;
    }

    public void setConsignee(String consignee) {
        this.consignee = consignee;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    @Override
    public String toString() {
        return "Order{" +
                "id=" + id +
                ", totalPay=" + totalPay +
                ", actualPay=" + actualPay +
                ", paymentType=" + paymentType +
                ", buyerMessage='" + buyerMessage + '\'' +
                ", consignee='" + consignee + '\'' +
                ", userId=" + userId +
                ", address='" + address + '\'' +
                ", phone='" + phone + '\'' +
                '}';
    }
}
