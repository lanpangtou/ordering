package cn.lanpangtou.service.impl;

import cn.lanpangtou.mapper.CategoryMapper;
import cn.lanpangtou.pojo.Category;
import cn.lanpangtou.pojo.Food;
import cn.lanpangtou.pojo.PageBean;
import cn.lanpangtou.service.CategoryService;
import cn.lanpangtou.util.PageUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class CategoryServiceImpl implements CategoryService {

    @Autowired
    private CategoryMapper categoryMapper;
    public PageBean<Category> findFoodByPage(int page, int rows) throws Exception {

        //调用分页方法
        PageBean pageBean = PageUtil.pageBean(page, rows, categoryMapper.findTotalCount());
        //设置列表数据
        pageBean.setList(categoryMapper.findFoodByPage((page - 1) * rows, rows));

        return pageBean;
    }

    public List<Category> findNames() throws Exception {
        return categoryMapper.findNames();
    }
}
