<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<link href="<%=basePath %>assets/pagecss/home/header.css" rel="stylesheet" type="text/css"/>
<div id="background_bg"></div>
<section id="container">
	<!-- top section Start -->
	<header>
	    <figure id="logo"><a href="<%=basePath %>"><img src="<%=basePath %>assets/images/logo.png" alt="img" /></a></figure>
	    <div class="top_right">
	        <ul class="top_info">
	            <li><span class=" call_1st_col">QQ:</span> <span class="call_2nd_col">${settings.qq }</span></li>
	            <li><span class=" call_1st_col">微信:</span> <span class="call_2nd_col">${settings.weixinNumber }</span></li>
	            <li><span class=" call_1st_col">Email:</span> <span class="call_2nd_col">${settings.siteEmail }</span></li>
	        </ul>
	        <div id="social_media">
	            注册 | 登录 | QQ登录 | 微博登录 | 微信登录
	        </div> 
	    </div>
	</header>
	<!-- top section end -->
	
	<!-- Nav start -->
	<nav>
	    <div id="myslidemenu" class="jqueryslidemenu clearfix">
	        <ul>
	            <li><a href="<%=basePath %>" class="<c:if test="${activeNavTitle == null}">active</c:if>">首页</a></li>
	            <c:if test="${filmCategorys != null}">
					<c:forEach var="filmCategory" items="${filmCategorys}" varStatus="status">
						<li>
							<a href="<%=basePath %>home/filmlist.htm?id=${filmCategory.id}" class="<c:if test="${activeNavTitle == filmCategory.name}">active</c:if>">${filmCategory.name }</a>
							<c:if test="${filmCategory.children != null}">
								<ul>
									<c:forEach var="category" items="${filmCategory.children}">
										<li><a href="<%=basePath %>home/filmlist.htm?id=${category.id}">${category.name }</a></li>
									</c:forEach>
								</ul>
							</c:if>
						</li>
					</c:forEach>
				</c:if>
				<c:if test="${channels != null}">
					<c:forEach var="channel" items="${channels}" varStatus="status">
						<li>
							<c:if test="${channel.cType == 1}">
								<a href="<%=basePath %>home/imagelist.htm?id=${channel.id}" class="<c:if test="${activeNavTitle == channel.name}">active</c:if>">${channel.name }</a>
							</c:if>
							<c:if test="${channel.cType == 2}">
								<a href="<%=basePath %>home/normallist.htm?id=${channel.id}" class="<c:if test="${activeNavTitle == channel.name}">active</c:if>">${channel.name }</a>
							</c:if>
							<c:if test="${channel.cType == 3}">
								<a href="<%=basePath %>home/videolist.htm?id=${channel.id}" class="<c:if test="${activeNavTitle == channel.name}">active</c:if>">${channel.name }</a>
							</c:if>
							<c:if test="${channel.children != null}">
								<ul>
									<c:forEach var="child" items="${channel.children}">
										<c:if test="${child.cType == 1}">
											<li><a href="<%=basePath %>home/imagelist.htm?id=${child.id}">${child.name }</a></li>
										</c:if>
										<c:if test="${child.cType == 2}">
											<li><a href="<%=basePath %>home/normallist.htm?id=${child.id}">${child.name }</a></li>
										</c:if>
										<c:if test="${child.cType == 3}">
											<li><a href="<%=basePath %>home/videolist.htm?id=${child.id}">${child.name }</a></li>
										</c:if>
									</c:forEach>
								</ul>
							</c:if>
						</li>
					</c:forEach>
				</c:if>
	            <li><a href="<%=basePath %>home/contactme.htm" target="_blank">联系站长</a></li>
	        </ul>
	        <div class="search_box">
		        <form id="searchform" class="searchform" action="#" method="get">
		        	<span>
		        	<input id="s" class="text_input" type="text" placeholder="请输入要搜索的内容..." />
		        	</span>
		        	<button class="search_button"><i class="fa fa-search"></i></button>
		        </form>
		    </div>
	    </div>
	</nav>
	<!-- Nav end -->
	
</section>
<div id="floatNavbar">
	<div class="container">
		<div id="floatSlidemenu" class="jqueryslidemenu clearfix">
			<ul>
	           <li><a class="<c:if test="${activeNavTitle == null}">active</c:if>" href="<%=basePath %>">首页</a></li>
	           <c:if test="${filmCategorys != null}">
					<c:forEach var="filmCategory" items="${filmCategorys}" varStatus="status">
						<li>
							<a href="<%=basePath %>home/filmlist.htm?id=${filmCategory.id}" class="<c:if test="${activeNavTitle == filmCategory.name}">active</c:if>">${filmCategory.name }</a>
							<c:if test="${filmCategory.children != null}">
								<ul>
									<c:forEach var="category" items="${filmCategory.children}">
										<li><a href="<%=basePath %>home/filmlist.htm?id=${category.id}">${category.name }</a></li>
									</c:forEach>
								</ul>
							</c:if>
						</li>
					</c:forEach>
				</c:if>
	           <c:if test="${channels != null}">
					<c:forEach var="channel" items="${channels}" varStatus="status">
						<li>
							<c:if test="${channel.cType == 1}">
								<a href="<%=basePath %>home/imagelist.htm?id=${channel.id}" class="<c:if test="${activeNavTitle == channel.name}">active</c:if>">${channel.name }</a>
							</c:if>
							<c:if test="${channel.cType == 2}">
								<a href="<%=basePath %>home/normallist.htm?id=${channel.id}" class="<c:if test="${activeNavTitle == channel.name}">active</c:if>">${channel.name }</a>
							</c:if>
							<c:if test="${channel.cType == 3}">
								<a href="<%=basePath %>home/videolist.htm?id=${channel.id}" class="<c:if test="${activeNavTitle == channel.name}">active</c:if>">${channel.name }</a>
							</c:if>
							<c:if test="${channel.children != null}">
								<ul>
									<c:forEach var="child" items="${channel.children}">
										<c:if test="${child.cType == 1}">
											<li><a href="<%=basePath %>home/imagelist.htm?id=${child.id}">${child.name }</a></li>
										</c:if>
										<c:if test="${child.cType == 2}">
											<li><a href="<%=basePath %>home/normallist.htm?id=${child.id}">${child.name }</a></li>
										</c:if>
										<c:if test="${child.cType == 3}">
											<li><a href="<%=basePath %>home/videolist.htm?id=${child.id}">${child.name }</a></li>
										</c:if>
									</c:forEach>
								</ul>
							</c:if>
						</li>
					</c:forEach>
				</c:if>
	           <li><a href="<%=basePath %>home/contactme.htm" target="_blank">联系站长</a></li>
	       </ul>
	       <div class="search_box">
		        <form id="searchform" class="searchform" action="#" method="get">
		        	<span>
		        	<input id="s" class="text_input" type="text" placeholder="请输入要搜索的内容..." />
		        	</span>
		        	<button class="search_button"><i class="fa fa-search"></i></button>
		        </form>
		    </div>
		</div>
	</div>
</div>