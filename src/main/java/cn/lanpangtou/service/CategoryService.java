package cn.lanpangtou.service;

import cn.lanpangtou.pojo.Category;
import cn.lanpangtou.pojo.Food;
import cn.lanpangtou.pojo.PageBean;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CategoryService {

    public PageBean<Category> findFoodByPage(int page, int rows) throws Exception;

    public List<Category> findNames() throws Exception;
}
