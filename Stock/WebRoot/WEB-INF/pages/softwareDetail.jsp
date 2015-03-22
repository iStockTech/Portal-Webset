<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<base href="<%=basePath%>" />
<link rel="icon" href="../../favicon.ico">
<link href="front/dist/css/bootstrap.css" rel="stylesheet">
<link href="front/dist/css/" rel="stylesheet">
<link href="front/dist/css/common.css" rel="stylesheet">
<link href="front/dist/css/page.css" rel="stylesheet">
</head>
<body>
<jsp:include page="_header.jsp?index=product" />
	<script language="javascript">
		function changeColor(obj,color){
			obj.bgColor = color ;
		}
		function closeWin(){
			window.close() ;
		}
	</script>

<center> 
<table border="1" width="100%" cellpadding="5" cellspacing="0" bgcolor="F2F2F2">
	<tr onMouseOver="changeColor(this,'white')" onMouseOut="changeColor(this,'F2F2F2')">
		<td colspan="3">
			<h1>软件详情</h1>		</td>
	</tr>
	<tr onMouseOver="changeColor(this,'white')" onMouseOut="changeColor(this,'F2F2F2')">
		<td><font size="2">名称：</font></td>
		<td><span class="STYLE6">${software.softwareName}</span></td>
	</tr>
	<tr onMouseOver="changeColor(this,'white')" onMouseOut="changeColor(this,'F2F2F2')">
		<td><font size="2">描述：</font></td>
		<td><span class="STYLE6">${software.softwareDescripe}</span></td>
	</tr>
	<tr onMouseOver="changeColor(this,'white')" onMouseOut="changeColor(this,'F2F2F2')">
		<td><font size="2">价格：</font></td>
		<td><span class="STYLE6">${software.price}</span></td>
	</tr></table>
<tr>
<!-- 
<td>
<c:if test="${state eq '未购买'}">
<form action="<%=request.getContextPath()%>/alipay/instantPay" method="post" name="alipay">
<input type="hidden" name="softwareid" value="${software.softwareId}">
</form>
<input type="button" onClick="alipay.submit()" value="购买"/> 
</c:if>
</td>
 -->

<td>
<input type="button" onClick="location.href='<%=basePath%>/user/userSoftwarelist.action'" value="返回"/> 
</td>
</tr>
</center>
</body>
</html>