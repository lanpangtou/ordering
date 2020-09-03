<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- 页面头部 -->
<header class="main-header">


    <!-- Logo -->
    <a href="/WEB-INF/pages/main.jsp" class="logo">
        <!-- mini logo for sidebar mini 50x50 pixels -->
        <span class="logo-mini"><b>点餐</b></span>
        <!-- logo for regular state and mobile devices -->
        <span class="logo-lg"><b>点餐</b>后台管理</span>
    </a>


    <!-- Header Navbar: style can be found in header.less -->
    <nav class="navbar navbar-static-top">
        <!-- Sidebar toggle button-->
        <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
            <span class="sr-only">Toggle navigation</span>
        </a>

        <div class="navbar-custom-menu">
            <ul class="nav navbar-nav">

                <!-- User Account: style can be found in dropdown.less -->
                <li class="dropdown user user-menu">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <img src="" class="user-image head" alt="User Image">
                        <span class="uname" class="hidden-xs"></span>
                    </a>
                    <ul class="dropdown-menu">
                        <!-- User image -->
                        <li class="user-header">
                            <img src="" class="img-circle head" alt="User Image">
                            <p class="uname"></p>
                        </li>

                        <!-- Menu Footer-->
                        <li class="user-footer">
                            <div class="pull-left">
                                <a href="#" class="btn btn-default btn-flat">修改密码</a>
                            </div>
                            <div class="pull-right">
                                <a href="/user/logOut" class="btn btn-default btn-flat">注销</a>
                            </div>
                        </li>
                    </ul>
                </li>

            </ul>
        </div>
    </nav>
</header>
<!-- 页面头部 /-->