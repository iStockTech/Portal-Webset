<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html> 
<head>
<base href="<%=basePath%>">
<title>行情中心</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">    
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css" href="front/dist/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="front/jquery-ui-1.11.2/jquery-ui.css">
<link rel="stylesheet" type="text/css" href="front/dist/css/jquery.dataTables.css">
<link rel="stylesheet" type="text/css" href="front/dist/css/">
<link rel="stylesheet" type="text/css" href="front/dist/css/common.css">
<link rel="stylesheet" type="text/css" href="front/dist/css/page.css">
 
</head>

<body>
<jsp:include page="../_header.jsp?param=news"></jsp:include>
<div id="wrapmain">

<div class="container">
	<!-- advertise -->
	<div class="row mgt20">
		<div class="col-lg-12">
			<img alt="advertise" src="" style="height: 100px;width: 100%;">
		</div>
	</div>
	<div class="row mgt20 mgb20">
		<!-- 左侧导航栏 -->
		<div class="col-lg-3" class="NavBar">
			<div id="accordion" >
				<h4>沪深股市</h4>
				<div>
					<ul class="list-unstyle" id="menu_hsh">
						<li><a href="hq/index#hsh@overview">沪深一览</a></li>
						
						<li>
							<a href="hq/index#hsh@basic">基础分类</a>
							<ul class="list-unstyle">
								<li><a href="hq/index#hsh@basic@cyb">创业板</a></li>
								<li><a href="hq/index#hsh@basic@hsha">沪市A股</a></li>
								<li><a href="hq/index#hsh@basic@hshb">沪市B股</a></li>
								<li><a href="hq/index#hsh@basic@shsha">深市A股</a></li>
								<li><a href="hq/index#hsh@basic@shshb">深市B股</a></li>
							</ul>
						</li>
						
						<li>
							<a href="hq/index#hsh@industry">证监会行业</a>
							<ul	class="list-unstyle">
								<li><a href="hq/index#hsh@industry@baoxian">保险业</a></li>
								<li><a href="hq/index#hsh@industry@cangchu">仓储业</a></li>
								<li><a href="hq/index#hsh@industry@xumu">畜牧业</a></li>
								<li><a href="hq/index#hsh@industry@canyin">餐饮业</a></li>
								<li><a href="hq/index#hsh@industry@dianli">电力热力生产</a></li>
								<li><a href="hq/index#hsh@industry@yunshu">道路运输业</a></li>
								<li><a href="hq/index#hsh@industry@dianqi">电器机械和器材制造业</a></li>
								<li><a href="hq/index#hsh@industry@fangchan">房产业</a></li>
								<li><a href="hq/index#hsh@industry@feijinshu">非金属矿物制品</a></li>
							</ul>
						</li>
						
						<li>
							<a href="hq/index#hsh@sort">排行</a>
							<ul	class="list-unstyle">
								<li>
									<a href="hq/index#hsh@sort@cyb">创业板</a>
									<ul class="list-unstyle">
										<li><a href="hq/index#hsh@sort@cybup">创业板涨幅</a></li>
										<li><a href="hq/index#hsh@sort@cybdown">创业板跌幅</a></li>
										<li><a href="hq/index#hsh@sort@cybcje">创业板成交额</a></li>
										<li><a href="hq/index#hsh@sort@cybcjl">创业板成交量</a></li>
									</ul>
								</li>
									
								<li>
									<a href="hq/index#sort@hsha">沪市A股</a>
									<ul class="list-unstyle">
										<li><a href="hq/index#sort@hshaup">沪市A股涨幅</a></li>
										<li><a href="hq/index#sort@hshadown">沪市A股跌幅</a></li>
										<li><a href="hq/index#sort@hshacje">沪市A股成交额</a></li>
										<li><a href="hq/index#sort@hshacjl">沪市A股成交量</a></li>
									</ul>
								</li>
								
								<li>
									<a href="hq/index#sort@hshb">沪市B股</a>
									<ul class="list-unstyle">
										<li><a href="hq/index#sort@hshbup">沪市B股涨幅</a></li>
										<li><a href="hq/index#sort@hshbdown">沪市B股跌幅</a></li>
										<li><a href="hq/index#sort@hshbcje">沪市B股成交额</a></li>
										<li><a href="hq/index#sort@hshbcjl">沪市B股成交量</a></li>
									</ul>
								</li>
								
								<li>
									<a href="hq/index#sort@shsha">深市A股</a>
									<ul class="list-unstyle">
										<li><a href="hq/index#sort@shshaup">沪市A股涨幅</a></li>
										<li><a href="hq/index#sort@shshadown">沪市A股跌幅</a></li>
										<li><a href="hq/index#sort@shshacje">沪市A股成交额</a></li>
										<li><a href="hq/index#sort@shshacjl">沪市A股成交量</a></li>
									</ul>
								</li>
								
								<li>
									<a href="hq/index#hsh@sort@shshb">深市B股</a>
									<ul class="list-unstyle">
										<li><a href="hq/index#hsh@sort@shshbup">深市B涨幅</a></li>
										<li><a href="hq/index#hsh@sort@shshbdown">深市B跌幅</a></li>
										<li><a href="hq/index#hsh@sort@shshbche">深市B成交额</a></li>
										<li><a href="hq/index#hsh@sort@shshbcjl">深市B成交量</a></li>
									</ul>
								</li>
							</ul>
						</li>
						
						<li>
							<a href="hq/index#hsh@new">新股上市</a>
						</li>
						
						<li>
							<a href="hq/index#hsh@">龙虎榜</a>
						</li>
					</ul>
				</div>
				
			  	<h4>香港股市</h4>
			  	<div>
			  		<ul class="list-unstyle" id="menu_hk">
						<li>
							<a href="hq/index#hk">港股一览</a>
						</li>
						<li>
							<a href="hq/index#hk">港股行业</a>
							<ul class="list-unstyle">
								<li><a href="">保险</a></li>
								<li><a href="">地产</a></li>
								<li><a href="">快消</a></li>
								<li><a href="">运输</a></li>
								<li><a href="">服务</a></li>
							</ul>
						</li>
					</ul>
			  	</div>
			  	
			  	<h4>美国股市</h4>
			  	<div>
			  		<ul class="list-unstyle" id="menu_mg">
						<li>
							<a href="hq/index#mg@overview">美股一览</a>
						</li>
						<li>
							<a href="hq/index#mg@industry">美股行业</a>
							<ul class="list-unstyle">
								<li><a href="hq/index#mg@industry@baoxian">保险</a></li>
								<li><a href="hq/index#mg@industry@dichan">地产</a></li>
								<li><a href="hq/index#mg@industry@kuaixiao">快消</a></li>
								<li><a href="hq/index#mg@industry@yunshu">运输</a></li>
								<li><a href="hq/index#mg@industry@fuwu">服务</a></li>
							</ul>
						</li>
						<li><a href="hq/index#mg@china">中国概念股</a></li>
						<li><a href="hq/index#mg@forecast">上市预告</a></li>
						<li><a href="hq/index#mg@new">新上市公司</a></li>
					</ul>
			  	</div>
			  	
			  	<h4>基金</h4>
			  	<div>
			  	</div>
			  	
			  	<h4>外汇</h4>
			  	<div></div>
			  	
			  	<h4>债券</h4>
			  	<div></div>
			  	
			  	<h4>期货</h4>
			  	<div></div>
			  	
			  	<h4>比特币</h4>
			  	<div></div>
			  	
			  	<h4>全球股指</h4>
			  	<div></div>
			</div>
		</div>
		
		<!-- 右侧内容栏 -->
		<div class="col-lg-9">
			<!-- 足迹导航 -->
			<div class="row">
				<div class="col-lg-12">
					<div class="printContainer">
<!-- 						<ol class="breadcrumb" id="hq_footprint"> -->
<!-- 					  		<li>行情中心</li> -->
<!-- 					  		<li>2013</li> -->
<!-- 					  		<li class="active">十一月</li> -->
<!-- 						</ol> -->
					</div>
					<div class="data">
						<table id="data" class="display" cellspacing="0" width="100%"> 
							<thead> 
								<tr> 
									<th>Name</th> 
									<th>Position</th> 
									<th>Office</th> 
									<th>Extn.</th> 
									<th>Start date</th> 
									<th>Salary</th> 
								</tr> 
							</thead> 
							<tfoot> 
								<tr>
									<th>Name</th> 
									<th>Position</th> 
									<th>Office</th> 
									<th>Extn.</th> 
									<th>Start date</th> 
									<th>Salary</th> 
								</tr> 
							</tfoot> 
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

</div>

<jsp:include page="../_footer.jsp"></jsp:include>

<script type="text/javascript" language="javascript" src="front/jquery-ui-1.11.2/jquery-ui.min.js"></script>
<script type="text/javascript" language="javascript" src="js/common.js"></script>
<script type="text/javascript" language="javascript" src="js/System.stockii.hq.js"></script>
<script type="text/javascript" language="javascript" src="js/Object.prototype.js"></script>
<script>
$(function() {

$('#data').dataTable({ 
	"ajax": 'data/arrays.txt',
	"language": {
        "lengthMenu": "每页 _MENU_ 条记录",
        "zeroRecords": "没有找到记录",
        "info": "第 _PAGE_ 页 ( 总共 _PAGES_ 页 )",
        "infoEmpty": "无记录",
        "infoFiltered": "(从 _MAX_ 条记录过滤)",
        "search" : "搜索",
        "paginate" : {
        	"previous" : "上一页",
        	"next" : "下一页"
        }
    }
});

var hash = "",
	b_refresh = false;

// refresh data

var icons = {
   	header: "ui-icon-circle-arrow-e",
   	activeHeader: "ui-icon-circle-arrow-s"
 };
 $( "#accordion" ).accordion({
   	icons: icons
 });
function select_unit(event,ui){
	if(ui.item.context.childElementCount == 1){
		var now = ui.item.context.innerText,
		ss = "";
		ui = ui.item.context;
		while(ui.nodeName=="LI"){
			ss = ss + "+" + $(ui.parentNode.parentNode).find("a").html();
			ui = ui.parentNode.parentNode;
		};
		var list = ss.split("+");
		list.shift();
		list.pop();
		list.reverse();
		list.push(now);
		list.unshift($(ui).prev().text());
		hqHandler.footprint.reSetPrint(list);
		hash = System.urlUtil.getUrlHash();
		console.log("hash = "+hash);
		hqHandler.data.refreshData(hash);		
	}
}
$( "#menu_hsh" ).menu({
	select : function(event,ui) {
// 		console.log(ui);
		select_unit(event,ui);
	}
});
$( "#menu_hk" ).menu({
	select : function(event,ui) {
// 		console.log(ui);
		select_unit(event,ui);
	}
});
$( "#menu_mg" ).menu({
	select : function(event,ui) {
// 		console.log(ui);
		select_unit(event,ui);
	}
});

hqHandler.footprint.initPrint();  	
  	
});
</script>
</body>
</html>
