<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:useBean id="dateValue" class="java.util.Date"/>
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
	<title>${media.title }-${media.channelName }-秀逗啊网站</title>
	<jsp:include page="/home/css.htm"></jsp:include>
	<jsp:include page="/home/js.htm"></jsp:include>
	<!--[if lt IE 9]>
	<script type="text/javascript" src="js/html5.js"></script>
	<![endif]-->
	<!--[if lt IE 9]>
		<script type="text/javascript" src="js/css3-mediaqueries.js"></script>
	<![endif]-->
	<link href="<%=basePath %>assets/pagecss/home/media.css" rel="stylesheet" type="text/css"/>
	<style type="text/css">
	video{width: 1100px !important;}
	</style>
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
					<a href="<%=basePath %>home/videolist.htm?id=${media.channelId }">${media.channelName }</a> <i class="fa fa-angle-double-right"></i> 
				</li>
				<li>
					<a href="javascript: void(0)">${media.title }</a>
				</li>
			</ul>
		</div>
		<!-- 面包屑导航 -->
		<div class="clear"></div>
		
		<section class="content">
			
			<!-- JustFresh 2017-08-17 begin 左侧文章内容详情部分 -->
			<div class="content-detail">
				<div class="title">
					<h1>${media.title }</h1>
					<p>
						<span class="time">发布时间：
							<jsp:setProperty name="dateValue" property="time" value="${media.createTime}"/>
							<fmt:formatDate value="${dateValue}" pattern="yyyy-MM-dd hh:mm"/>
						</span> 
						<span class="author">${media.authorName }</span>
						<span class="source">来源：${media.source }</span>
						<span class="click-num">浏览次数：${media.clickNum }</span>
					</p>
				</div>
				<div class="content-body">
                    ${media.extObj.content }
               	</div>
                <div class="baidu-share">
                	分享到：<div class="bdsharebuttonbox"><a href="#" class="bds_more" data-cmd="more"></a><a href="#" class="bds_qzone" data-cmd="qzone" title="分享到QQ空间"></a><a href="#" class="bds_tsina" data-cmd="tsina" title="分享到新浪微博"></a><a href="#" class="bds_tqq" data-cmd="tqq" title="分享到腾讯微博"></a><a href="#" class="bds_renren" data-cmd="renren" title="分享到人人网"></a><a href="#" class="bds_weixin" data-cmd="weixin" title="分享到微信"></a></div>
					<script>window._bd_share_config={"common":{"bdSnsKey":{},"bdText":"","bdMini":"2","bdMiniList":false,"bdPic":"","bdStyle":"0","bdSize":"16"},"share":{},"image":{"viewList":["qzone","tsina","tqq","renren","weixin"],"viewText":"分享到：","viewSize":"16"},"selectShare":{"bdContainerClass":null,"bdSelectMiniList":["qzone","tsina","tqq","renren","weixin"]}};with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion='+~(-new Date()/36e5)];</script> 
                </div>
                <div class="content-links">
                	<span class="prev pull-left">
                		<a href=""><i class="fa fa-angle-left"></i> WSTMall二次开发心得</a>
                	</span>
                	<span class="next pull-right">
                		<a href="">我想我的思念是一种病 <i class="fa fa-angle-right"></i></a>
                	</span>
                	<span class="clear"></span>
                </div>
                <div class="comment-box">
                	<h3>评论</h3>
                	<form>
                		<textarea rows="6" placeholder="请输入你的评论内容..."></textarea>
                		<div class="form-group">
                			<input type="text" class="verify-code" name="" /> <span class="warning">该项为必填项</span>
                			<img id="verify" onclick="refVerify()" title="点击切换验证码" src="<%=basePath %>/admin/getVerifyCode.htm"/>
                			<input type="button" class="comment-btn pull-right" onclick="" value="评论" />
                		</div>
                	</form>
                </div>
                
                <div class="comment-list">
                	<ul>
						<li>
							
							<a href="">
								<img class="user-head pull-left" src="<%=basePath %>assets/images/justfresh.jpg" />
							</a>
							<div class="info pull-left">
								<h3><a href="">JustFresh</a></h3>
								<p>
									<span>写的是真JB的好啊！</span>
									<span class="time">2017-08-18 11:52</span>
								</p>
							</div>
							<div class="clear"></div>
						</li>
						<li>
							
							<a href="">
								<img class="user-head pull-left" src="<%=basePath %>assets/images/justfresh.jpg" />
							</a>
							<div class="info pull-left">
								<h3><a href="">JustFresh</a></h3>
								<p>
									<span>写的是真JB的好啊！</span>
									<span class="time">2017-08-18 11:52</span>
								</p>
							</div>
							<div class="clear"></div>
						</li>
						<li>
							
							<a href="">
								<img class="user-head pull-left" src="<%=basePath %>assets/images/justfresh.jpg" />
							</a>
							<div class="info pull-left">
								<h3><a href="">JustFresh</a></h3>
								<p>
									<span>写的是真JB的好啊！</span>
									<span class="time">2017-08-18 11:52</span>
								</p>
							</div>
							<div class="clear"></div>
						</li>
						<li>
							
							<a href="">
								<img class="user-head pull-left" src="<%=basePath %>assets/images/justfresh.jpg" />
							</a>
							<div class="info pull-left">
								<h3><a href="">JustFresh</a></h3>
								<p>
									<span>写的是真JB的好啊！</span>
									<span class="time">2017-08-18 11:52</span>
								</p>
							</div>
							<div class="clear"></div>
						</li>
						<li>
							
							<a href="">
								<img class="user-head pull-left" src="<%=basePath %>assets/images/justfresh.jpg" />
							</a>
							<div class="info pull-left">
								<h3><a href="">JustFresh</a></h3>
								<p>
									<span>写的是真JB的好啊！</span>
									<span class="time">2017-08-18 11:52</span>
								</p>
							</div>
							<div class="clear"></div>
						</li>
						<li>
							
							<a href="">
								<img class="user-head pull-left" src="<%=basePath %>assets/images/justfresh.jpg" />
							</a>
							<div class="info pull-left">
								<h3><a href="">JustFresh</a></h3>
								<p>
									<span>写的是真JB的好啊！</span>
									<span class="time">2017-08-18 11:52</span>
								</p>
							</div>
							<div class="clear"></div>
						</li>
					</ul>
					<a href="javascript: void(0)" onclick="loadmore()" class="load-more">点击查看更多...</a>
                </div>
			</div>
			<!-- JustFresh 2017-08-17 end 左侧文章内容详情部分 -->
			
		</section>

	</section>
	<!-- JustFresh 2017-08-12 end 影片列表 -->
	
	<jsp:include page="/home/footer.htm"></jsp:include>
	<script type="text/javascript" src="<%=basePath %>assets/pagejs/home/media.js"></script>
</body>
</html>