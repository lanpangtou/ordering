package cn.lanpangtou.web;

import cn.lanpangtou.pojo.Category;
import cn.lanpangtou.pojo.Food;
import cn.lanpangtou.pojo.PageBean;
import cn.lanpangtou.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("category")
public class CategoryController {

    @Autowired
    private CategoryService categoryService;


    @RequestMapping("/page")
    public @ResponseBody PageBean findFoodByPage(@RequestParam String page, @RequestParam String rows) throws Exception{
        PageBean<Category> pageBean = categoryService.findFoodByPage(Integer.parseInt(page),Integer.parseInt(rows));
        System.out.println(pageBean);
        return pageBean;
    }

    @RequestMapping("/names")
    public @ResponseBody List<Category> findNames() throws Exception{
        List<Category> names = categoryService.findNames();
        return names;
    }

    @RequestMapping("foodCategoryPage")
    public String addFood(){
        return "foodCategory";
    }
}
