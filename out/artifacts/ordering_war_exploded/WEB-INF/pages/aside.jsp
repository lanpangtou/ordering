<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- 导航侧栏 -->
<script src="/js/jquery.js"></script>
<script>
    $(function () {
        $.get("/user/info",function (data) {
            $(".uname").html(data.name);
            $(".head").attr("src",data.head);
        },"json")
    })
</script>
<aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
        <!-- Sidebar user panel -->
        <div class="user-panel">
            <div class="pull-left image">
                <img src="" class="img-circle head" alt="User Image">
            </div>
            <div class="pull-left info">
                <p class="uname"></p>
                <a href="#"><i class="fa fa-circle text-success"></i> 在线</a>
            </div>
        </div>

        <ul class="sidebar-menu">
            <li class="header">菜单</li>

            <li id="admin-index"><a href="/user/mainPage"><i class="fa fa-dashboard"></i> <span>首页</span></a></li>

            <!-- 菜单 -->



            <li class="treeview">
                <a href="#">
                    <i class="fa fa-folder"></i> <span>菜品管理</span>
                    <span class="pull-right-container">
                        <i class="fa fa-angle-left pull-right"></i>
                    </span>
                </a>
                <ul class="treeview-menu">

                    <li id="admin-login">
                        <a href="/food/foodPage">
                            <i class="fa fa-circle-o"></i> 菜品列表
                        </a>
                    </li>

                    <li id="admin-register">
                        <a href="/category/foodCategoryPage">
                            <i class="fa fa-circle-o"></i> 菜品分类
                        </a>
                    </li>

                    <li id="admin-404">
                        <a href="/food/addFoodPage">
                            <i class="fa fa-circle-o"></i> 新增菜品
                        </a>
                    </li>
                    <li id="admin-404">
                        <a href="/order/foodOrderPage">
                            <i class="fa fa-circle-o"></i> 订单信息
                        </a>
                    </li>
                </ul>
            </li>



            <li class="treeview">
                <a href="#">
                    <i class="fa fa-pie-chart"></i> <span>用户管理</span>
                    <span class="pull-right-container">
                        <i class="fa fa-angle-left pull-right"></i>
                    </span>
                </a>
                <ul class="treeview-menu">

                    <li id="charts-chartjs">
                        <a href="/user/userInfoPage">
                            <i class="fa fa-circle-o"></i> 详细资料

                        </a>
                    </li>

                </ul>
            </li>


            <!-- 菜单 /-->

        </ul>
    </section>
    <!-- /.sidebar -->
</aside>
<!-- 导航侧栏 /-->





