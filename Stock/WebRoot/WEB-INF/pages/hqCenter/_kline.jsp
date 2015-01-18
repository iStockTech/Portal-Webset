<!doctype html>
<html>
<head>
<meta http-equiv="content-type" content="text/html;charset=UTF-8" />
<style type="text/css">
	.wrap{width:990px;zoom:1;margin:auto;}
	body{margin:4px;}
	BODY, A, P, SPAN, TD{font-family: Arial, "宋体";font-size: 14px;}
	h1{margin:0 0 10px 10px;border-bottom: 1px solid #f0f0f0;padding: 0px 20px 5px 10px;}
	h1 a{font-family:"微软雅黑", "黑体";font-size: 18px;color:black;text-decoration:none}
	h2{font-family:"微软雅黑", "黑体";font-size: 16px;margin: 10px 0 5px 2px;padding: 8px 0px 0px 2px;}
	pre{margin:4px;padding: 5px 0 0 30px!important;color: gray;font-size: .8em;line-height: 20px;}
	.foot{text-align:center}
	.foot a {font-size:9pt}
</style>

<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no"/>
<title>k line painter</title>
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
<body onload="drawKL()" style="padding:0;margin:2px">
<!-- <div class="wrap"> -->

    <canvas id="canvasKL" width="1002" height="460" style="z-index: 2; border: 1px solid #69c">
        <p>hey,您的浏览器不支持html5，换个浏览器吧，比如google chrome，firefox</p>
    </canvas>
    <script type="text/javascript" src="h5StockData/k-data.js"></script>
<!-- </div> -->

</body>
</html>
