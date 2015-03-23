<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">  
<title>斯多克为您带来更多惊喜</title>  
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">    
<meta http-equiv="keywords" content="证券,股指,投资,交易">
<meta http-equiv="description" content="斯多克为您带来更多惊喜">

<link href="front/dist/css/bootstrap.css" rel="stylesheet">
<link href="front/dist/css/common.css" rel="stylesheet">
<link href="front/dist/css/forum.css" rel="stylesheet">
</head>
<body>
<jsp:include page="_header.jsp?index=forum" />
<div id="wrapmain">
</div>
    
<script type="text/javascript" src="front/dist/js/jquery.min.js"></script>
<script type="text/javascript" src="front/dist/js/bootstrap.min.js"></script>
<script type="text/javascript">
	window.location.href = "developing";
</script>
	<!-- Footer should be put behind the jquery reference to make some effect works. -->
	<jsp:include page="_footer.jsp" />
  </body>
</html>
