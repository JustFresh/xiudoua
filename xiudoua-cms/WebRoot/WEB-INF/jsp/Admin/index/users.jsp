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
<link type="text/css" rel="stylesheet" href="<%=basePath %>assets/pagecss/admin/index/links.css" />
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
								<li class="selected"><a href="<%=basePath %>admin/index.htm?mod=index&act=users">系统用户</a></li>
							</ul>
							<div class="opts pull-right">
								<a href="<%=basePath %>admin/index.htm?mod=index&act=users&opt=user_mng" class="btn btn-success"><i class="fa fa-plus"></i> 添加系统用户</a>
								<a href="javascript: void(0)" onclick="exportXls()" class="btn btn-info"><i class="fa fa-file-excel-o"></i> 导出Excel</a>
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
								<input type="hidden" name="mod" value="index" />
								<input type="hidden" name="act" value="users" />
								<input type="hidden" name="page" value="1" />
								
								<span class="form-element">
									<label>昵称：</label>
									<input type="text" class="input-text" name="keywordNickName" value="${keywordNickName }" />
								</span>
								<span class="form-element">
									<label>电话：</label>
									<input type="text" class="input-text" name="phone" value="${user.phone }" />
								</span>
								<span class="form-element">
									<label>Email：</label>
									<input type="text" class="input-text" name="email" value="${user.email }" />
								</span>
								<span class="form-element">
									<label>电话验证：</label>
									<select name="isCheckPhone" class="input-select">
										<option value="0">--查看所有--</option>
										<option value="-1" <c:if test="${user.isCheckPhone==-1 }">selected</c:if>>--未验证--</option>
										<option value="1" <c:if test="${user.isCheckPhone==1 }">selected</c:if>>--已验证--</option>
									</select>
								</span>
								<span class="form-element">
									<label>Email验证：</label>
									<select name="isCheckEmail" class="input-select">
										<option value="0">--查看所有--</option>
										<option value="-1" <c:if test="${user.isCheckEmail==-1 }">selected</c:if>>--未验证--</option>
										<option value="1" <c:if test="${user.isCheckEmail==1 }">selected</c:if>>--已验证--</option>
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
									<th>登录名</th>
									<th>昵称</th>
									<th>头像</th>
									<th>联系电话</th>
									<th>邮箱</th>
									<th>QQ</th>
									<th>性别</th>
									<th>状态</th>
									<th>最近登录</th>
									<th style="text-align: center;width: 200px;">操作</th>
								</tr>
							</thead>
							<tbody>
								<c:if test="${page != null && page.list != null}">
									<c:forEach var="user" items="${page.list}" varStatus="status">
										<tr>
											<td width="30px"><input type="checkbox" value="${user.id }" name="userIds" /></td>
											<td>${user.userName }</td>
											<td>${user.nickName }</td>
											<td><img src="<%=basePath %>${user.thumb}" style="max-height: 25px;"/></td>
											<td>
												${user.phone }
												<c:if test="${user.isCheckPhone != null && user.isCheckPhone == 1}">
													<span style="background-color: #4cae4c;color: #fff;">已验证</span>
												</c:if>
												<c:if test="${user.isCheckPhone != null && user.isCheckPhone == -1}">
													<span style="background-color: #c33610;color: #fff;">未验证</span>
												</c:if>
											</td>
											<td>
												${user.email }
												<c:if test="${user.isCheckEmail != null && user.isCheckEmail == 1}">
													<span style="background-color: #4cae4c;color: #fff;">已验证</span>
												</c:if>
												<c:if test="${user.isCheckEmail != null && user.isCheckEmail == -1}">
													<span style="background-color: #c33610;color: #fff;">未验证</span>
												</c:if>
											</td>
											<td>${user.qq }</td>
											<td>${user.gender }</td>
											<td>
												<jsp:setProperty name="dateValue" property="time" value="${user.lastLoginTime}"/>
												<fmt:formatDate value="${dateValue}" pattern="yyyy-MM-dd HH:mm"/>
											</td>
											<td>
												<c:if test="${user.status != null && user.status == 1}">
													<span style="color: #4cae4c;">启用</span>
												</c:if>
												<c:if test="${user.status != null && user.status == -1}">
													<span style="color: #c33610;">禁用</span>
												</c:if>
											</td>
											<td>
												<c:if test="${user.status != null && user.status == 1}">
													<a href="javascript: void(0)" onclick="changeStatus(${user.id},-1)" class="btn-outline btn-outline-danger">禁用</a>
												</c:if>
												<c:if test="${user.status != null && user.status == -1}">
													<a href="javascript: void(0)" onclick="changeStatus(${user.id},1)" class="btn-outline btn-outline-info">启用</a>
												</c:if>
												<a href="<%=basePath %>admin/index.htm?mod=index&act=users&opt=user_mng&id=${user.id}" class="btn-outline btn-outline-success">编辑</a>
												<a href="javascript: void(0)" onclick="removeFn(${user.id})" class="btn-outline btn-outline-danger">删除</a>
											</td>
										</tr>
									</c:forEach>
								</c:if>
								<c:if test="${page == null || fn:length(page.list) <= 0}">
									<tr>
										<td colspan="11" align="center"><span style="color: #c33610;">当前系统暂时没有用户数据</span></td>
									</tr>
								</c:if>
							</tbody>
							<tfoot>
								<tr>
									<td colspan="11">
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
							<input type="checkbox" name="checkall" onclick="changeCheckboxStatus('userIds')" />
							<a href="javascript: void(0)" onclick="batchRemove('userIds','user')" class="btn-outline btn-outline-default">批量删除</a>
						</div>
					</div>
				</div>
			</div>
			
			<div class="clearfix"></div>
			<div style="height: 50px;width: 100%;"></div>
		</div>
	</div>
	<jsp:include page="/admin/js.do"></jsp:include>
	<script type="text/javascript" src="<%=basePath %>assets/pagejs/admin/index/users.js" charset="utf-8"></script>
</body>