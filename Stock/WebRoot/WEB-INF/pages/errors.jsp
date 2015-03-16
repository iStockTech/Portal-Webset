<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head> 
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" >
  <title>出错啦~~</title>
   <link rel="stylesheet" media="screen" href="<%=request.getContextPath()%>/front/dist/css/error-style.css" type="text/css" />

   </head> 
   <body> 
   <div class="controller">
    <div class="objects"> 
    <!-- text area -->
    <div class="text-area rotate">
    <p class="error">Error 404</p>
    <p class="details">有一个问题<br/><br/>你正在寻找的页面是不是在这里或移动。</p> 
    </div> 
    <!-- text area -->
    <!-- home page --> 
    <div class="homepage rotate">
    <a href="<%=request.getContextPath()%>/index">返回首页</a> 
    </div> <!-- home page --> 
    </div> <!-- social-icons --> 
    <!-- social-icons --> 
    </div> 
</body>
</html>