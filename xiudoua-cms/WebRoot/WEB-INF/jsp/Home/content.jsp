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
	<title>${content.title }-${content.channelName }-秀逗啊网站</title>
	<jsp:include page="/home/css.htm"></jsp:include>
	<jsp:include page="/home/js.htm"></jsp:include>
	<!--[if lt IE 9]>
	<script type="text/javascript" src="js/html5.js"></script>
	<![endif]-->
	<!--[if lt IE 9]>
		<script type="text/javascript" src="js/css3-mediaqueries.js"></script>
	<![endif]-->
	<link href="<%=basePath %>assets/pagecss/home/content.css" rel="stylesheet" type="text/css"/>
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
					<c:if test="${content.cType == 1 }">
						<a href="<%=basePath %>home/imagelist.htm?id=${content.channelId }">${content.channelName }</a> 
					</c:if>
					<c:if test="${content.cType == 2 }">
						<a href="<%=basePath %>home/normallist.htm?id=${content.channelId }">${content.channelName }</a> 
					</c:if>
					<i class="fa fa-angle-double-right"></i> 
				</li>
				<li>
					<a href="javascript: void(0)">${content.title }</a>
				</li>
			</ul>
		</div>
		<!-- 面包屑导航 -->
		<div class="clear"></div>
		
		<section class="content">
			
			<!-- JustFresh 2017-08-17 begin 左侧文章内容详情部分 -->
			<div class="content-detail pull-left">
				<div class="title">
					<h1>${content.title }</h1>
					<p>
						<span class="time">发布时间：
							<jsp:setProperty name="dateValue" property="time" value="${content.createTime}"/>
							<fmt:formatDate value="${dateValue}" pattern="yyyy-MM-dd hh:mm"/>
						</span> 
						<span class="author">${content.authorName}</span>
						<span class="source">来源：${content.source}</span>
						<span class="click-num">浏览次数：${content.clickNum}</span>
					</p>
				</div>
				<div class="content-body">
                    ${content.extObj.content }
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
			
			<!-- JustFresh 2017-08-17 begin 右侧推荐部分 -->
			<div class="recommends pull-right">
				<aside>
					<div class="widget_container hot-search">
						<h3><b><span>热门</span> 搜索</b></h3>
						<dl>
							<dd><a href="#">战狼系列</a></dd>
							<dd><a href="#">冰与火之歌</a></dd>
							<dd><a href="#">Java</a></dd>
							<dd><a href="#">PHP</a></dd>
							<dd><a href="#">LOL</a></dd>
							<dd><a href="#">2017</a></dd>
							<dd><a href="#">JustFresh</a></dd>
							<dd><a href="#">《教程》</a></dd>
							<dd><a href="#">秀逗啊</a></dd>
							<dd><a href="#">六盘水</a></dd>
						</dl>
					</div>
					
					<div class="widget_container click-sort">
						<h3><b><span>点击</span> 排行</b></h3>
						<ul>
							<li>
								<a href="#">
									<img src="<%=basePath %>assets/images/home/content/1.jpg" class="head" />
								</a>
								<div class="info pull-left">
									<h4><a href="">我想我的思念是一种病.</a></h4>
									<p><i class="fa fa-clock-o"></i> 2017-08-12 <i class="fa fa-eye"></i> 12</p>
								</div>
								<div class="clear"></div>
							</li>
						    <li>
						    	<a href="#">
									<img src="<%=basePath %>assets/images/home/content/2.jpg" class="head" />
								</a>
								<div class="info pull-left">
									<h4><a href="">我想我的思念是一种病.</a></h4>
									<p><i class="fa fa-clock-o"></i> 2017-08-12 <i class="fa fa-eye"></i> 12</p>
								</div>
								<div class="clear"></div>
						    </li>
						    <li>
						    	<a href="#">
									<img src="<%=basePath %>assets/images/home/content/3.jpg" class="head" />
								</a>
								<div class="info pull-left">
									<h4><a href="">我想我的思念是一种病.</a></h4>
									<p><i class="fa fa-clock-o"></i> 2017-08-12 <i class="fa fa-eye"></i> 12</p>
								</div>
								<div class="clear"></div>
						    </li>
						    <li>
						    	<a href="#">
									<img src="<%=basePath %>assets/images/home/content/4.jpg" class="head" />
								</a>
								<div class="info pull-left">
									<h4><a href="">我想我的思念是一种病.</a></h4>
									<p><i class="fa fa-clock-o"></i> 2017-08-12 <i class="fa fa-eye"></i> 12</p>
								</div>
								<div class="clear"></div>
						    </li>
						    <li>
						    	<a href="#">
									<img src="<%=basePath %>assets/images/home/content/5.jpg" class="head" />
								</a>
								<div class="info pull-left">
									<h4><a href="">我想我的思念是一种病.</a></h4>
									<p><i class="fa fa-clock-o"></i> 2017-08-12 <i class="fa fa-eye"></i> 12</p>
								</div>
								<div class="clear"></div>
						    </li>
						    <li>
						    	<a href="#">
									<img src="<%=basePath %>assets/images/home/content/2.jpg" class="head" />
								</a>
								<div class="info pull-left">
									<h4><a href="">我想我的思念是一种病.</a></h4>
									<p><i class="fa fa-clock-o"></i> 2017-08-12 <i class="fa fa-eye"></i> 12</p>
								</div>
								<div class="clear"></div>
						    </li>
						    <li>
						    	<a href="#">
									<img src="<%=basePath %>assets/images/home/content/3.jpg" class="head" />
								</a>
								<div class="info pull-left">
									<h4><a href="">我想我的思念是一种病.</a></h4>
									<p><i class="fa fa-clock-o"></i> 2017-08-12 <i class="fa fa-eye"></i> 12</p>
								</div>
								<div class="clear"></div>
						    </li>
						    <li>
						    	<a href="#">
									<img src="<%=basePath %>assets/images/home/content/4.jpg" class="head" />
								</a>
								<div class="info pull-left">
									<h4><a href="">我想我的思念是一种病一种病.</a></h4>
									<p><i class="fa fa-clock-o"></i> 2017-08-12 <i class="fa fa-eye"></i> 12</p>
								</div>
								<div class="clear"></div>
						    </li>
						</ul>
					</div>
					
					<div class="widget_container videos">
						<h3><b><span>推荐</span> 视频</b></h3>
						<dl>
							<dd>
								<a href="#">
									<div class="bg">
										<i class="fa fa-play-circle-o"></i>
									</div>
								</a>
								<a href="#">
									<img src="<%=basePath %>assets/images/home/video/1.jpg" class="thumb" />
								</a>
								<p><a href="">我想我的思念是一种病.</a></p>
							</dd>
							<dd>
								<a href="#">
									<div class="bg">
										<i class="fa fa-play-circle-o"></i>
									</div>
								</a>
								<a href="#">
									<img src="<%=basePath %>assets/images/home/video/2.jpg" class="thumb" />
								</a>
								<p><a href="">我想我的思念是一种病.</a></p>
							</dd>
							<dd>
								<a href="#">
									<div class="bg">
										<i class="fa fa-play-circle-o"></i>
									</div>
								</a>
								<a href="#">
									<img src="<%=basePath %>assets/images/home/video/3.jpg" class="thumb" />
								</a>
								<p><a href="">我想我的思念是一种病.</a></p>
							</dd>
							<dd>
								<a href="#">
									<div class="bg">
										<i class="fa fa-play-circle-o"></i>
									</div>
								</a>
								<a href="#">
									<img src="<%=basePath %>assets/images/home/video/4.jpg" class="thumb" />
								</a>
								<p><a href="">我想我的思念是一种病.</a></p>
							</dd>
							<dd>
								<a href="#">
									<div class="bg">
										<i class="fa fa-play-circle-o"></i>
									</div>
								</a>
								<a href="#">
									<img src="<%=basePath %>assets/images/home/video/5.jpg" class="thumb" />
								</a>
								<p><a href="">我想我的思念是一种病.</a></p>
							</dd>
							<dd>
								<a href="#">
									<div class="bg">
										<i class="fa fa-play-circle-o"></i>
									</div>
								</a>
								<a href="#">
									<img src="<%=basePath %>assets/images/home/video/1.jpg" class="thumb" />
								</a>
								<p><a href="">我想我的思念是一种病.</a></p>
							</dd>
						</dl>
					</div>
				</aside>
			</div>
			<!-- JustFresh 2017-08-17 begin 右侧推荐部分 -->
			
		</section>

	</section>
	<!-- JustFresh 2017-08-12 end 影片列表 -->
	
	<jsp:include page="/home/footer.htm"></jsp:include>
	<script type="text/javascript" src="<%=basePath %>assets/pagejs/home/content.js"></script>
</body>
</html>