<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<title>行情中心</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">    
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css" href="front/dist/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="front/jquery-ui-1.11.2/jquery-ui.css">
<link rel="stylesheet" type="text/css" href="front/dist/css/base.css">
<link rel="stylesheet" type="text/css" href="front/dist/css/common.css">
<link rel="stylesheet" type="text/css" href="front/dist/css/page.css">

<script src="http://js.jrj.com.cn/hq/co/swfobject.js" type="text/javascript"></script>
<script src="http://js.jrj.com.cn/hq/co/flash4code.js" type="text/javascript"></script>
<!--
<script src="js/flash4code.js" type="text/javascript"></script>
-->
<!-- JS files for print KLine -->
<script type="text/javascript" src="h5StockLibs/loading.js"></script>
<script type="text/javascript" src="h5StockLibs/util.js"></script>
<script type="text/javascript" src="h5StockLibs/absPainter.js"></script>
<script type="text/javascript" src="h5StockLibs/ajax.js"></script>
<script type="text/javascript" src="h5StockLibs/crossLines.js"></script>
<script type="text/javascript" src="h5StockLibs/axis-x.js"></script>
<script type="text/javascript" src="h5StockLibs/tip.js"></script>
<script type="text/javascript" src="h5StockLibs/linepainter.js"></script>
<script type="text/javascript" src="h5StockLibs/volumePainter.js"></script>
<script type="text/javascript" src="h5StockLibs/axis-y.js"></script>
<script type="text/javascript" src="h5StockLibs/chartEventHelper.js?abc"></script>
<script type="text/javascript" src="h5StockLibs/controller.js"></script>

<script type="text/javascript" src="h5StockLibs/print_KL.js"></script>

</head>
  
<body>
<jsp:include page="../_header.jsp?param=news"></jsp:include>

<div id="wrapmain">

<div class="container mgt20 mgb20">
	<div class="row">
		<div class="col-lg-1 col-md-2 col-sm-2 col-xs-2">
			<div class="companyinfo">
				<ul class="list-unstyle infolist">
				
					<li>
						<span class="title">公司概况</span>
						<ul class="list-unstyle">
							<li><a href="hq/S">公司简介</a></li>
							<li><a href="hq/S">公司高管</a></li>
							<li><a href="hq/S">IPO文件</a></li>
						</ul>
					</li>
					
					<li>
						<span class="title">股权信息</span>
						<ul class="list-unstyle">
							<li><a href="hq/S">股本结构</a></li>
							<li><a href="hq/S">主要股东</a></li>
							<li><a href="hq/S">流通股东</a></li>
							<li><a href="hq/S">基金持股</a></li>
							<li><a href="hq/S">高管持股</a></li>
							<li><a href="hq/S">股东户数</a></li>
							<li><a href="hq/S">限售股东</a></li>
						</ul>
					</li>
					
					<li>
						<span class="title">股票交易</span>
						<ul class="list-unstyle">
							<li><a href="hq/S">成分明细</a></li>
							<li><a href="hq/S">分价表</a></li>
							<li><a href="hq/S">大单统计</a></li>
							<li><a href="hq/S">大宗交易</a></li>
							<li><a href="hq/S">龙虎榜数据</a></li>
							<li><a href="hq/S">融资融券</a></li>
							<li><a href="hq/S">历史行情</a></li>
						</ul>
					</li>
					
					<li>
						<span class="title">公司公告</span>
						<ul class="list-unstyle">
							<li><a href="hq/S">最新公告</a></li>
							<li><a href="hq/S">年度报告</a></li>
						</ul>
					</li>
					
					<li>
						<span class="title">公司运作</span>
						<ul class="list-unstyle">
							<li><a href="hq/S">股东大会</a></li>
							<li><a href="hq/S">收入构成</a></li>
							<li><a href="hq/S">重大事项</a></li>
							<li><a href="hq/S">分红配送</a></li>
							<li><a href="hq/S">增发一览</a></li>
							<li><a href="hq/S">内部交易</a></li>
							<li><a href="hq/S">IR活动记录</a></li>
						</ul>
					</li>
					
					<li>
						<span class="title">财务数据</span>
						<ul class="list-unstyle">
							<li><a href="hq/S">业绩报告</a></li>
							<li><a href="hq/S">主要财务指标</a></li>
							<li><a href="hq/S">当日财务指标</a></li>
							<li><a href="hq/S">单季财务指标</a></li>
							<li><a href="hq/S">综合损益表</a></li>
							<li><a href="hq/S">资产负债表</a></li>
							<li><a href="hq/S">现金流量表</a></li>
							<li><a href="hq/S">股票收益指标</a></li>
							<li><a href="hq/S">所有者权益变动</a></li>
						</ul>
					</li>
					
				</ul>
			</div>
		</div>
		
		<div class="col-lg-10 col-md-10 col-sm-10 col-xs-10">
			<div class="stockinfo">
				<span class="stockname">陕西煤业(SH:601225)</span>
				<span class="stockprice">￥7.32</span>
				<div class="total">
					<ul class="list-inline">
						<li>
							<ul class="list-unstyle">
								<li><span class="indexname">今开：</span><span class="indexnum">6.65</span></li>
								<li><span class="indexname">昨收：</span><span class="indexnum">6.65</span></li>
								<li><span class="indexname">涨停价：</span><span class="indexnum">7.32</span></li>
								<li><span class="indexname">跌停价：</span><span class="indexnum">5.99</span></li>
								<li><span class="indexname">30日均量：</span><span class="indexnum">6064.762万</span></li>
							</ul>
						</li>
						
						<li>
							<ul class="list-unstyle">
								<li><span class="indexname">最高：</span><span class="indexnum">7.32</span></li>
								<li><span class="indexname">最低：</span><span class="indexnum">6.62</span></li>
								<li><span class="indexname">总市值：</span><span class="indexnum">7320.00亿</span></li>
								<li><span class="indexname">总股本：</span><span class="indexnum">100.00亿</span></li>
								<li><span class="indexname">流通股本：</span><span class="indexnum">5.00亿</span></li>
							</ul>
						</li>
						
						<li>
							<ul class="list-unstyle">
								<li><span class="indexname">52周最高：</span><span class="indexnum">7.96</span></li>
								<li><span class="indexname">52周最低：</span><span class="indexnum">4.01</span></li>
								<li><span class="indexname">每股收益：</span><span class="indexnum">0.09</span></li>
								<li><span class="indexname">每股净资产：</span><span class="indexnum">3.51</span></li>
								<li><span class="indexname">股息率：</span><span class="indexnum">--</span></li>
							</ul>
						</li>
						
						<li>
							<ul class="list-unstyle">
								<li><span class="indexname">成交量：</span><span class="indexnum">8607.16万</span></li>
								<li><span class="indexname">成交额：</span><span class="indexnum">6.15亿</span></li>
								<li><span class="indexname">市场盈利率LYR/TTM：</span><span class="indexnum">11.67/60.07</span></li>
								<li><span class="indexname">市净率TTM：</span><span class="indexnum">2.08</span></li>
								<li><span class="indexname">市销率TTM：</span><span class="indexnum">1.46</span></li>
							</ul>
						</li>
						
					</ul>
				</div>
			</div><!-- end stock info -->
			
			<div class="tendencyChart mgt20">
				<jsp:include page="_kline.jsp"></jsp:include>
			</div>
			
		</div>
	</div>
</div>


</div>

<jsp:include page="../_footer.jsp"></jsp:include>
</body>
</html>
