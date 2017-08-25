<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:include page="/admin/css.do"></jsp:include>
<link type="text/css" rel="stylesheet" href="<%=basePath %>assets/pagecss/admin/index/messages.css" />
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
								<li class="selected"><a href="<%=basePath %>">系统留言</a></li>
							</ul>
							<div class="opts pull-right">

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
							<form ng-submit="searchPaging()">
								<span class="form-element">
									<label>留言人：</label>
									<input type="text" class="input-text" ng-model="paginationConf.name" />
								</span>
								<span class="form-element">
									<label>留言邮箱：</label>
									<input type="text" class="input-text" ng-model="paginationConf.name" />
								</span>
								<span class="form-element">
									<label>分页数：</label>
									<select ng-init="pageNum=paginationConf.perPageOptions" class="input-select" ng-change="showPage(pagingInfo.order,pagingInfo.sort,pagingInfo.startIndex,paginationConf.rows)" ng-model="paginationConf.rows">
										<option value="10" selected="true">10</option>
										<option value="20">20</option>
										<option value="50">50</option>
										<option value="100">100</option>
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
									<th>留言人</th>
									<th>联系邮箱</th>
									<th>留言内容</th>
									<th>添加时间</th>
									<th style="text-align: center;width: 200px;">操作</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td><input type="checkbox" value="{{ads.id}}" name="adsIds" /></td>
									<td>JustFresh</td>
									<td>991058975@qq.com</td>
									<td>你好啊</td>
									<td>2017-07-29 11:51</td>
									<td>
										<a ng-click="remove(ads.id)" class="btn-outline btn-outline-danger">删除</a>
									</td>
								</tr>
							</tbody>
							<tfoot>
								<tr>
									<td colspan="6">
										<div class="paging-info pull-left">
											<span class="total" style="margin-right: 20px;">共有1条数据</span>
											<span class="">第1/1页</span>
										</div>
										<ul class="pagination pull-right" style="margin: 0px;">
									    <li class="disabled"><a href="#">首页</a></li>
									    <li class="disabled"><a href="#">上一页</a></li>
									    <li class="active"><a href="#">1</a></li>
									   	<li class="disabled"><a href="#">下一页</a></li>
									    <li class="disabled"><a href="#">尾页</a></li>
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
							<input type="checkbox" name="checkall" onclick="changeCheckboxStatus('adsIds')" />
							<a href="javascript: void(0)" onclick="batchRemove('adsIds','ads')" class="btn-outline btn-outline-default">批量删除</a>
						</div>
					</div>
				</div>
			</div>
			
			<div class="clearfix"></div>
			<div style="height: 50px;width: 100%;"></div>
		</div>
	</div>
	<jsp:include page="/admin/js.do"></jsp:include>
</body>