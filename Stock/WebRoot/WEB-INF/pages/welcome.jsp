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
<div id="wrapmain">
<!--     <header id="overview"> -->
<!-- 		<div class="container"> -->
<!-- 			<h3 class="lead">欢迎您！尊敬的<span><%=session.getAttribute("id")%></span></h3> -->
<!-- 		</div> -->
<!-- 	</header> -->
	
	<div class="container mgt20">
		<div class="row">
		<div class="col-md-2">
			<jsp:include page="usercenter/_sidebar.jsp?index=mysoftware"></jsp:include>
			</div>
		<div class="col-md-10">
			<div class="row">
				<h2 class="col-md-4">我的产品列表</h2>
				<a class="col-md-8 text-right pdt30" href="<%= basePath %>user/moreSoftwarelist.action"><span class="glyphicon glyphicon-plus"></span>购买更多</a>
			</div>
			
			<table class="table table-bordered text-center table-hover">
				<tr class="info">
					<th class="text-center">ID</th>
					<th class="text-center">产品名称</th>
					<th class="text-center">产品价格（人民币）</th>
					<th class="text-center">有效期</th>
					<th class="text-center">产品详情</th>
				</tr>
				<tr>
					<td>S001</td>
					<td><a>斯多克证券分析系统</a></td>
					<td>28000</td>
					<td>永久</td>
					<td><a href="productDetail">详情</a></td>
				</tr>
				<tr>
					<td>S002</td>
					<td><a>斯多克智能交易系统</a></td>
					<td>198000</td>
					<td>1年</td>
					<td><a href="productDetail">详情</a></td>
				</tr>
				<c:forEach items="${softwares}" var="software">
				<tr onMouseOver="changeColor(this,'white')" onMouseOut="changeColor(this,'F2F2F2')">
						<td><span class="STYLE6">${software.softwareId}</span></td>
						<td><span class="STYLE6"><a href="Software_download.action?sid=${software.softwareId}">${software.softwareName}</a></span></td>
						<td><span class="STYLE6">${software.price}</span></td>
						<td><span class="STYLE6"><a href="Software_detail.action?softwareid=${software.softwareId}">点击进入</a></span></td>
					</tr>
				</c:forEach>
		</table>
		</div>
	</div>
	</div>

</div>
<jsp:include page="_footer.jsp" />
</body>
</html>