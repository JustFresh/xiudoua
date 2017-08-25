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
	<link href="<%=basePath %>assets/pagecss/home/normallist.css" rel="stylesheet" type="text/css"/>
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
					<a href="<%=basePath %>home/normallist.htm">文字欲</a>
				</li>
			</ul>
		</div>
		<!-- 面包屑导航 -->
		<div class="clear"></div>
		
		<section class="content">
			<div class="two_third">
				<c:if test="${contentPage != null && contentPage.list != null}">
	    			<c:forEach var="article" items="${contentPage.list}">
	    				<div class="blog_element">
							<div class="baseinfo pull-left">
								<a href="<%=basePath %>home/content.htm?id=${article.id}" target="_blank">
									<img src="<%=basePath %>${article.thumb }" class="thumb" />
								</a><br>
					            <span class="post_comment">
					                <i class="fa fa-eye"></i> ${article.clickNum}
					            </span>
						         <span class="post_date">
					                <i class="fa fa-clock-o"></i> 
					                <jsp:setProperty name="dateValue" property="time" value="${article.createTime}"/>
									<fmt:formatDate value="${dateValue}" pattern="yyyy-MM-dd hh:mm"/>
					            </span>  
							</div>
							<div class="extinfo pull-right">
								<h4>
									<a href="<%=basePath %>home/content.htm?id=${article.id}" target="_blank">
										<c:choose>  
										    <c:when test="${fn:length(article.title) > 15}">  
										        <c:out value="${fn:substring(article.title, 0, 15)}..." />  
										    </c:when>  
										   <c:otherwise>  
										      <c:out value="${article.title}" /> 
										    </c:otherwise>  
										</c:choose>
									</a>
								</h4>      
						        <p>${article.abstracts }
						       	</p><br>
						        <a href="<%=basePath %>home/content.htm?id=${article.id}" target="_blank" class="read_more">阅读 详细</a>
							</div>
							<div class="clear"></div>
						</div>
						<span class="divider">&nbsp;</span>
	    			</c:forEach>
	    		</c:if>
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
						<li><a href="<%=basePath %>home/normallist.htm?id=${brandChannel.id }&page=1">首页</a></li>
						<li><a href="<%=basePath %>home/normallist.htm?id=${brandChannel.id }&page=${contentPage.previousPage}">上一页</a></li>
					</c:if>
					<c:if test="${contentPage.pageBar != null }">
						<c:forEach var="num" items="${contentPage.pageBar}" varStatus="status">
							<c:if test="${num == contentPage.currentPage }">
								<li class="active"><a href="<%=basePath %>home/normallist.htm?id=${brandChannel.id }&page=${num}">${num }</a></li>
							</c:if>
							<c:if test="${num != contentPage.currentPage }">
								<li><a href="<%=basePath %>home/normallist.htm?id=${brandChannel.id }&page=${num}">${num }</a></li>
							</c:if>
						</c:forEach>
					</c:if>
				    <c:if test="${contentPage.currentPage == contentPage.totalPage}">
				    	<li class="disabled"><a href="javascript: void(0)">下一页</a></li>
				    	<li class="disabled"><a href="javascript: void(0)">尾页</a></li>
				    </c:if>
				     <c:if test="${contentPage.currentPage < contentPage.totalPage}">
				    	<li><a href="<%=basePath %>home/normallist.htm?id=${brandChannel.id }&page=${contentPage.nextPage}">下一页</a></li>
				    	<li><a href="<%=basePath %>home/normallist.htm?id=${brandChannel.id }&page=${contentPage.totalPage}">尾页</a></li>
				    </c:if>
				  </ul>
			</div>
			<div class="clear"></div>
		</div>
		<!-- 分页部分 -->
	</section>
	<!-- JustFresh 2017-08-12 end 影片列表 -->
	
	<jsp:include page="/home/footer.htm"></jsp:include>
	<script type="text/javascript" src="<%=basePath %>assets/pagejs/home/normallist.js"></script>
</body>
</html>