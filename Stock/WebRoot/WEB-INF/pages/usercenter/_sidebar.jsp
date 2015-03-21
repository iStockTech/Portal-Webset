<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<ul class="sidebar-hierarchy">
	<li class="bar-title">
		<h3></h3>
	</li>
	<li class="sidebar-molecule ${param.index == 'userinfo' ? 'active' : ''}">
		<p class="molecule-title "><a href="usercenter/userinfo?userid=12312312">会员中心首页</a></p>
	</li>
	<hr>
	<li class="sidebar-molecule">
		<p class="molecule-title">产品管理<span class="icon-up3"></span></p>
		<ul class="sidebar-molecule-content">
			<li class="sidebar-atom ${param.index == 'mysoftware' ? 'active' : ''}"><a href="welcome">我的软件</a></li>
			<li class="sidebar-atom ${param.index == 'newestsoftware' ? 'active' : ''}"><a href="usercenter/userinfo">最新软件</a></li>
			<li class="sidebar-atom"><a href="usercenter/userinfo?userid=12312312">重新授权</a></li>
		</ul>
	</li>
	<hr>
	<li class="sidebar-molecule">
		<p class="molecule-title">策略管理<span class="icon-up3"></span></p>
		<ul class="sidebar-molecule-content">
			<li class="sidebar-atom"><a href="usercenter/userinfo?userid=12312312">我的策略</a></li>
			<li class="sidebar-atom"><a href="usercenter/userinfo?userid=12312312">最新策略</a></li>
			<li class="sidebar-atom"><a href="usercenter/userinfo?userid=12312312">定制策略</a></li>
		</ul>
	</li>
	<hr>
	<li class="sidebar-molecule">
		<p class="molecule-title">订单管理<span class="icon-up3"></span></p>
		<ul class="sidebar-molecule-content">
			<li class="sidebar-atom"><a href="usercenter/userinfo?userid=12312312">已付款订单</a></li>
			<li class="sidebar-atom"><a href="usercenter/userinfo?userid=12312312">未付款订单</a></li>
			<li class="sidebar-atom"><a href="usercenter/userinfo?userid=12312312">自动购买</a></li>
		</ul>
	</li>
</ul>
