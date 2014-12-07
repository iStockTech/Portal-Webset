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
<!-- Temp Style -->
<style type="text/css">
.developMain{
	background-image: url('front/dist/img/fullscreen-developing-sailing.jpg');
	height: 90%;
	background-size: 100% 100%;
}
.developMain .jumbotron{
	background-color: inherit;
	margin: 0;padding-bottom: 0px;padding-top: 20px;
}
.developMain .title{
	color: #fff;
}
.developMain .description{
	color: #fff;
}
</style>

</head>
  
<body>
<jsp:include page="_header.jsp?index=forum" />
<div id="wrapmain">
	<div class="developMain">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 jumbotron">
			      <h1 class="title">研发中...</h1>
			      <p class="description">
			      	新产品正在路上，输入您的<i class="link-email">邮件地址</i>
			      	并点击“提醒我产品更新”，我们将向您发送最新的产品信息以便于您了解。如果你希望直接和我们进行深度合作，请点击<a class="hyperlink" href="corpration">合作伙伴</a>并与我们取得联系。
			      </p>
			    </div>
			   
			    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 subscribe-form jumbotron">
					<form>
						<div class="input-group">
							<input id="input-email" type="text" class="form-control" placeholder="stockii@163.com"> <span
								class="input-group-btn">
								<button class="btn btn-primary" type="button" onFocus="this.blur()">提醒我产品更新</button>
							</span>
						</div>
					</form>
				</div>
			   
			</div> 
		</div>
	</div>
</div>
<jsp:include page="_footer.jsp" />
    
    <!-- <script type="text/javascript" src="front/dist/js/jquery.min.js"></script>
	<script type="text/javascript" src="front/dist/js/jquery-ui.min.js"></script>
	<script type="text/javascript" src="front/dist/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="front/dist/js/site.effect.js"></script>
	<script type="text/javascript" src="front/dist/js/stockii-ui.js"></script> -->
	
<script type="text/javascript">
	$(window).resize(function() {
		// TODO 
	});
	
	$(function () {
		fullscreenHeight(".maxbg");
		
		// give focus to the email input
		$(".link-email").bind("click", function() {
			focusTo("#input-email");
		});
	});
		
</script>
	
</body>
</html>
