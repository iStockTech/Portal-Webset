<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>开启智能投资之旅</title>
<base
	href="<%=request.getScheme() + "://" + request.getServerName()
					+ ":" + request.getServerPort() + request.getContextPath()%>/" />
<link rel="icon" href="front/dist/img/icon_stockii_square.png">
<link href="front/dist/css/bootstrap.css" rel="stylesheet">
<link href="front/dist/css/base.css" rel="stylesheet">
<link href="front/dist/css/common.css" rel="stylesheet">
<link href="front/dist/css/page.css" rel="stylesheet">
<style type="text/css">
	
	
	
</style>

</head>
<body>
<jsp:include page="_header.jsp?index=signup" />
<div id="wrapmain" class="mgt30 mgb20">	

<div class="container signup">
	<div class="row">
    	<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
		<form action="userRegister" method="post" id="signupForm">
<!-- 		<form  method="post" id="signupForm"> -->
			<ul class="list-unstyle">
				<li>
					<label class="name">用户名</label>
					<input type="text" name="mid" class="form-control">
				</li>
				<li>
					<label class="name">邮箱</label>
					<input type="email" name="email" id="email" class="form-control">
				</li>
				<li>
					<label class="name">密码</label>
					<input id="password" type="password" name="password" class="form-control">
				</li>
				<li>
					<label class="name">密码确认</label>
					<input type="password" name="conf" class="form-control">
				</li>
				<li>
					<label class="name">身份证</label>
					<input type="text" name="idNum" id="idNumber" class="form-control">
				</li>
				<li>
					<label class="name">真实姓名</label>
					<input type="text" name="realName" id="realName" class="form-control">
				</li>
				<li>
					<label class="name">性别</label>
					<input type="radio" name="sex" value="male" checked="checked" />男
					<input type="radio" name="sex" value="female" />女
				</li>
				<li>
					<label class="name">手机</label>
					<input type="tel" name="phone" id="phone" class="form-control">
				</li>
				
<!-- 				<li> -->
<!-- 					<label class="name">车牌号</label> -->
<!-- 					<input type="text" name="vinUS" class="form-control"> -->
<!-- 				</li>  -->
				
				
				<li>
					<label class="name"></label>
					<input type="checkbox" checked="checked" name="not" value="aa">我同意《服务协议》和《用户条款》
				</li>
				<li>
					<label class="name"></label>
					<input type="submit" value="注册" class="register">
					<input type="button" value="重置" class="reset" name="reset">
				</li>
			</ul>
			</form>
		</div>    
    </div>
</div>

</div>
<jsp:include page="_footer.jsp" />

<script src="front/dist/js/jquery.validate.js" type="text/javascript"></script>
<script src="front/dist/js/jquery.validate.additional-methods.js" type="text/javascript"></script>
<script src="front/dist/js/jquery.metadata.js" type="text/javascript"></script>
<script src="front/dist/js/_message_zh.js" type="text/javascript"></script>

<script type="text/javascript">
$().ready(function() {
 var validator = $("#signupForm").validate({
//  	debug : true,
 	rules : {
 		mid : "required",
 		email : {
 			required : true,
    		email : true
 		},
 		password : {
 			required : true,
 			rangelength:[5,15] 
 		},
 		conf : {
 			required: true,
    		rangelength:[5,15],
    		equalTo: "#password"
 		},
 		realName : {
 			required: true,
 			chineseName : "#realName"
 		},
 		idNum : {
 			required: true,
 			idNumber : "#idNumber"
 		},
		phone : {
			required : true,
			mobileZH : "#phone",
		}
 	},
 	messages : {
 		mid : "请输入用户名",
 		email : {
 			required : "请输入邮箱",
 			email : "请输入格式正确的去邮箱地址"
 		},
 		password : {
 			required : "请输入密码",
 			minlength: jQuery.format("密码必须是5~15位")
 		},
 		conf : {
 			required: "请输入确认密码",
    		minlength: jQuery.format("密码必须是5~15位"),
    		equalTo: "两次输入密码不一致不一致"
 		},
 		realName : {
 			required: "请输入您的真实姓名",
 			chineseName : "真实姓名存在非法字符，如英文、数字等"
 		},
 		idNum : {
 			required: "请输入您的身份证号",
 			idNumber : "身份证格式输入错误"
 		},
 		phone : {
 			required : "请输入手机号",
 			mobileZH : "手机号码输入格式错误"
 		},
 		
 	}
 });
 
 $(".reset").click(function(){
 	validator.resetForm();
 });
 
 
});
</script>

</body>
</html>