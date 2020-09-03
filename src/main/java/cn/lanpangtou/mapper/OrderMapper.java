package cn.lanpangtou.mapper;

import cn.lanpangtou.pojo.Order;
import cn.lanpangtou.pojo.OrderDetail;
import cn.lanpangtou.pojo.QueryCondition;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface OrderMapper {

    /**
     * 分页查询订单列表总记录数
     * @param queryCondition
     * @return
     */
    @Select("select count(id) from `order`")
    public int findFoodOrderByConditionCount(QueryCondition queryCondition);

    /**
     * 分页查询订单列表
     * @param startIndex
     * @param rows
     * @return
     */
    @Select("select * from `order` limit #{startIndex},#{rows}")
    public List<Order> findFoodOrderByCondition(@Param("startIndex") int startIndex, @Param("rows") int rows);


    /**
     * 生成订单详情信息
     * @param orderDetail
     * @throws Exception
     */
    @Insert("insert into order_detail(orderId,foodId,count,status,createTime,endTime,closeTime)" +
            " values(#{orderId},#{foodId},#{count},#{status},#{createTime},#{endTime},#{closeTime})")
    public void orderDetail(OrderDetail orderDetail) throws Exception;

    /**
     * 生成订单信息
     * @param orderDetail
     * @throws Exception
     */
    @Insert("insert into `order`(id,totalPay,actualPay,paymentType,buyerMessage,consignee,userId,address,phone)" +
            " values(#{id},#{totalPay},#{actualPay},#{paymentType},#{buyerMessage},#{consignee},#{userId},#{address},#{phone})")
    public void order(Order order) throws Exception;

    /**
     * 根据订单id查询订单详情
     * @param id
     * @return
     * @throws Exception
     */
    @Select("select * from order_detail where orderId = #{id}")
    public OrderDetail findOrderDetailByOrderId(String id)throws Exception;

    /**
     * 根据id查询订单
     * @param id
     * @return
     * @throws Exception
     */
    @Select("select * from `order` where id = #{id}")
    public Order findOrderById(String id) throws Exception;


    /**
     * 根据orderid删除订单
     * @param id
     * @return
     * @throws Exception
     */
    @Delete("delete from `order` where id = #{id}")
    public int deleteOrder(@Param("id") String id) throws Exception;

    /**
     * 根据orderid删除订单详情
     * @param id
     * @return
     * @throws Exception
     */
    @Delete("delete from order_detail where orderId = #{id}")
    public int deleteOrderDetail(@Param("id") String id) throws Exception;
}
