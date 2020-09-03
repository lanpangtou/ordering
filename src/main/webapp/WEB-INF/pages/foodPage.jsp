<%--
  Created by IntelliJ IDEA.
  User: zy
  Date: 2020-06-06
  Time: 14:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <!-- 页面meta -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>菜品列表</title>

    <meta content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no" name="viewport">
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

    <link rel="stylesheet" href="/plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/plugins/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="/plugins/ionicons/css/ionicons.min.css">
    <link rel="stylesheet" href="/plugins/iCheck/square/blue.css">
    <link rel="stylesheet" href="/plugins/morris/morris.css">
    <link rel="stylesheet" href="/plugins/jvectormap/jquery-jvectormap-1.2.2.css">
    <link rel="stylesheet" href="/plugins/datepicker/datepicker3.css">
    <link rel="stylesheet" href="/plugins/daterangepicker/daterangepicker.css">
    <link rel="stylesheet" href="/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">
    <link rel="stylesheet" href="/plugins/datatables/dataTables.bootstrap.css">
    <link rel="stylesheet" href="/plugins/treeTable/jquery.treetable.css">
    <link rel="stylesheet" href="/plugins/treeTable/jquery.treetable.theme.default.css">
    <link rel="stylesheet" href="/plugins/select2/select2.css">
    <link rel="stylesheet" href="/plugins/colorpicker/bootstrap-colorpicker.min.css">
    <link rel="stylesheet" href="/plugins/bootstrap-markdown/css/bootstrap-markdown.min.css">
    <link rel="stylesheet" href="/plugins/adminLTE/css/AdminLTE.css">
    <link rel="stylesheet" href="/plugins/adminLTE/css/skins/_all-skins.min.css">
    <link rel="stylesheet" href="/css/style.css">
    <link rel="stylesheet" href="/plugins/ionslider/ion.rangeSlider.css">
    <link rel="stylesheet" href="/plugins/ionslider/ion.rangeSlider.skinNice.css">
    <link rel="stylesheet" href="/plugins/bootstrap-slider/slider.css">
    <link rel="stylesheet" href="/plugins/bootstrap-datetimepicker/bootstrap-datetimepicker.css">
    <style>
        #select{
            padding: 0px 5px;
            height: 30px;
            width: 100px;
            line-height: 30px;
            border: 1px solid black;
            position: relative;
        }
        #select:hover{
            cursor:pointer;
        }
        #options{
            width: 100px;
            height: 100px;
            position: absolute;
            background: white;
            display: none;
        }
        #price{

        }
        #pricebtn{
            position: relative;
            display: none;
        }

        #price:hover #pricebtn{
            display: inline-block;
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
                菜品管理
                <small>菜品列表</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> 首页</a></li>
                <li><a href="#">菜品管理</a></li>
                <li class="active">菜品列表</li>
            </ol>
        </section>
        <!-- 内容头部 /-->

        <!-- 正文区域 -->
        <section class="content">

            <!-- .box-body -->
            <div class="box box-primary">
                <div class="box-header with-border">
                    <h3 class="box-title">列表</h3>
                </div>

                <div class="box-body">

                    <!-- 数据表格 -->
                    <div class="table-box">

                        <!--工具栏-->
                        <div class="pull-left">
                            <div class="form-group form-inline">
                                <div class="btn-group">
                                    <button type="button" class="btn btn-default" onclick="location.href='/food/addFoodPage'" title="新增"><i class="fa fa-file-o"></i> 新增</button>
                                    <button type="button" onclick="delSelected()" class="btn btn-default" title="删除"><i class="fa fa-trash-o"></i> 删除</button>
                                    <button type="button" class="btn btn-default" onclick="javascript:location.reload()" title="刷新"><i class="fa fa-refresh"></i> 刷新</button>
                                </div>
                            </div>
                        </div>

                        <div class="box-tools pull-right">
                            <span id="price" style="margin-right: 20px">
                                <input type="text" id="pricemin" placeholder="￥" style="width: 40px"> -
                                <input type="text" id="pricemax" placeholder="￥" style="width: 40px">
                                <input type="button" onclick="loadFood(1)" value="确定" id="pricebtn">
                            </span>
                            <select onchange="queryByCondition()" id="condition1">
                                <option value="dishName">菜名</option>
                            </select>
                            <input id="dishName" name="" value="" placeholder="菜名" style="width: 120px" type="text"/>
                            <select onchange="queryByCondition()" id="condition1">
                                <option value="discount">折扣</option>
                            </select>
                            <input id="discount" name="" value="" placeholder="参数0 和 1" style="width: 120px" type="text"/>
                            <select onchange="queryByCondition()" id="condition1">
                                <option value="saleable">状态</option>
                            </select>
                            <input id="saleable" name="" value="" placeholder="参数0 和 1" style="width: 120px" type="text"/>
<%--                            <input id="input1" name="" value="" style="width: 100px;display: none" type="text"/>--%>
                            <input type="button" id="query" onclick="loadFood(1)" value="查询">
                        </div>
                        <!--工具栏/-->

                        <!--数据列表-->
                        <table id="dataList" class="table table-bordered table-striped table-hover dataTable">
                            <thead>
                            <tr>
                                <th class="" style="padding-right:0px;">
                                    <input id="selall" type="checkbox" class="icheckbox_square-blue">
                                </th>
                                <th class="sorting">ID</th>
                                <th class="sorting">菜品名称</th>
                                <th class="sorting">图片</th>
                                <th class="sorting">价钱</th>
                                <th class="sorting">折扣价</th>
                                <th class="sorting">剩余数量</th>
                                 <th class="sorting">状态</th>
                                <th class="sorting">折扣</th>
                                <th class="text-center">操作</th>
                            </tr>
                            </thead>
                            <tbody id="list">

                            </tbody>
                        </table>
                        <!--数据列表/-->
                    </div>
                    <!-- 数据表格 /-->
                </div>
                <!-- /.box-body -->

                <!-- .box-footer-->
                <div class="box-footer">
                    <div class="pull-left">
                        <div class="form-group form-inline">
                            总共 <b><span id="totalPage"></span></b> 页，共 <b><span id="totalCount"></span></b> 条数据。 每页
                            <select class="form-control" id="rows">
                                <option selected>8</option>
                                <option>10</option>
                                <option>20</option>
                                <option>50</option>
                                <option>100</option>
                            </select> 条
                        </div>
                    </div>
                    <div class="box-tools pull-right">
                        <ul class="pagination" id="pageList">

                        </ul>
                    </div>

                </div>
                <!-- /.box-footer-->
            </div>

        </section>
        <!-- 正文区域 /-->

    </div>
    <!-- @@close -->
    <!-- 内容区域 /-->

    <jsp:include page="foot.jsp"></jsp:include>

</div>


<script src="../../plugins/jQuery/jquery-2.2.3.min.js"></script>
<script src="../../plugins/jQueryUI/jquery-ui.min.js"></script>
<script src="../../js/jquery.js"></script>
<script src="/js/commen.js"></script>
<script>
    $(function () {
        loadFood(1);
    })


    //加载菜单列表
    function loadFood(currentPage){
        //每页显示的条数
        var rows = $("#rows").find("option:selected").text();
        $.post("/food/page",{page:currentPage,rows:rows,
            dishName:$("#dishName").val(),
            discount:$("#discount").val(),
            saleable:$("#saleable").val(),
            priceMin:$("#pricemin").val(),
            priceMax:$("#pricemax").val()},
            function (data) {
            render(data);
            page(data,"loadFood");
        })
    }
    //渲染菜单列表
    function render(data) {
        var list = "";
        for (var i = 0; i < data.list.length; i++) {
            var el = "<tr>\n" +"<td hidden><input id=\"currentPage\" type=\"text\" value='"+data.currentPage+"'></td>"+
                "                                <td><input name=\"ids\" type=\"checkbox\" value="+data.list[i].id+"></td>\n" +
                "                                <td>" + data.list[i].id + "</td>\n" +
                "                                <td>" + data.list[i].dishName + "</td>\n" +
                "                                <td><img width='50px' height='50px' src=\""+data.list[i].images+"\" alt=\"\"></td>\n" +
                "                                <td>" + data.list[i].price + "</td>\n" +
                "                                <td>" + data.list[i].discountPrice + "</td>\n" +
                "                                <td class=\"text-center\">" + data.list[i].remainingCount + "</td>\n" +
                "                                <td>" + data.list[i].saleableStr + "</td>\n" +
                "                                <td>" + data.list[i].discountTypeStr + "</td>\n" +
                "                                <td class=\"text-center\">\n" +
                "                                    <button type=\"button\" onclick=\"deleteFood("+data.currentPage+","+data.list[i].id+")\" class=\"btn bg-olive btn-xs\">删除</button>\n" +
                "                                    <button type=\"button\" onclick='location.href=\"/food/foodDetail?id="+data.list[i].id+"\"' class=\"btn bg-olive btn-xs\">详情</button>\n" +
                "                                    <button type=\"button\" onclick='location.href=\"/order/payPage?id="+data.list[i].id+"\"' class=\"btn bg-olive btn-xs\">购买</button>\n" +
                "                                </td>\n" +
                "                            </tr>";
            list += el;
        }
        $("#list").empty().append(list);
        // 列表按钮
        $("#dataList td input[type='checkbox']").iCheck({
            checkboxClass: 'icheckbox_square-blue',
            increaseArea: '20%'
        });
        $("#totalPage").text(data.totalPage);
        $("#totalCount").text(data.totalCount);
    }


    //根据id删除菜单
    function deleteFood(currentPage,id) {

        if(!confirm("确定删除?"))return;
        $.get("/food/delete",{id:id,},function (data) {
            loadFood(currentPage);
        });

    }

    //批量删除菜单
    function  delSelected() {
        var ids = $("#list input[type='checkbox']:checked");
        var lis = new Array() ;
        var currentPage = $("#currentPage").val();//获取当前页
        for (var i = 0; i < ids.length; i++) {
            lis[i] = ids[i].value;
        }
        $.post("/food/delSelected",{ids:lis},function (data) {
            $("#selall").prop("checked",false);
            loadFood(currentPage);
        })
    }

</script>

<script src="/plugins/bootstrap/js/bootstrap.min.js"></script>
<script src="/plugins/raphael/raphael-min.js"></script>
<script src="/plugins/morris/morris.min.js"></script>
<script src="/plugins/sparkline/jquery.sparkline.min.js"></script>
<script src="/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
<script src="/plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
<script src="/plugins/knob/jquery.knob.js"></script>
<script src="/plugins/daterangepicker/moment.min.js"></script>
<script src="/plugins/daterangepicker/daterangepicker.js"></script>
<script src="/plugins/daterangepicker/daterangepicker.zh-CN.js"></script>
<script src="/plugins/datepicker/bootstrap-datepicker.js"></script>
<script src="/plugins/datepicker/locales/bootstrap-datepicker.zh-CN.js"></script>
<script src="/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
<script src="/plugins/slimScroll/jquery.slimscroll.min.js"></script>
<script src="/plugins/fastclick/fastclick.js"></script>
<script src="/plugins/iCheck/icheck.min.js"></script>
<script src="/plugins/adminLTE/js/app.min.js"></script>
<script src="/plugins/treeTable/jquery.treetable.js"></script>
<script src="/plugins/select2/select2.full.min.js"></script>
<script src="/plugins/colorpicker/bootstrap-colorpicker.min.js"></script>
<script src="/plugins/bootstrap-wysihtml5/bootstrap-wysihtml5.zh-CN.js"></script>
<script src="/plugins/bootstrap-markdown/js/bootstrap-markdown.js"></script>
<script src="/plugins/bootstrap-markdown/locale/bootstrap-markdown.zh.js"></script>
<script src="/plugins/bootstrap-markdown/js/markdown.js"></script>
<script src="/plugins/bootstrap-markdown/js/to-markdown.js"></script>
<script src="/plugins/ckeditor/ckeditor.js"></script>
<script src="/plugins/input-mask/jquery.inputmask.js"></script>
<script src="/plugins/input-mask/jquery.inputmask.date.extensions.js"></script>
<script src="/plugins/input-mask/jquery.inputmask.extensions.js"></script>
<script src="/plugins/datatables/jquery.dataTables.min.js"></script>
<script src="/plugins/datatables/dataTables.bootstrap.min.js"></script>
<script src="/plugins/chartjs/Chart.min.js"></script>
<script src="/plugins/flot/jquery.flot.min.js"></script>
<script src="/plugins/flot/jquery.flot.resize.min.js"></script>
<script src="/plugins/flot/jquery.flot.pie.min.js"></script>
<script src="/plugins/flot/jquery.flot.categories.min.js"></script>
<script src="/plugins/ionslider/ion.rangeSlider.min.js"></script>
<script src="/plugins/bootstrap-slider/bootstrap-slider.js"></script>
<script src="/plugins/bootstrap-datetimepicker/bootstrap-datetimepicker.js"></script>
<script src="/plugins/bootstrap-datetimepicker/locales/bootstrap-datetimepicker.zh-CN.js"></script>
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

        // 激活导航位置
        setSidebarActive("admin-datalist");


        // 全选操作
        $("#selall").click(function() {
            var clicks = $(this).is(':checked');
            if (!clicks) {
                $("#dataList td input[type='checkbox']").iCheck("uncheck");
            } else {
                $("#dataList td input[type='checkbox']").iCheck("check");
            }
            $(this).data("clicks", !clicks);
        });

    });
</script>
</body>
</html>
