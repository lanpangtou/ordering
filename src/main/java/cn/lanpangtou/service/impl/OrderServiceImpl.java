package cn.lanpangtou.service.impl;

import cn.lanpangtou.mapper.FoodMapper;
import cn.lanpangtou.mapper.OrderMapper;
import cn.lanpangtou.pojo.*;
import cn.lanpangtou.service.FoodService;
import cn.lanpangtou.service.OrderService;
import cn.lanpangtou.service.UserService;
import cn.lanpangtou.util.PageUtil;
import com.sun.xml.internal.bind.v2.model.core.ID;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.UUID;

@Service
@Transactional
public class OrderServiceImpl implements OrderService {

    @Autowired
    private OrderMapper orderMapper;

    @Autowired
    private UserService userService;

    @Autowired
    private FoodMapper foodMapper;

    @Override
    public PageBean<Order> findFoodOrderByPage(QueryCondition queryCondition) throws Exception {
        //调用分页方法
        PageBean pageBean = PageUtil.pageBean(queryCondition.getPage(), queryCondition.getRows(), orderMapper.findFoodOrderByConditionCount(queryCondition));
        //设置列表数据
        pageBean.setList(orderMapper.findFoodOrderByCondition((queryCondition.getPage() - 1) * queryCondition.getRows(), queryCondition.getRows()));
        System.out.println(pageBean);
        return pageBean;
    }

    public void pay(Order order, Integer foodId) throws Exception{
        //更新当前菜品的剩余数量
        foodMapper.updateFoodRemainingCountMinusOne(foodId);
        //更新当前菜品的订单数量
        foodMapper.updateOrderCountAddOne(foodId);
        //订单信息
        UUID uuid = UUID.randomUUID();
        String orderId = uuid.toString().replaceAll("-","");
        order.setId(orderId);
        orderMapper.order(order);

        //订单详情信息
        OrderDetail orderDetail = new OrderDetail();
        orderDetail.setOrderId(order.getId());
        orderDetail.setFoodId(foodId);
        orderDetail.setCount(1);
        orderDetail.setCreateTime(new Date());
        orderDetail.setStatus(1);
        orderDetail.setEndTime(new Date());
        orderMapper.orderDetail(orderDetail);
    }

    @Override
    public OrderDetail findOrderDetailByOrderId(String id) throws Exception {

        //查询订单详情
        OrderDetail orderDetail = orderMapper.findOrderDetailByOrderId(id);
        //查询订单
        Order order = orderMapper.findOrderById(id);
        orderDetail.setOrder(order);
        //查询菜品
        Food food = foodMapper.findFoodById(orderDetail.getFoodId());
        orderDetail.setFood(food);

        System.out.println(orderDetail);
        return orderDetail;
    }


    @Override
    public int cancelOrder(String id) throws Exception {
        //查询订单详情
        OrderDetail orderDetail = orderMapper.findOrderDetailByOrderId(id);
        //根据订单详情的foodId更新OrderCount
        foodMapper.updateOrderCountMinusOne(orderDetail.getFoodId());
        //更新food剩余数量
        foodMapper.updateFoodRemainingCountAddOne(orderDetail.getFoodId());
        //删除订单
        int count = orderMapper.deleteOrder(id);
        //删除订单详情
        int count2 = orderMapper.deleteOrderDetail(id);
        return count+count2;
    }
}
