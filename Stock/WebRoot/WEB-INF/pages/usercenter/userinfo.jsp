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
	<jsp:include page="../_header.jsp?index=account" />
	
  	<div id="wrapmain">
  	<div class="container mgt20">
  		<div class="row">
  			<div class="col-md-2">
  				<jsp:include page="_sidebar.jsp?index=userinfo"></jsp:include>
  			</div>
  			<div class="col-md-10 mgt20">
  				<div class="section-set">
  					<div class="row section-bordered user-intro">
  						<div class="col-md-2">
  							<img alt="portrait" src="front/dist/img/index_investor_livermore.png" class="user-intro-potrait">
  						</div>
  						<div class="col-md-3">
  							<h3 class="pdt10"><%=session.getAttribute("id")%></h3>
  							<p>xunaixuan0421@163.com</p>
  						</div>
  					</div>
  				</div>
  				<div>

					<%-- <%

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

					%> --%>
				</div>
  			</div>
  		</div>
  	</div>
	</div>
	
	<script src="front/dist/js/jquery.min.js"></script>
	<script src="front/dist/js/bootstrap.min.js"></script>
	
	<!-- Footer should be put behind the jquery reference to make some effect works. -->
	<jsp:include page="../_footer.jsp" />
</body>
</html>