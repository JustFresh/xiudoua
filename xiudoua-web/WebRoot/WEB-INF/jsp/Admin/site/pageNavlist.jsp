<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:include page="/admin/css.do"></jsp:include>
<link type="text/css" rel="stylesheet" href="<%=basePath %>assets/pagecss/admin/site/pageNavlist.css" />
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
								<li class="selected"><a href="javascript: void(0)"><i class="fa fa-cogs"></i> 管理</a></li>
								<li><a href="javascript: void(0)"><i class="fa fa-plus"></i> 新增</a></li>
							</ul>
							<div class="opts pull-right">
								
							</div>
							<div class="clearfix"></div>
						</div>
					</div>
				</div>
			</div>
			<div class="clearfix"></div>
			
			<div class="container-fluid conditions">
				<div class="row">
					<div class="col-sm-12 col-md-12">
						<form class="search-form pull-right">
							<span class="form-element">
								<label>标题：</label>
								<input type="text" class="input-text" name="" />
							</span>
							<span class="form-element">
								<label>所在位置：</label>
								<select class="input-select" name="">
									<option value="10">--请选择--</option>
									<option value="20">--头部--</option>
									<option value="50">--中部--</option>
									<option value="100">--底部--</option>
								</select>
							</span>
							<span class="form-element">
								<label>分页：</label>
								<select class="input-select" name="">
									<option value="10">--10--</option>
									<option value="20">--20--</option>
									<option value="50">--50--</option>
									<option value="100">--100--</option>
								</select>
							</span>
							<span class="form-element">
								<button type="submit" class="btn btn-warning"><i class="fa fa-search"></i> 搜索</button>
							</span>
						</form>
					</div>
				</div>
			</div>
			<!--  JustFresh 2017-07-14 end 条件查询部分 -->
			
			<div class="clearfix"></div>
			<div class="main-body container-fluid">
				<div class="row">
					<div class="col-sm-12 col-md-12">
						<table class="table table-striped table-bordered">
							<thead>
								<tr>
									<th colspan="10">
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
									<th>标题</th>
									<th>链接</th>
									<th>所在位置</th>
									<th>新窗口打开</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td><input type="checkbox" name="" value="" /></td>
									<td>
										<input type="text" value="1" name="" style="width: 60px;" />
									</td>
									<td>招聘英才</td>
									<td>/shop/index.php?act=article&article_id=24</td>
									<td>底部</td>
									<td>是</td>
									<td width="200px">
										<a href="#" class="btn-outline btn-outline-danger">删除</a>
										<a href="#" class="btn-outline btn-outline-info">编辑</a>
									</td>
								</tr>
								<tr>
									<td><input type="checkbox" name="" value="" /></td>
									<td>
										<input type="text" value="1" name="" style="width: 60px;" />
									</td>
									<td>招聘英才</td>
									<td>/shop/index.php?act=article&article_id=24</td>
									<td>底部</td>
									<td>是</td>
									<td width="200px">
										<a href="#" class="btn-outline btn-outline-danger">删除</a>
										<a href="#" class="btn-outline btn-outline-info">编辑</a>
									</td>
								</tr>
								<tr>
									<td><input type="checkbox" name="" value="" /></td>
									<td>
										<input type="text" value="1" name="" style="width: 60px;" />
									</td>
									<td>招聘英才</td>
									<td>/shop/index.php?act=article&article_id=24</td>
									<td>底部</td>
									<td>是</td>
									<td width="200px">
										<a href="#" class="btn-outline btn-outline-danger">删除</a>
										<a href="#" class="btn-outline btn-outline-info">编辑</a>
									</td>
								</tr>
								<tr>
									<td><input type="checkbox" name="" value="" /></td>
									<td>
										<input type="text" value="1" name="" style="width: 60px;" />
									</td>
									<td>招聘英才</td>
									<td>/shop/index.php?act=article&article_id=24</td>
									<td>底部</td>
									<td>是</td>
									<td width="200px">
										<a href="#" class="btn-outline btn-outline-danger">删除</a>
										<a href="#" class="btn-outline btn-outline-info">编辑</a>
									</td>
								</tr>
								<tr>
									<td><input type="checkbox" name="" value="" /></td>
									<td>
										<input type="text" value="1" name="" style="width: 60px;" />
									</td>
									<td>招聘英才</td>
									<td>/shop/index.php?act=article&article_id=24</td>
									<td>底部</td>
									<td>是</td>
									<td width="200px">
										<a href="#" class="btn-outline btn-outline-danger">删除</a>
										<a href="#" class="btn-outline btn-outline-info">编辑</a>
									</td>
								</tr>
								<tr>
									<td><input type="checkbox" name="" value="" /></td>
									<td>
										<input type="text" value="1" name="" style="width: 60px;" />
									</td>
									<td>招聘英才</td>
									<td>/shop/index.php?act=article&article_id=24</td>
									<td>底部</td>
									<td>是</td>
									<td width="200px">
										<a href="#" class="btn-outline btn-outline-danger">删除</a>
										<a href="#" class="btn-outline btn-outline-info">编辑</a>
									</td>
								</tr>
								<tr>
									<td><input type="checkbox" name="" value="" /></td>
									<td>
										<input type="text" value="1" name="" style="width: 60px;" />
									</td>
									<td>招聘英才</td>
									<td>/shop/index.php?act=article&article_id=24</td>
									<td>底部</td>
									<td>是</td>
									<td width="200px">
										<a href="#" class="btn-outline btn-outline-danger">删除</a>
										<a href="#" class="btn-outline btn-outline-info">编辑</a>
									</td>
								</tr>
								<tr>
									<td><input type="checkbox" name="" value="" /></td>
									<td>
										<input type="text" value="1" name="" style="width: 60px;" />
									</td>
									<td>招聘英才</td>
									<td>/shop/index.php?act=article&article_id=24</td>
									<td>底部</td>
									<td>是</td>
									<td width="200px">
										<a href="#" class="btn-outline btn-outline-danger">删除</a>
										<a href="#" class="btn-outline btn-outline-info">编辑</a>
									</td>
								</tr>
								<tr>
									<td><input type="checkbox" name="" value="" /></td>
									<td>
										<input type="text" value="1" name="" style="width: 60px;" />
									</td>
									<td>招聘英才</td>
									<td>/shop/index.php?act=article&article_id=24</td>
									<td>底部</td>
									<td>是</td>
									<td width="200px">
										<a href="#" class="btn-outline btn-outline-danger">删除</a>
										<a href="#" class="btn-outline btn-outline-info">编辑</a>
									</td>
								</tr>
								<tr>
									<td><input type="checkbox" name="" value="" /></td>
									<td>
										<input type="text" value="1" name="" style="width: 60px;" />
									</td>
									<td>招聘英才</td>
									<td>/shop/index.php?act=article&article_id=24</td>
									<td>底部</td>
									<td>是</td>
									<td width="200px">
										<a href="#" class="btn-outline btn-outline-danger">删除</a>
										<a href="#" class="btn-outline btn-outline-info">编辑</a>
									</td>
								</tr>
							</tbody>
							<tfoot>
								<tr>
									<td colspan="10">
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