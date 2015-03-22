<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<title>表格控件--分页功能</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">    
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css" href="front/dist/css/jquery.dataTables.css">
<link rel="stylesheet" type="text/css" href="front/dist/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="front/dist/css/">
<link rel="stylesheet" type="text/css" href="front/dist/css/common.css">
<link rel="stylesheet" type="text/css" href="front/dist/css/page.css">

</head>
  
<body>
<jsp:include page="_header.jsp"></jsp:include>

<div id="wrapmain">

<div class="container">
	<div class="row">
		<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
			<table id="example" class="display" cellspacing="0" width="100%">
				<thead>
					<tr>
			            <th>股票代码</th>
			            <th>股票名称</th>
			            <th>日涨跌</th>
			            <th>卖出价</th>
			        </tr>
			    </thead>
			 
			    <tfoot>
			    </tfoot>
			</table>
		</div>
	</div>
</div>

<!-- pagination -->
<div class="container text-center">
	<div class="row">
		<div class="col-lg-12">
			<ul class="pagination">
				<!-- <li><a href="javascript:void(0);">&laquo;</a></li>
			  	<li class="active"><a href="javascript:void(0);">1</a></li>
			  	<li><a href="javascript:void(0);">2</a></li>
			  	<li><a href="javascript:void(0);">3</a></li>
			  	<li><a href="javascript:void(0);">4</a></li>
			  	<li><a href="javascript:void(0);">5</a></li>
			  	<li><a href="javascript:void(0);">&raquo;</a></li> -->
			</ul>
		</div>
	</div>
</div>


<!-- <div class="container text-center">
	<div class="row">
		<div class="col-lg-12">
			<button class="ss">switch</button>
		</div>
	</div>
</div> -->

</div>



<jsp:include page="_footer.jsp"></jsp:include>
<script type="text/javascript" language="javascript" src="front/dist/js/stockii-ui.js"></script>
<script type="text/javascript" language="javascript" src="front/dist/js/jquery.datatables.api.fnReloadAjax.js"></script>

<script type="text/javascript"> 
var table;
$(function(){

	var total = 100;
	var numPerPage = 10;
	var currentPage = 1;
	reshapePagination(total,numPerPage);
	displayPagination(currentPage,total,numPerPage);
	
	table = $('#example').dataTable({
    	//stateSave: true,
    	 "bPaginate": false, 
        //"ajax": "<%=request.getContextPath()%>/TableTestPage",
        "ajax": "<%=request.getContextPath()%>/data/test.txt",
        "columns": [
            { "data": "stock_id" },
            { "data": "stock_name" },
            { "data": "daily_up_down" },
            { "data": "sold_price" }
        ],
        "oLanguage": {
           "sProcessing": "正在加载中......",
           "sLengthMenu": "每页显示 _MENU_ 条记录",
           "sZeroRecords": "对不起，查询不到相关数据！",
           "sEmptyTable": "表中无数据存在！",
           "sInfo": "当前显示 _START_ 到 _END_ 条，共 _TOTAL_ 条记录",
           "sInfoFiltered": "数据表中共为 _MAX_ 条记录",
           "sSearch": "搜索",
           "oPaginate": {
               "sFirst": "首页",
               "sPrevious": "上一页",
               "sNext": "下一页",
               "sLast": "末页"   
           }
        } //多语言配置
     });
     
});

function opera(page){
	console.log(page);
	table.fnReloadAjax("<%=request.getContextPath()%>/data/testPagi.txt");
}
</script>
</body>
</html>
