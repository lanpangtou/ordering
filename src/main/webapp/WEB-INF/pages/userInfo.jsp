<%--
  Created by IntelliJ IDEA.
  User: zy
  Date: 2020-06-06
  Time: 19:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <!-- 页面meta -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>个人信息</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no" name="viewport">

    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

    <link rel="stylesheet" href="../plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="../plugins/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="../plugins/ionicons/css/ionicons.min.css">
    <link rel="stylesheet" href="../plugins/iCheck/square/blue.css">
    <link rel="stylesheet" href="../plugins/morris/morris.css">
    <link rel="stylesheet" href="../plugins/jvectormap/jquery-jvectormap-1.2.2.css">
    <link rel="stylesheet" href="../plugins/datepicker/datepicker3.css">
    <link rel="stylesheet" href="../plugins/daterangepicker/daterangepicker.css">
    <link rel="stylesheet" href="../plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">
    <link rel="stylesheet" href="../plugins/datatables/dataTables.bootstrap.css">
    <link rel="stylesheet" href="../plugins/treeTable/jquery.treetable.css">
    <link rel="stylesheet" href="../plugins/treeTable/jquery.treetable.theme.default.css">
    <link rel="stylesheet" href="../plugins/select2/select2.css">
    <link rel="stylesheet" href="../plugins/colorpicker/bootstrap-colorpicker.min.css">
    <link rel="stylesheet" href="../plugins/bootstrap-markdown/css/bootstrap-markdown.min.css">
    <link rel="stylesheet" href="../plugins/adminLTE/css/AdminLTE.css">
    <link rel="stylesheet" href="../plugins/adminLTE/css/skins/_all-skins.min.css">
    <link rel="stylesheet" href="../css/style.css">
    <link rel="stylesheet" href="../plugins/ionslider/ion.rangeSlider.css">
    <link rel="stylesheet" href="../plugins/ionslider/ion.rangeSlider.skinNice.css">
    <link rel="stylesheet" href="../plugins/bootstrap-slider/slider.css">
    <link rel="stylesheet" href="../plugins/bootstrap-datetimepicker/bootstrap-datetimepicker.css">
    <style>
        .save,.back{
            border: none;
            color: white;
            border-radius: 3px;
            background-color: rgb(228,49,93);
            padding: 10px;
            font-size: 12px;
        }
        .save{
            margin-right: 10px;
        }
    </style>
</head>

<body class="hold-transition skin-purple sidebar-mini">

<div class="wrapper">

    <jsp:include page="head.jsp"></jsp:include>

    <jsp:include page="aside.jsp"></jsp:include>

    <!-- 内容区域 -->
    <div class="content-wrapper">

        <!-- 内容头部 -->
        <section class="content-header">
            <h1>
                个人资料
                <small>资料表单</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="all-admin-index.html"><i class="fa fa-dashboard"></i> 首页</a></li>
                <li><a href="all-order-manage-list.html">个人资料</a></li>
                <li class="active">图书资料</li>
            </ol>
        </section>
        <!-- 内容头部 /-->

        <!-- 正文区域 -->
        <section id="userDetail" class="content">
            <form id="updateUser">
                <div class="panel panel-default">
                    <input hidden id="id" type="text" name="id" value="">
                </div>
                <div class="panel panel-default">
                    <div class="panel-heading">图书状态</div>
                    <div class="row data-type">

                        <div class="col-md-2 title">姓名</div>
                        <div class="disable col-md-10 data text">
                            <input type="text" id="name" name="name" class="form-control" value="">
                        </div>

                        <div class="col-md-2 title">头像</div>
                        <div class="col-md-10 data text">
                            <input hidden type="text" name="images" value="">
                            <a href="#"  class="a-upload">
                                <input type="file" id="upfile" onchange="upload()" class="a-upload" value="">选择图片
                            </a>
                        </div>
                        <img id="img">

                        <div class="col-md-2 title">性别</div>
                        <div class="col-md-10 data">
                            <div id="isDel" class="form-group form-inline">
                                <div class="radio"><label><input class="disable" type="radio" name="sex" value="0"> 男</label></div>
                                <div class="radio"><label><input class="disable" type="radio" name="sex" value="1"> 女</label></div>
                            </div>
                        </div>

                        <div class="col-md-2 title">生日</div>
                        <div  class="disable col-md-10 data text">
                            <input type="text" id="birthday" name="birthday" class="form-control" value="">
                        </div>

                        <div class="col-md-2 title">电话</div>
                        <div  class="disable col-md-10 data text">
                            <input type="text" id="phone" name="phone" class="form-control" value="">
                        </div>

                        <div class="col-md-2 title">邮箱</div>
                        <div class="col-md-10 data text">
                            <input  type="text" id="email" name="email" class="form-control" value="">
                        </div>
                    </div>
                </div>
            </form>

            <!--工具栏-->
            <div class="box-tools text-center">
                <button type="button" class="btn bg-maroon" onclick="updateUser()">保存</button>
                <button type="button" class="btn bg-maroon" onclick="edit()">修改</button>
                <button type="button" class="btn bg-maroon" onclick="history.back(-1);">返回</button>
            </div>
            <!--工具栏/-->

        </section>
        <!-- 正文区域 /-->

    </div>
    <!-- 内容区域 /-->

    <jsp:include page="foot.jsp"></jsp:include>

</div>


<script src="../plugins/jQuery/jquery-2.2.3.min.js"></script>
<script src="../plugins/jQueryUI/jquery-ui.min.js"></script>
<script src="../js/jquery.js"></script>

<script>
    $(function () {
        var id = window.location.search.substr(4);
        $.get("/user/data",{id:id},function (data) {
            $("input").attr("disabled","true")
            $("#id").val(data.id);
            $("#name").val(data.name);
            if(data.sex == false){
                $('input[value="0"]').attr('checked', true);
            }
            if(data.sex == true){
                $('input[value="1"]').attr('checked', true);
            }
            $("#birthday").val(data.birthdayStr);
            $("#phone").val(data.phone);
            $("#email").val(data.email);

        })
    })

    function edit() {
        $("input").removeAttr("disabled");
    }
    function updateUser() {
        $.post("/user/update",$("#updateUser").serialize(),function () {
            location.reload();
        })
    }

    function upload() {
        var fd = new FormData();
        fd.append("file",$("#upfile").get(0).files[0]);
        $.ajax({
            url:"/upload/image",
            data:fd,
            dataType:"text",
            type:"post",
            processData : false, // 使数据不做处理
            contentType : false,
            success:function(data) {
                console.log(data);
                $("input[name = 'images']").val(data);
                $("#img").attr("src",data).css({"width":"100px","height":"100px"});
            },
            error:function (dat) {
                alert("上传失败！")
            }
        });
    }
</script>

<script src="../plugins/bootstrap/js/bootstrap.min.js"></script>
<script src="../plugins/raphael/raphael-min.js"></script>
<script src="../plugins/morris/morris.min.js"></script>
<script src="../plugins/sparkline/jquery.sparkline.min.js"></script>
<script src="../plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
<script src="../plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
<script src="../plugins/knob/jquery.knob.js"></script>
<script src="../plugins/daterangepicker/moment.min.js"></script>
<script src="../plugins/daterangepicker/daterangepicker.js"></script>
<script src="../plugins/daterangepicker/daterangepicker.zh-CN.js"></script>
<script src="../plugins/datepicker/bootstrap-datepicker.js"></script>
<script src="../plugins/datepicker/locales/bootstrap-datepicker.zh-CN.js"></script>
<script src="../plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
<script src="../plugins/slimScroll/jquery.slimscroll.min.js"></script>
<script src="../plugins/fastclick/fastclick.js"></script>
<script src="../plugins/iCheck/icheck.min.js"></script>
<script src="../plugins/adminLTE/js/app.min.js"></script>
<script src="../plugins/treeTable/jquery.treetable.js"></script>
<script src="../plugins/select2/select2.full.min.js"></script>
<script src="../plugins/colorpicker/bootstrap-colorpicker.min.js"></script>
<script src="../plugins/bootstrap-wysihtml5/bootstrap-wysihtml5.zh-CN.js"></script>
<script src="../plugins/bootstrap-markdown/js/bootstrap-markdown.js"></script>
<script src="../plugins/bootstrap-markdown/locale/bootstrap-markdown.zh.js"></script>
<script src="../plugins/bootstrap-markdown/js/markdown.js"></script>
<script src="../plugins/bootstrap-markdown/js/to-markdown.js"></script>
<script src="../plugins/ckeditor/ckeditor.js"></script>
<script src="../plugins/input-mask/jquery.inputmask.js"></script>
<script src="../plugins/input-mask/jquery.inputmask.date.extensions.js"></script>
<script src="../plugins/input-mask/jquery.inputmask.extensions.js"></script>
<script src="../plugins/datatables/jquery.dataTables.min.js"></script>
<script src="../plugins/datatables/dataTables.bootstrap.min.js"></script>
<script src="../plugins/chartjs/Chart.min.js"></script>
<script src="../plugins/flot/jquery.flot.min.js"></script>
<script src="../plugins/flot/jquery.flot.resize.min.js"></script>
<script src="../plugins/flot/jquery.flot.pie.min.js"></script>
<script src="../plugins/flot/jquery.flot.categories.min.js"></script>
<script src="../plugins/ionslider/ion.rangeSlider.min.js"></script>
<script src="../plugins/bootstrap-slider/bootstrap-slider.js"></script>
<script src="../plugins/bootstrap-datetimepicker/bootstrap-datetimepicker.js"></script>
<script src="../plugins/bootstrap-datetimepicker/locales/bootstrap-datetimepicker.zh-CN.js"></script>
<script>
    $(document).ready(function() {
        // 选择框
        $(".select2").select2();

        // WYSIHTML5编辑器
        $(".textarea").wysihtml5({
            locale: 'zh-CN'
        });
    });


    // 设置激活菜单
    function setSidebarActive(tagUri) {
        var liObj = $("#" + tagUri);
        if (liObj.length > 0) {
            liObj.parent().parent().addClass("active");
            liObj.addClass("active");
        }
    }


    $(document).ready(function() {
        $('#datepicker-a3').datepicker({
            autoclose: true,
            language: 'zh-CN'
        });
    });


    $(document).ready(function() {
        $('#datepicker-a6').datepicker({
            autoclose: true,
            language: 'zh-CN'
        });
    });


    $(document).ready(function() {
        // 激活导航位置
        setSidebarActive("order-manage");
    });
</script>
</body>

</html>
