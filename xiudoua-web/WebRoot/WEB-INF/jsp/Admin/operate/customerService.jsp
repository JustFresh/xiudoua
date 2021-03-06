<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:include page="/admin/css.do"></jsp:include>
<link type="text/css" rel="stylesheet" href="<%=basePath %>assets/pagecss/admin/operate/customerService.css" />
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
								<li class="selected"><a href="javascript: void(0)"><i class="fa fa-list"></i> 平台客服咨询列表</a></li>
								<li><a href="javascript: void(0)"><i class="fa fa-gavel"></i> 平台咨询类型</a></li>
								<li><a href="javascript: void(0)"><i class="fa fa-plus"></i> 新增类型</a></li>
							</ul>
							<div class="opts pull-right">
								
							</div>
							<div class="clearfix"></div>
						</div>
					</div>
				</div>
			</div>
			<div class="clearfix"></div>
			
			<!--  JustFresh 2017-07-14 begin 条件查询部分 -->
			<div class="container-fluid conditions">
				<div class="row">
					<div class="col-sm-12 col-md-12">
						<form class="search-form pull-right">
							<span class="form-element">
								<label>咨询人：</label>
								<input type="text" class="input-text" name="" />
							</span>
							<span class="form-element">
								<label>咨询类型：</label>
								<select class="input-select" name="">
									<option value="10">请选择</option>
									<option value="20">商品咨询</option>
									<option value="20">订单咨询</option>
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
									<th>咨询内容</th>
									<th>咨询人</th>
									<th>咨询时间</th>
									<th>回复状态</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>
										<input type="checkbox" name="" value="1" /> 
										商品更换让我补款怎样补
									</td>
									<td>伍凯</td>
									<td>2017-07-18 16:35</td>
									<td>未回复</td>
									<td width="200px">
										<a href="#" class="btn-outline btn-outline-info">回复</a>
										<a href="#" class="btn-outline btn-outline-danger">删除</a>
									</td>
								</tr>
								<tr>
									<td>
										<input type="checkbox" name="" value="1" /> 
										商品更换让我补款怎样补
									</td>
									<td>伍凯</td>
									<td>2017-07-18 16:35</td>
									<td>未回复</td>
									<td width="200px">
										<a href="#" class="btn-outline btn-outline-info">回复</a>
										<a href="#" class="btn-outline btn-outline-danger">删除</a>
									</td>
								</tr>
								<tr>
									<td>
										<input type="checkbox" name="" value="1" /> 
										商品更换让我补款怎样补
									</td>
									<td>伍凯</td>
									<td>2017-07-18 16:35</td>
									<td>未回复</td>
									<td width="200px">
										<a href="#" class="btn-outline btn-outline-info">回复</a>
										<a href="#" class="btn-outline btn-outline-danger">删除</a>
									</td>
								</tr>
								<tr>
									<td>
										<input type="checkbox" name="" value="1" /> 
										商品更换让我补款怎样补
									</td>
									<td>伍凯</td>
									<td>2017-07-18 16:35</td>
									<td>未回复</td>
									<td width="200px">
										<a href="#" class="btn-outline btn-outline-info">回复</a>
										<a href="#" class="btn-outline btn-outline-danger">删除</a>
									</td>
								</tr>
								<tr>
									<td>
										<input type="checkbox" name="" value="1" /> 
										商品更换让我补款怎样补
									</td>
									<td>伍凯</td>
									<td>2017-07-18 16:35</td>
									<td>未回复</td>
									<td width="200px">
										<a href="#" class="btn-outline btn-outline-info">回复</a>
										<a href="#" class="btn-outline btn-outline-danger">删除</a>
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