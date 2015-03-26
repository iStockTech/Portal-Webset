<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=Edge">
	<meta charset=UTF-8">
	<base href="<%= basePath %>" />
	<title>个人中心首页——Stockii</title>
	<link href="front/dist/css/bootstrap.css" rel="stylesheet">
	<link href="front/dist/css/common.css" rel="stylesheet">
	<link href="front/dist/css/page.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="../_header.jsp?index=account" />
	
  	<div class="content-main container mgt20">
  		<div class="row">
  			<div class="col-md-2">
  				<jsp:include page="_sidebar.jsp?index=userinfo"></jsp:include>
  			</div>
  			<div class="col-md-10 mgt20">
  				<div class="section-set">
  					<div class="row section-bordered user-intro">
  						<div class="col-md-2">
  							<img alt="portrait" src="front/dist/img/index_investor_livermore.png" class="user-intro-potrait">
  						</div>
  						<div class="col-md-3">
  							<h3 class="pdt10"><%=session.getAttribute("id")%></h3>
  							<p>xunaixuan0421@163.com</p>
  						</div>
  					</div>
  					
  					<div class="row section-bordered">
						<h2 class="col-md-4 col-sm-6 col-xs-6">我的产品列表</h2>
						<a class="col-md-8 col-sm-6 col-xs-6 text-right pdt30" href="<%= basePath %>user/moreSoftwarelist.action"><span class="glyphicon glyphicon-plus"></span>购买更多</a>
					
						<div class="col-md-12 ">
							<table class="table table-bordered text-center table-hover" id="js_mysoft">
								<tr class="info">
									<th class="text-center">ID</th>
									<th class="text-center">名称</th>
									<th class="text-center">产品价格（人民币）</th>
									<th class="text-center">产品详情</th>
									<th class="text-center">下载</th>
								</tr>
								<tr id="js_tr_content">
									<td class="soft-id"></td>
									<td class="soft-name"></td>
									<td class="soft-price"></td>
									<td class="soft-details"></td>
									<td class="soft-download"></td>
								</tr>
	<!-- 						<c:forEach items="${softwares}" var="software"> -->
	<!-- 						<tr class="tr-content hide"> -->
	<!-- 							<td>${software.softwareId}</td> -->
	<!-- 							<td>${software.softwareDescripe}</td> -->
	<!-- 							<td>${software.price}</td> -->
	<!-- 							<td><a href="<%=request.getContextPath()%>/Product_detail.action?softwareid=${software.softwareId}">点击进入</a></td> -->
	<!-- 							<td><a href="<%=request.getContextPath()%>/Software_download.action?sid=${software.softwareId}">${software.softwareName}</a></td> -->
	<!-- 						</tr> -->
	<!-- 						</c:forEach> -->
							</table>
						</div>
					</div>
  				</div>
  			<div>
		</div>
  	</div>
  </div>
  	</div>
	
	<script src="front/dist/js/jquery.min.js"></script>
	<script src="front/dist/js/bootstrap.min.js"></script>
	
	<script type="text/javascript">
		$(function() {
			$.ajax({
				type: "GET",
				url: "<%=request.getContextPath()%>/interface/userSoftwarelist.action",
				data: "",
				dataType: "json",
				success: function(data, status){
					for(var k = 0; k < data.softwares.length; k++) {
						$("#js_tr_content .soft-id").text(data.softwares[k].softwareId);
						$("#js_tr_content .soft-name").text(data.softwares[k].softwareDescripe);
						$("#js_tr_content .soft-price").text(data.softwares[k].price);
						$("#js_tr_content .soft-details").html("<a href=\"<%=request.getContextPath()%>/Product_detail.action?softwareid=" + data.softwares[k].softwareId + "\">点击进入</a>");
						$("#js_tr_content .soft-download").html("<a href=\"<%=request.getContextPath()%>/Software_download.action?sid=" + data.softwares[k].softwareId + "\">下载</a>");
						$("#js_mysoft").append($("<tr></tr>").append($("#js_tr_content").html()));
					}
					$("#js_tr_content").hide();
				},
				error: function(msg, status){
// 					alert(msg);
				}
			}) ;
		});
	</script>
	
	<!-- Footer should be put behind the jquery reference to make some effect works. -->
	<jsp:include page="../_footer.jsp" />
	
</body>
</html>