<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
  <head>
<!--     <base href="<%=basePath%>developing"> -->
    
    <title>斯多克为您带来更多惊喜</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="证券,股指,投资,交易">
	<meta http-equiv="description" content="斯多克为您带来更多惊喜">
	
	<link href="front/dist/css/bootstrap.css" rel="stylesheet">
	<link href="front/dist/css/common.css" rel="stylesheet">
	<link href="front/dist/css/developing.css" rel="stylesheet">
	<link href="front/dist/css/jquery.fs.boxer.css" rel="stylesheet">
  </head>
  
  <body>
  <jsp:include page="_header.jsp" />
  <div id="wrapmain">
	<div class="container-fluid">
		<div class="row-fluid">
			<div class="container">
				<div class="col-lg-12 declaration text-center">
					<a class="icon" href="index"><span class="home-icon"></span></a>
					<div class="title">研发中...</div>
					
					<p class="body">输入您的<a class="link-email">邮件地址</a>并点击“提醒我产品更新”，您将可以了解到最新的产品信息。
						如果你希望直接和我们进行深度合作，请点击<a
							class="hyperlink" href="corpration">合作伙伴</a>并与我们取得联系</p>
				</div>
				<div class="subscribe-form col-sm-8 col-sm-offset-2">
					<form>
						<div class="input-group">
							<input id="input-email" type="text" class="form-control"
								placeholder="helloworld@stockii.com"> <span
								class="input-group-btn">
								<button class="btn btn-primary" type="button">提醒我产品更新</button>
							</span>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
  </div>
	<jsp:include page="_footer.jsp" /> 
	<script src="front/dist/js/jquery.min.js"></script>
	<script src="front/dist/js/bootstrap.min.js"></script>
	<script src="front/dist/js/jquery.backstretch.js"></script>
<!-- 	<script type="text/javascript" src="front/dist/js/stockii-ui.js"></script> -->
	
	<script type="text/javascript">
		$(function () {
// 			$(".main-bg").backstretch("front/img/fullscreen-developing-computer.jpg");
			$("#wrapmain").backstretch("front/dist/img/fullscreen-developing-computer.jpg");
			
// 			give focus to the email input
			$(".link-email").bind("click", function() {
				focusTo("#input-email");
			});
		});
		
	</script>
	
  </body>
</html>
