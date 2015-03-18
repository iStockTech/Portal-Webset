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
	
	<div class="container mgt40">
		<div class="row">
		<div class="col-md-2">
	  		<ul class="sidebar-hierarchy">
	  			<h3 class="bar-title"></h3>
	  			<li class="sidebar-molecule">
					<p class="molecule-title"><a href="usercenter/userinfo?userid=12312312">会员中心首页</a></p>
				</li>
				<hr>
				<li class="sidebar-molecule">
					<p class="molecule-title">产品管理<span class="icon-up3"></span></p>
					<ul class="sidebar-molecule-content">
						<li class="sidebar-atom active"><a href="welcome/usercenter?id=17398123">我的软件</a></li>
						<li class="sidebar-atom"><a href="usercenter/userinfo?userid=12312312">最新软件</a></li>
						<li class="sidebar-atom"><a href="usercenter/userinfo?userid=12312312">重新授权</a></li>
					</ul>
				</li>
				<hr>
				<li class="sidebar-molecule">
					<p class="molecule-title">策略管理<span class="icon-up3"></span></p>
					<ul class="sidebar-molecule-content">
						<li class="sidebar-atom"><a href="usercenter/userinfo?userid=12312312">我的策略</a></li>
						<li class="sidebar-atom"><a href="usercenter/userinfo?userid=12312312">最新策略</a></li>
						<li class="sidebar-atom"><a href="usercenter/userinfo?userid=12312312">定制策略</a></li>
					</ul>
				</li>
				<hr>
				<li class="sidebar-molecule">
					<p class="molecule-title">订单管理<span class="icon-up3"></span></p>
					<ul class="sidebar-molecule-content">
						<li class="sidebar-atom"><a href="usercenter/userinfo?userid=12312312">已付款订单</a></li>
	  					<li class="sidebar-atom"><a href="usercenter/userinfo?userid=12312312">未付款订单</a></li>
	  					<li class="sidebar-atom"><a href="usercenter/userinfo?userid=12312312">自动购买</a></li>
					</ul>
				</li>
	  		</ul>
		</div>
		<div class="col-md-10">
			
<center>
	<h1>我的软件列表</h1>
<TABLE BORDER="1" cellpadding="5" cellspacing="0" bgcolor="F2F2F2" width="100%">
	<TR onMouseOver="changeColor(this,'white')" onMouseOut="changeColor(this,'F2F2F2')">
		<td align="center" valign="middle"><span class="STYLE10">ID</span></td>
		<td align="center" valign="middle"><span class="STYLE10">软件</span></td>
		<td align="center" valign="middle"><span class="STYLE10">价格</span></td>
		<td align="center" valign="middle"><span class="STYLE10">详情</span></td>
	</TR>
	<c:forEach items="${softwares}" var="software">
	<TR onMouseOver="changeColor(this,'white')" onMouseOut="changeColor(this,'F2F2F2')">
		<td align="center" valign="middle"><span class="STYLE6">${software.softwareId}</span></td>
		<td align="center" valign="middle"><span class="STYLE6"><a href="Software_download.action?sid=${software.softwareId}">${software.softwareName}</a></span></td>
		<td align="center" valign="middle"><span class="STYLE6">${software.price}</span></td>
		<td align="center" valign="middle"><span class="STYLE6"><a href="Software_detail.action?softwareid=${software.softwareId}">点击进入</a></span></td>
	</TR>
	</c:forEach>
</table>
<a href="<%= basePath %>user/moreSoftwarelist.action">更多</a>
</center>
		
		
		</div>
	</div>
	</div>

</div>
<jsp:include page="_footer.jsp" />
</body>
</html>