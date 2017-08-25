<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<style type="text/css">
.container{width: 1200px;margin: 0px auto;}
#links{margin-bottom: 30px;}
#links h3{border-bottom: 1px dashed #999;padding-bottom: 15px;color: #666;}
#links ul{}
#links ul li{float: left;margin: 15px 10px 0px 0px;}
</style>
<!-- JustFresh 2017-08-03 begin 友情链接部分 -->
<section class="container" id="links">
	<h3><i class="fa fa-link"></i> 友情链接</h3>
	<ul>
		<c:if test="${linksList != null}">
	    	<c:forEach var="links" items="${linksList}">
	    		<li><a href="${links.url }" target="_blank">${links.name }</a></li>
	    	</c:forEach>
	    </c:if>
	</ul>
	<div class="clear"></div>
</section>
<!-- JustFresh 2017-08-03 end 友情链接部分 -->

<!--  Footer bottom Start -->
<section class="container">
	<div class="copyright">
		<p>
			免责声明 › 本站所有资源信息均从互联网搜索而来，本站不对显示的内容承担责任
		</p>
		<p>如您认为本站页面信息侵犯了您的权益，请附上版权证明邮件告知，在收到邮件后24小时内删除</p>
		<p>
			邮箱：justfresh@foxmail.com &copy; Copyright JustFresh个人所有<a target="_blank" href="http://www.xiudoua.com">www.xiudoua.com</a>
		</p>
	</div>
</section>
<!--  Footer bottom End -->