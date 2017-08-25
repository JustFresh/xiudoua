<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<div class="left-nav pull-left" id="leftNav">
	<ul>
		<%-- <li>
			<a href=""><i class="fa fa-cc"></i> <span class="hidden-small">文章中心</span></a>
			<dl>
				<dd><a href="<%=basePath %>admin/channel_list.do"><i class="fa fa-circle-o"></i> <span class="hidden-small">文章分类</span></a></dd>
				<dd><a href="<%=basePath %>admin/article_list.do"><i class="fa fa-circle-o"></i> <span class="hidden-small">文章列表</span></a></dd>
			</dl>
		</li> --%>
	</ul>
	
	<div style="height: 50px;width: 100%;"></div>
	
</div>