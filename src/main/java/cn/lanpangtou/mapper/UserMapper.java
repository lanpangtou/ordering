package cn.lanpangtou.mapper;

import cn.lanpangtou.pojo.User;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

@Repository
public interface UserMapper{


    @Select("select * from user where name =#{name} and password = #{password}")
    public User findByUser(User user);

    @Select("select name from user where name = #{name}")
    public String checkName(@Param("name") String name) throws Exception;

    @Insert("insert into user(name,password,images,admin,birthday,sex,phone,email,address,createTime)" +
            "values(#{name},#{password},#{images},#{admin},#{birthday},#{sex},#{phone},#{email},#{address},#{createTime})")
    public int addUser(User user) throws  Exception;

    @Update("update user set name = #{name},images = #{images},admin = #{admin},birthday = #{birthday}," +
            "sex = #{sex},phone = #{phone},email = #{email},address = #{address},createTime = #{createTime} where id = #{id}")
    public int updateUser(User user) throws Exception;

    @Select("select * from user where name = #{name}")
    public User findUserByName(@Param("name") String name) throws Exception;
}
