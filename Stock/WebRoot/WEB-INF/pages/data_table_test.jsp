<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>"><title>My JSP 'data_table_test.jsp' starting page</title>  
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">    
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css" href="http://cdn.datatables.net/1.10.4/css/jquery.dataTables.css">
<link rel="stylesheet" type="text/css" href="front/dist/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="front/dist/css/base.css">
<link rel="stylesheet" type="text/css" href="front/dist/css/common.css">
</head> 
 
<body>
<jsp:include page="_header.jsp"></jsp:include>
<div id="wrapmain">

<div class="container mgt30">
	<div class="row">
		<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
			<table id="example" class="display" cellspacing="0" width="100%">
				<thead>
					<tr>
						<!-- <th>stockid</th>
			            <th>stockname</th>
			            <th>areaname</th>
			            <th>industryname</th> -->
			            <th>股票代码</th>
			            <th>股票名称</th>
			            <th>所属区域</th>
			            <th>所属行业</th>
			        </tr>
			    </thead>
			 
			    <tfoot>
			        <!-- <tr>
			            <th>stockid</th>
			            <th>stockname</th>
			            <th>areaname</th>
			            <th>industryname</th>
			        </tr> -->
			    </tfoot>
			</table>
		</div>
	</div>
	
	
	<div class="row">
		<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text">
		
			<button class="reload">reload</button>
			
		</div>
	</div>
</div>

</div>
<jsp:include page="_footer.jsp"></jsp:include>
<script type="text/javascript" language="javascript" src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<script type="text/javascript" language="javascript" src="http://cdn.datatables.net/1.10.4/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" language="javascript" src="front/dist/js/jquery.datatables.api.fnReloadAjax.js"></script>

<script type="text/javascript">
$(document).ready(function() {
    var table = $('#example').dataTable({
    	stateSave: true,
        "ajax": "<%=request.getContextPath()%>/data_crossDomain",
        "columns": [
            { "data": "stockid" },
            { "data": "stockname" },
            { "data": "areaname" },
            { "data": "industryname" }
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
    
//    $.ajax({
//     	url:"<%=request.getContextPath()%>/data_crossDomain",
//     	type:"GET",
//     	success:function(msg){
//     		console.log(msg);
//     	},
//     	error:function(){
//     		console.log("get info error");
//     	}
//     });

	$("button.reload").click(function(){
		table.fnReloadAjax("<%=request.getContextPath()%>/data/test.txt");
	});
});
</script>
</body>
</html>
