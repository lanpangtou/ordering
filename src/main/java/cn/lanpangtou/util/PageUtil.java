package cn.lanpangtou.util;

import cn.lanpangtou.pojo.PageBean;

public class PageUtil {
    /**
     * 分页方法
     * @param page  当前页数
     * @param rows  显示条数
     * @param totalCounts   总记录数
     * @param <T>
     * @return
     */
    public static  <T> PageBean pageBean(int page, int rows, int totalCounts){
        //创建pageBean
        PageBean<T> pageBean = new PageBean<T>();
        //设置参数
        pageBean.setCurrentPage(page);//当前页
        pageBean.setRows(rows);//每页显示的条数
        //查询总记录数
        int totalCount = totalCounts;
        pageBean.setTotalCount(totalCount);
        //计算开始查询的索引
        //int startIndex = (page - 1) * rows;
        //查询List列表
        //总页数
        int totalPage = totalCount%rows == 0 ? totalCount/rows : totalCount/rows + 1;
        pageBean.setTotalPage(totalPage);
        return pageBean;
    }
}
