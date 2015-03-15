<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head><title>软件详情</title>
<style type="text/css">
<!--
.STYLE6 {font-size: 12px}
.STYLE10 {font-size: 14px; font-weight: bold; }
-->
</style>
</head>
<body>
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
	</tr>
	<tr onMouseOver="changeColor(this,'white')" onMouseOut="changeColor(this,'F2F2F2')">
		<td><font size="2">状态：</font></td>
		<td><span class="STYLE6">${state}</span></td>
	</tr>
</table>
<tr>
<td>
<c:if test="${state eq '未购买'}">
<form action="<%=request.getContextPath()%>/alipay/instantPay" method="post" name="alipay">
<input type="hidden" name="softwareid" value="${software.softwareId}">
</form>
<input type="button" onClick="alipay.submit()" value="购买"/> 
</c:if>
</td>
<td>
<input type="button" onClick="location.href='userSoftwarelist.action'" value="返回"/> 
</td>
</tr>
</center>
</body>
</html>