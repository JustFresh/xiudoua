<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:include page="/admin/css.do"></jsp:include>
<link type="text/css" rel="stylesheet" href="<%=basePath %>assets/pagecss/admin/goods/categorys.css" />
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
								<li class="selected"><a href="javascript: void(0)"><i class="fa fa-cog"></i> 管理</a></li>
								<li><a href="javascript: void(0)"><i class="fa fa-plus"></i> 新增</a></li>
								<li><a href="javascript: void(0)"><i class="fa fa-file-excel-o"></i> 导出</a></li>
								<li><a href="javascript: void(0)"><i class="fa fa-file-excel-o"></i> 导入</a></li>
							</ul>
							<div class="opts pull-right">
								
							</div>
							<div class="clearfix"></div>
						</div>
					</div>
				</div>
			</div>
			
			<div class="container-fluid warning-info">
				<div class="row">
					<div class="col-sm-12 col-md-12">
						<h4><i class="fa fa-warning"></i> 操作提示</h4>
						<p>当店主添加商品时可选择商品分类，用户可根据分类查询商品列表</p>
						<p>点击分类名前“+”符号，显示当前分类的下级分类</p>
						<p>对分类作任何更改后，都需要到 设置 -> 清理缓存 清理商品分类，新的设置才会生效</p>
					</div>
				</div>
			</div>
			
			<div class="clearfix"></div>
			<div class="main-body container-fluid">
				<div class="row">
					<div class="col-sm-12 col-md-12">
						<table class="table table-striped table-bordered">
							<thead>
								<tr>
									<th colspan="5">
										<div class="pull-right">
											<a href="javascript: void(0)" class="btn btn-default btn-sm">
												<i class="fa fa-file-excel-o"></i> 导出Excel
											</a>
										</div>
									</th>
								</tr>
								<tr>
									<th width="40px">&nbsp;</th>
									<th>排序</th>
									<th>分类名称</th>
									<th>类型</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td><input type="checkbox" name="checkall" value="" /></td>
									<td>
										<input type="text" value="1" name="" style="width: 50px;"/>
									</td>
									<td>
										<input type="text" value="分类一" name="" />
										<a href="" class="btn btn-default btn-sm"><i class="fa fa-plus"></i> 新增下级</a>
									</td>
									<td>类型一</td>
									<td width="200px">
										<a href="#" class="btn-outline btn-outline-danger">禁用</a>
										<a href="#" class="btn-outline btn-outline-success">编辑</a>
										<a href="#" class="btn-outline btn-outline-danger">删除</a>
									</td>
								</tr>
								<tr>
									<td><input type="checkbox" name="checkall" value="" /></td>
									<td>
										<input type="text" value="1" name="" style="width: 50px;"/>
									</td>
									<td>
										<input type="text" value="分类一" name="" />
										<a href="" class="btn btn-default btn-sm"><i class="fa fa-plus"></i> 新增下级</a>
									</td>
									<td>类型一</td>
									<td width="200px">
										<a href="#" class="btn-outline btn-outline-danger">禁用</a>
										<a href="#" class="btn-outline btn-outline-success">编辑</a>
										<a href="#" class="btn-outline btn-outline-danger">删除</a>
									</td>
								</tr>
								<tr>
									<td><input type="checkbox" name="checkall" value="" /></td>
									<td>
										<input type="text" value="1" name="" style="width: 50px;"/>
									</td>
									<td>
										<input type="text" value="分类一" name="" />
										<a href="" class="btn btn-default btn-sm"><i class="fa fa-plus"></i> 新增下级</a>
									</td>
									<td>类型一</td>
									<td width="200px">
										<a href="#" class="btn-outline btn-outline-danger">禁用</a>
										<a href="#" class="btn-outline btn-outline-success">编辑</a>
										<a href="#" class="btn-outline btn-outline-danger">删除</a>
									</td>
								</tr>
								<tr>
									<td><input type="checkbox" name="checkall" value="" /></td>
									<td>
										<input type="text" value="1" name="" style="width: 50px;"/>
									</td>
									<td>
										<input type="text" value="分类一" name="" />
										<a href="" class="btn btn-default btn-sm"><i class="fa fa-plus"></i> 新增下级</a>
									</td>
									<td>类型一</td>
									<td width="200px">
										<a href="#" class="btn-outline btn-outline-danger">禁用</a>
										<a href="#" class="btn-outline btn-outline-success">编辑</a>
										<a href="#" class="btn-outline btn-outline-danger">删除</a>
									</td>
								</tr>
								<tr>
									<td><input type="checkbox" name="checkall" value="" /></td>
									<td>
										<input type="text" value="1" name="" style="width: 50px;"/>
									</td>
									<td>
										<input type="text" value="分类一" name="" />
										<a href="" class="btn btn-default btn-sm"><i class="fa fa-plus"></i> 新增下级</a>
									</td>
									<td>类型一</td>
									<td width="200px">
										<a href="#" class="btn-outline btn-outline-danger">禁用</a>
										<a href="#" class="btn-outline btn-outline-success">编辑</a>
										<a href="#" class="btn-outline btn-outline-danger">删除</a>
									</td>
								</tr>
								<tr>
									<td><input type="checkbox" name="checkall" value="" /></td>
									<td>
										<input type="text" value="1" name="" style="width: 50px;"/>
									</td>
									<td>
										<input type="text" value="分类一" name="" />
										<a href="" class="btn btn-default btn-sm"><i class="fa fa-plus"></i> 新增下级</a>
									</td>
									<td>类型一</td>
									<td width="200px">
										<a href="#" class="btn-outline btn-outline-danger">禁用</a>
										<a href="#" class="btn-outline btn-outline-success">编辑</a>
										<a href="#" class="btn-outline btn-outline-danger">删除</a>
									</td>
								</tr>
								<tr>
									<td><input type="checkbox" name="checkall" value="" /></td>
									<td>
										<input type="text" value="1" name="" style="width: 50px;"/>
									</td>
									<td>
										<input type="text" value="分类一" name="" />
										<a href="" class="btn btn-default btn-sm"><i class="fa fa-plus"></i> 新增下级</a>
									</td>
									<td>类型一</td>
									<td width="200px">
										<a href="#" class="btn-outline btn-outline-danger">禁用</a>
										<a href="#" class="btn-outline btn-outline-success">编辑</a>
										<a href="#" class="btn-outline btn-outline-danger">删除</a>
									</td>
								</tr>
								<tr>
									<td><input type="checkbox" name="checkall" value="" /></td>
									<td>
										<input type="text" value="1" name="" style="width: 50px;"/>
									</td>
									<td>
										<input type="text" value="分类一" name="" />
										<a href="" class="btn btn-default btn-sm"><i class="fa fa-plus"></i> 新增下级</a>
									</td>
									<td>类型一</td>
									<td width="200px">
										<a href="#" class="btn-outline btn-outline-danger">禁用</a>
										<a href="#" class="btn-outline btn-outline-success">编辑</a>
										<a href="#" class="btn-outline btn-outline-danger">删除</a>
									</td>
								</tr>
								<tr>
									<td><input type="checkbox" name="checkall" value="" /></td>
									<td>
										<input type="text" value="1" name="" style="width: 50px;"/>
									</td>
									<td>
										<input type="text" value="分类一" name="" />
										<a href="" class="btn btn-default btn-sm"><i class="fa fa-plus"></i> 新增下级</a>
									</td>
									<td>类型一</td>
									<td width="200px">
										<a href="#" class="btn-outline btn-outline-danger">禁用</a>
										<a href="#" class="btn-outline btn-outline-success">编辑</a>
										<a href="#" class="btn-outline btn-outline-danger">删除</a>
									</td>
								</tr>
								<tr>
									<td><input type="checkbox" name="checkall" value="" /></td>
									<td>
										<input type="text" value="1" name="" style="width: 50px;"/>
									</td>
									<td>
										<input type="text" value="分类一" name="" />
										<a href="" class="btn btn-default btn-sm"><i class="fa fa-plus"></i> 新增下级</a>
									</td>
									<td>类型一</td>
									<td width="200px">
										<a href="#" class="btn-outline btn-outline-danger">禁用</a>
										<a href="#" class="btn-outline btn-outline-success">编辑</a>
										<a href="#" class="btn-outline btn-outline-danger">删除</a>
									</td>
								</tr>
							</tbody>
							<tfoot>
								<tr>
									<td colspan="6">
										<div class="paging-info pull-left">
											<span class="total" style="margin-right: 20px;">共有***条数据</span>
											<span class="">第1/**页</span>
										</div>
										<ul class="pagination navigation pull-right" style="margin: 0px;">
											<li><a href="#">首页</a></li>
											<li><a href="#">上一页</a></li>
											<li class="active"><a href="#">1</a></li> 
											<li><a href="#">2</a></li> 
											<li><a href="#">3</a></li> 
											<li><a href="#">4</a></li>
											<li><a href="#">5</a></li> 
											<li><a href="#">下一页</a></li>
											<li><a href="#">尾页</a></li> 
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
							<span class="opt-btn">
								<input type="checkbox" name="checkall" onclick="changeCheckboxStatus('adsIds')" />
								<a href="javascript: void(0)" class="btn btn-default btn-sm">批量删除</a>
							</span>
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