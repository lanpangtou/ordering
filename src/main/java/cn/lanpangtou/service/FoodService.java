package cn.lanpangtou.service;

import cn.lanpangtou.pojo.Food;
import cn.lanpangtou.pojo.PageBean;
import cn.lanpangtou.pojo.QueryCondition;

public interface FoodService {

    public PageBean<Food> findFoodByPage(QueryCondition queryCondition) throws Exception;

    public int addFood(Food food) throws Exception;

    public void deleteFoodById(int id) throws Exception;

    public Food findFoodById(int id) throws Exception;

    public void updateFood(Food food) throws Exception;
}
