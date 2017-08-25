<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:useBean id="dateValue" class="java.util.Date"/>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:include page="/admin/css.do"></jsp:include>
<link type="text/css" rel="stylesheet" href="<%=basePath %>assets/pagecss/admin/cms/film_cagetorys.css" />
<body>
	<jsp:include page="/admin/header.do"></jsp:include>
	<div class="main">
		<jsp:include page="/admin/left_nav.do"></jsp:include>
		<div class="content pull-right">
		
			<div class="container-fluid">
				<div class="row">
					<div class="col-sm-12 col-md-12">
						<div class="tab-nav">
							<ul class="pull-left">
								<li class="selected"><a href="javascript: void(0)">分类管理</a></li>
							</ul>
							<div class="opts pull-right">
								<a href="<%=basePath %>admin/index.htm?mod=cms&act=film_categorys&opt=film_category_mng" class="btn btn-success"><i class="fa fa-plus"></i> 添加分类</a>
							</div>
							<div class="clearfix"></div>
						</div>
					</div>
				</div>
			</div>
			
			<!-- JustFresh 条件查询表单部分 -->
			<div class="conditions container-fluid">
				<div class="row">
					<div class="col-sm-12 col-md-12">
						<div class="search-form pull-right">
							<form action="<%=basePath %>admin/index.htm" method="get">
								<input type="hidden" name="mod" value="cms" />
								<input type="hidden" name="act" value="film_categorys" />
								<input type="hidden" name="page" value="1" />
								<span class="form-element">
									<label>分类名称：</label>
									<input type="text" class="input-text" name="keywordName" value="${keywordName }" />
								</span>
								<span class="form-element">
									<label>父级分类：</label>
									<select name="parentId" class="input-select">
										<option value="">--查询所有--</option>
										<c:forEach var="model" items="${categoryList }" varStatus="status">
											<option value="${model.id }" <c:if test="${model.id==category.parentId }">selected</c:if>>${model.name }</option>
										</c:forEach>
									</select>
								</span>
								<span class="form-element">
									<label>状态：</label>
									<select name="status" class="input-select">
										<option value="">--查询所有--</option>
										<option value="1" <c:if test="${category.status==1 }">selected</c:if>>--启用--</option>
										<option value="-1" <c:if test="${category.status==-1 }">selected</c:if>>--禁用--</option>
									</select>
								</span>
								<span class="form-element">
									<label>分页数：</label>
									<select name="rows" class="input-select">
										<option value="10" <c:if test="${page.pageSize==10 }">selected</c:if>>10</option>
										<option value="20" <c:if test="${page.pageSize==20 }">selected</c:if>>20</option>
										<option value="50" <c:if test="${page.pageSize==50 }">selected</c:if>>50</option>
										<option value="100" <c:if test="${page.pageSize==100 }">selected</c:if>>100</option>
									</select>
								</span>
								<span class="form-element">
									<button type="submit" class="btn btn-warning"><i class="fa fa-search"></i> 搜索</button>
								</span>
							</form>
						</div>
					</div>
				</div>
			</div>
			<!-- JustFresh 条件查询表单部分 -->
			
			<div class="container-fluid content-table">
				<div class="row">
					<div class="col-sm-12 col-md-12">
						<table class="table table-striped table-bordered">
							<thead>
								<tr>
									<th>&nbsp;</th>
									<th>名称</th>
									<th>缩略图</th>
									<th>类型</th>
									<th>全称</th>
									<th>等级</th>
									<th>创建时间</th>
									<th>状态</th>
									<th>排序</th>
									<th style="text-align: center;width: 200px;">操作</th>
								</tr>
							</thead>
							<tbody>
								<c:if test="${page != null && page.list != null}">
									<c:forEach var="filmCategory" items="${page.list}" varStatus="status">
										<tr>
											<td width="30px"><input type="checkbox" value="${filmCategory.id }" name="filmCategoryIds" /></td>
											<td>${filmCategory.name }</td>
											<td><img src="<%=basePath %>${filmCategory.thumb}" style="max-height: 25px;"/></td>
											<td>
												<c:if test="${filmCategory.filmType == '1'}">
													电影单集
												</c:if>
												<c:if test="${filmCategory.filmType == '2'}">
													电视续集
												</c:if>
											</td>
											<td>
												${filmCategory.fullName }
											</td>
											<td>${filmCategory.level }</td>
											<td>
												<jsp:setProperty name="dateValue" property="time" value="${filmCategory.createTime}"/>
												<fmt:formatDate value="${dateValue}" pattern="yyyy-MM-dd HH:mm"/>
											</td>
											<td>
												<c:if test="${filmCategory.status == '1'}">
													<span style="color: #4cae4c">启用</span>
												</c:if>
												<c:if test="${filmCategory.status == '-1'}">
													<span style="color: #c33610">禁用</span>
												</c:if>
											</td>
											<td>${filmCategory.reorder }</td>
											<td>
												<c:if test="${filmCategory.status != null && filmCategory.status == 1}">
													<a href="javascript: void(0)" onclick="changeStatus(${filmCategory.id},-1)" class="btn-outline btn-outline-danger">禁用</a>
												</c:if>
												<c:if test="${filmCategory.status != null && filmCategory.status == -1}">
													<a href="javascript: void(0)" onclick="changeStatus(${filmCategory.id},1)" class="btn-outline btn-outline-info">启用</a>
												</c:if>
												<a href="<%=basePath %>admin/index.htm?mod=cms&act=film_categorys&opt=film_category_mng&id=${filmCategory.id}" class="btn-outline btn-outline-success">编辑</a>
												<a href="javascript: void(0)" onclick="removeFn(${filmCategory.id})" class="btn-outline btn-outline-danger">删除</a>
											</td>
										</tr>
									</c:forEach>
								</c:if>
								
							</tbody>
							<tfoot>
								<tr>
									<td colspan="10">
										<div class="paging-info pull-left">
											<span class="total" style="margin-right: 20px;">共有${page.totalRecord}条数据</span>
											<span class="">第${page.currentPage}/${page.totalPage}页</span>
										</div>
										<ul class="pagination pull-right" style="margin: 0px;">
										    <c:if test="${page.currentPage == 1}">
												<li class="disabled"><a href="javascript: void(0)">首页</a></li>
												<li class="disabled"><a href="javascript: void(0)">上一页</a></li>
											</c:if>
											<c:if test="${page.currentPage > 1}">
												<li><a href="<%=basePath %>admin/index.htm?mod=index&act=links&page=1&rows=${page.pageSize}">首页</a></li>
												<li><a href="<%=basePath %>admin/index.htm?mod=index&act=links&page=${page.previousPage}&rows=${page.pageSize}">上一页</a></li>
											</c:if>
											<c:if test="${page.pageBar != null }">
												<c:forEach var="num" items="${page.pageBar}" varStatus="status">
													<c:if test="${num == page.currentPage }">
														<li class="active"><a href="<%=basePath %>admin/index.htm?mod=index&act=links&page=${num}&rows=${page.pageSize}">${num }</a></li>
													</c:if>
													<c:if test="${num != page.currentPage }">
														<li><a href="<%=basePath %>admin/index.htm?mod=index&act=links&page=${num}&rows=${page.pageSize}">${num }</a></li>
													</c:if>
												</c:forEach>
											</c:if>
										    <c:if test="${page.currentPage == page.totalPage}">
										    	<li class="disabled"><a href="javascript: void(0)">下一页</a></li>
										    	<li class="disabled"><a href="javascript: void(0)">尾页</a></li>
										    </c:if>
										     <c:if test="${page.currentPage < page.totalPage}">
										    	<li><a href="<%=basePath %>admin/index.htm?mod=index&act=links&page=${page.nextPage}&rows=${page.pageSize}">下一页</a></li>
										    	<li><a href="<%=basePath %>admin/index.htm?mod=index&act=links&page=${page.totalPage}&rows=${page.pageSize}">尾页</a></li>
										    </c:if>
									  </ul>
									</td>
								</tr>
							</tfoot>
						</table>
					</div>
				</div>
			</div>
			
			<!-- JustFresh 底部操作按钮列表部分 -->
			<div class="clearfix"></div>
			<div class="container-fluid">
				<div class="row">
					<div class="col-sm-12 col-md-12">
						<div class="bottom-opts">
							<input type="checkbox" name="checkall" onclick="changeCheckboxStatus('filmCategoryIds')" />
							<a href="javascript: void(0)" onclick="batchRemove('filmCategoryIds','filmCategory')" class="btn-outline btn-outline-default">批量删除</a>
						</div>
					</div>
				</div>
			</div>
			
			<div class="clearfix"></div>
			<div style="height: 50px;width: 100%;"></div>
			
		</div>
	</div>
	<jsp:include page="/admin/js.do"></jsp:include>
	<script type="text/javascript" src="<%=basePath %>assets/pagejs/admin/cms/film_categorys.js" charset="utf-8"></script>
</body>