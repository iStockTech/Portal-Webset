<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<script type="text/javascript">
function visitedCount(){
	var storage = window.localStorage;
	if (!storage.getItem("pageLoadCount")) storage.setItem("pageLoadCount",0);
	storage.pageLoadCount = parseInt(storage.getItem("pageLoadCount")) + 1;//必须格式转换
	//console.log("view times:"+storage.pageLoadCount); 
	return storage.pageLoadCount;
	//return 11;
}
</script>
	<nav class="nav navbar-default" role="navigation">
	  <div class="container">
	    <div class="navbar-header">
	      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
	        <span class="sr-only">Toggle navigation</span>
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>
	      </button>
	      <a class="navbar-brand nav-logo" href="index">Stockii</a>
	    </div>
	    
	    <div class="collapse navbar-collapse" id="navbar">
	      <ul class="nav navbar-nav menu-main">
            <li class='${param.index=="index"?"active":"" }'>
			  <a href="index" onFocus="this.blur()">首页</a></li>
			<li class='${param.index=="product"?"active":"" }'>
			 	<%
					if(session.getAttribute("id") != null){
				%>
				<a href="<%=request.getContextPath()%>/user/moreSoftwarelist.action" onFocus="this.blur()">产品</a></li>
				<%			
					} else {
				%>
				<a href="<%=request.getContextPath()%>/Software_list.action" onFocus="this.blur()">产品</a></li>
					<%
					}
				%>
			 <li class='${param.index=="corpration"?"active":"" }'>
				<a href="corpration" onFocus="this.blur()">合作</a></li>
			<li class='${param.index=="news"?"active":"" }'>
				<a href="news/index" onFocus="this.blur()">资讯中心</a></li>
			 <li class='${param.index=="about"?"active":"" }'>
				<a href="about" onFocus="this.blur()">关于我们</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right menu-user">
            	<%
					if(session.getAttribute("id") != null){
				%>
<!-- 				<li class='${param.index=="account"?"active":"" }'> -->
<!-- 					<a href="<%=request.getContextPath()%>/user/userSoftwarelist.action">${session.id}</a></li> -->
<!-- 				<li class='${param.index=="signup"?"active":"" }'> -->
<!-- 					<a href="<%=request.getContextPath()%>/logout" onFocus="this.blur()">注销</a></li> -->
				<li class="dropdown">
             	  <a href="" class="dropdown-toggle" data-toggle="dropdown" role="button">${session.id} <span class="caret"></span></a>
              	  <ul class="dropdown-menu dropdown-menu-user" role="menu">
                  	<li><a href="<%=request.getContextPath()%>/user/userSoftwarelist.action"">个人中心</a></li>
                  	<li><a href="#">最新消息</a></li>
                  	<li><a href="#">个人设置</a></li>
                  	<li class="divider"></li>
                  	<li><a href="<%=request.getContextPath()%>/logout" onFocus="this.blur()">注销</a></li>
              	  </ul>
            	</li>
				<%			
					} else {
				%>
		 		<li class='${param.index=="account"?"active":"" }'>
					<a href="account" onFocus="this.blur()">登录</a></li>
				<li class='${param.index=="signup"?"active":"" }'>
					<a href="signup" onFocus="this.blur()">注册</a></li>
<!-- 				<li class='${param.index=="forum"?"active":"" }'> -->
<!-- 					<a href="forum" onFocus="this.blur()">论坛</a></li> -->
				<%
					}
				%>
				
            </ul>
	    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>
      
