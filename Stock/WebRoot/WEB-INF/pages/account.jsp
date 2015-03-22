<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
  <head>
    <title>登录斯多克</title>
    <base href="<%=basePath%>" />
	<link href="front/dist/css/bootstrap.css" rel="stylesheet">
	<link href="front/dist/css/common.css" rel="stylesheet">
	<link href="front/dist/css/page.css" rel="stylesheet">
  </head>
  
  <body>
  	<jsp:include page="_header.jsp" />
	<div id="wrapmain">
		<div class="container login-content">
			<div class="row">
				<div class="col-md-5 mgt30" id="img-tips">
					<img alt="img-tips" src="front/dist/img/account_tips.png">
				</div>
				<div class="col-md-5 col-md-offset-2">
					<div class="panel panel-default">
	    				<div class="panel-body">
	    					<p class="alert-important"><%=request.getAttribute("info")!=null?request.getAttribute("info"):""%></p>
		    				<form action="userLogin" method="post" class="form-horizontal" onsubmit="return validate()">
		      					<h2>登录</h2>
		      					<div style="margin:0;padding:0;display:inline"><input name="utf8" type="hidden" value="✓">
		      					<input name="authenticity_token" type="hidden" value="3EliZ07kHTqkHCEcNDJegiCF6qNH3xDxQLU+K8H6+rk="></div>
		        				<div class="form-group">
		          					<div class="col-sm-12">
		          						<input class="form-control" id="user_login" name="mid" type="text" placeholder="邮箱/用户名" autofocus="autofocus">
		        						<p class="alert-tips"></p>
		        					</div>
		        				</div>
		        				<div class="form-group">
		        					<div class="col-sm-12">
		          						<input class="form-control" id="user_password" name="password" type="password" placeholder="密码">
		        						<p class="alert-tips"></p>
		        					</div>
		        				</div>
		          				<div class="form-group">
		          					<div class="col-sm-8">
		          						<input class="form-control" id="user_checkcode" name="checkcode" type="text" maxlength="4" size="4" placeholder="验证码">
		        						<p class="alert-tips"></p>
		        					</div>
		        					<img class="col-sm-4" alt="" src="image.jsp">
		        				</div>
		        				<div>
		        					<ul class="list-inline btn-banner">
		        						<li class="btn-banner-2"><input class="btn btn-stockii btn-block" name="commit" type="submit" value="登录"/></li>
		        						<li class="btn-banner-2"><a class="btn btn-stockii btn-block" href="signup">立即注册</a></li>
		        					</ul>        					        					
		        				</div>
							</form> 
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<script src="front/dist/js/jquery.min.js"></script>
	<script src="front/dist/js/bootstrap.min.js"></script>
	<script src="front/dist/js/jquery.backstretch.js"></script>
	<script src="front/dist/js/SHA1.js"></script>
	
	<script type="text/javascript">
		$(function () {
			$("#wrapmain").backstretch("front/dist/img/account_bg.jpg");
			
			initElementEvents();
		});
		
		function initElementEvents() {
			/* 在失去焦点的时候进行校验 */
			$('input.form-control').blur(function(){
// 				$('p.alert-tips').hide();
				if(this.name === 'mid') {
					if(validateUserName()) {
						$(this).siblings("p").hide();
					}
				}
				else if(this.name=='password'){
					if(validatePassword()) {
						$(this).siblings("p").hide();
					}
				}
				else if(this.name=='checkcode'){
					if(validateCheckCode()) {
						$(this).siblings("p").hide();
					}
				}
			});
		}
		
		/* 校验表单合法性的函数 */
		function validate() {
			if(validateUserName() && validatePassword() && validateCheckCode()) {
				$('[name="password"]').val(hex_sha1($('[name="password"]').val()));
				return true;
			}
			return false;
		}
		
		/* 校验用户名是否合法的函数 */
		function validateUserName() {
			var $input = $('#user_login');
			if($input.val() == '') {
				$input.siblings("p").text("用户名不能为空").show();
				return false;
			} else if(!(/^\w+$/.test($input.val()))) {
				$input.siblings("p").text("用户名只能由数字、26个英文字母或者下划线组成").show();
				return false;
			}
			return true;
		}
		
		/* 校验密码是否合法的函数 */
		function validatePassword() {
			var $input = $('#user_password');
			if($input.val() == '') {
				$input.siblings("p").text("密码不能为空").show();
				return false;
			} 
			else if(!(/^.{5,15}$/.test($input.val()))) {
				$input.siblings("p").text("密码长度必须在5-15之间").show();
				return false;
			}
			else if(!(/(?!^\\d+$)/.test($input.val()))) {
				$input.siblings("p").text("密码不能全是数字").show();
				return false;
			}
// 			else if(!(/(?!^[a-zA-Z]+$)/.test($input.val()))) {
// 				$input.siblings("p").text("不能全是字母").show();
// 				return false;
// 			}
			return true;
		}
		
		/* 校验验证码是否合法的函数 */
		function validateCheckCode() {
			var $input = $('#user_checkcode');
			if($input.val() == '') {
				$input.siblings("p").text("校验码不能为空").show();
				return false;
			}
			return true;
		}
		
	</script>
	<!-- Footer should be put behind the jquery reference to make some effect works. -->
	<jsp:include page="_footer.jsp" />
  </body>
</html>
