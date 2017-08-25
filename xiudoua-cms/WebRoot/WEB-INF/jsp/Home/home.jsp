<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:useBean id="dateValue" class="java.util.Date"/>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<link href="<%=basePath %>assets/pagecss/home/home.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript">
	// Elastic Slider
	$(function() {
	$('#ei-slider').eislideshow({
	easing		: 'easeOutExpo',
	titleeasing	: 'easeOutExpo',
	titlespeed	: 1200
	});
	});// 
</script>
<!--[if lt IE 9]>
<script type="text/javascript" src="js/html5.js"></script>
<![endif]-->
<!--[if lt IE 9]>
	<script type="text/javascript" src="js/css3-mediaqueries.js"></script>
<![endif]-->
<style type="text/css">
h3{color: #ff9000 !important;}
</style>
<section id="container">
	<!-- Elastic Slider Start -->
	<div id="ei-slider" class="ei-slider">
	    <ul class="ei-slider-large">
	    	<c:if test="${adsPage != null && adsPage.list != null}">
	    		<c:forEach var="ads" items="${adsPage.list}" varStatus="status">
	    			<li>
			        	<a href="${ads.linkUrl}" target="_blank">
				            <img src="<%=basePath %>${ads.thumb}" alt="img" />
				            <div class="ei-title">
				                <h2><span>${ads.name }</span></h2>
				                <h3>${ads.title }</h3>
				            </div>
			            </a>
			        </li>
	    		</c:forEach>
	    	</c:if>
	    </ul>
	    <ul class="ei-slider-thumbs">
	    	<c:if test="${adsPage != null && adsPage.list != null}">
	    		<li class="ei-slider-element">1</li>
	    		<c:forEach var="ads" items="${adsPage.list}" varStatus="status">
	    			<li><a href="#">${status.count }</a></li>
	    		</c:forEach>
	    	</c:if>
	    </ul>
	</div>
	<div class="clear"></div>
	<!-- Elastic Slider end -->
	
	<div class="new-movies">
		<h3><span><i class="fa fa-film"></i> 最新电影</span></h3>
		<ul>
			<c:if test="${filmPage != null && filmPage.list != null}">
				<c:forEach var="film" items="${filmPage.list}" varStatus="status">
					<li>
						<a href="<%=basePath %>home/film.htm?id=${film.id}">
							<img src="<%=basePath %>${film.thumb}" />
						</a>
			            <p><a href="<%=basePath %>home/film.htm?id=${film.id}">${film.title}</a></p>
			            <p>
			            	<span class="pull-left">豆瓣：${film.douban}</span>
			            	<span class="pull-right"><i class="fa fa-clock-o"></i>
			            		<jsp:setProperty name="dateValue" property="time" value="${film.createTime}"/>
								<fmt:formatDate value="${dateValue}" pattern="yyyy-MM-dd"/>
			            	</span>
			            </p>
					</li>
				</c:forEach>
			</c:if>
			<%-- <li>
				<a href="#">
					<img src="<%=basePath %>assets/images/default-film.jpg" />
				</a>
	            <p><a href="#">2017高分犯罪悬疑《记忆大师》HD1080P.国语中字</a></p>
	            <p>
	            	<span class="pull-left"><i class="fa fa-eye"></i> 123</span>
	            	<span class="pull-right"><i class="fa fa-clock-o"></i> 2017-08-03</span>
	            </p>
			</li> --%>
		</ul>
		<div class="clear"></div>
	</div>
	
	<section class="content">
		<div class="one_third">
		    <div class="widget_container">
		        <h3><span><i class="fa fa-youtube-play"></i> 电视剧</span></h3>
		        <dl>
		        	<c:if test="${tvPage != null && tvPage.list != null}">
						<c:forEach var="tv" items="${tvPage.list}" varStatus="status">
							<c:if test="${status.count == 1}">
								<dt>
					        		<a href="<%=basePath %>home/film.htm?id=${tv.id}">
										<img src="<%=basePath %>${tv.thumb }" class="thumb_img" />
									</a>
					                <div class="description pull-left">
					                    <h4>${tv.title }</h4>
					                    <p>${tv.abstracts }</p>
					                    <p>
					                    	<span class="pull-left">
					                    		豆瓣 ${tv.douban }
					                    	</span>
					                    	<span class="pull-right">
					                    		<i class="fa fa-clock-o"></i> 
					                    		<jsp:setProperty name="dateValue" property="time" value="${tv.createTime}"/>
												<fmt:formatDate value="${dateValue}" pattern="yyyy-MM-dd"/>
					                    	</span>
					                    </p>
					                </div>
					                <div class="clear"></div>
					        	</dt>
							</c:if>
							<c:if test="${status.count > 1}">
								<dd>
					        		<a href="<%=basePath %>home/film.htm?id=${tv.id}">
					        			<span class="pull-left">
					        				<i class="fa fa-youtube-play"></i>
					        				${tv.title }
					        			</span>
					        		</a>
					        		<span class="pull-right"><i class="fa fa-clock-o"></i> 
					        			<jsp:setProperty name="dateValue" property="time" value="${tv.createTime}"/>
										<fmt:formatDate value="${dateValue}" pattern="yyyy-MM-dd"/>
					        		</span>
					        	</dd>
							</c:if>
						</c:forEach>
					</c:if>
		        </dl>
		    </div>
	    </div>
	    
	    <div class="one_third">
		    <div class="widget_container">
		        <h3><span><i class="fa fa-random"></i> 综艺</span></h3>
		        <dl>
		        	<c:if test="${varietyPage != null && varietyPage.list != null}">
						<c:forEach var="variety" items="${varietyPage.list}" varStatus="status">
							<c:if test="${status.count == 1}">
								<dt>
					        		<a href="<%=basePath %>home/film.htm?id=${variety.id}">
										<img src="<%=basePath %>${variety.thumb }" class="thumb_img" />
									</a>
					                <div class="description pull-left">
					                    <h4>${variety.title }</h4>
					                    <p>${variety.abstracts }</p>
					                    <p>
					                    	<span class="pull-left">
					                    		豆瓣 ${variety.douban }
					                    	</span>
					                    	<span class="pull-right">
					                    		<i class="fa fa-clock-o"></i> 
					                    		<jsp:setProperty name="dateValue" property="time" value="${variety.createTime}"/>
												<fmt:formatDate value="${dateValue}" pattern="yyyy-MM-dd"/>
					                    	</span>
					                    </p>
					                </div>
					                <div class="clear"></div>
					        	</dt>
							</c:if>
							<c:if test="${status.count > 1}">
								<dd>
					        		<a href="<%=basePath %>home/film.htm?id=${variety.id}">
					        			<span class="pull-left">
					        				<i class="fa fa-youtube-play"></i>
					        				${variety.title }
					        			</span>
					        		</a>
					        		<span class="pull-right"><i class="fa fa-clock-o"></i> 
					        			<jsp:setProperty name="dateValue" property="time" value="${variety.createTime}"/>
										<fmt:formatDate value="${dateValue}" pattern="yyyy-MM-dd"/>
					        		</span>
					        	</dd>
							</c:if>
						</c:forEach>
					</c:if>
		        </dl>
		    </div>
	    </div>
	    
	    <div class="one_third_last">
		    <div class="widget_container">
		        <h3><span><i class="fa fa-pause"></i> 动漫</span></h3>
		        <dl>
		        	<c:if test="${comicPage != null && comicPage.list != null}">
						<c:forEach var="comic" items="${comicPage.list}" varStatus="status">
							<c:if test="${status.count == 1}">
								<dt>
					        		<a href="<%=basePath %>home/film.htm?id=${comic.id}">
										<img src="<%=basePath %>${comic.thumb }" class="thumb_img" />
									</a>
					                <div class="description pull-left">
					                    <h4>${comic.title }</h4>
					                    <p>${comic.abstracts }</p>
					                    <p>
					                    	<span class="pull-left">
					                    		豆瓣 ${comic.douban }
					                    	</span>
					                    	<span class="pull-right">
					                    		<i class="fa fa-clock-o"></i> 
					                    		<jsp:setProperty name="dateValue" property="time" value="${comic.createTime}"/>
												<fmt:formatDate value="${dateValue}" pattern="yyyy-MM-dd"/>
					                    	</span>
					                    </p>
					                </div>
					                <div class="clear"></div>
					        	</dt>
							</c:if>
							<c:if test="${status.count > 1}">
								<dd>
					        		<a href="<%=basePath %>home/film.htm?id=${comic.id}">
					        			<span class="pull-left">
					        				<i class="fa fa-youtube-play"></i>
					        				${comic.title }
					        			</span>
					        		</a>
					        		<span class="pull-right"><i class="fa fa-clock-o"></i> 
					        			<jsp:setProperty name="dateValue" property="time" value="${comic.createTime}"/>
										<fmt:formatDate value="${dateValue}" pattern="yyyy-MM-dd"/>
					        		</span>
					        	</dd>
							</c:if>
						</c:forEach>
					</c:if>
		        </dl>
		    </div>
	    </div>
	    
	</section>

	<section id="navbar">
		<ul class="slider-box">
			<c:if test="${navbarPage != null && navbarPage.list != null}">
				<c:forEach var="navbar" items="${navbarPage.list}" varStatus="status">
					<c:if test="${status.count == 1}">
						<li class="selected">
					</c:if>
					<c:if test="${status.count > 1}">
						<li>
					</c:if>
							<a href="${navbar.linkUrl }" target="_blank"><img src="<%=basePath %>${navbar.thumb }" /></a>
						<p>
							${navbar.title }
						</p>
					</li>
				</c:forEach>
			</c:if>
		</ul>
		<ul class="slider-num">
			<c:if test="${navbarPage != null && navbarPage.list != null}">
				<c:forEach var="navbar" items="${navbarPage.list}" varStatus="status">
					<c:if test="${status.count == 1}">
						<li class="selected">1</li>
					</c:if>
					<c:if test="${status.count > 1}">
						<li>${status.count }</li>
					</c:if>
				</c:forEach>
			</c:if>
		</ul>
	</section>
	
	<!-- JustFresh 2017-08-03 begin CMS常用栏目版块数据 -->
	<section class="cms-main">
		<div class="one-third font-show">
		    <h3><i class="fa fa-font"></i> 文字欲</h3>
		    <ul>
		    	<c:if test="${fontsPage != null && fontsPage.list != null}">
					<c:forEach var="fonts" items="${fontsPage.list}" varStatus="status">
						<li>
				    		<span class="pull-left"><i class="fa fa-font"></i> 
				    			<a href="<%=basePath %>home/content.htm?id=${fonts.id}" target="_blank">${fonts.title }</a>
				    		</span>
				    		<span class="pull-right"><i class="fa fa-clock-o"></i> 
				    			<jsp:setProperty name="dateValue" property="time" value="${fonts.createTime}"/>
								<fmt:formatDate value="${dateValue}" pattern="yyyy-MM-dd"/>
				    		</span>
				    	</li>
					</c:forEach>
				</c:if>
		    </ul>
		</div>
		<div class="one-third img-show">
		    <h3><i class="fa fa-image"></i> 图片说</h3>
		    <ul>
		    	<c:if test="${imagesPage != null && imagesPage.list != null}">
					<c:forEach var="images" items="${imagesPage.list}">
						<li>
				    		<a href="<%=basePath %>home/content.htm?id=${images.id}">
								<img src="<%=basePath %>${images.thumb}" class="thumb_img" />
							</a>
							<p class="pull-left"><a href="<%=basePath %>home/content.htm?id=${images.id}" target="_blank">${images.title }</a></p>
							<div class="pull-right"><i class="fa fa-clock-o"></i> 
								<jsp:setProperty name="dateValue" property="time" value="${images.createTime}"/>
								<fmt:formatDate value="${dateValue}" pattern="yyyy-MM-dd"/>
							</div>
							<div class="clearfix"></div>
				    	</li>
					</c:forEach>
				</c:if>
		    </ul>
		</div>
		<div class="one-third-last">
			<h4>
				<ul class="tab-nav">
					<li>视频展</li>
					<li class="selected"><a href="#">开发视频</a></li>
					<li><a href="#">搞笑视频</a></li>
				</ul>
				<div class="clearfix"></div>
			</h4>
		    <ul class="tab-panel">
		    	<li class="selected">
		    		<dl>
		    			<c:if test="${developVideoPage != null && developVideoPage.list != null}">
							<c:forEach var="develop" items="${developVideoPage.list}">
								<dd>
				    				<a href="<%=basePath %>home/content.htm?id=${develop.id}" target="_blank">
				    					<img src="<%=basePath %>${develop.thumb}" />
				    					<p>
				    						<c:choose>  
											    <c:when test="${fn:length(develop.title) > 15}">  
											        <c:out value="${fn:substring(develop.title, 0, 15)}..." />  
											    </c:when>  
											   <c:otherwise>  
											      <c:out value="${develop.title}" />  
											    </c:otherwise>  
											</c:choose>
				    					</p>
				    				</a>
				    			</dd>
							</c:forEach>
						</c:if>
		    		</dl>
		    	</li>
		    	<li>
		    		<dl>
		    			<c:if test="${funnyVideoPage != null && funnyVideoPage.list != null}">
							<c:forEach var="funny" items="${funnyVideoPage.list}">
								<dd>
				    				<a href="<%=basePath %>home/content.htm?id=${funny.id}" target="_blank">
				    					<img src="<%=basePath %>${funny.thumb}" />
				    					<p>
				    						<c:choose>  
											    <c:when test="${fn:length(funny.title) > 15}">  
											        <c:out value="${fn:substring(funny.title, 0, 15)}..." />  
											    </c:when>  
											   <c:otherwise>  
											      <c:out value="${funny.title}" />  
											    </c:otherwise>  
											</c:choose>
				    					</p>
				    				</a>
				    			</dd>
							</c:forEach>
						</c:if>
		    		</dl>
		    	</li>
		    </ul>
		</div>
	</section>
	<div class="clear"></div>
	<!-- JustFresh 2017-08-03 end CMS常用栏目版块数据 -->
	
</section>
<div class="clear"></div>

<!-- JustFresh 2017-08-03 begin 用户投稿部分 -->
<div id="contactUs" class="contact-us">
	<div class="container">
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
</div>
<!-- JustFresh 2017-08-03 end 用户投稿部分 -->
<script type="text/javascript" src="<%=basePath %>assets/pagejs/home/home.js"></script>