package cn.lanpangtou.pojo;

import cn.lanpangtou.util.DateUtils;

import java.util.Date;

public class Food {
    private Integer id;//菜品id
    private Integer cid;//分类id
    private String category;//分类名称
    private String dishName;//菜品名字
    private String desc;//菜品描述
    private String images;//菜品图片
    private Integer price;//菜品价格
    private Integer discountPrice;//打折后的价格
    private Boolean saleable;//是否上架
    private String saleableStr;//是否上架
    private Boolean discount;//是否打折
    private Boolean del;//是否删除
    private Float discountType;//打折类型，几折
    private String discountTypeStr;//打折类型，几折
    private Integer count;//菜品数量
    private Integer remainingCount;//剩余数量
    private Date createTime;//创建时间
    private String createTimeStr;
    private Integer orderCount;//当前商品的订单数量
    private Date lastUpdateTime;//最后更新时间
    private String lastUpdateTimeStr;

    public String getCreateTimeStr() {
        if (createTime != null){
            createTimeStr = DateUtils.dateToString(createTime,"yyyy-MM-dd HH:mm:ss");
        }
        return createTimeStr;
    }

    public void setCreateTimeStr(String createTimeStr) {
        this.createTimeStr = createTimeStr;
    }

    public String getLastUpdateTimeStr() {
        if (lastUpdateTime != null){
            lastUpdateTimeStr = DateUtils.dateToString(lastUpdateTime,"yyyy-MM-dd HH:mm:ss");
        }
        return lastUpdateTimeStr;
    }

    public void setLastUpdateTimeStr(String lastUpdateTimeStr) {
        this.lastUpdateTimeStr = lastUpdateTimeStr;
    }

    public String getDiscountTypeStr() {
        if (discountType >= 10){
            discountTypeStr = "不打折";
        }else {
            discountTypeStr = discountType+"折";
        }
        return discountTypeStr;
    }

    public void setDiscountTypeStr(String discountTypeStr) {
        this.discountTypeStr = discountTypeStr;
    }

    public String getSaleableStr() {
        if (saleable == true){
            saleableStr = "正在售卖";
        }else {
            saleableStr = "已售完";
        }
        return saleableStr;
    }

    public void setSaleableStr(String saleableStr) {
        this.saleableStr = saleableStr;

    }


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getCid() {
        return cid;
    }

    public void setCid(Integer cid) {
        this.cid = cid;
    }

    public String getDishName() {
        return dishName;
    }

    public void setDishName(String dishName) {
        this.dishName = dishName;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }

    public String getImages() {
        return images;
    }

    public void setImages(String images) {
        this.images = images;
    }

    public Integer getPrice() {
        return price;
    }

    public void setPrice(Integer price) {
        this.price = price;
    }

    public Integer getDiscountPrice() {
        return discountPrice;
    }

    public void setDiscountPrice(Integer discountPrice) {
        this.discountPrice = discountPrice;
    }

    public Boolean getSaleable() {
        return saleable;
    }

    public void setSaleable(Boolean saleable) {
        this.saleable = saleable;
    }

    public Boolean getDiscount() {
        return discount;
    }

    public void setDiscount(Boolean discount) {
        this.discount = discount;
    }

    public Boolean getDel() {
        return del;
    }

    public void setDel(Boolean del) {
        this.del = del;
    }

    public Float getDiscountType() {
        return discountType;
    }

    public void setDiscountType(Float discountType) {
        this.discountType = discountType;
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

    public Integer getRemainingCount() {
        return remainingCount;
    }

    public void setRemainingCount(Integer remainingCount) {
        this.remainingCount = remainingCount;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getLastUpdateTime() {
        return lastUpdateTime;
    }

    public void setLastUpdateTime(Date lastUpdateTime) {
        this.lastUpdateTime = lastUpdateTime;
    }

    public Integer getOrderCount() {
        return orderCount;
    }

    public void setOrderCount(Integer orderCount) {
        this.orderCount = orderCount;
    }

    @Override
    public String toString() {
        return "Food{" +
                "id=" + id +
                ", cid=" + cid +
                ", category='" + category + '\'' +
                ", dishName='" + dishName + '\'' +
                ", desc='" + desc + '\'' +
                ", images='" + images + '\'' +
                ", price=" + price +
                ", discountPrice=" + discountPrice +
                ", saleable=" + saleable +
                ", saleableStr='" + saleableStr + '\'' +
                ", discount=" + discount +
                ", del=" + del +
                ", discountType=" + discountType +
                ", discountTypeStr='" + discountTypeStr + '\'' +
                ", count=" + count +
                ", remainingCount=" + remainingCount +
                ", createTime=" + createTime +
                ", lastUpdateTime=" + lastUpdateTime +
                '}';
    }
}
