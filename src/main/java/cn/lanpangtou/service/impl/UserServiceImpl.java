package cn.lanpangtou.service.impl;

import cn.lanpangtou.mapper.UserMapper;
import cn.lanpangtou.mapper.UserMapper;
import cn.lanpangtou.pojo.User;
import cn.lanpangtou.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;

@Service
@Transactional
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;


    public User findByUser(User user) throws Exception {
        return userMapper.findByUser(user);
    }

    public String checkName(String name) throws Exception {
        return userMapper.checkName(name);
    }

    public int addUser(User user) throws Exception {
        user.setCreateTime(new Date());
        if (user.getImages() == null){
            user.setImages("http://localhost:8080/img/lanpangtou.jpg");
        }
        return userMapper.addUser(user);
    }

    public void updateUser(User user) throws Exception {
        userMapper.updateUser(user);
    }

    @Override
    public User findUserByName(String name) throws Exception {
        return userMapper.findUserByName(name);
    }
}
