<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<title>斯多克 -- 资讯中心</title>  
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">    
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css" href="front/dist/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="front/dist/css/base.css">
<link rel="stylesheet" type="text/css" href="front/dist/css/common.css">
<link rel="stylesheet" type="text/css" href="front/dist/css/page.css">

<style type="text/css">
div{
	/* border: 1px solid green; */
	/* min-height: 100px; */
}
</style>
</head>
  
<body>
<jsp:include page="../_header.jsp?index=news"></jsp:include>
<div id="wrapmain" class="news">
	<div class="container text-center">
		<!-- hot news -->
		<div class="row text-left hotnews" data-type="type1">
<!-- 			<div class="col-lg-4 col-md-4 col-sm-4 col-xs-4"><img alt="HotNews" src="upload/a.jpg"><p class="profile"><a href="javascript:viod(0);"></a></p></div> -->
<!-- 			<div class="col-lg-4 col-md-4 col-sm-4 col-xs-4"><img alt="HotNews" src="upload/a.jpg"><p class="profile"><a href="javascript:viod(0);"></a></p></div> -->
<!-- 			<div class="col-lg-4 col-md-4 col-sm-4 col-xs-4"><img alt="HotNews" src="upload/a.jpg"><p class="profile"><a href="javascript:viod(0);"></a></p></div> -->
		</div><!-- end hot news -->
		
		<div class="row">
			<!-- index main (left) -->
			<div class="col-lg-8 col-md-8 col-sm-8 col-xs-8 js-index-main">
				<!-- part one (沪深) -->
				<div class="row classify">
					<div class="col-lg-12 sector left" data-type="type5">
						<div class="caption text-left"><span class="title">沪<span style="font-weight: bold;">·</span>深</span><span class="more"><a href="javascript:viod(0);" data-more="classify">更多&#10174;</a></span></div>
						<div class="row img-new text-left">
							<div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
								<img alt="news" src="upload/a.jpg" >
							</div>
							<div class="col-lg-8 col-md-8 col-sm-8 col-xs-8">
								<p class="title"><a href="javascript:void(0);" data-id="1">人民币周五收跌，创6个月新低</a></p>
								<p class="content">中国人民币兑美元周五收低于6.22元附近，创近半年低点，与中间价贬值方向一致。盘间一度触及6.2316元低点。市场人士认为，当前已接近今年低点，年内续贬空间不多。</p>
							</div>
						</div>
						<div class="row">
							<div class="col-lg-4 col-md-4 col-sm-4 col-xs-4 succinct-new">
								<a href="javascript:void(0);" data-id="3"><img alt="" src="upload/a.jpg"></a>
								<p class="title text-left"><a href="javascript:void(0);">郭靖：后继乏力，降龙十八掌该何去何从？</a></p>
								<p class="content text-left">
									近几个月的中原武林“风雨飘摇”大概是最好的词汇了，转瞬之间就被腰斩。
								</p>
							</div>
							
<!-- 								<div class="col-lg-4 col-md-4 col-sm-4 col-xs-4"> -->
<!-- 										<a href="javascript:void(0);" data-id="3"><img alt="" src="upload/a.jpg"></a> -->
<!-- 									<p class="title text-left"><a href="javascript:void(0);">郭靖：后继乏力，降龙十八掌该何去何从？</a></p> -->
<!-- 									<p class="content text-left"> -->
<!-- 										近几个月的中原武林“风雨飘摇”大概是最好的词汇了，转瞬之间就被腰斩。 -->
<!-- 									</p> -->
<!-- 								</div> -->
							
<!-- 								<div class="col-lg-4 col-md-4 col-sm-4 col-xs-4"> -->
<!-- 										<a href="javascript:void(0);" data-id="3"><img alt="" src="upload/a.jpg"></a> -->
<!-- 									<p class="title text-left"><a href="javascript:void(0);">郭靖：后继乏力，降龙十八掌该何去何从？</a></p> -->
<!-- 									<p class="content text-left"> -->
<!-- 										近几个月的中原武林“风雨飘摇”大概是最好的词汇了，转瞬之间就被腰斩。 -->
<!-- 									</p> -->
<!-- 								</div> -->
						</div>
							
						<!-- 推荐阅读 -->
<!-- 						<div class=""> -->
							<div class="row recommend-reading">
								<div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
									<img alt="recommend reading" src="upload/a.jpg">
									<div class="layer">推荐阅读</div>
								</div>
								<div class="col-lg-4 col-md-4 col-sm-4 col-xs-4 text-left">
									<ul class="lsit-unstyle list">
										<li><a href="javascript:void(0);">降龙十八掌该何去何从</a></li>
										<li><a href="javascript:void(0);">武林大会</a></li>
										<li><a href="javascript:void(0);">武林大会降龙十八掌该何去何从</a></li>
										<li><a href="javascript:void(0);">武林大会降龙十八掌该何去何从</a></li>
									</ul>
								</div> 
								<div class="col-lg-4 col-md-4 col-sm-4 col-xs-4 text-left">
									<ul class="lsit-unstyle list">
										<li><a href="javascript:void(0);">降龙十八掌该何去何从</a></li>
										<li><a href="javascript:void(0);">武林大会</a></li>
										<li><a href="javascript:void(0);">武林大会降龙十八掌该何去何从</a></li>
										<li><a href="javascript:void(0);">武林大会降龙十八掌该何去何从</a></li>
									</ul>
								</div>
							</div>
<!-- 						</div> -->
						<!-- end 推荐阅读 -->
						<button><span class="more"><a href="javascript:viod(0);" data-more="classify">更多股票市场资讯</a></span></button>
					</div>
				</div>
				<!-- end part one (沪深) -->
				
<!-- 				<div class="row advertise"> -->
<!-- 					<img alt="广告/公司活动推广宣传" src="upload/k.jpg"> -->
<!-- 				</div>  -->
				
				<!-- part two 美股·港股) -->
				<div class="row classify">
					<div class="col-lg-12 sector left" data-type="type5">
						<div class="caption text-left"><span class="title">美股<span style="font-weight: bold;">·</span>港股</span><span class="more"><a href="javascript:viod(0);" data-more="classify">更多&#10174;</a></span></div>
						<div class="img-new text-left">
							<div class="row">
								<div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
									<img alt="news" src="upload/a.jpg" >
								</div>
								<div class="col-lg-8 col-md-8 col-sm-8 col-xs-8">
									<p class="title"><a href="javascript:void(0);" data-id="1">人民币周五收跌，创6个月新低</a></p>
									<p class="content">中国人民币兑美元周五收低于6.22元附近，创近半年低点，与中间价贬值方向一致。盘间一度触及6.2316元低点。市场人士认为，当前已接近今年低点，年内续贬空间不多。</p>
								</div>
							</div>
						</div>
						<div class="succinct-new">
							<div class="row">
								<div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
									<div class="layer" >
										<a href="javascript:void(0);" data-id="3"><img alt="" src="upload/a.jpg"></a>
									</div>
									<div class="title text-left">郭靖：后继乏力，降龙十八掌该何去何从？</div>
									<div class="content text-left">
										近几个月的中原武林“风雨飘摇”大概是最好的词汇了，转瞬之间就被腰斩。
									</div>
								</div>
								
								<div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
									<div class="layer" >
										<a href="javascript:void(0);" data-id="4"><img alt="" src="upload/a.jpg"></a>
									</div>
									<div class="title text-left">郭靖：后继乏力，降龙十八掌该何去何从？</div>
									<div class="content text-left">
										近几个月的中原武林“风雨飘摇”大概是最好的词汇了，转瞬之间就被腰斩。
									</div>
								</div>
								
								<div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
									<div class="layer" >
										<a href="javascript:void(0);" data-id="5"><img alt="" src="upload/a.jpg"></a>
									</div>
									<div class="title text-left">郭靖：后继乏力，降龙十八掌该何去何从？</div>
									<div class="content text-left">
										近几个月的中原武林“风雨飘摇”大概是最好的词汇了，转瞬之间就被腰斩。
									</div>
								</div>
							</div>
						</div>
						
						
						<!-- 推荐阅读 -->
						<div class="recommend-reading">
							<div class="row">
								<div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
									<img alt="recommend reading" src="upload/a.jpg">
									<div class="layer">推荐阅读</div>
								</div>
								<div class="col-lg-4 col-md-4 col-sm-4 col-xs-4 text-left">
									<ul class="lsit-unstyle list">
										<li><a href="javascript:void(0);">降龙十八掌该何去何从</a></li>
										<li><a href="javascript:void(0);">武林大会</a></li>
										<li><a href="javascript:void(0);">武林大会降龙十八掌该何去何从</a></li>
										<li><a href="javascript:void(0);">武林大会降龙十八掌该何去何从</a></li>
									</ul>
								</div> 
								<div class="col-lg-4 col-md-4 col-sm-4 col-xs-4 text-left">
									<ul class="lsit-unstyle list">
										<li><a href="javascript:void(0);">降龙十八掌该何去何从</a></li>
										<li><a href="javascript:void(0);">武林大会</a></li>
										<li><a href="javascript:void(0);">武林大会降龙十八掌该何去何从</a></li>
										<li><a href="javascript:void(0);">武林大会降龙十八掌该何去何从</a></li>
									</ul>
								</div>
							</div>
						</div>
						<!-- end 推荐阅读 -->
						
						<button><span class="more"><a href="javascript:viod(0);" data-more="classify">更多股票市场资讯</a></span></button>
					</div>
				</div>
				<!-- end part two 美股·港股) -->
				
				<!-- part three (基金) -->
				<div class="row classify">
					<div class="col-lg-12 sector left" data-type="type5">
						<div class="caption text-left"><span class="title">基金</span><span class="more"><a href="javascript:viod(0);" data-more="classify">更多&#10174;</a></span></div>
						<div class="img-new text-left">
							<div class="row">
								<div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
									<img alt="news" src="upload/a.jpg" >
								</div>
								<div class="col-lg-8 col-md-8 col-sm-8 col-xs-8">
									<p class="title"><a href="javascript:void(0);" data-id="1">人民币周五收跌，创6个月新低</a></p>
									<p class="content">中国人民币兑美元周五收低于6.22元附近，创近半年低点，与中间价贬值方向一致。盘间一度触及6.2316元低点。市场人士认为，当前已接近今年低点，年内续贬空间不多。</p>
								</div>
							</div>
						</div>
						<div class="succinct-new">
							<div class="row">
								<div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
									<div class="layer" >
										<a href="javascript:void(0);" data-id="3"><img alt="" src="upload/a.jpg"></a>
									</div>
									<div class="title text-left">郭靖：后继乏力，降龙十八掌该何去何从？</div>
									<div class="content text-left">
										近几个月的中原武林“风雨飘摇”大概是最好的词汇了，转瞬之间就被腰斩。
									</div>
								</div>
								
								<div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
									<div class="layer" >
										<a href="javascript:void(0);" data-id="4"><img alt="" src="upload/a.jpg"></a>
									</div>
									<div class="title text-left">郭靖：后继乏力，降龙十八掌该何去何从？</div>
									<div class="content text-left">
										近几个月的中原武林“风雨飘摇”大概是最好的词汇了，转瞬之间就被腰斩。
									</div>
								</div>
								
								<div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
									<div class="layer" >
										<a href="javascript:void(0);" data-id="5"><img alt="" src="upload/a.jpg"></a>
									</div>
									<div class="title text-left">郭靖：后继乏力，降龙十八掌该何去何从？</div>
									<div class="content text-left">
										近几个月的中原武林“风雨飘摇”大概是最好的词汇了，转瞬之间就被腰斩。
									</div>
								</div>
							</div>
						</div>
						
						
						<!-- 推荐阅读 -->
						<div class="recommend-reading">
							<div class="row">
								<div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
									<img alt="recommend reading" src="upload/a.jpg">
									<div class="layer">推荐阅读</div>
								</div>
								<div class="col-lg-4 col-md-4 col-sm-4 col-xs-4 text-left">
									<ul class="lsit-unstyle list">
										<li><a href="javascript:void(0);">降龙十八掌该何去何从</a></li>
										<li><a href="javascript:void(0);">武林大会</a></li>
										<li><a href="javascript:void(0);">武林大会降龙十八掌该何去何从</a></li>
										<li><a href="javascript:void(0);">武林大会降龙十八掌该何去何从</a></li>
									</ul>
								</div> 
								<div class="col-lg-4 col-md-4 col-sm-4 col-xs-4 text-left">
									<ul class="lsit-unstyle list">
										<li><a href="javascript:void(0);">降龙十八掌该何去何从</a></li>
										<li><a href="javascript:void(0);">武林大会</a></li>
										<li><a href="javascript:void(0);">武林大会降龙十八掌该何去何从</a></li>
										<li><a href="javascript:void(0);">武林大会降龙十八掌该何去何从</a></li>
									</ul>
								</div>
							</div>
						</div>
						<!-- end 推荐阅读 -->
						
						<button><span class="more"><a href="javascript:viod(0);" data-more="classify">更多股票市场资讯</a></span></button>
					</div>
				</div><!-- end part three (基金) -->
			</div><!-- end index main(left) -->
			
			<!-- append info (right) -->
			<div class="col-lg-4 col-md-4 col-sm-4 col-xs-4 js-index-append">
				<!-- 上证指数 -->
				<div class="row stock-index right">
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-left">
						<span class="index-item">上证指数</span><span class="line"></span>
						<ul class="list-unstyle mgb10">
							<li><p><span class="index-name" title="道琼斯指数">上证指数</span><span class="index-number">3108.596  51.075  1.67%</span></p></li>
							<!-- <li><span class="index-name" title="纳斯达克指数">深证指数</span><span class="index-number"></span></li>
							 <li><span class="index-name" title="标准普尔500">沪深300</span><span class="index-number">2070.65 -9.42 -0.46%</span></li>
							-->
						</ul>
						<!-- <p class="line"></p> -->
						<span class="index-item">深证指数</span><span class="line"></span>
						<ul class="list-unstyle mgb10">
							<li><span class="index-name" title="恒生指数">深证指数</span><span class="index-number">3108.596  51.075  1.67%</span></li>
							<li><span class="index-name" title="国企指数">沪深300</span><span class="index-number">3108.596  51.075  1.67%</span></li>
							<li><span class="index-name" title="标普创业指数">创业板指数</span><span class="index-number">3108.596  51.075  1.67%</span></li>
						</ul>
						<span class="hot-stock">涨跌排行</span><span class="line"></span>
						<ul id="myTab" class="nav nav-tabs">
						   <li class="active">
						      <a href="#up" data-toggle="tab">涨幅前十</a>
						   </li>
						   <li><a href="#down" data-toggle="tab">跌幅前十</a></li>							
						</ul>
						<div class="rank">
							<ul class="list-unstyle mgb10 up" style="display: none;">
								<li><span class="serial first">1</span><span class="stock-name">阿里巴巴</span><span class="stock-number">115.70 -3.80 3.40%</span></li>
								<li><span class="serial second">2</span><span class="stock-name">奇虎360</span><span class="stock-number"></span></li>
								<li><span class="serial third">3</span><span class="stock-name">苹果</span><span class="stock-number"></span></li>
								<li><span class="serial">4</span><span class="stock-name">苹果</span><span class="stock-number"></span></li>
								<li><span class="serial">5</span><span class="stock-name">苹果</span><span class="stock-number"></span></li>
								<li><span class="serial">6</span><span class="stock-name">苹果</span><span class="stock-number"></span></li>
								<li><span class="serial">7</span><span class="stock-name">苹果</span><span class="stock-number"></span></li>
								<li><span class="serial">8</span><span class="stock-name">苹果</span><span class="stock-number"></span></li>
								<li><span class="serial">9</span><span class="stock-name">苹果</span><span class="stock-number"></span></li>
								<li><span class="serial">10</span><span class="stock-name">苹果</span><span class="stock-number"></span></li>
							</ul>
							<ul class="list-unstyle mgb10 down" >
								<li><span class="serial first">1</span><span class="stock-name">阿里巴巴</span><span class="stock-number">115.70 -3.80 3.40%</span></li>
								<li><span class="serial second">2</span><span class="stock-name">奇虎360</span><span class="stock-number"></span></li>
								<li><span class="serial third">3</span><span class="stock-name">苹果</span><span class="stock-number"></span></li>
								<li><span class="serial">4</span><span class="stock-name">苹果</span><span class="stock-number"></span></li>
								<li><span class="serial">5</span><span class="stock-name">苹果</span><span class="stock-number"></span></li>
								<li><span class="serial">6</span><span class="stock-name">苹果</span><span class="stock-number"></span></li>
								<li><span class="serial">7</span><span class="stock-name">苹果</span><span class="stock-number"></span></li>
								<li><span class="serial">8</span><span class="stock-name">苹果</span><span class="stock-number"></span></li>
								<li><span class="serial">9</span><span class="stock-name">苹果</span><span class="stock-number"></span></li>
								<li><span class="serial">10</span><span class="stock-name">苹果</span><span class="stock-number"></span></li>
							</ul>
						</div>
						
					</div>
				</div><!-- end 上证指数 -->
				
				<!-- 美股·港股 指数 -->
				<div class="row stock-index right">
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-left">
						<span class="index-item">美股指数</span><span class="line"></span>
						<ul class="list-unstyle mgb10">
							<li><p><span class="index-name" title="道琼斯指数">道琼斯指数</span><span class="index-number">3108.596  51.075  1.67%</span></p></li>
							<li><span class="index-name" title="纳斯达克指数">纳斯达克指数</span><span class="index-number"></span></li>
							<li><span class="index-name" title="标准普尔500">标准普尔500</span><span class="index-number">2070.65 -9.42 -0.46%</span></li>
						</ul>
						<!-- <p class="line"></p> -->
						<span class="index-item">港股指数</span><span class="line"></span>
						<ul class="list-unstyle mgb10">
							<li><span class="index-name" title="恒生指数">恒生指数</span><span class="index-number">墨镜安排</span></li>
<!-- 							<li><span class="index-name" title="国企指数">国企指数</span><span class="index-number"></span></li> -->
<!-- 							<li><span class="index-name" title="标普创业指数">标普创业指数</span><span class="index-number"></span></li> -->
						</ul>
						<span class="hot-stock">涨跌排行</span><span class="line"></span>
						<ul id="myTab" class="nav nav-tabs">
						   <li class="active">
						      <a href="#up" data-toggle="tab">涨幅前十</a>
						   </li>
						   <li><a href="#down" data-toggle="tab">跌幅前十</a></li>							
						</ul>
						<div class="rank">
							<ul class="list-unstyle mgb10 up" style="display: none;">
								<li><span class="serial first">1</span><span class="stock-name">阿里巴巴</span><span class="stock-number">115.70 -3.80 3.40%</span></li>
								<li><span class="serial second">2</span><span class="stock-name">奇虎360</span><span class="stock-number"></span></li>
								<li><span class="serial third">3</span><span class="stock-name">苹果</span><span class="stock-number"></span></li>
								<li><span class="serial">4</span><span class="stock-name">苹果</span><span class="stock-number"></span></li>
								<li><span class="serial">5</span><span class="stock-name">苹果</span><span class="stock-number"></span></li>
								<li><span class="serial">6</span><span class="stock-name">苹果</span><span class="stock-number"></span></li>
								<li><span class="serial">7</span><span class="stock-name">苹果</span><span class="stock-number"></span></li>
								<li><span class="serial">8</span><span class="stock-name">苹果</span><span class="stock-number"></span></li>
								<li><span class="serial">9</span><span class="stock-name">苹果</span><span class="stock-number"></span></li>
								<li><span class="serial">10</span><span class="stock-name">苹果</span><span class="stock-number"></span></li>
							</ul>
							<ul class="list-unstyle mgb10 down" >
								<li><span class="serial first">1</span><span class="stock-name">阿里巴巴</span><span class="stock-number">115.70 -3.80 3.40%</span></li>
								<li><span class="serial second">2</span><span class="stock-name">奇虎360</span><span class="stock-number"></span></li>
								<li><span class="serial third">3</span><span class="stock-name">苹果</span><span class="stock-number"></span></li>
								<li><span class="serial">4</span><span class="stock-name">苹果</span><span class="stock-number"></span></li>
								<li><span class="serial">5</span><span class="stock-name">苹果</span><span class="stock-number"></span></li>
								<li><span class="serial">6</span><span class="stock-name">苹果</span><span class="stock-number"></span></li>
								<li><span class="serial">7</span><span class="stock-name">苹果</span><span class="stock-number"></span></li>
								<li><span class="serial">8</span><span class="stock-name">苹果</span><span class="stock-number"></span></li>
								<li><span class="serial">9</span><span class="stock-name">苹果</span><span class="stock-number"></span></li>
								<li><span class="serial">10</span><span class="stock-name">苹果</span><span class="stock-number"></span></li>
							</ul>
						</div>
					</div>
				</div><!-- end 美股·港股 指数 -->
				
				<!-- 基金 指数 -->
				<div class="row stock-index right">
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-left">
						<span class="index-item">基金指数</span><span class="line"></span>
						<ul class="list-unstyle mgb10">
							<li><p><span class="index-name" title="道琼斯指数">深市基金指数</span><span class="index-number">3108.596  51.075  1.67%</span></p></li>
							<li><span class="index-name" title="纳斯达克指数">上证基金指数</span><span class="index-number"></span></li>
						</ul>
						<!-- <p class="line"></p> -->
						<!-- <span class="index-item">港股指数</span><span class="line"></span>
						<ul class="list-unstyle mgb10">
							<li><span class="index-name" title="恒生指数">恒生指数</span><span class="index-number">墨镜安排</span></li>
							<li><span class="index-name" title="国企指数">国企指数</span><span class="index-number"></span></li>
							<li><span class="index-name" title="标普创业指数">标普创业指数</span><span class="index-number"></span></li>
						</ul> -->
						<span class="hot-stock mgt20">涨跌排行</span><span class="line"></span>
						<ul id="myTab" class="nav nav-tabs">
						   <li class="active">
						      <a href="#up" data-toggle="tab">涨幅前十</a>
						   </li>
						   <li><a href="#down" data-toggle="tab">跌幅前十</a></li>							
						</ul>
						<div class="rank">
							<ul class="list-unstyle mgb10 up" style="display: none;">
								<li><span class="serial first">1</span><span class="stock-name">阿里巴巴</span><span class="stock-number">115.70 -3.80 3.40%</span></li>
								<li><span class="serial second">2</span><span class="stock-name">奇虎360</span><span class="stock-number"></span></li>
								<li><span class="serial third">3</span><span class="stock-name">苹果</span><span class="stock-number"></span></li>
								<li><span class="serial">4</span><span class="stock-name">苹果</span><span class="stock-number"></span></li>
								<li><span class="serial">5</span><span class="stock-name">苹果</span><span class="stock-number"></span></li>
								<li><span class="serial">6</span><span class="stock-name">苹果</span><span class="stock-number"></span></li>
								<li><span class="serial">7</span><span class="stock-name">苹果</span><span class="stock-number"></span></li>
								<li><span class="serial">8</span><span class="stock-name">苹果</span><span class="stock-number"></span></li>
								<li><span class="serial">9</span><span class="stock-name">苹果</span><span class="stock-number"></span></li>
								<li><span class="serial">10</span><span class="stock-name">苹果</span><span class="stock-number"></span></li>
							</ul>
							<ul class="list-unstyle mgb10 down" >
								<li><span class="serial first">1</span><span class="stock-name">阿里巴巴</span><span class="stock-number">115.70 -3.80 3.40%</span></li>
								<li><span class="serial second">2</span><span class="stock-name">奇虎360</span><span class="stock-number"></span></li>
								<li><span class="serial third">3</span><span class="stock-name">苹果</span><span class="stock-number"></span></li>
								<li><span class="serial">4</span><span class="stock-name">苹果</span><span class="stock-number"></span></li>
								<li><span class="serial">5</span><span class="stock-name">苹果</span><span class="stock-number"></span></li>
								<li><span class="serial">6</span><span class="stock-name">苹果</span><span class="stock-number"></span></li>
								<li><span class="serial">7</span><span class="stock-name">苹果</span><span class="stock-number"></span></li>
								<li><span class="serial">8</span><span class="stock-name">苹果</span><span class="stock-number"></span></li>
								<li><span class="serial">9</span><span class="stock-name">苹果</span><span class="stock-number"></span></li>
								<li><span class="serial">10</span><span class="stock-name">苹果</span><span class="stock-number"></span></li>
							</ul>
						</div>
					</div>
				</div><!-- end 基金 指数 -->
			</div><!-- end append info (right) -->
			
		</div>
	</div>
	
</div><!-- end wrap -->
<jsp:include page="../_footer.jsp"></jsp:include>
<script type="text/javascript" language="javascript" src="js/common.js"></script>
<script type="text/javascript" language="javascript" src="js/System.stockii.news.js"></script>

<script type="text/javascript">
newsHandler.getNewsList.getForHot("data/hotnews.txt", "hotnews");
newsHandler.getNewsList.getForIndexMain("data/indexMain.txt", "indexMain");
</script>
</body>
</html>
