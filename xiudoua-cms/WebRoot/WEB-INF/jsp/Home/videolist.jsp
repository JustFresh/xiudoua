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
	<link href="<%=basePath %>assets/pagecss/home/videolist.css" rel="stylesheet" type="text/css"/>
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
			<!-- JustFresh 2017-05-25 begin 条件查询部分开始 -->
			<div id="conditions" class="pjh-container">
				<div class="box">
					<div class="con-line">
						<div class="name pull-left">视频类别：</div>
						<div class="list pull-left">
							<ul>
								<li><a href="#">全部</a></li>
								<li class="selected"><a href="#">开发视频</a></li>
								<li><a href="#">LOL视频</a></li>
								<li><a href="#">搞笑视频</a></li>
							</ul>
						</div>
						<div class="clearfix"></div>
					</div>
					<div class="con-line">
						<div class="name pull-left">关键字：</div>
						<div class="list pull-left">
							<ul>
								<li class="selected"><a href="#">全部</a></li>
								<li><a href="#">JustFresh</a></li>
								<li><a href="#">JAVA</a></li>
								<li><a href="#">前端</a></li>
								<li><a href="#">LOL</a></li>
								<li><a href="#">PHP</a></li>
								<li><a href="#">杂谈</a></li>
							</ul>
						</div>
						<div class="clearfix"></div>
					</div>
				</div>
			</div>
			<div class="clearfix"></div>
			<!-- JustFresh 2017-05-25 end 条件查询部分结束 -->
			
			<!-- JustFresh 2017-08-15 begin 推荐部分开始 -->
			<div id="recommends">
				<div class="slider pull-left">
					<div class="slider-box">
						<ul>
							<c:if test="${slider != null && slider.list != null}">
	    						<c:forEach var="article" items="${slider.list}" varStatus="status">
									<c:if test="${status.count == 1}">
										<li class="selected">
									</c:if>
									<c:if test="${status.count > 1}">
										<li>
									</c:if>
									<a href="<%=basePath %>home/media.htm?id=${article.id }" target="_blank">
											<div class="bg">
												<i class="fa fa-play-circle-o"></i>
											</div>
										</a>
										<a href="#">
											<img src="<%=basePath %>${article.thumb }" class="thumb" />
										</a>
									</li>
								</c:forEach>
							</c:if>
						</ul>
					</div>
					<div class="slider-num">
						<ul>
							<c:if test="${slider != null && slider.list != null}">
	    						<c:forEach var="article" items="${slider.list}" varStatus="status">
	    							<c:if test="${status.count == 1}">
										<li class="selected">1</li>
									</c:if>
									<c:if test="${status.count > 1}">
										<li>${status.count }</li>
									</c:if>
								</c:forEach>
							</c:if>
						</ul>
					</div>
				</div>
				
				<div class="list pull-right">
					<ul>
						<c:if test="${recommends != null && recommends.list != null}">
	    					<c:forEach var="article" items="${recommends.list}" varStatus="status">
	    						<li>
									<a href="<%=basePath %>home/media.htm?id=${article.id }" target="_blank">
										<div class="bg">
											<i class="fa fa-play-circle-o"></i>
										</div>
									</a>
									<a href="<%=basePath %>home/media.htm?id=${article.id }" target="_blank">
										<img src="<%=basePath %>${article.thumb }" class="thumb" />
									</a>
									<p>
										<a href="<%=basePath %>home/media.htm?id=${article.id }" target="_blank">
											<c:choose>  
											    <c:when test="${fn:length(article.title) > 15}">  
											        <c:out value="${fn:substring(article.title, 0, 15)}..." />  
											    </c:when>  
											   <c:otherwise>  
											      <c:out value="${article.title}" /> 
											    </c:otherwise>  
											</c:choose>
										</a>
									</p>
								</li>
	    					</c:forEach>
	    				</c:if>
					</ul>
				</div>
				
				<div class="clear"></div>
			</div>
			<!-- JustFresh 2017-08-15 end 推荐部分结束 -->
			
			<!-- JustFresh 2017-08-15 begin 视频列表部分开始 -->
			<div id="videoList">
				<div class="title">
					<span>${brandChannel.name }</span>
				</div>
				<ul>
					<c:if test="${contentPage != null && contentPage.list != null}">
	    				<c:forEach var="article" items="${contentPage.list}">
	    					<li>
								<a href="<%=basePath %>home/media.htm?id=${article.id}" target="_blank">
									<div class="bg">
										<i class="fa fa-play-circle-o"></i>
									</div>
								</a>
								<a href="<%=basePath %>home/media.htm?id=${article.id}" target="_blank">
									<img src="<%=basePath %>${article.thumb }" class="thumb" />
								</a>
								<p><a href="<%=basePath %>home/media.htm?id=${article.id}" target="_blank">
									<c:choose>  
									    <c:when test="${fn:length(article.title) > 13}">  
									        <c:out value="${fn:substring(article.title, 0, 13)}..." />  
									    </c:when>  
									   <c:otherwise>  
									      <c:out value="${article.title}" /> 
									    </c:otherwise>  
									</c:choose>
								</a></p>
								<p>
									<span class="pull-left"><i class="fa fa-clock-o"></i> 
										<jsp:setProperty name="dateValue" property="time" value="${article.createTime}"/>
										<fmt:formatDate value="${dateValue}" pattern="yyyy-MM-dd hh:mm"/>
									</span>
									<span class="pull-right"><i class="fa fa-eye"></i> ${article.clickNum }</span>
									<span class="clear"></span>
								</p>
							</li>
	    				</c:forEach>
	    			</c:if>
				</ul>
				
				<div class="clear"></div>
			</div>
			<!-- JustFresh 2017-08-15 end 视频列表部分结束 -->
			
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
						<li><a href="<%=basePath %>home/videolist.htm?id=${brandChannel.id }&page=1">首页</a></li>
						<li><a href="<%=basePath %>home/videolist.htm?id=${brandChannel.id }&page=${contentPage.previousPage}">上一页</a></li>
					</c:if>
					<c:if test="${contentPage.pageBar != null }">
						<c:forEach var="num" items="${contentPage.pageBar}" varStatus="status">
							<c:if test="${num == contentPage.currentPage }">
								<li class="active"><a href="<%=basePath %>home/videolist.htm?id=${brandChannel.id }&page=${num}">${num }</a></li>
							</c:if>
							<c:if test="${num != contentPage.currentPage }">
								<li><a href="<%=basePath %>home/videolist.htm?id=${brandChannel.id }&page=${num}">${num }</a></li>
							</c:if>
						</c:forEach>
					</c:if>
				    <c:if test="${contentPage.currentPage == contentPage.totalPage}">
				    	<li class="disabled"><a href="javascript: void(0)">下一页</a></li>
				    	<li class="disabled"><a href="javascript: void(0)">尾页</a></li>
				    </c:if>
				     <c:if test="${contentPage.currentPage < contentPage.totalPage}">
				    	<li><a href="<%=basePath %>home/videolist.htm?id=${brandChannel.id }&page=${contentPage.nextPage}">下一页</a></li>
				    	<li><a href="<%=basePath %>home/videolist.htm?id=${brandChannel.id }&page=${contentPage.totalPage}">尾页</a></li>
				    </c:if>
				  </ul>
			</div>
			<div class="clear"></div>
		</div>
		<!-- 分页部分 -->
	</section>
	<!-- JustFresh 2017-08-12 end 影片列表 -->
	
	<jsp:include page="/home/footer.htm"></jsp:include>
	<script type="text/javascript" src="<%=basePath %>assets/pagejs/home/videolist.js"></script>
</body>
</html>