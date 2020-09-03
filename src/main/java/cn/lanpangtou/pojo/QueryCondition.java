package cn.lanpangtou.pojo;

public class QueryCondition {
    private int page;
    private int rows;
    private String dishName;//菜品名称
    private Boolean saleable;//是否上架
    private Boolean discount;//是否打折
    private Integer priceMin;//菜品价格最小
    private Integer priceMax;//菜品价格最大

    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
    }

    public int getRows() {
        return rows;
    }

    public void setRows(int rows) {
        this.rows = rows;
    }

    public String getDishName() {
        return dishName;
    }

    public void setDishName(String dishName) {
        this.dishName = dishName;
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

    public Integer getPriceMin() {
        return priceMin;
    }

    public void setPriceMin(Integer priceMin) {
        this.priceMin = priceMin;
    }

    public Integer getPriceMax() {
        return priceMax;
    }

    public void setPriceMax(Integer priceMax) {
        this.priceMax = priceMax;
    }

    @Override
    public String toString() {
        return "QueryCondition{" +
                "page=" + page +
                ", rows=" + rows +
                ", dishName='" + dishName + '\'' +
                ", saleable=" + saleable +
                ", discount=" + discount +
                ", priceMin=" + priceMin +
                ", priceMax=" + priceMax +
                '}';
    }
}
