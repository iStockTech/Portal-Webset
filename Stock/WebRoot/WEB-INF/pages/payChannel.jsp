<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
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
</head>
<body>
<jsp:include page="_header.jsp?index=product" />
<div class="container">
	    请选择支付方式. <br>
<form name="alipay" action="<%=request.getContextPath()%>/alipay/instantPay" method="post">
<input type="radio" name="enable_paymethod" value="directPay" checked="checked"/> 支付宝账户余额
<br />
<input type="radio" name="enable_paymethod" value="cartoon" /> 卡通
<br />
<input type="radio" name="enable_paymethod" value="bankPay" /> 网银
<br />
<input type="radio" name="enable_paymethod" value="creditCardExpress" /> 信用卡快捷
<br />
<input type="radio" name="enable_paymethod" value="debitCardExpress" /> 借记卡快捷
<br />
<input type="hidden" name="softwareid" value="<%=request.getParameter("softwareid")%>">
<input type="submit" value="支付" />
</form>
</div>



<jsp:include page="_footer.jsp" />
  </body>
</html>
