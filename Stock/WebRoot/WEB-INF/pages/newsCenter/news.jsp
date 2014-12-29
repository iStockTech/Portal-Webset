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
<div id="wrapmain" class="newscenter">
	<div class="container text-center">
		<!-- hot news -->
		<div class="row text-left" >
			<div class=" newsblock hotnews" data-type="type1">
				
			</div>
<!-- 			<div class="col-lg-4 col-md-4 col-sm-4 col-xs-4"><img alt="HotNews" src="upload/a.jpg"><p class="profile"><a href="javascript:viod(0);"></a></p></div> -->
<!-- 			<div class="col-lg-4 col-md-4 col-sm-4 col-xs-4"><img alt="HotNews" src="upload/a.jpg"><p class="profile"><a href="javascript:viod(0);"></a></p></div> -->
<!-- 			<div class="col-lg-4 col-md-4 col-sm-4 col-xs-4"><img alt="HotNews" src="upload/a.jpg"><p class="profile"><a href="javascript:viod(0);"></a></p></div> -->
		</div><!-- end hot news -->
		
		<div class="row">
			<!-- index main (left) -->
			<div class="col-lg-8 col-md-8 col-sm-8 col-xs-8 js-news-main">
				<!-- part one (沪深) -->
<!-- 				<div class="row"> -->
<!-- 					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 bgc-f8 mgt20 border-news" data-type="type5"> -->
<!-- 						<div class="newsblock sectorname"> -->
<!-- 							<span class="title">沪<span class="dot">·</span>深</span> -->
<!-- 						</div> -->
<!-- 						<div class="newsblock illustrate single"> -->
<!-- 							<img alt="illustrated photo" class="image" src="upload/a.jpg"> -->
<!-- 							<div class="content"> -->
<!-- 								<p class="title"><a href="javascript:void(0);" data-id="1">人民币周五收跌，创6个月新低</a></p> -->
<!-- 								<p class="summary">中国人民币兑美元周五收低于6.22元附近，创近半年低点，与中间价贬值方向一致。盘间一度触及6.2316元低点。市场人士认为，当前已接近今年低点，年内续贬空间不多。</p> -->
<!-- 							</div> -->
<!-- 						</div> -->
						
<!-- 						<div class="newsblock illustrate set"> -->
<!-- 							<div class="slice"> -->
<!-- 								<img alt="slice news" src="upload/a.jpg"> -->
<!-- 								<p class="title"><a href="javascript:void(0);">郭靖：后继乏力，降龙十八掌该何去何从？</a></p> -->
<!-- 								<p class="summary">近几个月的中原武林“风雨飘摇”大概是最好的词汇了，转瞬之间就被腰斩。</p> -->
<!-- 							</div> -->
<!-- 							<div class="slice"> -->
<!-- 								<img alt="slice news" src="upload/a.jpg"> -->
<!-- 								<p class="title"><a href="javascript:void(0);">郭靖：后继乏力，降龙十八掌该何去何从？</a></p> -->
<!-- 								<p class="summary">近几个月的中原武林“风雨飘摇”大概是最好的词汇了，转瞬之间就被腰斩。</p> -->
<!-- 							</div> -->
<!-- 							<div class="slice"> -->
<!-- 								<img alt="slice news" src="upload/a.jpg"> -->
<!-- 								<p class="title"><a href="javascript:void(0);">郭靖：后继乏力，降龙十八掌该何去何从？</a></p> -->
<!-- 								<p class="summary">近几个月的中原武林“风雨飘摇”大概是最好的词汇了，转瞬之间就被腰斩。</p> -->
<!-- 							</div> -->
<!-- 						</div> -->
						
<!-- 						<div class="newsblock succicent"> -->
<!-- 							<div class="card slice"> -->
<!-- 								<img alt="card recommend" src="upload/a.jpg"> -->
<!-- 								<p class="text">推荐阅读</p> -->
<!-- 							</div> -->
							
<!-- 							<ul class="lsit-unstyle list slice"> -->
<!-- 								<li><a href="javascript:void(0);">降龙十八掌该何去何从</a></li> -->
<!-- 								<li><a href="javascript:void(0);">武林大会</a></li> -->
<!-- 								<li><a href="javascript:void(0);">武林大会降龙十八掌该何去何从</a></li> -->
<!-- 								<li><a href="javascript:void(0);">武林大会降龙十八掌该何去何从</a></li> -->
<!-- 								<li><a href="javascript:void(0);">武林大会降龙十八掌该何去何从</a></li> -->
<!-- 							</ul> -->
							
<!-- 							<ul class="lsit-unstyle list slice">  -->
<!-- 								<li><a href="javascript:void(0);">降龙十八掌该何去何从</a></li> -->
<!-- 								<li><a href="javascript:void(0);">武林大会</a></li> -->
<!-- 								<li><a href="javascript:void(0);">武林大会降龙十八掌该何去何从</a></li> -->
<!-- 								<li><a href="javascript:void(0);">武林大会降龙十八掌该何去何从</a></li> -->
<!-- 								<li><a href="javascript:void(0);">武林大会降龙十八掌该何去何从</a></li> -->
<!-- 							</ul> -->
<!-- 						</div> -->
						
<!-- 						<div class="newsblock button">更多沪·深市场资讯</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
				<!-- end part one (沪深) -->
				
<!-- 				<div class="row advertise"> -->
<!-- 					<img alt="广告/公司活动推广宣传" src="upload/k.jpg"> -->
<!-- 				</div>  -->
				
				<!-- part two 美股·港股) -->
<!-- 				<div class="row"> -->
<!-- 					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 bgc-f8 mgt20 border-news" data-type="type5"> -->
<!-- 						<div class="newsblock sectorname"> -->
<!-- 							<span class="title">美股<span class="dot">·</span>港股</span> -->
<!-- 						</div> -->
<!-- 						<div class="newsblock illustrate single"> -->
<!-- 							<img alt="illustrated photo" class="image" src="upload/a.jpg"> -->
<!-- 							<div class="content"> -->
<!-- 								<p class="title"><a href="javascript:void(0);" data-id="1">人民币周五收跌，创6个月新低</a></p> -->
<!-- 								<p class="summary">中国人民币兑美元周五收低于6.22元附近，创近半年低点，与中间价贬值方向一致。盘间一度触及6.2316元低点。市场人士认为，当前已接近今年低点，年内续贬空间不多。</p> -->
<!-- 							</div> -->
<!-- 						</div> -->
						
<!-- 						<div class="newsblock illustrate set"> -->
<!-- 							<div class="slice"> -->
<!-- 								<img alt="slice news" src="upload/a.jpg"> -->
<!-- 								<p class="title"><a href="javascript:void(0);">郭靖：后继乏力，降龙十八掌该何去何从？</a></p> -->
<!-- 								<p class="summary">近几个月的中原武林“风雨飘摇”大概是最好的词汇了，转瞬之间就被腰斩。</p> -->
<!-- 							</div> -->
<!-- 							<div class="slice"> -->
<!-- 								<img alt="slice news" src="upload/a.jpg"> -->
<!-- 								<p class="title"><a href="javascript:void(0);">郭靖：后继乏力，降龙十八掌该何去何从？</a></p> -->
<!-- 								<p class="summary">近几个月的中原武林“风雨飘摇”大概是最好的词汇了，转瞬之间就被腰斩。</p> -->
<!-- 							</div> -->
<!-- 							<div class="slice"> -->
<!-- 								<img alt="slice news" src="upload/a.jpg"> -->
<!-- 								<p class="title"><a href="javascript:void(0);">郭靖：后继乏力，降龙十八掌该何去何从？</a></p> -->
<!-- 								<p class="summary">近几个月的中原武林“风雨飘摇”大概是最好的词汇了，转瞬之间就被腰斩。</p> -->
<!-- 							</div> -->
<!-- 						</div> -->
						
<!-- 						<div class="newsblock succicent"> -->
<!-- 							<div class="card slice"> -->
<!-- 								<img alt="card recommend" src="upload/a.jpg"> -->
<!-- 								<p class="text">推荐阅读</p> -->
<!-- 							</div> -->
							
<!-- 							<ul class="lsit-unstyle list slice"> -->
<!-- 								<li><a href="javascript:void(0);">降龙十八掌该何去何从</a></li> -->
<!-- 								<li><a href="javascript:void(0);">武林大会</a></li> -->
<!-- 								<li><a href="javascript:void(0);">武林大会降龙十八掌该何去何从</a></li> -->
<!-- 								<li><a href="javascript:void(0);">武林大会降龙十八掌该何去何从</a></li> -->
<!-- 								<li><a href="javascript:void(0);">武林大会降龙十八掌该何去何从</a></li> -->
<!-- 							</ul> -->
							
<!-- 							<ul class="lsit-unstyle list slice">  -->
<!-- 								<li><a href="javascript:void(0);">降龙十八掌该何去何从</a></li> -->
<!-- 								<li><a href="javascript:void(0);">武林大会</a></li> -->
<!-- 								<li><a href="javascript:void(0);">武林大会降龙十八掌该何去何从</a></li> -->
<!-- 								<li><a href="javascript:void(0);">武林大会降龙十八掌该何去何从</a></li> -->
<!-- 								<li><a href="javascript:void(0);">武林大会降龙十八掌该何去何从</a></li> -->
<!-- 							</ul> -->
<!-- 						</div> -->
						
<!-- 						<div class="newsblock button">更多美股·港股市场资讯</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!--  end part two 美股·港股) -->
				
				<!-- part three (基金) -->
<!-- 				<div class="row"> -->
<!-- 					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 bgc-f8 mgt20 border-news" data-type="type5"> -->
<!-- 						<div class="newsblock sectorname"> -->
<!-- 							<span class="title">基金</span> -->
<!-- 						</div> -->
<!-- 						<div class="newsblock illustrate single"> -->
<!-- 							<img alt="illustrated photo" class="image" src="upload/a.jpg"> -->
<!-- 							<div class="content"> -->
<!-- 								<p class="title"><a href="javascript:void(0);" data-id="1">人民币周五收跌，创6个月新低</a></p> -->
<!-- 								<p class="summary">中国人民币兑美元周五收低于6.22元附近，创近半年低点，与中间价贬值方向一致。盘间一度触及6.2316元低点。市场人士认为，当前已接近今年低点，年内续贬空间不多。</p> -->
<!-- 							</div> -->
<!-- 						</div> -->
						
<!-- 						<div class="newsblock illustrate set"> -->
<!-- 							<div class="slice"> -->
<!-- 								<img alt="slice news" src="upload/a.jpg"> -->
<!-- 								<p class="title"><a href="javascript:void(0);">郭靖：后继乏力，降龙十八掌该何去何从？</a></p> -->
<!-- 								<p class="summary">近几个月的中原武林“风雨飘摇”大概是最好的词汇了，转瞬之间就被腰斩。</p> -->
<!-- 							</div> -->
<!-- 							<div class="slice"> -->
<!-- 								<img alt="slice news" src="upload/a.jpg"> -->
<!-- 								<p class="title"><a href="javascript:void(0);">郭靖：后继乏力，降龙十八掌该何去何从？</a></p> -->
<!-- 								<p class="summary">近几个月的中原武林“风雨飘摇”大概是最好的词汇了，转瞬之间就被腰斩。</p> -->
<!-- 							</div> -->
<!-- 							<div class="slice"> -->
<!-- 								<img alt="slice news" src="upload/a.jpg"> -->
<!-- 								<p class="title"><a href="javascript:void(0);">郭靖：后继乏力，降龙十八掌该何去何从？</a></p> -->
<!-- 								<p class="summary">近几个月的中原武林“风雨飘摇”大概是最好的词汇了，转瞬之间就被腰斩。</p> -->
<!-- 							</div> -->
<!-- 						</div> -->
						
<!-- 						<div class="newsblock succicent"> -->
<!-- 							<div class="card slice"> -->
<!-- 								<img alt="card recommend" src="upload/a.jpg"> -->
<!-- 								<p class="text">推荐阅读</p> -->
<!-- 							</div> -->
							
<!-- 							<ul class="lsit-unstyle list slice"> -->
<!-- 								<li><a href="javascript:void(0);">降龙十八掌该何去何从</a></li> -->
<!-- 								<li><a href="javascript:void(0);">武林大会</a></li> -->
<!-- 								<li><a href="javascript:void(0);">武林大会降龙十八掌该何去何从</a></li> -->
<!-- 								<li><a href="javascript:void(0);">武林大会降龙十八掌该何去何从</a></li> -->
<!-- 								<li><a href="javascript:void(0);">武林大会降龙十八掌该何去何从</a></li> -->
<!-- 							</ul> -->
							
<!-- 							<ul class="lsit-unstyle list slice">  -->
<!-- 								<li><a href="javascript:void(0);">降龙十八掌该何去何从</a></li> -->
<!-- 								<li><a href="javascript:void(0);">武林大会</a></li> -->
<!-- 								<li><a href="javascript:void(0);">武林大会降龙十八掌该何去何从</a></li> -->
<!-- 								<li><a href="javascript:void(0);">武林大会降龙十八掌该何去何从</a></li> -->
<!-- 								<li><a href="javascript:void(0);">武林大会降龙十八掌该何去何从</a></li> -->
<!-- 							</ul> -->
<!-- 						</div> -->
						
<!-- 						<div class="newsblock button">更多基金市场资讯</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
				<!-- end part three (基金) -->
			</div><!-- end index main(left) -->
			
			<!-- append info (right) -->
			<div class="col-lg-4 col-md-4 col-sm-4 col-xs-4 js-news-appendix" >
				<!-- 上证指数 -->
				<div class="row mgt20" style="margin-left: 0;">
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 bgc-f8 border-news">
						<div class="indexblock">				
							<span class="blockname">沪<span class="dot">·</span>深指数</span>
							<span class="line"></span>
							<ul class="list-unstyle list slice">
								<li><span class="indexname" title="上证指数">上证指数</span><span class="indexnumber"><span class="number-1 up">115.70</span><span class="number-2">-3.80</span><span class="number-3">3.40%</span></span></li>
								<li><span class="indexname" title="上证指数">深证指数</span><span class="indexnumber"><span class="number-1">115.70</span><span class="number-2">-3.80</span><span class="number-3">3.40%</span></span></li>
								<li><span class="indexname" title="沪深300">沪深300</span><span class="indexnumber"><span class="number-1">115.70</span><span class="number-2">-3.80</span><span class="number-3">3.40%</span></span></li>
								<li><span class="indexname" title="创业板指数">创业板指数</span><span class="indexnumber"><span class="number-1 down">115.70</span><span class="number-2">-3.80</span><span class="number-3">3.40%</span></span></li>
							</ul>
						</div>
						<div class="rankblock">
							<span class="blockname">涨跌排行</span>
							<span class="line"></span>
							<ul class="list-inline list rankname">
								<li class="active" data-target="up">涨幅前十</li>
								<li data-target="down">跌幅前十</li>
							</ul>
							<ul class="list-unstyle list rankdata js-up" data-target="up">
								<li><span class="stockname"><span class="serial first up">1</span>ssss阿里巴巴阿里巴巴阿里巴巴阿里巴巴</span><span class="stocknumber"><span class="number-1 up">115.70</span><span class="number-2">-3.80</span><span class="number-3">3.40%</span></span></li>
								<li><span class="stockname"><span class="serial second up">2</span>奇虎360</span><span class="stocknumber"><span class="number-1 up">115.70</span><span class="number-2">-3.80</span><span class="number-3">3.40%</span></span></li>
								<li><span class="stockname"><span class="serial third up">3</span>苹果</span><span class="stocknumber"><span class="number-1 up">115.70</span><span class="number-2">-3.80</span><span class="number-3">3.40%</span></span></li>
								<li><span class="stockname"><span class="serial">4</span>苹果</span><span class="stocknumber"><span class="number-1 up">115.70</span><span class="number-2">-3.80</span><span class="number-3">3.40%</span></span></li>
								<li><span class="stockname"><span class="serial">5</span>苹果</span><span class="stocknumber"><span class="number-1 up">115.70</span><span class="number-2">-3.80</span><span class="number-3">3.40%</span></span></li>
								<li><span class="stockname"><span class="serial">6</span>苹果</span><span class="stocknumber"><span class="number-1 up">115.70</span><span class="number-2">-3.80</span><span class="number-3">3.40%</span></span></li>
								<li><span class="stockname"><span class="serial">7</span>苹果</span><span class="stocknumber"><span class="number-1 up">115.70</span><span class="number-2">-3.80</span><span class="number-3">3.40%</span></span></li>
								<li><span class="stockname"><span class="serial">8</span>苹果</span><span class="stocknumber"><span class="number-1 up">115.70</span><span class="number-2">-3.80</span><span class="number-3">3.40%</span></span></li>
								<li><span class="stockname"><span class="serial">9</span>苹果</span><span class="stocknumber"><span class="number-1 up">115.70</span><span class="number-2">-3.80</span><span class="number-3">3.40%</span></span></li>
								<li><span class="stockname"><span class="serial">10</span>苹果</span><span class="stocknumber"><span class="number-1 up">115.70</span><span class="number-2">-3.80</span><span class="number-3">3.40%</span></span></li>
							</ul>
							<ul class="list-unstyle list rankdata js-down" style="display: none;" data-target="down">
								<li><span class="stockname"><span class="serial first down">1</span>111阿里巴巴阿里巴巴阿里巴巴阿里巴巴</span><span class="stocknumber"><span class="number-1 up">115.70</span><span class="number-2">-3.80</span><span class="number-3">3.40%</span></span></li>
								<li><span class="stockname"><span class="serial second down">2</span>奇虎360</span><span class="stocknumber"><span class="number-1 up">115.70</span><span class="number-2">-3.80</span><span class="number-3">3.40%</span></span></li>
								<li><span class="stockname"><span class="serial third down">3</span>苹果</span><span class="stocknumber"><span class="number-1 up">115.70</span><span class="number-2">-3.80</span><span class="number-3">3.40%</span></span></li>
								<li><span class="stockname"><span class="serial">4</span>苹果</span><span class="stocknumber"><span class="number-1 up">115.70</span><span class="number-2">-3.80</span><span class="number-3">3.40%</span></span></li>
								<li><span class="stockname"><span class="serial">5</span>苹果</span><span class="stocknumber"><span class="number-1 up">115.70</span><span class="number-2">-3.80</span><span class="number-3">3.40%</span></span></li>
								<li><span class="stockname"><span class="serial">6</span>苹果</span><span class="stocknumber"><span class="number-1 up">115.70</span><span class="number-2">-3.80</span><span class="number-3">3.40%</span></span></li>
								<li><span class="stockname"><span class="serial">7</span>苹果</span><span class="stocknumber"><span class="number-1 up">115.70</span><span class="number-2">-3.80</span><span class="number-3">3.40%</span></span></li>
								<li><span class="stockname"><span class="serial">8</span>苹果</span><span class="stocknumber"><span class="number-1 up">115.70</span><span class="number-2">-3.80</span><span class="number-3">3.40%</span></span></li>
								<li><span class="stockname"><span class="serial">9</span>苹果</span><span class="stocknumber"><span class="number-1 up">115.70</span><span class="number-2">-3.80</span><span class="number-3">3.40%</span></span></li>
								<li><span class="stockname"><span class="serial">10</span>苹果</span><span class="stocknumber"><span class="number-1 up">115.70</span><span class="number-2">-3.80</span><span class="number-3">3.40%</span></span></li>
							</ul>
						</div>
					</div>
				</div><!-- end 上证指数 -->
				
				
				<!-- 美股·港股 指数  -->
				<div class="row mgt20" style="margin-left: 0;">
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 bgc-f8 border-news">
						<div class="indexblock">				
							<span class="blockname">美<span class="dot">·</span>港指数</span>
							<span class="line"></span>
							<ul class="list-unstyle list slice">
								<li><span class="indexname" title="道琼斯指数">道琼斯指数</span><span class="indexnumber"><span class="number-1 up">115.70</span><span class="number-2">-3.80</span><span class="number-3">3.40%</span></span></li>
								<li><span class="indexname" title="纳斯达克指数">纳斯达克指数</span><span class="indexnumber"><span class="number-1">115.70</span><span class="number-2">-3.80</span><span class="number-3">3.40%</span></span></li>
								<li><span class="indexname" title="标准普尔500">标准普尔500</span><span class="indexnumber"><span class="number-1">115.70</span><span class="number-2">-3.80</span><span class="number-3">3.40%</span></span></li>
								<li><span class="indexname" title="恒生指数">恒生指数</span><span class="indexnumber"><span class="number-1 down">115.70</span><span class="number-2">-3.80</span><span class="number-3">3.40%</span></span></li>
							</ul>
						</div>
						<div class="rankblock">
							<span class="blockname">涨跌排行</span>
							<span class="line"></span>
							<ul class="list-inline list rankname">
								<li >涨幅前十</li>
								<li class="active">跌幅前十</li>
							</ul>
							<ul class="list-unstyle list rankdata">
								<li><span class="serial first down">1</span><span class="stockname">阿里巴巴阿里巴巴阿里巴巴阿里巴巴</span><span class="stocknumber"><span class="number-1 up">115.70</span><span class="number-2">-3.80</span><span class="number-3">3.40%</span></span></li>
								<li><span class="serial second down">2</span><span class="stockname">奇虎360</span><span class="stocknumber"></span></li>
								<li><span class="serial third down">3</span><span class="stockname">苹果</span><span class="stock-number"></span></li>
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
				</div>
				<!-- end 美股·港股 指数  -->
				
				
			</div><!-- end append info (right) -->
			
		</div>
	</div>
	
</div><!-- end wrap -->
<jsp:include page="../_footer.jsp"></jsp:include>
<script type="text/javascript" language="javascript" src="js/common.js"></script>
<script type="text/javascript" language="javascript" src="js/System.stockii.news.js"></script>

<script type="text/javascript">

newsHandler.getNewsList.getForHot("data/hotnews.txt", "hotnews");
newsHandler.getNewsList.getForIndex("data/indexMain.txt", "indexMain");

$(function(){
var content = {
	"title" : "title test text",
	"summary" : "summary test text"
};


//basic test
// var $_basicCotainer = atomicOperation.createFrameDOM.basicCotainer();
// atomicOperation.pasteFrameDOM.basicCotainer($_basicCotainer,$(".js-news-main"));

// var sectorname = atomicOperation.createFrameDOM.sectorName("沪<span class='dot'>·</span>深");
// atomicOperation.pasteFrameDOM.sectorName(sectorname,$_basicCotainer.find("div.js-nail"));


// var $_block_IllustrateSingle = atomicOperation.createHtmlDOM.createIllustrateSingle();
// atomicOperation.fillHtmlDOM.fillIllustrateSingle($_block_IllustrateSingle,content);
// atomicOperation.pasteHtmlDOM.pasteIllustrateSingle($_block_IllustrateSingle,$_basicCotainer.find("div.js-nail.basic"));

// var $_block_IllustrateSet = atomicOperation.createHtmlDOM.createIllustrateSet();
// atomicOperation.fillHtmlDOM.fillIllustrateSet($_block_IllustrateSet,content);
// atomicOperation.pasteHtmlDOM.pasteIllustrateSet($_block_IllustrateSet,$_basicCotainer.find("div.js-nail.basic"));


// var $_block_succinct = atomicOperation.createHtmlDOM.createSuccicent();
// atomicOperation.fillHtmlDOM.fillSuccicent($_block_succinct,content);
// atomicOperation.pasteHtmlDOM.pasteSuccicent($_block_succinct,$_basicCotainer.find("div.js-nail.basic"));


//appendix test
var indexList = [["上证指数","115.70","3.8","4.2%"],["深证指数","133.67","7.90","3.47%"],["沪深300","216.36","5.6","6.74%"],["创业板指数","156.47","10.65","2.78%"]];
var rankList= 
{
	"up":[
		["1强生up","12","14","155"],
		["2强生up","12","14","155"],
		["3强生up","12","14","155"],
		["4强生up","12","14","155"],
		["5强生up","12","14","155"],
		["6强生up","12","14","155"],
		["7强生up","12","14","155"],
		["8强生up","12","14","155"],
		["9强生up","12","14","155"],
		["0强生up","12","14","155"]
	],
	"down":[
		["1强生down","12","14","155"],
		["2强生down","12","14","155"],
		["3强生down","12","14","155"],
		["4强生down","12","14","155"],
		["5强生down","12","14","155"],
		["6强生down","12","14","155"],
		["7强生down","12","14","155"],
		["8强生down","12","14","155"],
		["9强生down","12","14","155"],
		["0强生down","12","14","155"]
	]
};

var $_appendixContainer = atomicOperation.createFrameDOM.appendixContainer();
atomicOperation.pasteFrameDOM.appendixContainer($_appendixContainer,$(".js-news-appendix"));

var $_stockindex = atomicOperation.createHtmlDOM.createStockIndex(4);
atomicOperation.fillHtmlDOM.fillStockIndex($_stockindex,content,indexList);
// atomicOperation.fillHtmlDOM.fillStockIndex();
atomicOperation.pasteHtmlDOM.pasetStockIndex($_stockindex,$("div.js-nail.appendix"));

var $_stockrank = atomicOperation.createHtmlDOM.createStockRank();
atomicOperation.fillHtmlDOM.fillStockRank($_stockrank,rankList);
atomicOperation.pasteHtmlDOM.pasteStockRank($_stockrank,$("div.js-nail.appendix"));





//rank switch
$("ul.rankname > li").click(function(){
// 	alert($(this).text());
	if(!$(this).hasClass("active")){
		$(this).addClass("active");
		$(this).siblings("li").removeClass("active");
// 		$("ul.rankdata").attr("style","none");
// 		$("ul.rankdata[style]").attr("style","block");
		$(this).parent("ul").siblings("[data-target]").css("display","none");
		console.log($(this).attr("data-target"));
		$(this).parent("ul").siblings("[data-target="+$(this).attr("data-target")+"]").css("display","block");
	}
// 	$(this).siblings().removeClass("active");
// 	$(this).addClass("active");
// 	$(this).parent("ul").siblings("ul.rankdata") 
});

});
</script>
</body>
</html>
