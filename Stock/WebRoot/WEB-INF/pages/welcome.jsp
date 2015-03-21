<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
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
<title>登录斯多克</title>
</head>

<body>
<jsp:include page="_header.jsp?index=account" />
<!-- <div id="wrapmain"> -->
<!--     <header id="overview"> -->
<!-- 		<div class="container"> -->
<!-- 			<h3 class="lead">欢迎您！尊敬的<span><%=session.getAttribute("id")%></span></h3> -->
<!-- 		</div> -->
<!-- 	</header> -->
	
	<div class="content-main container mgt20">
		<div class="row">
			<div class="col-md-2">
				<jsp:include page="usercenter/_sidebar.jsp?index=mysoftware"></jsp:include>
			</div>
			<div class="col-md-10 section-set mgt20">
	  			<div class="row section-bordered">
					<h2 class="col-md-4 col-sm-6 col-xs-6">我的产品列表</h2>
					<a class="col-md-8 col-sm-6 col-xs-6 text-right pdt30" href="<%= basePath %>user/moreSoftwarelist.action"><span class="glyphicon glyphicon-plus"></span>购买更多</a>
					
					<div class="col-md-12 ">
						<table class="table table-bordered text-center table-hover">
						<tr class="info">
							<th class="text-center">ID</th>
							<th class="text-center">名称</th>
							<th class="text-center">产品价格（人民币）</th>
		<!-- 					<th class="text-center">有效期</th> -->
							<th class="text-center">产品详情</th>
							<th class="text-center">下载</th>
						</tr>
						<tr>
							<td>S001</td>
							<td>斯多克证券分析系统</td>
							<td>28000</td>
		<!-- 					<td>永久</td> -->
							<td><a href="productDetail">点击进入</a></td>
							<td><a href="">下载</a></td>
						</tr>
						<tr>
							<td>S002</td>
							<td>斯多克智能交易系统</td>
							<td>198000</td>
		<!-- 					<td>1年</td> -->
							<td><a href="productDetail">点击进入</a></td>
							<td><a href="">下载</a></td>
						</tr>
						<c:forEach items="${softwares}" var="software">
							<tr>
								<td>${software.softwareId}</td>
								<td>${software.softwareDescripe}</td>
								<td>${software.price}</td>
								<td><a href="<%=request.getContextPath()%>/Product_detail.action?softwareid=${software.softwareId}">点击进入</a></td>
								<td><a href="<%=request.getContextPath()%>/Software_download.action?sid=${software.softwareId}">${software.softwareName}</a></td>
							</tr>
						</c:forEach>
					</table>
					</div>
				</div>
				
			</div>
		</div>
	</div>
<!-- 	</div> -->
<!-- </div> -->
<jsp:include page="_footer.jsp" />

	<script type="text/javascript">
		$(function() {
			$.ajax({
				type: "GET",
				url: "<%=request.getContextPath()%>/interface/allSoftwarelist.action",
				data: "",
				dataType: "json",
				success: function(data, status){
// 					alert(data.softwares);
				},
				error: function(msg, status){
// 					alert(msg);
				}
			}) ;
		});
	</script>
</body>
</html>