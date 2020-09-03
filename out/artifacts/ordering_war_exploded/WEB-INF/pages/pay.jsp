<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <!-- 页面meta -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>购买信息</title>

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
                支付
                <small>支付表单</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> 首页</a></li>
                <li><a href="#">支付</a></li>
                <li class="active">支付表单</li>
            </ol>
        </section>
        <!-- 内容头部 /-->

        <!--tab内容-->
        <div class="tab-content">
            <form id="pay">
                <!--label显示的内容-->
                <div class="tab-pane active" id="tab-label">
                    <input hidden id="foodId" type="text" name="foodId" value="">
                    <div class="row data-type">

                        <div class="panel panel-default">
                            <div class="panel-heading">购买信息</div>
                            <div class="row data-type">


                                <div class="col-md-2 title">收货地址</div>
                                <div class="col-md-10 data text">
                                    <input type="text" id="address" name="address" class="form-control disable" value="">
                                </div>

                                <div class="col-md-2 title">手机号</div>
                                <div class="col-md-10 data text">
                                    <input type="text" id="phone" name="phone" class="form-control disable" value="">
                                </div>

                                <div class="col-md-2 title">备注留言</div>
                                <div class="col-md-10 data">
                                    <input type="text" id="buyerMessage" name="buyerMessage" class="form-control disable" value="">
                                </div>

                                <div class="col-md-2 title">支付类型</div>
                                <div class="col-md-10 data text">
                                    <div id="paymentType" class="form-group form-inline">
                                        <div class="radio"><label><input class="disable" type="radio" name="paymentType" value="1"> 微信</label></div>
                                        <div class="radio"><label><input class="disable" type="radio" name="paymentType" value="2"> 支付宝</label></div>
                                    </div>
                                </div>

                                <div class="col-md-2 title">实付金额</div>
                                <div class="col-md-10 data">
                                    <input type="text" id="actualPay" name="actualPay" class="form-control disable" readonly value="">
                                </div>

                                <div class="col-md-2 title">总金额</div>
                                <div class="col-md-10 data">
                                    <input type="text" id="totalPay" name="totalPay" class="form-control disable" readonly value="">
                                </div>

                            </div>
                        </div>

                    </div>
                </div>
            </form>

            <div class="box-tools text-center">
                <button class="btn bg-maroon" id="pay" onclick="pay()">购买</button>
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
        var id = window.location.search.substr(4);
        console.log(id);
        //查找商品
        $.post("/order/findFood",{id:id},function (data) {
            console.log(data);
            $("#foodId").val(data.id);
            $("#totalPay").val(data.price);
            $("#actualPay").val(data.discountPrice);

        })

    })
    //支付购买
    function pay() {
        $.post("/order/pay",$("#pay").serialize(),function () {
            alert("购买成功");
        })
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

