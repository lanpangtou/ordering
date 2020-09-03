package cn.lanpangtou.mapper;

import cn.lanpangtou.pojo.Food;
import cn.lanpangtou.pojo.QueryCondition;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import java.util.List;

@Repository
public interface FoodMapper {

    @Insert("insert into food(cid,dishName,`desc`,images,price,discountPrice,saleable,discount,discountType,count,remainingCount,createTime,lastUpdateTime)" +
            " values(#{cid},#{dishName},#{desc},#{images},#{price},#{discountPrice},#{saleable},#{discount},#{discountType},#{count},#{remainingCount},#{createTime},#{lastUpdateTime})")
    public int addFood(Food food) throws Exception;

    @Delete("update food set del = 0 where id = #{id}")
    public void deleteFoodById(@Param("id") int id) throws Exception;

    /**
     * 条件查询总记录数
     * @param condition
     * @return
     * @throws Exception
     */
    @Select({"<script>select count(id) from food " +
            "<where>" +
            "<if test='dishName !=null'> and dishName like '%${dishName}%'</if>" +
            "<if test='saleable !=null'> and saleable = #{saleable}</if>" +
            "<if test='discount !=null'> and discount = #{discount}</if>" +
            "<if test='priceMin !=null'> and price <![CDATA[ >= ]]> #{priceMin}</if>" +
            "<if test='priceMax !=null'> and price <![CDATA[ <= ]]> #{priceMax}</if>" +
            " and del = 1"+
            "</where>" +
            "</script>"})
    public int findFoodByConditionCount(QueryCondition condition) throws Exception;

    /**
     * 条件分页查询菜品列表
     * @param startIndex
     * @param rows
     * @return
     * @throws Exception
     *
     */
    @Select({"<script>select * from food " +
            "<where>" +
            "<if test='condition.dishName !=null'> and dishName like '%${condition.dishName}%'</if>" +
            "<if test='condition.saleable !=null'> and saleable = #{condition.saleable}</if>" +
            "<if test='condition.discount !=null'> and discount = #{condition.discount}</if>" +
            "<if test='condition.priceMin !=null'> and price <![CDATA[ >= ]]> #{condition.priceMin}</if>" +
            "<if test='condition.priceMax !=null'> and price <![CDATA[ <= ]]> #{condition.priceMax}</if>" +
            " and del = 1"+
            "</where>" +
            "limit #{startIndex},#{rows}"+
            "</script>"})
    public List<Food> findFoodByCondition(@Param("startIndex") int startIndex, @Param("rows") int rows, @Param("condition") QueryCondition condition) throws Exception;


    /**
     * 根据id查询食物
     * @param id
     * @return
     * @throws Exception
     */
    @Select("select * from food where del = 1 and id = #{id}")
    public Food findFoodById(@Param("id") int id) throws Exception;

    /**
     * 根据id更新食物
     * @param food
     * @throws Exception
     */
    @Update("update food set cid=#{cid},dishName=#{dishName},`desc`=#{desc}," +
            "price=#{price},discountPrice=#{discountPrice},saleable=#{saleable},del=#{del},discount=#{discount}," +
            "discountType=#{discountType},count=#{count},remainingCount=#{remainingCount},lastUpdateTime=#{lastUpdateTime} where id = #{id}")
    public void updateFood(Food food) throws Exception;

    /**
     * 当前菜品的订单数量减1
     * @param foodId
     * @throws Exception
     */
    @Update("update food set orderCount = orderCount - 1 where id = #{foodId} ")
    public void updateOrderCountMinusOne(@Param("foodId") int foodId) throws Exception;

    /**
     * 当前菜品的订单数量加1
     * @param foodId
     * @throws Exception
     */
    @Update("update food set orderCount = orderCount + 1 where id = #{foodId} ")
    public void updateOrderCountAddOne(@Param("foodId") int foodId) throws Exception;

    /**
     * 当前菜品的剩余数量减1
     * @param foodId
     */
    @Update("update food set remainingCount = remainingCount - 1 where id = #{foodId} ")
    public void updateFoodRemainingCountMinusOne(@Param("foodId") int foodId);

    /**
     * 当前菜品的剩余数加1
     * @param foodId
     */
    @Update("update food set remainingCount = remainingCount + 1 where id = #{foodId} ")
    public void updateFoodRemainingCountAddOne(@Param("foodId") int foodId);
}
