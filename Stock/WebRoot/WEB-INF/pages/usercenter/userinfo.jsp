<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=Edge">
	<meta charset=UTF-8">
	<base href="<%= basePath %>" />
	<title>个人中心首页——Stockii</title>
	<link href="front/dist/css/bootstrap.css" rel="stylesheet">
	<link href="front/dist/css/common.css" rel="stylesheet">
	<link href="front/dist/css/page.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="../_header.jsp" />
	
  	<div id="wrapmain">
  	<div class="container">
  		Hello World!
  		<div>
	<%
			if(session.getAttribute("id") != null){
		%>
				<h2>欢迎<%=session.getAttribute("id")%>光临！</h2>
				<a class="btn btn-lg btn-success" href="logout">登录注销</a>
				
				<%			
			} else {
				request.setAttribute("info","请先登陆！") ;
		%>
				<jsp:forward page="account.jsp"/>
		<%
			}
		%>
				</div>
  	</div>
	</div>
	
	<jsp:include page="../_footer.jsp" /> 
	<script src="front/dist/js/jquery.min.js"></script>
	<script src="front/dist/js/bootstrap.min.js"></script>
	
	
	
</body>
</html>