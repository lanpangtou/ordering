package cn.lanpangtou.web;

import cn.lanpangtou.pojo.User;
import cn.lanpangtou.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

@SuppressWarnings("Duplicates")
@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;

    /**
     * 登录验证
     * @param user
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping("login")
    public String findByUser(User user, @RequestParam("checkCode")String code, HttpServletRequest request, Model model) throws Exception {
        String checkCode = (String)request.getSession().getAttribute("checkCode");
        if (!code.equalsIgnoreCase(checkCode)){
            model.addAttribute("login","");
            return "redirect:/login.jsp";
        }
        User u = userService.findByUser(user);
        if(u != null){
            request.getSession().setAttribute("user",u);
            return "main";
        }
        return "redirect:/login.jsp";
    }

    /**
     * 获取用户昵称
     * @param request
     * @return
     */
    @RequestMapping("info")
    public @ResponseBody Map<String,Object> findName(HttpServletRequest request){
        User user = (User) request.getSession().getAttribute("user");
        Map<String,Object> map = new HashMap<String, Object>();
        map.put("name",user.getName());
        map.put("head",user.getImages());
        return map;
    }

    @RequestMapping("data")
    public @ResponseBody  User findUserData(HttpServletRequest request){
        User user = (User) request.getSession().getAttribute("user");
        return user;
    }
    /**
     * 退出
     * @param request
     * @return
     */
    @RequestMapping("logOut")
    public String logOut(HttpServletRequest request){
        request.getSession().removeAttribute("user");
        return "redirect:/login.jsp";
    }

    /**
     * 检测名字是否存在
     * @param name
     * @return
     * @throws Exception
     */
    @RequestMapping("checkName")
    public @ResponseBody String checkName(@RequestParam("name") String name) throws Exception {
        String username = userService.checkName(name);
        return username != null ? "n" : "y";
    }

    /**
     * 新增用户
     * @param user
     * @return
     */
    @RequestMapping("addUser")
    public @ResponseBody String addUser(User user) throws Exception {
        if (userService.checkName(user.getName()) != null || user.getName() == null){
            return "n";
        }
        int count = userService.addUser(user);
        return count == 1 ? "y" : "n";
    }

    /**
     * 更新用户
     * @param user
     * @throws Exception
     */
    @RequestMapping("update")
    public @ResponseBody void updateUser(User user) throws Exception {
        userService.updateUser(user);
    }

    /**
     * 验证码
     * @param request
     * @param response
     * @throws Exception
     */
    @RequestMapping("code")
    public void getCode(HttpServletRequest request,HttpServletResponse response) throws Exception {
        int width = 100;
        int height = 35;
        BufferedImage image = new BufferedImage(width,height,BufferedImage.TYPE_INT_BGR);

        Graphics g = image.getGraphics();
        //填充背景色
        g.setColor(Color.PINK);
        g.fillRect(0,0,width,height);
        System.out.println("0");
        //画边框
        g.setColor(Color.GRAY);
        g.drawRect(0,0,width -1,height -1);
        Random random = new Random();
        String codes = "QWERTYUIOPASDFGHJKLZXCVBNMqwertyuiopasdfghjklzxcvbnm1234567890";
        request.getSession().removeAttribute("checkCode");
        String code = "";
        //写验证码
        for (int i = 0; i < 4; i++) {
            //获取随机字符
            char codeStr = codes.charAt(random.nextInt(codes.length()));
            code+=codeStr;
            //写验证码
            g.drawString(codeStr+"",width/4*i+10,height/2);
        }
        request.getSession().setAttribute("checkCode",code);
        ImageIO.write(image,"jpg",response.getOutputStream());
        response.getOutputStream().flush();
    }

    @RequestMapping("registerPage")
    public String registerPage(){
        return "register";
    }

    @RequestMapping("userInfoPage")
    public String userInfoPage(){
        return "userInfo";
    }

    @RequestMapping("loginPage")
    public String loginPage(){
        return "/login.jsp";
    }

    @RequestMapping("mainPage")
    public String mainPage(){
        return "main";
    }
}

