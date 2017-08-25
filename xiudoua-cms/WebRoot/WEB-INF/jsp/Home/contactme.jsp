<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<meta charset="UTF-8">
	<meta name="keywords" content="秀逗啊网站"/>
	<meta name="description" content="秀逗啊网站"/>
	<meta name="author" content="JustFresh"/>
	<title>秀逗啊网站</title>
	<jsp:include page="/home/css.htm"></jsp:include>
	<jsp:include page="/home/js.htm"></jsp:include>
	<!--[if lt IE 9]>
	<script type="text/javascript" src="js/html5.js"></script>
	<![endif]-->
	<!--[if lt IE 9]>
		<script type="text/javascript" src="js/css3-mediaqueries.js"></script>
	<![endif]-->
	<link href="<%=basePath %>assets/pagecss/home/contactme.css" rel="stylesheet" type="text/css"/>
</head>
<body class="home">
	<jsp:include page="/home/float.htm"></jsp:include>
	<jsp:include page="/home/header.htm"></jsp:include>
	
	<!-- JustFresh 2017-08-12 begin 影片列表 -->
	<section class="container">
		<!-- 面包屑导航 -->
		<div id="brands">
			<ul>
				<li>
					您当前的浏览位置：<a href="<%=basePath %>">首页</a> <i class="fa fa-angle-double-right"></i> 
				</li>
				<li>
					<a href="<%=basePath %>home/contactme.htm">联系站长</a>
				</li>
			</ul>
		</div>
		<!-- 面包屑导航 -->
		<div class="clear"></div>
		
		<section class="content">
			<div class="two_third">
    			<img src="<%=basePath %>/assets/images/justfresh.jpg" alt="JustFresh" class="alignleft">
    			<h3>Just<span>Fresh</span></h3>
    			<p>Etiam magna libero dapibus eu suscipit condimentum fringilla mattis ligula. 
				    Morbi eget sem nunc. Ut felis ipsum mollis a ultrices id condimentum ac odio. 
				    Nam id velit non dui cursus aliquam. Vestibulum ante ipsum primis in faucibus orci 
				    luctus et ultrices posuere cubilia Curae Nulla facilisi. Praesent nec dolor non 
				    eros tempus mollis. Maecenas feugiat facilisis ipsum at pellentesque. Sed dolor 
				    ipsum feugiat non euismod at pulvinar ut sem.
				</p><br>
				<a href="#" class="read_more">点击 认识我</a>
    			<span class="divider"></span>
    			
    			<h3>你有什么 <span>想对我说呢？？？</span></h3>
    			<div id="contactUs" class="contact-us">
	    			<form action="" id="messageForm">
					  	<div class="form-group">
					    	<label>你的大名</label>
					    	<input type="text" class="form-control" placeholder="请填写您的大名..." id="messageName" />
					  	</div>
					 	<div class="form-group">
					    	<label>联系方式：QQ/Email/微信/电话</label>
					    	<input type="number" class="form-control" placeholder="请填上您的联系方式..." id="messagePhone" />
					  	</div>
					  	<div class="form-group">
					    	<label>你想说嘛？？？</label>
					    	<textarea rows="5" class="form-control" id="messageDetail"></textarea>
					  	</div>
					  	<button type="button" class="btn" onclick="submitMessageForm()">立即提交</button>
					</form>
				</div>
				<br />
				<h3>Po一份<span>地图！！！</span></h3><br />
				<div id="map" class="form-control" style="height: 400px;"></div>
			</div>

			<div class="one_third_last">
				<aside>
					<div class="widget_container">
						<h3><b><span>推荐</span> 文章</b></h3>
						<ul>
							<li><a href="#">不要孤单，不要彷徨！！！</a></li>
						    <li><a href="#">六盘水景点旅游全攻略！！！</a></li>
						    <li><a href="#">秀逗啊网站改版上线！！！</a></li>
						    <li><a href="#">秀逗啊网站改版上线！！！</a></li>
						    <li><a href="#">秀逗啊网站改版上线！！！</a></li>
						</ul>
					</div>

					<div class="widget_container">
						<h3><b><span>热门</span> 访问</b></h3>
						<ul>
							<li><a href="#">不要孤单，不要彷徨.</a></li>
						    <li><a href="#">六盘水景点旅游全攻略...</a></li>
						    <li><a href="#">秀逗啊网站改版上线...</a></li>
						    <li><a href="#">秀逗啊网站改版上线...</a></li>
						    <li><a href="#">去北漂我得做些什么准备？？？</a></li>
						</ul>
					</div>

					<div class="widget_container">
						<h3><b><span>注册</span> 用户</b></h3>
						<div class="tagcloud">
						    <a href="#">JustFresh</a>
						    <a href="#">疯狂的小猫咪</a>
						    <a href="#">爱做梦的妹纸</a>
						    <a href="#">队长</a>
						    <a href="#">老四</a>
						    <a href="#">大屁股的老二</a>
						    <a href="#">喷他Kill的老大</a>
						</div>
					</div>

					<div class="widget_container">
						<h3><b><span>推荐</span> 电影</b></h3>
						<ul>
							<li><a href="#">《战狼系列》</a></li>
						    <li><a href="#">《三生三世十里桃花》</a></li>
						    <li><a href="#">《荒岛余生》</a></li>
						    <li><a href="#">《当幸福来敲门》</a></li>
						    <li><a href="#">《肖申克的救赎》</a></li>
						</ul>
					</div>
					
					<div class="widget_container">
						<h3><b><span>推荐</span> 电视</b></h3>
						<ul>
							<li><a href="#">《权利的游戏第七季》</a></li>
						    <li><a href="#">《西部世界》</a></li>
						    <li><a href="#">《越狱第五季》</a></li>
						    <li><a href="#">《我的前半生》</a></li>
						    <li><a href="#">《人民的名义》</a></li>
						</ul>
					</div>
					
				</aside>
			</div>
		</section>
		
	</section>
	<!-- JustFresh 2017-08-12 end 影片列表 -->
	
	<jsp:include page="/home/footer.htm"></jsp:include>
	<script type="text/javascript" src="<%=basePath %>assets/pagejs/home/contactme.js"></script>
	<script src="http://cache.amap.com/lbs/static/es5.min.js"></script>
    <script src="http://webapi.amap.com/maps?v=1.3&key=f51c689d1dc29ee2767d078cdf54d0a4"></script>
    <script type="text/javascript" src="http://cache.amap.com/lbs/static/addToolbar.js"></script>
    <script type="text/javascript">
    var map = new AMap.Map('map', {
        resizeEnable: true,
        zoom:11,
        center: [104.898282,26.589085]
    });
    </script>
</body>
</html>