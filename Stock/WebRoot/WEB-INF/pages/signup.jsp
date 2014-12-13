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
<link rel="icon" href="../../favicon.ico">
<link href="front/dist/css/bootstrap.css" rel="stylesheet">
<link href="front/dist/css/common.css" rel="stylesheet">
<link href="front/dist/css/signin.css" rel="stylesheet">
<style type="text/css">
	.sign-up-field label{
	}
</style>
<link rel="icon" href="front/dist/img/icon_stockii_square.png">
</head>
<body>
<jsp:include page="_header.jsp?index=signup" />
<div id="wrapmain">	
	
	<div class="container sign-up-section">
    	<div class="col-md-6">
		<form action="userRegister" method="post" onSubmit="return validate(this)">
			<div class="row sign-up-input">
				<div class="sign-up-field">
					<label>邮箱</label>
					<span style="display:none;color: red;font-size: 10px;">#请输入正确的邮箱</span>
					<input id="id_email" class="form-control" type="email" name="email" placeholder="填入您的常用邮箱" />
					<h5 id="tip_email"></h5>
				</div>

				<div class="sign-up-field">
					<label>密码</label>
					<span style="display:none;color: red;font-size: 10px;">#两次输入的密码不一致，请重新输入</span>
					<input id="id_password" class="form-control" type="password" name="password" placeholder="设置密码" />
					<h5 id="tip_psw"></h5>
				</div>
				
				<div class="sign-up-field">
					<label>确认密码</label>
					<input id="id_passwordConf" class="form-control" type="password" name="conf" placeholder="密码确认" />
					<h5 id="tip_pswconf"></h5>
				</div>
				
				<div class="sign-up-field">
					<label>身份证号</label>
					<span style="display: none;color: red;font-size: 10px;">#身份证号输入错误</span>
					<input id="id_idno" class="form-control" type="text" name="idNum" placeholder="身份证号/护照号" maxlength="50" />
					
					<h5 id="tip_idnumber"></h5>
				</div>

				<div class="sign-up-field">
					<label>真实姓名</label>
					<span style="display: none;color: red;font-size: 10px;">#真实姓名输入错误（存在非法字符，如英文字母、标点符号等）</span>
					<input id="id_realname" class="form-control" type="text" name="realName" placeholder="斯多克服务要求实名认证" maxlength="50" />
					<h5 id="tip_realname"></h5>
				</div>
				
				<div class="sign-up-field">
					<label>性别</label>
					<input type="radio" name="sex" value="male" checked="checked" />男
					<input type="radio" name="sex" value="female" />女
					<h5 id="tip_sex"></h5>
				</div>

				<div class="sign-up-field">
					<label>用户名</label>
					<input id="id_name" class="form-control" type="text" name="mid" placeholder="您的昵称是？" maxlength="50" />
					<h5 id="tip_username"></h5>
				</div>

				<div class="sign-up-field">
					<label>电话</label>
					<span style="display: none;color: red;font-size: 10px;">#手机号输入错误</span>
					<input id="id_phone" class="form-control" type=tel name="phone" placeholder="填入手机号有利于帐户安全"/>
					<h5 id="tip_phone"></h5>
				</div>

				<div class="sign-up-field">
					<label>公司</label>
					<input id="id_company" class="form-control" type="text" name="info" placeholder="填入公司信息帮助我们更好的认识您" />
					<h5 id="tip_company"></h5>
				</div>

				<div class="note">
					点击注册表示您同意我们的 <a href="https://istocktech.com/terms/">条款</a> and <a
						href="https://istocktech.com/privacy/">隐私协议</a>.
				</div>
				<button class="btn btn-success" type="submit">注册</button>

			</div>
			</form>
		</div>    
    </div>
</div>
<jsp:include page="_footer.jsp" />
	
<!-- <script language="javascript" charset="GBK" src="../js/signup_validate.js"></script>
<script type="text/javascript" src="front/dist/js/jquery.min.js"></script>
<script type="text/javascript" src="front/dist/js/bootstrap.min.js"></script> -->
<script type="text/javascript">
//validate
var mapForRegular={
	"email":"/^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/",
	"phone":"/^0{0,1}(13[0-9]|15[7-9]|153|156|18[7-9])[0-9]{8}$/",
	"realName":"/[\u4e00-\u9fa5]{2,}/"
}
$("input[type!='submit']").blur(function(){
	if($(this).attr("name")=="email" ||$(this).attr("name")=="phone" ||$(this).attr("name")=="realName"){
		if(!eval(mapForRegular[$(this).attr("name")]).test($(this).val())){
			$(this).siblings("span").css("display","inline");
			console.log("errr");
			this.focus();
		}else{
			$(this).siblings("span").css("display","none");
			console.log("yes");
		}
	}
});
//validate idNum(身份证号验证)
$("input[name='idNum']").blur(function(){
	console.log($(this).val());
	var num = $(this).val().toUpperCase(); 
	//身份证号码为15位或者18位，15位时全为数字，18位前17位为数字，最后一位是校验位，可能为数字或字符X。  
    if (!(/(^\d{15}$)|(^\d{17}([0-9]|X)$)/.test(num))){
    	$(this).siblings("span").text('输入的身份证号长度不对，或者号码不符合规定！15位号码应全为数字，18位号码末位可以为数字或X。')
    							.css("display","inline");
    	$(this).focus();
    }else{
    	$(this).siblings("span").css("display","none");
    }
	//校验位按照ISO 7064:1983.MOD 11-2的规定生成，X可以认为是数字10。
	//下面分别分析出生日期和校验位
	var len, re;
	len = num.length;
	if (len == 15){
		re = new RegExp(/^(\d{6})(\d{2})(\d{2})(\d{2})(\d{3})$/);
		var arrSplit = num.match(re);
		//检查生日日期是否正确
		var dtmBirth = new Date('19' + arrSplit[2] + '/' + arrSplit[3] + '/' + arrSplit[4]);
		var bGoodDay;
		bGoodDay = (dtmBirth.getYear() == Number(arrSplit[2])) && ((dtmBirth.getMonth() + 1) == Number(arrSplit[3])) && (dtmBirth.getDate() == Number(arrSplit[4]));
		if (!bGoodDay){
		    $(this).siblings("span").text('输入的身份证号里出生日期错误！')
    								.css("display","inline");
		}else{
			//将15位身份证转成18位
			//校验位按照ISO 7064:1983.MOD 11-2的规定生成，X可以认为是数字10。
			var arrInt = new Array(7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2);
            var arrCh = new Array('1', '0', 'X', '9', '8', '7', '6', '5', '4', '3', '2');
            var nTemp = 0, i;  
            num = num.substr(0, 6) + '19' + num.substr(6, num.length - 6);
		    for(i = 0; i < 17; i ++){
		    	nTemp += num.substr(i, 1) * arrInt[i];
		    }
		    num += arrCh[nTemp % 11];  
		    //return num;  
		}  
	}
	
	if (len == 18){
		re = new RegExp(/^(\d{6})(\d{4})(\d{2})(\d{2})(\d{3})([0-9]|X)$/);
		var arrSplit = num.match(re);
		//检查生日日期是否正确
		var dtmBirth = new Date(arrSplit[2] + "/" + arrSplit[3] + "/" + arrSplit[4]);
		var bGoodDay;
		bGoodDay = (dtmBirth.getFullYear() == Number(arrSplit[2])) && ((dtmBirth.getMonth() + 1) == Number(arrSplit[3])) && (dtmBirth.getDate() == Number(arrSplit[4]));
		if (!bGoodDay){
// 			alert(dtmBirth.getYear());
// 			alert(arrSplit[2]);
// 			alert('输入的身份证号里出生日期不对！');
			$(this).siblings("span").text(dtmBirth.getYear()+arrSplit[2]+'输入的身份证号里出生日期错误！')
    								.css("display","inline");
		}else{
			//检验18位身份证的校验码是否正确。
			//校验位按照ISO 7064:1983.MOD 11-2的规定生成，X可以认为是数字10。
			var valnum;
			var arrInt = new Array(7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2);
			var arrCh = new Array('1', '0', 'X', '9', '8', '7', '6', '5', '4', '3', '2');
			var nTemp = 0, i;
			for(i = 0; i < 17; i ++){
				nTemp += num.substr(i, 1) * arrInt[i];
			}
			valnum = arrCh[nTemp % 11];
			if (valnum != num.substr(17, 1)){
				//alert('18位身份证的校验码不正确！应该为：' + valnum);
				$(this).siblings("span").text('身份证号最后一位输入错误！正确值为：'+valnum)
    								.css("display","inline");
			}else{
				$(this).siblings("span").css("display","none");
			}
		}
	}
});
//validate password
$("input[name='conf']").blur(function(){
	var pwd = $("input[name='password']").val();
	if($(this).val()!=pwd){
		$("input[name='password']").siblings("span").css("display","inline");
		$(this).val("");
		$("input[name='password']").val("");
		$("input[name='password']").focus();
	}else{
		$("input[name='password']").siblings("span").css("display","none");
	}
});

</script>	
</body>
</html>