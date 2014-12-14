<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<base href="<%=basePath%>" />
<link rel="stylesheet" href="front/dist/css/bootstrap.css">
<link rel="stylesheet" href="front/dist/css/base.css">
<link rel="stylesheet" href="front/dist/css/common.css">
<link rel="stylesheet" href="front/dist/css/tablesorter.theme.default.css">

<script type="text/javascript" src="front/dist/js/jquery.min.js" ></script>
<script type="text/javascript" src="front/dist/js/bootstrap.min.js"></script>
<script type="text/javascript" src="front/dist/js/jquery.infinitescroll.min.js"></script>
<script type="text/javascript" src="front/dist/js/jquery.stockii.table.js"></script>
<script type="text/javascript" src="front/dist/js/jquery.tablesorter.js"></script>


<style type="text/css">
	tr,td{
		height: 50px;
	}

</style>
</head>
<body>
<jsp:include page="_header.jsp?index=product" />
<div id="wrapmain">
	<div class="container">
		<h1 style="font-size: 30px; padding: 20px;">A股所有公司</h1>
		
		<table id="table_test" class="tablesorter">
		</table>
		
<!-- 		<div class="row"> -->
<!-- 			<div class="loading col-lg-2 col-lg-offset-5"> -->
<!-- 				<img src="front/dist/img/loading.gif"><span>正在加载...</span> -->
<!-- 			</div> -->
<!-- 		</div> -->
		<div id="navigation" align="center">
			<!-- 页面导航-->
			<a href="front/pages/2.htm?page=1"></a>
			<!-- 此处可以是url，可以是action，要注意不是每种html都可以加，是跟当前网页有相同布局的才可以。另外一个重要的地方是page参数，这个一定要加在这里，它的作用是指出当前页面页码，没加载一次数据，page自动+1,我们可以从服务器用request拿到他然后进行后面的分页处理。-->
		</div>
	</div>
</div>


<%-- <jsp:include page="_footer.jsp" />  --%>

<script type="text/javascript">
	$(function() {
		initTable();
	});

	var onOff = true;
	
	$(window).scroll(function(){
		var scrollTop = $(this).scrollTop();
		var scrollHeight = $(document).height();
		var windowHeight = $(this).height();
		if(scrollTop + windowHeight == scrollHeight){
			if(onOff){
				onOff = false;
				loadAjax();
				onOff = true;
			}
		}
	});
	
	var options = {
		customClass: "success",
	};
	options.columns = [

		{ id: "number", name: "序号", width: 10, align: "left"},
		{ id: "stockid", name: "#股票代码", width: 20, align: "left"},
		{ id: "stockname", name: "股票名称", width: 20, align: "left", },
		{ id: "areaname", name: "所在地区", width: 10, align: "left", },
		{ id: "industryname", name: "所在行业", width: 30, align: "left", },
	];
	
	
	/* request company info and init the table */
	function initTable() {
		options.ajax = {
			<%-- url:"<%=request.getContextPath()%>/interface/Test2Action.action", --%>
			url:"data/apiData.txt",
			type:"get",
			data: "",
			dataType: "json",
			func: function(data) {
			
				//var array = eval("(" + data.data + ")");
				var jsonObj = eval("(" + data + ")");
				var array = jsonObj.liststockclassficationresponse.stockclassification;
				
				var contentData = [];
				for(var i = 0; i < array.length; i++) {
					var dataItem = {};
					dataItem.number = i + 1;
					dataItem.stockid = array[i].stockid;
					dataItem.stockname = array[i].stockname;
					dataItem.areaname = array[i].areaname;
					dataItem.industryname = array[i].industryname;
					contentData[i] = dataItem;
				}
				return contentData;
			}
		};
		$("#table_test").stockiitable(options);
		$("#table_test").tablesorter({theme: 'default'});
	}
	
	function loadAjax(){
		options.ajax = {
			<%-- url:"<%=request.getContextPath()%>/interface/Test2Action.action", --%>
			url:"data/apiDataTmp.txt",
			type:"get",
			data: "",
			dataType: "json",
			func: function(data) {
			
				//var array = eval("(" + data.data + ")");
				var jsonObj = eval("(" + data + ")");
				var array = jsonObj.liststockclassficationresponse.stockclassification;
				
				var contentData = [];
				for(var i = 0; i < array.length; i++) {
					var dataItem = {};
					dataItem.number = i + 1;
					dataItem.stockid = array[i].stockid;
					dataItem.stockname = array[i].stockname;
					dataItem.areaname = array[i].areaname;
					dataItem.industryname = array[i].industryname;
					contentData[i] = dataItem;
				}
				return contentData;
			}
		};
		$("#table_test").stockiitableAjaxRefrash(options);
	}
</script>

<script type="text/javascript">

</script>
</body>
</html>