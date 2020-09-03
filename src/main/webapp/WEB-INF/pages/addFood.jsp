<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <!-- 页面meta -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>添加菜品</title>

    <meta content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no" name="viewport">

    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

    <link rel="stylesheet" href="../../plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="../../plugins/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="../../plugins/ionicons/css/ionicons.min.css">
    <link rel="stylesheet" href="../../plugins/iCheck/square/blue.css">
    <link rel="stylesheet" href="../../plugins/morris/morris.css">
    <link rel="stylesheet" href="../../plugins/jvectormap/jquery-jvectormap-1.2.2.css">
    <link rel="stylesheet" href="../../plugins/datepicker/datepicker3.css">
    <link rel="stylesheet" href="../../plugins/daterangepicker/daterangepicker.css">
    <link rel="stylesheet" href="../../plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">
    <link rel="stylesheet" href="../../plugins/datatables/dataTables.bootstrap.css">
    <link rel="stylesheet" href="../../plugins/treeTable/jquery.treetable.css">
    <link rel="stylesheet" href="../../plugins/treeTable/jquery.treetable.theme.default.css">
    <link rel="stylesheet" href="../../plugins/select2/select2.css">
    <link rel="stylesheet" href="../../plugins/colorpicker/bootstrap-colorpicker.min.css">
    <link rel="stylesheet" href="../../plugins/bootstrap-markdown/css/bootstrap-markdown.min.css">
    <link rel="stylesheet" href="../../plugins/adminLTE/css/AdminLTE.css">
    <link rel="stylesheet" href="../../plugins/adminLTE/css/skins/_all-skins.min.css">
    <link rel="stylesheet" href="../../css/style.css">
    <link rel="stylesheet" href="../../plugins/ionslider/ion.rangeSlider.css">
    <link rel="stylesheet" href="../../plugins/ionslider/ion.rangeSlider.skinNice.css">
    <link rel="stylesheet" href="../../plugins/bootstrap-slider/slider.css">
    <link rel="stylesheet" href="../../plugins/bootstrap-datetimepicker/bootstrap-datetimepicker.css">
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
                新增菜品
                <small>菜品表单</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> 首页</a></li>
                <li><a href="#">新增菜品</a></li>
                <li class="active">菜品表单</li>
            </ol>
        </section>
        <!-- 内容头部 /-->

        <!--tab内容-->
        <div class="tab-content">
            <form id="addFood">
            <!--label显示的内容-->
            <div class="tab-pane active" id="tab-label">

                <div class="row data-type">

                    <div class="col-md-2 title">菜名</div>
                    <div class="col-md-4 data text">
                        <input type="text" name="dishName" class="form-control" placeholder="菜名" value="">
                    </div>

                    <div class="col-md-2 title">描述</div>
                    <div class="col-md-4 data text">
                        <input type="text" name="desc" class="form-control" placeholder="描述" value="">
                    </div>

                    <div class="col-md-2 title">价钱</div>
                    <div class="col-md-4 data text">
                        <input type="text" name="price" class="form-control" placeholder="价钱" value="">
                    </div>

                    <div class="col-md-2 title">菜品种类</div>
                    <div class="col-md-4 data">
                        <select id="selectOption" name="cid" class="form-control select2 select2-hidden-accessible" style="width: 100%;" tabindex="-1" aria-hidden="true">

                        </select>
                    </div>

                    <div class="col-md-2 title">数量</div>
                    <div class="col-md-4 data text">
                        <input type="text" name="count" class="form-control" placeholder="数量" value="">
                    </div>

                    <div class="col-md-2 title">状态</div>
                    <div class="col-md-4 data">
                        <select name="saleable" class="form-control select2 select2-hidden-accessible" style="width: 100%;" tabindex="-1" aria-hidden="true">
                            <option value="1" selected="selected">售卖</option>
                            <option value="0">已售完</option>
                        </select>
                    </div>

                    <div class="col-md-2 title">是否打折</div>
                    <div class="col-md-4 data">
                        <select name="discount" class="form-control select2 select2-hidden-accessible" style="width: 100%;" tabindex="-1" aria-hidden="true">
                            <option value="1">打折</option>
                            <option value="0" selected="selected">不打折</option>
                        </select>
                    </div>

                    <div class="col-md-2 title">折扣</div>
                    <div class="col-md-4 data text">
                        <input type="text" disabled name="discountType" class="form-control" placeholder="几折" value="">
                    </div>

                    <div class="col-md-2 title">图片</div>
                    <div class="col-md-4 data text">
                        <input hidden type="text" name="images" value="">
                        <a href="#"  class="a-upload">
                            <input type="file" id="upfile" onchange="upload()"  class="a-upload" value="">选择图片
                        </a>
                    </div>
                </div>
            </div>
            </form>
                <img id="img">

            <div class="box-tools text-center">
                <button class="btn bg-maroon" id="saveFood">添加</button>
                <button class="btn bg-maroon" onclick="history.back()-1">返回</button>
            </div>
        </div>
        <!--label显示的内容/-->
    </div>
    <!-- 内容区域 /-->

    <jsp:include page="foot.jsp"></jsp:include>

</div>


<script src="../../plugins/jQuery/jquery-2.2.3.min.js"></script>
<script src="../../plugins/jQueryUI/jquery-ui.min.js"></script>
<script>

    $(function () {
        $.get("/category/names",function (data) {

            var list = "";
            for (var i = 0; i < data.length; i++) {
                var option = '<option value="'+data[i].id+'">'+data[i].name+'</option>';
                list += option;
            }
            $("#selectOption").append(list)
        })
    })

    $("select[name = 'discount']").change(function () {
        $("select[name = 'discount']").val() == 1 ?
            $("input[name = 'discountType']").removeAttr("disabled"):
            $("input[name = 'discountType']").attr("disabled",true);
    })

    $("#saveFood").click(function () {
        $.post("/food/addFood",$("#addFood").serialize(),function (data) {
            data == 'y' ? alert("添加成功") : alert("添加失败");
            location.reload();
        },"text")
    })

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
                $("input[name = 'images']").val(data);
                $("#img").attr("src",data).css({"width":"100px","height":"100px"});
            },
            error:function (dat) {
                alert("上传失败！")
            }
        });
    }


</script>

<script src="../../plugins/bootstrap/js/bootstrap.min.js"></script>
<script src="../../plugins/raphael/raphael-min.js"></script>
<script src="../../plugins/morris/morris.min.js"></script>
<script src="../../plugins/sparkline/jquery.sparkline.min.js"></script>
<script src="../../plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
<script src="../../plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
<script src="../../plugins/knob/jquery.knob.js"></script>
<script src="../../plugins/daterangepicker/moment.min.js"></script>
<script src="../../plugins/daterangepicker/daterangepicker.js"></script>
<script src="../../plugins/daterangepicker/daterangepicker.zh-CN.js"></script>
<script src="../../plugins/datepicker/bootstrap-datepicker.js"></script>
<script src="../../plugins/datepicker/locales/bootstrap-datepicker.zh-CN.js"></script>
<script src="../../plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
<script src="../../plugins/slimScroll/jquery.slimscroll.min.js"></script>
<script src="../../plugins/fastclick/fastclick.js"></script>
<script src="../../plugins/iCheck/icheck.min.js"></script>
<script src="../../plugins/adminLTE/js/app.min.js"></script>
<script src="../../plugins/treeTable/jquery.treetable.js"></script>
<script src="../../plugins/select2/select2.full.min.js"></script>
<script src="../../plugins/colorpicker/bootstrap-colorpicker.min.js"></script>
<script src="../../plugins/bootstrap-wysihtml5/bootstrap-wysihtml5.zh-CN.js"></script>
<script src="../../plugins/bootstrap-markdown/js/bootstrap-markdown.js"></script>
<script src="../../plugins/bootstrap-markdown/locale/bootstrap-markdown.zh.js"></script>
<script src="../../plugins/bootstrap-markdown/js/markdown.js"></script>
<script src="../../plugins/bootstrap-markdown/js/to-markdown.js"></script>
<script src="../../plugins/ckeditor/ckeditor.js"></script>
<script src="../../plugins/input-mask/jquery.inputmask.js"></script>
<script src="../../plugins/input-mask/jquery.inputmask.date.extensions.js"></script>
<script src="../../plugins/input-mask/jquery.inputmask.extensions.js"></script>
<script src="../../plugins/datatables/jquery.dataTables.min.js"></script>
<script src="../../plugins/datatables/dataTables.bootstrap.min.js"></script>
<script src="../../plugins/chartjs/Chart.min.js"></script>
<script src="../../plugins/flot/jquery.flot.min.js"></script>
<script src="../../plugins/flot/jquery.flot.resize.min.js"></script>
<script src="../../plugins/flot/jquery.flot.pie.min.js"></script>
<script src="../../plugins/flot/jquery.flot.categories.min.js"></script>
<script src="../../plugins/ionslider/ion.rangeSlider.min.js"></script>
<script src="../../plugins/bootstrap-slider/bootstrap-slider.js"></script>
<script src="../../plugins/bootstrap-datetimepicker/bootstrap-datetimepicker.js"></script>
<script src="../../plugins/bootstrap-datetimepicker/locales/bootstrap-datetimepicker.zh-CN.js"></script>

<script>

    // 选择框
    $(".select2").select2();

    // datetime picker
    $('#dateTimePicker').datetimepicker({
        format: "yyyy-mm-dd  hh:mm:ss",
        autoclose: true,
        todayBtn: true,
        language: 'zh-CN'
    });

</script>
</body>

</html>

