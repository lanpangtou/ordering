package cn.lanpangtou.web;

import cn.lanpangtou.pojo.*;
import cn.lanpangtou.service.FoodService;
import cn.lanpangtou.service.OrderService;
import cn.lanpangtou.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("order")
public class OrderController {

    @Autowired
    private OrderService orderService;

    @Autowired
    private FoodService foodService;

    @Autowired
    private UserService userService;


    /**
     * 根条件分页查询食物
     * @param page
     * @param rows
     * @return
     * @throws Exception
     */
    @RequestMapping("page")
    public @ResponseBody PageBean findFoodByPage(QueryCondition queryCondition) throws Exception{
        System.out.println("-------");
        PageBean pageBean = orderService.findFoodOrderByPage(queryCondition);
        return pageBean;
    }


    /**
     * 根据id查找商品
     * @param id
     * @return
     * @throws Exception
     */
    @RequestMapping("findFood")
    public @ResponseBody Food findFoodById(@RequestParam("id")Integer id) throws Exception {
        return foodService.findFoodById(id);
    }

    /**
     * 支付购买
     * @param order
     * @param orderId
     */
    @RequestMapping("pay")
    public @ResponseBody void pay(Order order, @RequestParam("foodId")Integer foodId, HttpServletRequest request) throws Exception {
        User user = (User) request.getSession().getAttribute("user");
        order.setUserId(user.getId());
        order.setConsignee(user.getName());
        orderService.pay(order,foodId);
    }

    /**
     * 根据orderId查询orderDetail详情
     * @param id
     * @return
     * @throws Exception
     */
    @RequestMapping("orderDetail")
    public @ResponseBody OrderDetail findOrderDetailByOrderId(@RequestParam("id")String id) throws Exception {
        System.out.println(id);
        return orderService.findOrderDetailByOrderId(id);
    }

    /**
     * 取消订单
     * @param id
     * @throws Exception
     */
    @RequestMapping("cancelOrder")
    public @ResponseBody void cancelOrder(@RequestParam("id")String id) throws Exception{
        int count = orderService.cancelOrder(id);
    }


    @RequestMapping("payPage")
    public String payPage(){
        return "pay";
    }

    @RequestMapping("foodOrderPage")
    public String foodOrderPage(){
        return "foodOrder";
    }


    @RequestMapping("orderDetailPage")
    public String orderDetailPage(){
        return "orderDetail";
    }
}
