    //分页
    function page(data,fn) {
        //分页工具栏
        var pageList = "";
        var begin,end;
        //如果总页数小于10页
        if(data.totalPage <= 10){
            begin = 1;
            end = data.totalPage;
        }else{//如果总页数大于10页
            begin = data.currentPage - 5;
            end = data.currentPage + 4;
            //处理头部溢出,如果begin小于等于1 ，begin等于1
            if(begin <= 1){
                begin = 1;
                end = 10;
            }
            //处理尾部溢出，如果大于最后一页
            if(end >= data.totalPage){
                begin = data.totalPage - 10
                end = data.totalPage;
            }
        }

        pageList += pageHome = '<li><a href="javascript:'+fn+'(1)" aria-label="Previous">首页</a></li>';
        pageList += upPage = '<li><a href="javascript:'+fn+'('+(data.currentPage-1)+')" id="upPage" style="display: none">上一页</a></li>';

        //输出10页
        for (var i = begin;i <= end;i++){
            var li = "";
            if(i == data.currentPage){
                pageList += li =  '<li ><a style="background: rgba(255,200,200,0.5)" href="javascript:'+fn+'('+i+')" >'+i+'</a></li>';
            }else {
                pageList += li = '<li><a href="javascript:'+fn+'('+i+')" >'+i+'</a></li>';
            }

        }
        pageList += nextPage = '<li><a href="javascript:'+fn+'('+(data.currentPage+1)+')" id="nextPage" style="display: none">下一页</a></li>';
        pageList += lastPage = '<li><a href="javascript:'+fn+'('+data.totalPage+')" id="lastPage" aria-label="Next">尾页</a></li>';

        $("#pageList").empty().append(pageList);
        //如果当前页大于第一页，显示前一页
        if(data.currentPage > 1){
            $("#upPage").css({"display":"block"});
        }
        //如果当前页小于最后一页，显示下一页
        if(data.currentPage < data.totalPage){
            $("#nextPage").css({"display":"block"})
        }

        window.scrollTo({top:0});
    }

