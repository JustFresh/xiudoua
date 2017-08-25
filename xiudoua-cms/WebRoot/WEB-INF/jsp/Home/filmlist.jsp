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
	<title>${brandCategory.name }-影片模块-秀逗啊网站</title>
	<jsp:include page="/home/css.htm"></jsp:include>
	<jsp:include page="/home/js.htm"></jsp:include>
	<!--[if lt IE 9]>
	<script type="text/javascript" src="js/html5.js"></script>
	<![endif]-->
	<!--[if lt IE 9]>
		<script type="text/javascript" src="js/css3-mediaqueries.js"></script>
	<![endif]-->
	<link href="<%=basePath %>assets/pagecss/home/flimlist.css" rel="stylesheet" type="text/css"/>
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
					<a href="javascript: void(0)">${brandCategory.name }</a>
				</li>
			</ul>
		</div>
		<!-- 面包屑导航 -->
		<div class="clear"></div>
		
		<div class="filmlist">
			<ul>
				<c:if test="${filmPage != null && filmPage.list != null}">
	    			<c:forEach var="film" items="${filmPage.list}" varStatus="status">
	    				<li>
							<a href="<%=basePath %>home/film.htm?id=${film.id}" target="_blank">
								<img src="<%=basePath %>${film.thumb }" />
							</a>
				            <p>
				            	<a href="<%=basePath %>home/film.htm?id=${film.id}" target="_blank">
				            		<c:choose>  
									    <c:when test="${fn:length(film.title) > 15}">  
									        <c:out value="${fn:substring(film.title, 0, 15)}..." />  
									    </c:when>  
									   <c:otherwise>  
									      <c:out value="${film.title}" /> 
									    </c:otherwise>  
									</c:choose>
				            	</a>
				            </p>
				            <p>
				            	<span class="pull-left">豆瓣 ${film.douban }</span>
				            	<span class="pull-right"><i class="fa fa-clock-o"></i> 
				            		<jsp:setProperty name="dateValue" property="time" value="${film.createTime}"/>
									<fmt:formatDate value="${dateValue}" pattern="yyyy-MM-dd"/>
				            	</span>
				            </p>
						</li>
	    			</c:forEach>
	    		</c:if>
			</ul>
			<div class="clear"></div>
		</div>
		
		<!-- 分页部分 -->
		<div class="pagination">
			<div class="infoshow pull-left">
				当前第${filmPage.currentPage}/${filmPage.totalPage}页-共${filmPage.totalRecord}条记录
			</div>
			<div class="paging-detail pull-right">
				<ul>
					<c:if test="${filmPage.currentPage == 1}">
						<li class="disabled"><a href="javascript: void(0)">首页</a></li>
						<li class="disabled"><a href="javascript: void(0)">上一页</a></li>
					</c:if>
					<c:if test="${filmPage.currentPage > 1}">
						<li><a href="<%=basePath %>home/filmlist.htm?id=${brandCategory.id }&page=1">首页</a></li>
						<li><a href="<%=basePath %>home/filmlist.htm?id=${brandCategory.id }&page=${filmPage.previousPage}">上一页</a></li>
					</c:if>
					<c:if test="${filmPage.pageBar != null }">
						<c:forEach var="num" items="${filmPage.pageBar}" varStatus="status">
							<c:if test="${num == filmPage.currentPage }">
								<li class="active"><a href="<%=basePath %>home/filmlist.htm?id=${brandCategory.id }&page=${num}">${num }</a></li>
							</c:if>
							<c:if test="${num != filmPage.currentPage }">
								<li><a href="<%=basePath %>home/filmlist.htm?id=${brandCategory.id }&page=${num}">${num }</a></li>
							</c:if>
						</c:forEach>
					</c:if>
				    <c:if test="${filmPage.currentPage == filmPage.totalPage}">
				    	<li class="disabled"><a href="javascript: void(0)">下一页</a></li>
				    	<li class="disabled"><a href="javascript: void(0)">尾页</a></li>
				    </c:if>
				     <c:if test="${filmPage.currentPage < filmPage.totalPage}">
				    	<li><a href="<%=basePath %>home/filmlist.htm?id=${brandCategory.id }&page=${filmPage.nextPage}">下一页</a></li>
				    	<li><a href="<%=basePath %>home/filmlist.htm?id=${brandCategory.id }&page=${filmPage.totalPage}">尾页</a></li>
				    </c:if>
				 </ul>
			</div>
			<div class="clear"></div>
		</div>
		<!-- 分页部分 -->
	</section>
	<!-- JustFresh 2017-08-12 end 影片列表 -->
	
	<jsp:include page="/home/footer.htm"></jsp:include>
	<script type="text/javascript" src="<%=basePath %>assets/pagejs/home/filmlist.js"></script>
</body>
</html>