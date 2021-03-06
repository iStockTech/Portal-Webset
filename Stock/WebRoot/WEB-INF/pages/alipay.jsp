<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
	<head>
	<base href="<%=basePath%>" />
	<link href="<%=request.getContextPath()%>/front/dist/css/StyleSheet.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="front/dist/css/bootstrap.css">
	<link rel="stylesheet" href="front/dist/css/common.css">
	<link rel="stylesheet" href="front/dist/css/page.css">
	
	<script src="<%=request.getContextPath()%>/js/jquery-latest.js"></script>
    <script src="<%=request.getContextPath()%>/js/MessageBox.js"></script>
	<title>支付宝即时到账交易接口</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
*{
	margin:0;
	padding:0;
}
ul,ol{
	list-style:none;
}
.title{
    color: #ADADAD;
    font-size: 14px;
    font-weight: bold;
    padding: 8px 16px 5px 10px;
}
.hidden{
	display:none;
}

.new-btn-login-sp{
	border:1px solid #D74C00;
	padding:1px;
	display:inline-block;
}

.new-btn-login{
    background-color: transparent;
    background-image: url("<%=request.getContextPath()%>/images/new-btn-fixed.png");
    border: medium none;
}
.new-btn-login{
    background-position: 0 -198px;
    width: 82px;
	color: #FFFFFF;
    font-weight: bold;
    height: 28px;
    line-height: 28px;
    padding: 0 10px 3px;
}
.new-btn-login:hover{
	background-position: 0 -167px;
	width: 82px;
	color: #FFFFFF;
    font-weight: bold;
    height: 28px;
    line-height: 28px;
    padding: 0 10px 3px;
}
.bank-list{
	overflow:hidden;
	margin-top:5px;
}
.bank-list li{
	float:left;
	width:153px;
	margin-bottom:5px;
}

#main{
	width:750px;
	margin:0 auto;
	font-size:14px;
	font-family:'宋体';
}
#logo{
	background-color: transparent;
    background-image: url("<%=request.getContextPath()%>/images/new-btn-fixed.png");
    border: medium none;
	background-position:0 0;
	width:166px;
	height:35px;
    float:left;
}
.red-star{
	color:#f00;
	width:10px;
	display:inline-block;
}
.null-star{
	color:#fff;
}
.content{
	margin-top:5px;
}

.content dt{
	width:160px;
	display:inline-block;
	text-align:right;
	float:left;
	
}
.content dd{
	margin-left:100px;
	margin-bottom:5px;
}
#foot{
	margin-top:10px;
}
.foot-ul li {
	text-align:center;
}
.note-help {
    color: #999999;
    font-size: 12px;
    line-height: 130%;
    padding-left: 3px;
}

.cashier-nav {
    font-size: 14px;
    margin: 15px 0 10px;
    text-align: left;
    height:30px;
    border-bottom:solid 2px #CFD2D7;
}
.cashier-nav ol li {
    float: left;
}
.cashier-nav li.current {
    color: #AB4400;
    font-weight: bold;
}
.cashier-nav li.last {
    clear:right;
}
.alipay_link {
    text-align:right;
}
.alipay_link a:link{
    text-decoration:none;
    color:#8D8D8D;
}
.alipay_link a:visited{
    text-decoration:none;
    color:#8D8D8D;
}
</style>
</head>
<body>

<script type="text/javascript">
    function payFinish(){
    	CloseMessageBox();
    	var tradeNo = $("#trade_no").val();
    	window.location.href="<%=request.getContextPath()%>/alipay/orderFinish.action?WIDout_trade_no="+tradeNo; 
    }
</script>
	<jsp:include page="_header.jsp?index=product" />
	<div id="waitpay_online" style="display:none">
        <table style="width: 400px">
            <tr>        	
                <td >
                <span class="icon"><img src="<%=request.getContextPath()%>/images/working.gif" /></span></td>
                 <td>支付完成前，请不要关闭此支付验证窗口。支付完成后，请根据您支付的情况点击下面按钮。</td>
            </tr>
            <tr>
                <td align="center" >
                    <input id="online_have_question" onclick="payFinish()" type="button" value="支付遇到问题" /></td>
                 <td align="center" >
                 	<input id="finish_pay_order" onclick="payFinish()" type="button" value="支付完成" /></td>
            </tr>
        </table>
    </div>
	<div class="content-main container mgt20">
	<form name="alipayment" action="<%=request.getContextPath()%>/alipay/alipayTo.action" method="post" 
		target="_blank" class="form-horizontal">
		<input type="hidden" name="order_token" value="${session.order_token}"/>
		<input type="hidden" size="30" name="WIDseller_email" value="${WIDseller_email}"/>
		<input type="hidden" size="30" name="softwareid" value="${softwareid}"/>
		
		<div class="form-group row">
   	 		<label for="trade_no" class="col-sm-2 control-label">商户订单号</label>
   			<div class="col-sm-6">
     			<input type="text" class="form-control" id="trade_no" size="30" name="WIDout_trade_no" 
     				readonly="true" value="${WIDout_trade_no}" placeholder="商户网站订单系统中唯一订单号，必填"/>
   			</div>
  		</div>
  		
  		<div class="form-group row">
   	 		<label for="trade_name" class="col-sm-2 control-label">商户订单名称</label>
   			<div class="col-sm-6">
     			<input type="text" class="form-control" id="trade_name" size="30" name="WIDsubject" 
     				readonly="true" value="${WIDsubject}"/>
   			</div>
  		</div>
  		
  		<div class="form-group row">
   	 		<label for="trade_amount" class="col-sm-2 control-label">付款金额：</label>
   			<div class="col-sm-6">
     			<input type="text" class="form-control" id="trade_amount" size="30" name="WIDtotal_fee" 
     				readonly="true" value="${WIDtotal_fee}"/>
   			</div>
  		</div>
  		
  		<div class="form-group row">
   	 		<label for="trade_desc" class="col-sm-2 control-label">订单描述：</label>
   			<div class="col-sm-6">
     			<input type="text" class="form-control" id="trade_desc" size="30" name="WIDbody" 
     			value="${WIDbody}"/>
   			</div>
  		</div>
  		
  		<div class="form-group row">
   	 		<label for="pay_channel" class="col-sm-2 control-label">支付渠道：</label>
   			<div class="col-sm-6">
     			<input type="text" class="form-control" id="pay_channel" size="30" name="enable_paymethod" readonly="true"
     			value="${enable_paymethod}"/>
   			</div>
  		</div>
  		
  		<div class="form-group row">
   	 		<label for="display_address" class="col-sm-2 control-label">商品展示地址：</label>
   			<div class="col-sm-6">
     			<input type="text" class="form-control" id="display_address" size="30" name="WIDshow_url" 
     			value="${WIDshow_url}"/>
   			</div>
  		</div>
  		
  		<div class="form-group row">
  			<div class="col-sm-2 col-sm-offset-2">
   				<button class="new-btn-login" type="submit" showoption="control:waitpay_online;width:400;height:320;title:网上支付提示">确 认</button>
  			</div>
  		</div>
	</form>
</div>



	<div id="main">
		<div id="head">
            <dl class="alipay_link">
                <a target="_blank" href="http://www.alipay.com/"><span>支付宝首页</span></a>|
                <a target="_blank" href="https://b.alipay.com/home.htm"><span>商家服务</span></a>|
                <a target="_blank" href="http://help.alipay.com/support/index_sh.htm"><span>帮助中心</span></a>
            </dl>
            <span class="title">支付宝即时到账交易接口快速通道</span>
		</div>
        <div class="cashier-nav">
            <ol>
				<li class="current">1、确认信息 →</li>
				<li>2、点击确认 →</li>
				<li class="last">3、确认完成</li>
            </ol>
        </div>
<!--         <s:form name="alipayment" action="alipayTo.action" method="post" namespace="/alipay" target="_blank"> -->
<!-- 			<input type="hidden" name="order_token" value="${session.order_token}"/> -->
<!--             <div id="body" style="clear:left"> -->
<!--                 <dl class="content"> -->
<!-- 					<dd> -->
<!-- 						<input type="hidden" size="30" name="WIDseller_email" value="${WIDseller_email}"/> -->
<!-- 						<input type="hidden" size="30" name="softwareid" value="${softwareid}"/> -->
<!-- 					</dd> -->
<!-- 					<dt>商户订单号：</dt> -->
<!-- 					<dd> -->
<!-- 						<span class="null-star">*</span> -->
<!-- 						<input id="trade_no" size="30" name="WIDout_trade_no" readonly="true" value="${WIDout_trade_no}"/> -->
<!-- 						<span>商户网站订单系统中唯一订单号，必填 -->
<!-- </span> -->
<!-- 					</dd> -->
<!-- 					<dt>订单名称：</dt> -->
<!-- 					<dd> -->
<!-- 						<span class="null-star">*</span> -->
<!-- 						<input size="30" name="WIDsubject" readonly="true" value="${WIDsubject}"/> -->
<!-- 						<span>必填 -->
<!-- </span> -->
<!-- 					</dd> -->
<!-- 					<dt>付款金额：</dt> -->
<!-- 					<dd> -->
<!-- 						<span class="null-star">*</span> -->
<!-- 						<input size="30" name="WIDtotal_fee" readonly="true" value="${WIDtotal_fee}"/> -->
<!-- 						<span>必填 -->
<!-- </span> -->
<!-- 					</dd> -->
<!-- 					<dt>订单描述：</dt> -->
<!-- 					<dd> -->
<!-- 						<span class="null-star">*</span> -->
<!-- 						<input size="30" name="WIDbody" value="${WIDbody}"/> -->
<!-- 						<span></span> -->
<!-- 					</dd> -->
<!-- 					<dt>支付渠道：</dt> -->
<!-- 					<dd> -->
<!-- 						<span class="null-star">*</span> -->
<!-- 						<input size="30" name="enable_paymethod" readonly="true" value="${enable_paymethod}"/> -->
<!-- 						<span></span> -->
<!-- 					</dd> -->
<!-- 					<dt>商品展示地址：</dt> -->
<!-- 					<dd> -->
<!-- 						<span class="null-star">*</span> -->
<!-- 						<input size="30" name="WIDshow_url" readonly="true" value="${WIDshow_url}"/> -->
<!-- 					</dd> -->
<!--                     <dt></dt> -->
<!--                     <dd> -->
<!--                         <span class="new-btn-login-sp"> -->
<!--                             <button class="new-btn-login" type="submit" style="text-align:center;" showoption="control:waitpay_online;width:400;height:320;title:网上支付提示">确 认</button> -->
<!--                         </span> -->
<!--                     </dd> -->
<!--                 </dl> -->
<!--             </div> -->
<!-- 		</s:form> -->
        <div id="foot">
			<ul class="foot-ul">
				<li><font class="note-help">如果您点击“确认”按钮，即表示您同意该次的执行操作。 </font></li>
				<li>
					支付宝版权所有 2011-2015 ALIPAY.COM 
				</li>
			</ul>
		</div>
	</div>

	<script src="front/dist/js/bootstrap.min.js"></script>
	
	<jsp:include page="_footer.jsp" />
</body>
</html>