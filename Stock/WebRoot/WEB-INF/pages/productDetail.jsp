<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<base href="<%= basePath %>" />
<link rel="icon" href="../../favicon.ico">
<link href="front/dist/css/bootstrap.css" rel="stylesheet">
<link href="front/dist/css/common.css" rel="stylesheet">
<link href="front/dist/css/page.css" rel="stylesheet">
</head>
<body>
<jsp:include page="_header.jsp?index=product" />
<div id="productDetail" class="content-main container-fluid pd0">
	<div class="pmbanner">
		<div class="container pdt30">
			<h1>${software.softwareDescripe}</h1>
			<p>多奇证券分析师可以为您提供最专业的证券交易记录，供您查看、模拟交易，并帮助您完成最新投资策略的定制。</p>
			<div id="js_download">
				<p>下载：<a href="<%=request.getContextPath()%>/Software_download.action?sid=${software.softwareId}">${software.softwareName}</a></p>
			</div>
			<div id="js_buy">
				<form action="<%=request.getContextPath()%>/alipay/payChannel.action" method="post" name="alipay">
					<input type="hidden" name="softwareid" value="${software.softwareId}">
				</form>
				<p>购买：<input type="button" onClick="alipay.submit()" value="￥${software.price}"/> </p>
			</div>
<!-- 			<button class="btn-quick-view" onclick="javascript:window.location.href='product'"></button> -->
		</div>
	</div>
	<!-- product introduction -->
	<div class="layer layer-intro">
		<div class="container">
			<!-- introduction one -->
			<div class="row">
				<div class="col-sm-3 col-md-3 col-lg-3" style=""><img class="img-intro" alt="产品介绍一" src="front/dist/img/product-detail-intro.png"></div>
				<div class="col-sm-9 col-md-9 col-lg-9" style="">
					<p class="title-intro">首款产品权威发布<span>&#9660;</span></p>
					<p class="content-intro">中韩自贸区谈判于2012年5月启动，是我国迄今为止对外商谈的覆盖领域最广、涉及国别贸易额最大的自贸区。根据谈判成果，在开放水平方面，双方货物贸易自由化比例均超过“税目90％、贸易额85％”。协定范围涵盖货物贸易、服务贸易、投资和规则共17个领域，包含了电子商务、竞争政策、政府采购、环境等“21世纪经贸议题”。</p>
				</div>
				<!-- arrow three -->
				<img alt="向下箭头1" src="front/dist/img/icon-arrow-1.png" class="icon-arrow">
			</div>
			
			<!-- introduction two -->
			<div class="row">
				<!-- arrow two -->
				<img alt="向下箭头2" src="front/dist/img/icon-arrow-3.png" class="icon-arrow">
				<div class="col-sm-3 col-md-3 col-lg-3" style=""><img class="img-intro" alt="产品介绍一" src="front/dist/img/product-detail-intro.png"></div>
				<div class="col-sm-9 col-md-9 col-lg-9" style="">
					<p class="title-intro">首款产品权威发布<span>&#9660;</span></p>
					<p class="content-intro">中韩自贸区谈判于2012年5月启动，是我国迄今为止对外商谈的覆盖领域最广、涉及国别贸易额最大的自贸区。根据谈判成果，在开放水平方面，双方货物贸易自由化比例均超过“税目90％、贸易额85％”。协定范围涵盖货物贸易、服务贸易、投资和规则共17个领域，包含了电子商务、竞争政策、政府采购、环境等“21世纪经贸议题”。</p>
				</div>
			</div>
			
			<!-- introduction three -->
			<div class="row">
				<div class="col-sm-3 col-md-3 col-lg-3" style=""><img class="img-intro" alt="产品介绍一" src="front/dist/img/product-detail-intro.png"></div>
				<div class="col-sm-9 col-md-9 col-lg-9" style="">
					<p class="title-intro">首款产品权威发布<span>&#9660;</span></p>
					<p class="content-intro">中韩自贸区谈判于2012年5月启动，是我国迄今为止对外商谈的覆盖领域最广、涉及国别贸易额最大的自贸区。根据谈判成果，在开放水平方面，双方货物贸易自由化比例均超过“税目90％、贸易额85％”。协定范围涵盖货物贸易、服务贸易、投资和规则共17个领域，包含了电子商务、竞争政策、政府采购、环境等“21世纪经贸议题”。</p>
				</div>
				<!-- arrow three -->
				<img alt="向下箭头3" src="front/dist/img/icon-arrow-2.png" class="icon-arrow">
			</div>
			
			<!-- introduction four -->
			<div class="row">
				<div class="col-sm-3 col-md-3 col-lg-3" style=""><img class="img-intro" alt="产品介绍一" src="front/dist/img/product-detail-intro.png"></div>
				<div class="col-sm-9 col-md-9 col-lg-9" style="">
					<p class="title-intro">首款产品权威发布<span>&#9660;</span></p>
					<p class="content-intro">中韩自贸区谈判于2012年5月启动，是我国迄今为止对外商谈的覆盖领域最广、涉及国别贸易额最大的自贸区。根据谈判成果，在开放水平方面，双方货物贸易自由化比例均超过“税目90％、贸易额85％”。协定范围涵盖货物贸易、服务贸易、投资和规则共17个领域，包含了电子商务、竞争政策、政府采购、环境等“21世纪经贸议题”。</p>
				</div>
			</div>
		</div>
	</div><!-- end product introduction -->
	<!-- f & q -->
	<div class="layer layer-fq-d">
		<div class="title">
			<div class="container">常见问题<span class="icon-arrow-4"></span></div>
		</div>
		<div class="main">
			<div class="container">
				<div class="block">
					<p class="item">①新型智能决策方式</p>
					<p class="text">新华社北京11月10日电 11月10日，中国国家主席习近平与韩国总统朴槿惠在北京举行会晤，双方共同确认中韩自贸区结束实质性谈判。会晤后，在两国领导人共同见证下，中国商务部部长高虎城和韩国通商产业资源部部长尹相直，分别代表两国政府签署了结束中韩自贸区实质性谈判的会议纪要。</p>
				</div>
				<div class="block">
					<p class="item">②新型智能决策方式</p>
					<p class="text">新华社北京11月10日电 11月10日，中国国家主席习近平与韩国总统朴槿惠在北京举行会晤，双方共同确认中韩自贸区结束实质性谈判。会晤后，在两国领导人共同见证下，中国商务部部长高虎城和韩国通商产业资源部部长尹相直，分别代表两国政府签署了结束中韩自贸区实质性谈判的会议纪要。</p>
				</div>
				<div class="block">
					<p class="item">③新型智能决策方式</p>
					<p class="text">新华社北京11月10日电 11月10日，中国国家主席习近平与韩国总统朴槿惠在北京举行会晤，双方共同确认中韩自贸区结束实质性谈判。会晤后，在两国领导人共同见证下，中国商务部部长高虎城和韩国通商产业资源部部长尹相直，分别代表两国政府签署了结束中韩自贸区实质性谈判的会议纪要。</p>
				</div>
				<div class="block">
					<p class="item">④新型智能决策方式</p>
					<p class="text">新华社北京11月10日电 11月10日，中国国家主席习近平与韩国总统朴槿惠在北京举行会晤，双方共同确认中韩自贸区结束实质性谈判。会晤后，在两国领导人共同见证下，中国商务部部长高虎城和韩国通商产业资源部部长尹相直，分别代表两国政府签署了结束中韩自贸区实质性谈判的会议纪要。</p>
				</div>
			</div>
		</div>
	</div>

</div>
 
	<script type="text/javascript" language="javascript" src="front/dist/js/jquery.min.js" ></script>
	<!-- <script type="text/javascript" language="javascript" src="front/dist/js/jquery-ui.min.js"></script> -->
	<script type="text/javascript" language="javascript" src="front/dist/js/bootstrap.min.js"></script>
	<script type="text/javascript" language="javascript" src="front/dist/js/common.js"></script>
	
	<script type="text/javascript">
	
		$(function () {
			isSoftwareBought();
		});
	
		/* 获取全部的产品信息 */
		function isSoftwareBought() {
			$.ajax({
				type: "GET",
				url: "<%=request.getContextPath()%>/interface/userSoftwarelist.action",
				data: "",
				dataType: "json",
				success: function(data, status){
					for(var i = 0; i < data.softwares.length; i ++) {
						if(data.softwares[i].softwareId == getQueryString("softwareid")) {
							// software bought
							$("#js_buy").hide();
							break;
						} else {
							$("#js_download").hide();
							break;
						}
					}
				},
				error: function(msg, status){
// 					alert(msg);
					
				}
			}) ;
		}
	
	</script>
	
	
 	<!-- Footer should be put behind the jquery reference to make some effect works. -->
	<jsp:include page="_footer.jsp" />
  </body>
</html>
