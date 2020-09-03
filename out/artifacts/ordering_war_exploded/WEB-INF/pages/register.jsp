<%--
  Created by IntelliJ IDEA.
  User: zy
  Date: 2020-06-05
  Time: 16:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>注册</title>
    <meta content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no" name="viewport">

    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

    <link rel="stylesheet" href="/plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/plugins/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="/plugins/ionicons/css/ionicons.min.css">
    <link rel="stylesheet" href="/plugins/adminLTE/css/AdminLTE.css">
    <link rel="stylesheet" href="/plugins/iCheck/square/blue.css">
</head>

<body class="hold-transition register-page">
<div class="register-box">
    <div class="register-logo">
        <a href="all-admin-index.html"><b>点餐</b>系统</a>
    </div>

    <div class="register-box-body">
        <h3 class="login-box-msg">新用户注册</h3>


        <form>
            <div class="form-group has-feedback">
                <input type="text" name="name" onblur="checkName()" class="form-control" placeholder="全名">
                <span class="glyphicon glyphicon-user form-control-feedback"></span>
                <P id="info"></P>
            </div>
            <div class="form-group has-feedback">
                <input type="password" name="password" id="password1" class="form-control" placeholder="密码">
                <span class="glyphicon glyphicon-lock form-control-feedback"></span>
            </div>
            <div class="form-group has-feedback">
                <input type="password" class="form-control" id="password2" placeholder="确认密码">
                <span class="glyphicon glyphicon-log-in form-control-feedback"></span>
            </div>
            <div class="form-group has-feedback">
                <input type="email" name="email" class="form-control" placeholder="Email">
                <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
            </div>
            <div class="row">
                <div class="col-xs-4">
                    <button type="submit" onclick="register()" class="btn btn-primary btn-block btn-flat">注册</button>
                </div>
            </div>
        </form>
        <p class="text-right"><a href="/login.jsp" class="text-right">我有账号，现在就去登录</a></p>
    </div>
    <!-- /.form-box -->
</div>
<!-- /.register-box -->

<script src="/plugins/jQuery/jquery-2.2.3.min.js"></script>
<script src="/plugins/bootstrap/js/bootstrap.min.js"></script>
<script src="/plugins/iCheck/icheck.min.js"></script>
<script>
    $(function() {
        $('input').iCheck({
            checkboxClass: 'icheckbox_square-blue',
            radioClass: 'iradio_square-blue',
            increaseArea: '20%' // optional
        });
    });

    //用户名检测
    function checkName() {
        $.get("/user/checkName","name="+$("input[name='name']").val(),function (data) {
            data == 'y' ? $("#info").html("用户名可用").css("color","green"):$("#info").html("用户名不可用").css("color","red");
        },"text");
    }

    function register() {
        $.post("/user/addUser",$("input").serialize(),function (data) {
            data == 'y' ? alert("注册成功") : alert("注册失败");
        })
    }


</script>
</body>

</html>
