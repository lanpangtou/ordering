package cn.lanpangtou.service;

import cn.lanpangtou.pojo.User;


public interface UserService {

    public User findByUser(User user) throws Exception;

    public String checkName(String name) throws Exception;

    public int addUser(User user) throws Exception;

    public void updateUser(User user) throws Exception;

    public User findUserByName(String name) throws Exception;
}
