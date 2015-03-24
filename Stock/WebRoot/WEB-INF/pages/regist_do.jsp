<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%
	int result = (Integer)request.getAttribute("result");
	String user = (String)request.getAttribute("user");
%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="refresh" content="2;URL=<%=request.getContextPath()%>/account">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<base href="<%= request.getScheme() + "://" + request.getServerName() + ":" + 
	request.getServerPort() + request.getContextPath() %>/" />
<link rel="icon" href="front/dist/img/icon_stockii_square.png">
<link href="front/dist/css/bootstrap.css" rel="stylesheet">
<link href="front/dist/css/common.css" rel="stylesheet">
<title>注册成功</title>
</head>
<body>
<jsp:include page="_header.jsp" />
<center>
<%
	if(result == 1){	// 注册成功
%>
		<h3>恭喜<%=user%>用户注册成功，两秒后将跳转到登陆页！</h3>
		<h3>如果没有跳转，请按<a href="<%=request.getContextPath()%>/account.action">这里</a>！</h3>
<%
	} else {
%>
		<h3>用户注册失败，此注册ID已经被人使用了！</h3>
<%
	}
%>
</center>
<jsp:include page="_footer.jsp" />
</body>
</html>