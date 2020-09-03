package cn.lanpangtou.service;

import cn.lanpangtou.pojo.Order;
import cn.lanpangtou.pojo.OrderDetail;
import cn.lanpangtou.pojo.PageBean;
import cn.lanpangtou.pojo.QueryCondition;

public interface OrderService {

    public PageBean<Order> findFoodOrderByPage(QueryCondition queryCondition) throws Exception;

    public void  pay(Order order,Integer foodId) throws Exception;

    public OrderDetail findOrderDetailByOrderId(String id) throws Exception;

    public int cancelOrder(String id) throws Exception;
}
