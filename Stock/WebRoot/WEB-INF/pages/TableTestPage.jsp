<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'TableTestPage.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    <script src="front/dist/js/jquery.min.js" type="text/javascript"></script>
    <script type="text/javascript">
    	$.ajax({
    		url:"<%=request.getContextPath()%>/interface/acquireTablePageAction.action",
    		type:'GET',
    		dataType:'json',
    		data:{"currentPage":"2"},
    		success:function(msg){
    			console.log(msg.table);
    			document.body.innerHTML = msg.table;
    		},
    		error:function(){
    			console.log("error");
    		}
    	});
    </script>
  
  
  </body>
</html>
