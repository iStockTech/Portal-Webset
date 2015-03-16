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
    请选择支付方式. <br>
<form name="alipay" action="<%=request.getContextPath()%>/alipay/instantPay" method="post">
<input type="radio" name="channel" value="alipay" checked="checked"/> 支付宝
<br />
<input type="radio" name="channel" value="ICBC" /> 中国工商银行
<br />
<input type="radio" name="channel" value="ABC" /> 中国农业银行
<br />
<input type="radio" name="channel" value="BC" /> 中国银行
<br />
<input type="radio" name="channel" value="CBC" /> 中国建设银行
<br />
<input type="hidden" name="softwareid" value="<%=request.getParameter("softwareid")%>">
<input type="submit" value="支付" />
</form>
<jsp:include page="_footer.jsp" />
  </body>
</html>
