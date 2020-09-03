package cn.lanpangtou.service.impl;

import cn.lanpangtou.mapper.CategoryMapper;
import cn.lanpangtou.mapper.FoodMapper;
import cn.lanpangtou.pojo.Food;
import cn.lanpangtou.pojo.PageBean;
import cn.lanpangtou.pojo.QueryCondition;
import cn.lanpangtou.service.FoodService;
import cn.lanpangtou.util.PageUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;

@Service
@Transactional
public class FoodServiceImpl implements FoodService {

    @Autowired
    private FoodMapper foodMapper;

    @Autowired
    private CategoryMapper categoryMapper;


    public PageBean<Food> findFoodByPage(QueryCondition queryCondition) throws Exception {
        //调用分页方法
        PageBean pageBean = PageUtil.pageBean(queryCondition.getPage(), queryCondition.getRows(), foodMapper.findFoodByConditionCount(queryCondition));
        //设置列表数据
        pageBean.setList(foodMapper.findFoodByCondition((queryCondition.getPage() - 1) * queryCondition.getRows(), queryCondition.getRows(),queryCondition));
        return pageBean;
    }



    public int addFood(Food food) throws Exception {
        if (food.getDiscount()){
            food.setDiscountPrice(Math.round(food.getPrice() * (food.getDiscountType() / 10)));
        }else {
            food.setDiscountType(10f);
            food.setDiscountPrice(food.getPrice());
        }
        food.setRemainingCount(food.getCount());
        food.setCreateTime(new Date());
        return foodMapper.addFood(food);
    }

    @Override
    public void deleteFoodById(int id) throws Exception {
        foodMapper.deleteFoodById(id);
    }


    @Override
    public Food findFoodById(int id) throws Exception {
        return foodMapper.findFoodById(id);
    }

    @Override
    public void updateFood(Food food) throws Exception {
        if (food.getDiscount()){
            food.setDiscountPrice(Math.round(food.getPrice() * (food.getDiscountType() / 10)));
        }else {
            food.setDiscountType(10f);
            food.setDiscountPrice(food.getPrice());
        }
        food.setDel(true);
        food.setLastUpdateTime(new Date());
        System.out.println(food);
        foodMapper.updateFood(food);
    }
}
