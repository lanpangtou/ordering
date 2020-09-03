package cn.lanpangtou.web;

import cn.lanpangtou.pojo.Food;
import cn.lanpangtou.pojo.PageBean;
import cn.lanpangtou.pojo.QueryCondition;
import cn.lanpangtou.service.FoodService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
@RequestMapping("food")
public class FoodController {

    @Autowired
    private FoodService foodService;

    /**
     * 根条件分页查询食物
     * @param page
     * @param rows
     * @return
     * @throws Exception
     */
    @RequestMapping("page")
    public @ResponseBody PageBean findFoodOrderByPage(QueryCondition queryCondition) throws Exception{
        PageBean<Food> pageBean = foodService.findFoodByPage(queryCondition);
        return pageBean;
    }

    /**
     * 添加食物
     * @param food
     * @return
     * @throws Exception
     */
    @RequestMapping("addFood")
    public @ResponseBody String addFood(Food food) throws Exception{
        System.out.println(food);
        int count = foodService.addFood(food);
        return count == 1 ? "y" : "n";
    }

    /**
     * 根据id删除
     * @param id
     * @throws Exception
     */
    @RequestMapping("/delete")
    public @ResponseBody void deleteBookById(@RequestParam String id) throws Exception {
        foodService.deleteFoodById(Integer.parseInt(id));
    }

    /**
     * 批量删除
     * @param ids
     * @throws Exception
     */
    @RequestMapping("/delSelected")
    public @ResponseBody void  delSelected(@RequestParam("ids[]") String[] ids) throws Exception {
            if(ids != null && ids.length != 0){
            for (int i = 0; i < ids.length; i++) {
                foodService.deleteFoodById(Integer.parseInt(ids[i]));
            }
        }
    }


    /**
     * 根据id查找食物
     * @param id
     * @throws Exception
     */
    @RequestMapping("/findFoodById")
    public @ResponseBody Food findFoodById(@RequestParam String id) throws Exception {
        return foodService.findFoodById(Integer.parseInt(id));
    }

    /**
     * 根据id更新食物
     * @param id
     * @throws Exception
     */
    @RequestMapping("/updateFood")
    public @ResponseBody void updateFood(Food food) throws Exception {
        foodService.updateFood(food);
    }


    @RequestMapping("addFoodPage")
    public String addFoodPage(){
        return "addFood";
    }

    @RequestMapping("foodPage")
    public String foodPage(){
        return "foodPage";
    }

    @RequestMapping("foodDetail")
    public String foodDetail(){
        return "foodDetail";
    }
}
