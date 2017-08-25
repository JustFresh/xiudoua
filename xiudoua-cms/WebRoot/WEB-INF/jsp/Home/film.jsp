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
	<title>${film.title }-${film.categoryName }-秀逗啊网站</title>
	<jsp:include page="/home/css.htm"></jsp:include>
	<jsp:include page="/home/js.htm"></jsp:include>
	<!--[if lt IE 9]>
	<script type="text/javascript" src="js/html5.js"></script>
	<![endif]-->
	<!--[if lt IE 9]>
		<script type="text/javascript" src="js/css3-mediaqueries.js"></script>
	<![endif]-->
	<link href="<%=basePath %>assets/pagecss/home/film.css" rel="stylesheet" type="text/css"/>
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
					<a href="<%=basePath %>home/filmlist.htm?id=${film.categoryId}">${film.categoryName }</a> <i class="fa fa-angle-double-right"></i> 
				</li>
				<li>
					<a href="javascript: void(0)">${film.title }</a>
				</li>
			</ul>
		</div>
		<!-- 面包屑导航 -->
		<div class="clear"></div>
		
		<section class="content">
			
			<!-- JustFresh 2017-08-17 begin 左侧文章内容详情部分 -->
			<div class="content-detail pull-left">
				<div class="title">
					<h1>${film.title }</h1>
					<div class="baseinfo">
						<img src="<%=basePath %>${film.thumb }" class="pull-left thumb" />
						<div class="desc pull-left">
							<p class="stars">【主演】：${film.stars }</p>
							<p class="categoryName">【类型】：${film.categoryName }</p>
							<p class="country">【发行地】：${film.country }</p>
							<p class="definition">【清晰度】：${film.definition }</p>
							<p class="release-time">【上映时间】：${film.releaseTime }</p>
							<p class="create-time">【添加时间】：${film.createTime }</p>
							<p class="source">【来源】：${film.source }</p>
							<p class="douban">【豆瓣评分】：${film.douban }分</p>
							<p class="wangpan">【百度网盘】：
								<c:if test="${film.sequels[1].wangpan != '#'}">
									${film.sequels[1].wangpan }
								</c:if>
								<c:if test="${film.sequels[1].wangpan == '#'}">
									暂未提交网盘下载
								</c:if>
							</p>
							<p class="xunlei">【迅雷下载】：
								<c:if test="${film.sequels[1].xunlei != '#'}">
									${film.sequels[1].xunlei }
								</c:if>
								<c:if test="${film.sequels[1].xunlei == '#'}">
									暂不支持迅雷下载，站长努力增加中，请谅解...
								</c:if>
							</p>
						</div>
						<div class="clear"></div>
					</div>
				</div>
				<div class="abstracts">
					<h4><i class="fa fa-comment-o"></i> 站长影评：</h4>
					<p>${film.abstracts }</p>
				</div>
				<div class="sequels">
					<h4><i class="fa fa-list"></i> 剧集列表：</h4>
					<ul>
						<c:if test="${film.sequels != null }">
	    					<c:forEach var="sequels" items="${film.sequels}" varStatus="status">
	    						<c:if test="${sequelsId == null }">
	    							<c:if test="${status.count == 1 }">
	    								<li><a href="<%=basePath %>home/film.htm?id=${film.id}&sequelsId=${sequels.id}" class="selected">${sequels.name }</a></li>
	    							</c:if>
	    							<c:if test="${status.count > 1 }">
	    								<li><a href="<%=basePath %>home/film.htm?id=${film.id}&sequelsId=${sequels.id}">${sequels.name }</a></li>
	    							</c:if>
	    						</c:if>
	    						<c:if test="${sequelsId != null }">
	    							<c:if test="${sequelsId == sequels.id }">
	    								<li><a href="<%=basePath %>home/film.htm?id=${film.id}&sequelsId=${sequels.id}" class="selected">${sequels.name }</a></li>
	    							</c:if>
	    							<c:if test="${sequelsId != sequels.id }">
	    								<li><a href="<%=basePath %>home/film.htm?id=${film.id}&sequelsId=${sequels.id}">${sequels.name }</a></li>
	    							</c:if>
	    						</c:if>
	    					</c:forEach>
	    				</c:if>
					</ul>
					<div class="clear"></div>
				</div>
				<div class="content-body">
                    <p>
					    <span style="color: #f30;font-weight: bold;">【剧情简介】：</span>
					</p>
					${film.content }
               	</div>
               	<div class="images">
					<h4><i class="fa fa-image"></i> 影片相册：</h4>
					<div class="slider-box">
						<ul>
							<c:if test="${film.images != null }">
	    						<c:forEach var="image" items="${film.images}" varStatus="status">
	    							<c:if test="${status.count == 1 }">
	    								<li class="selected"><img src="<%=basePath %>${image.filmImage }" class="thumb" /></li>
	    							</c:if>
	    							<c:if test="${status.count > 1 }">
	    								<li><img src="<%=basePath %>${image.filmImage }" class="thumb" /></li>
	    							</c:if>
	    						</c:forEach>
	    					</c:if>
						</ul>
					</div>
					<div class="slider-num">
						<ul>
							<c:if test="${film.images != null }">
	    						<c:forEach var="image" items="${film.images}" varStatus="status">
	    							<c:if test="${status.count == 1 }">
	    								<li class="selected"></li>
	    							</c:if>
	    							<c:if test="${status.count > 1 }">
	    								<li></li>
	    							</c:if>
	    						</c:forEach>
	    					</c:if>
						</ul>
					</div>
					<span class="opt prev">
						<i class="fa fa-angle-left"></i>
					</span>
					<span class="opt next">
						<i class="fa fa-angle-right"></i>
					</span>
				</div>
                <div class="baidu-share">
                	分享到：<div class="bdsharebuttonbox"><a href="#" class="bds_more" data-cmd="more"></a><a href="#" class="bds_qzone" data-cmd="qzone" title="分享到QQ空间"></a><a href="#" class="bds_tsina" data-cmd="tsina" title="分享到新浪微博"></a><a href="#" class="bds_tqq" data-cmd="tqq" title="分享到腾讯微博"></a><a href="#" class="bds_renren" data-cmd="renren" title="分享到人人网"></a><a href="#" class="bds_weixin" data-cmd="weixin" title="分享到微信"></a></div>
					<script>window._bd_share_config={"common":{"bdSnsKey":{},"bdText":"","bdMini":"2","bdMiniList":false,"bdPic":"","bdStyle":"0","bdSize":"16"},"share":{},"image":{"viewList":["qzone","tsina","tqq","renren","weixin"],"viewText":"分享到：","viewSize":"16"},"selectShare":{"bdContainerClass":null,"bdSelectMiniList":["qzone","tsina","tqq","renren","weixin"]}};with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion='+~(-new Date()/36e5)];</script> 
                </div>
                <div class="content-links">
                	<span class="prev pull-left">
                		<a href=""><i class="fa fa-angle-left"></i> 上一部：《战狼系列》</a>
                	</span>
                	<span class="next pull-right">
                		<a href="">下一部：《指环王》系列高清下载  <i class="fa fa-angle-right"></i></a>
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
					</ul>
					<a href="javascript: void(0)" onclick="loadmore()" class="load-more">没有更多了...</a>
                </div>
			</div>
			<!-- JustFresh 2017-08-17 end 左侧文章内容详情部分 -->
			
			<!-- JustFresh 2017-08-17 begin 右侧推荐部分 -->
			<div class="recommends pull-right">
				<aside>
					<div class="widget_container">
						<h3><b><span>热门</span> 下载</b></h3>
						<ul>
							<li><a href="#"><i class="fa fa-film"></i> 《权利的游戏》第七季720p全集下载</a></li>
							<li><a href="#"><i class="fa fa-film"></i> 《指环王》系列高清下载</a></li>
							<li><a href="#"><i class="fa fa-film"></i> 《加勒比海盗》系列下载</a></li>
							<li><a href="#"><i class="fa fa-film"></i> 《战狼》系列下载</a></li>
							<li><a href="#"><i class="fa fa-film"></i> 《生化危机》系列下载</a></li>
							<li><a href="#"><i class="fa fa-film"></i> 《霍比特人》系列下载</a></li>
							<li><a href="#"><i class="fa fa-film"></i> 《变形金刚》系列下载</a></li>
							<li><a href="#"><i class="fa fa-film"></i> 《国家宝藏》两部曲下载</a></li>
							<li><a href="#"><i class="fa fa-film"></i> 《战争之王》高清下载</a></li>
							<li><a href="#"><i class="fa fa-film"></i> 《肖申克的救赎》高清下载</a></li>
						</ul>
					</div>
					<div class="widget_container">
						<h3><b><span>最新</span> 添加</b></h3>
						<ul>
							<li><a href="#"><i class="fa fa-film"></i> 《权利的游戏》第七季720p全集下载</a></li>
							<li><a href="#"><i class="fa fa-film"></i> 《指环王》系列高清下载</a></li>
							<li><a href="#"><i class="fa fa-film"></i> 《加勒比海盗》系列下载</a></li>
							<li><a href="#"><i class="fa fa-film"></i> 《战狼》系列下载</a></li>
							<li><a href="#"><i class="fa fa-film"></i> 《生化危机》系列下载</a></li>
							<li><a href="#"><i class="fa fa-film"></i> 《霍比特人》系列下载</a></li>
							<li><a href="#"><i class="fa fa-film"></i> 《变形金刚》系列下载</a></li>
							<li><a href="#"><i class="fa fa-film"></i> 《国家宝藏》两部曲下载</a></li>
							<li><a href="#"><i class="fa fa-film"></i> 《战争之王》高清下载</a></li>
							<li><a href="#"><i class="fa fa-film"></i> 《肖申克的救赎》高清下载</a></li>
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
			<!-- JustFresh 2017-08-17 end 右侧推荐部分 -->
			
		</section>

	</section>
	<!-- JustFresh 2017-08-12 end 影片列表 -->
	
	<jsp:include page="/home/footer.htm"></jsp:include>
	<script type="text/javascript" src="<%=basePath %>assets/pagejs/home/film.js"></script>
</body>
</html>