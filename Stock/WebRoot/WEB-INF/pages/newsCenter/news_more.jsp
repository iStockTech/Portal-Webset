<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<title>资讯中心</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">    
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css" href="front/dist/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="front/dist/css/jBootsrapPage.css">
<link rel="stylesheet" type="text/css" href="front/dist/css/jquery.shCircleLoader.css">
<link rel="stylesheet" type="text/css" href="front/dist/css/base.css">
<link rel="stylesheet" type="text/css" href="front/dist/css/common.css">
<link rel="stylesheet" type="text/css" href="front/dist/css/page.css">


</head>
  
<body>
<jsp:include page="../_header.jsp?index=news"></jsp:include>
<div id="wrapmain">

<div class="container news-more">
	<div class="row">
		<div class="col-md-9 col-md-9 col-sm-9 col-xs-9 news-list-block" >
			<ul class="list-inline topbar">
				<li data-target="stock_hsh" class="active" ><a href="javascript:void(0);">沪<span style="font-weight: bold;">·</span>深</a></li>
				<li data-target="stock_mhk"><a href="javascript:void(0);">美股<span style="font-weight: bold;">·</span>港股</a></li>
				<li data-target="stock_found"><a href="javascript:void(0);">基金</a></li>
			</ul>
			<div class="main js-main">
				<%-- <div class="js-newsList" style="display: block;">
					
				</div>
				<div class="js-newsList" style="display: none;">
					<jsp:include page="stock_mhk.jsp"></jsp:include>
				</div>
				<div class="js-newsList" style="display: none;">
					<jsp:include page="stock_found.jsp"></jsp:include>
				</div> --%>
				<!-- pagination -->
<!-- 				<div class="text-center"><ul class="pagination"></ul></div> -->
			</div>
		</div>
		
		<!-- right area -->
		<div class="col-lg-3 col-md-3 col-sm-3 col-xs-3 news-attach">
			<div class="news-attach-block">
				<p class="caption">热点事件</p>
				<ul class="list-unstyle">
					<li><a href="javascript:void(0)">热点事件</a></li>
					<li><a href="javascript:void(0)">热点事件</a></li>
					<li><a href="javascript:void(0)">热点事件</a></li>
					<li><a href="javascript:void(0)">热点事件</a></li>
					<li><a href="javascript:void(0)">热点事件</a></li>
				</ul>
			</div>
			<img alt="广告位招商" src="upload/advertise.png" class="advertise">
			<div class="news-attach-block">
				<p class="caption">时事政策</p>
				<ul class="list-unstyle">
					<li><a href="javascript:void(0)">时事政策</a></li>
					<li><a href="javascript:void(0)">时事政策</a></li>
					<li><a href="javascript:void(0)">时事政策</a></li>
					<li><a href="javascript:void(0)">时事政策</a></li>
					<li><a href="javascript:void(0)">时事政策</a></li>
				</ul>
			</div>
			<img alt="广告位招商" src="upload/advertise.png" class="advertise">
			<div class="news-attach-block">
				<p class="caption">会议报道</p>
				<ul class="list-unstyle">
					<li><a href="javascript:void(0)">会议报道</a></li>
					<li><a href="javascript:void(0)">会议报道</a></li>
					<li><a href="javascript:void(0)">会议报道</a></li>
					<li><a href="javascript:void(0)">会议报道</a></li>
					<li><a href="javascript:void(0)">会议报道</a></li>
				</ul>
			</div>
		</div>
		
		<!-- end right area -->
	
	</div>

</div>

</div>

<jsp:include page="../_footer.jsp" />
<script type="text/javascript" language="javascript" src="js/common.js"></script>
<script type="text/javascript" language="javascript" src="front/dist/js/jquery.shCircleLoader-min.js"></script>
<script type="text/javascript" language="javascript" src="front/dist/js/jBootstrapPage.js"></script>
<script type="text/javascript" language="javascript" src="js/System.stockii.news.js"></script>
<script type="text/javascript">
console.log(com.stockii.portal.news.type);
// newsHandler.tfg();
//loading layer
// $('.loading').shCircleLoader({
//     duration: 2,//持续时间
//     color: '#ba2635'//
// });
// var content = {
// 	"img":"aa",
// 	"title":"新闻标题一",
// 	"summary":"新闻摘要一",
// 	"author":"新闻作者一",
// 	"time":"2014.12.25",
// 	"id":"11"
// };
// fillNewsItem(createNewsItem(),content);

$("ul.topbar").find("li").click(function(){
	$(this).siblings().removeClass("active");
	$(this).addClass("active");
	if($(this).attr("data-target").match("hsh")){
// 		$("div.main").children("div").css("display","none");
// 		$("div.main").children("div").eq(0).css("display","block");
		com.stockii.portal.news.type = "hsh";
	}else if($(this).attr("data-target").match("mhk")){
// 		$("div.main").children("div").css("display","none");
// 		$("div.main").children("div").eq(1).css("display","block");
		com.stockii.portal.news.type = "mhk";
	}else if($(this).attr("data-target").match("found")){
// 		$("div.main").children("div").css("display","none");
// 		$("div.main").children("div").eq(2).css("display","block");
		com.stockii.portal.news.type = "found";
	}else{
		$("div.main").html("<h1>请求资源出错。<br>请稍后再试</h1>");
		com.stockii.portal.news.type = "";
	}
	newsHandler.getNewsPagination();
	newsHandler.getNewsList.getForSec("data/rebuildother.txt",com.stockii.portal.news.type, 1);
// 	System.ajaxUtil.sendAjax("data/pagination.txt","", com.stockii.portal.news.pagination.options);
// 	newsHandler.getNewsList("data/rebuildother.txt",com.stockii.portal.news.type, 1);
	
});
newsHandler.getNewsPagination();
newsHandler.getNewsList.getForSec("data/rebuild.txt",com.stockii.portal.news.type, 1);
// System.ajaxUtil.sendAjax("data/pagination.txt", com.stockii.portal.news.type, com.stockii.portal.news.pagination.options);
// newsHandler.getNewsList("data/rebuild.txt",com.stockii.portal.news.type, 1);
</script>
</body>
</html>
