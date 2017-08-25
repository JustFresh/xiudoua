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
	<title>${brandChannel.name }-文章模块-秀逗啊网站</title>
	<jsp:include page="/home/css.htm"></jsp:include>
	<jsp:include page="/home/js.htm"></jsp:include>
	<!--[if lt IE 9]>
	<script type="text/javascript" src="js/html5.js"></script>
	<![endif]-->
	<!--[if lt IE 9]>
		<script type="text/javascript" src="js/css3-mediaqueries.js"></script>
	<![endif]-->
	<link href="<%=basePath %>assets/pagecss/home/imagelist.css" rel="stylesheet" type="text/css"/>
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
					<a href="javascript: void(0)">${brandChannel.name }</a>
				</li>
			</ul>
		</div>
		<!-- 面包屑导航 -->
		<div class="clear"></div>
		
		<section class="content">
			<div class="imagelist pull-left">
				<ul>
					<c:if test="${contentPage != null && contentPage.list != null}">
	    				<c:forEach var="article" items="${contentPage.list}">
	    					<li>
								<a href="<%=basePath %>home/content.htm?id=${article.id}" target="_blank">
									<img src="<%=basePath %>${article.thumb }" class="thumb" />
								</a>
								<h4><a href="<%=basePath %>home/content.htm?id=${article.id}" target="_blank">
									<c:choose>  
										    <c:when test="${fn:length(article.title) > 14}">  
										        <c:out value="${fn:substring(article.title, 0, 14)}..." />  
										    </c:when>  
										   <c:otherwise>  
										      <c:out value="${article.title}" /> 
										    </c:otherwise>  
										</c:choose>
								</a></h4>
								<p>
									<span class="pull-left">
										<i class="fa fa-eye"></i> ${article.clickNum}
									</span>
									<span class="pull-right">
										<i class="fa fa-clock-o"></i> 
										<jsp:setProperty name="dateValue" property="time" value="${article.createTime}"/>
										<fmt:formatDate value="${dateValue}" pattern="yyyy-MM-dd hh:mm"/>
									</span>
									<span class="clearfix"></span>
								</p>
								<p class="author">
									<a href="#">
										<img src="<%=basePath %>assets/images/home/content/1.jpg" class="head" />
										${article.authorName}
									</a>
								</p>
							</li>
	    				</c:forEach>
	    			</c:if>
				</ul>
				<div class="clear"></div>
			</div>
			
			<div class="recommend pull-right">
				<aside>
					<div class="widget_container">
						<h3><b><span>热门</span> 访问</b></h3>
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
						</ul>
					</div>
					
					<div class="widget_container videos">
						<h3><b><span>推荐</span> 视频</b></h3>
						<ul>
							<li>
								<a href="#">
									<img src="<%=basePath %>assets/images/home/video/1.jpg" class="thumb" />
								</a>
								<h4><a href="">我想我的思念是一种病.</a></h4>
							</li>
							<li>
								<a href="#">
									<img src="<%=basePath %>assets/images/home/video/2.jpg" class="thumb" />
								</a>
								<h4><a href="">我想我的思念是一种病.</a></h4>
							</li>
							<li>
								<a href="#">
									<img src="<%=basePath %>assets/images/home/video/3.jpg" class="thumb" />
								</a>
								<h4><a href="">我想我的思念是一种病.</a></h4>
							</li>
						</ul>
					</div>
				</aside>
			</div>
		</section>
		
		<!-- 分页部分 -->
		<div class="pagination">
			<div class="infoshow pull-left">
				当前第${contentPage.currentPage}/${contentPage.totalPage}页-共${contentPage.totalRecord}条记录
			</div>
			<div class="paging-detail pull-right">
				<ul>
				    <c:if test="${contentPage.currentPage == 1}">
						<li class="disabled"><a href="javascript: void(0)">首页</a></li>
						<li class="disabled"><a href="javascript: void(0)">上一页</a></li>
					</c:if>
					<c:if test="${contentPage.currentPage > 1}">
						<li><a href="<%=basePath %>home/imagelist.htm?id=${brandChannel.id }&page=1">首页</a></li>
						<li><a href="<%=basePath %>home/imagelist.htm?id=${brandChannel.id }&page=${contentPage.previousPage}">上一页</a></li>
					</c:if>
					<c:if test="${contentPage.pageBar != null }">
						<c:forEach var="num" items="${contentPage.pageBar}" varStatus="status">
							<c:if test="${num == contentPage.currentPage }">
								<li class="active"><a href="<%=basePath %>home/imagelist.htm?id=${brandChannel.id }&page=${num}">${num }</a></li>
							</c:if>
							<c:if test="${num != contentPage.currentPage }">
								<li><a href="<%=basePath %>home/imagelist.htm?id=${brandChannel.id }&page=${num}">${num }</a></li>
							</c:if>
						</c:forEach>
					</c:if>
				    <c:if test="${contentPage.currentPage == contentPage.totalPage}">
				    	<li class="disabled"><a href="javascript: void(0)">下一页</a></li>
				    	<li class="disabled"><a href="javascript: void(0)">尾页</a></li>
				    </c:if>
				     <c:if test="${contentPage.currentPage < contentPage.totalPage}">
				    	<li><a href="<%=basePath %>home/imagelist.htm?id=${brandChannel.id }&page=${contentPage.nextPage}">下一页</a></li>
				    	<li><a href="<%=basePath %>home/imagelist.htm?id=${brandChannel.id }&page=${contentPage.totalPage}">尾页</a></li>
				    </c:if>
				  </ul>
			</div>
			<div class="clear"></div>
		</div>
		<!-- 分页部分 -->
	</section>
	<!-- JustFresh 2017-08-12 end 影片列表 -->
	
	<jsp:include page="/home/footer.htm"></jsp:include>
	<script type="text/javascript" src="<%=basePath %>assets/pagejs/home/imagelist.js"></script>
</body>
</html>