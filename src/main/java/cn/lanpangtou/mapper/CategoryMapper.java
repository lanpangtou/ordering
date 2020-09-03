package cn.lanpangtou.mapper;

import cn.lanpangtou.pojo.Category;
import cn.lanpangtou.pojo.Food;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CategoryMapper {

    @Select("select count(id) from category")
    public int findTotalCount() throws Exception;

    @Select("select * from category limit #{startIndex},#{rows}")
    public List<Category> findFoodByPage(@Param("startIndex") int startIndex, @Param("rows") int rows) throws Exception;

    @Select("select id from category where name = $(0")
    public int findIdByName(Integer cid) throws Exception;

    @Select("select * from category")
    public List<Category> findAll() throws Exception;

    @Select("select * from category")
    public List<Category> findNames() throws Exception;
}
