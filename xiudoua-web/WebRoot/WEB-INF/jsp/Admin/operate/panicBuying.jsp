<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:include page="/admin/css.do"></jsp:include>
<link type="text/css" rel="stylesheet" href="<%=basePath %>assets/pagecss/admin/operate/panicBuying.css" />
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
								<li class="selected"><a href="javascript: void(0)"><i class="fa fa-cogs"></i> 抢购活动</a></li>
								<li><a href="javascript: void(0)"><i class="fa fa-cog"></i> 套餐管理</a></li>
								<li><a href="javascript: void(0)"><i class="fa fa-list"></i> 抢购分类</a></li>
								<li><a href="javascript: void(0)"><i class="fa fa-area-chart"></i> 抢购价格区间</a></li>
								<li><a href="javascript: void(0)"><i class="fa fa-cogs"></i> 设置</a></li>
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
								<label>抢购名称</label>
								<input type="text" class="input-text" name="" />
							</span>
							<span class="form-element">
								<label>店铺名称</label>
								<input type="text" class="input-text" name="" />
							</span>
							<span class="form-element">
								<label>状态：</label>
								<select class="input-select" name="">
									<option value="10">请选择</option>
									<option value="20">审核中</option>
									<option value="20">正常</option>
									<option value="20">已结束</option>
									<option value="20">审核失败</option>
									<option value="20">管理员关闭</option>
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
						<table class="table table-striped">
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
									<th>抢购名称</th>
									<th>开始时间</th>
									<th>结束时间</th>
									<th>浏览数</th>
									<th>已购买</th>
									<th>是否推荐</th>
									<th>抢购状态</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>
										<div class="thumb pull-left">
											<img src="<%=basePath %>assets/images/default.jpg" alt="" />
										</div>
										<div class="info pull-left">
											<p><a href="" target="_blank">低价活动</a></p>
											<p><a href="" target="_blank">商品名称:金龙鱼花生调和油5L</a></p>
											<p class="help-block">***店铺</p>
										</div>
										<div class="clearfix"></div>
									</td>
									<td>2016-10-25 16:59</td>
									<td>2016-10-25 17:04</td>
									<td>0</td>
									<td>0</td>
									<td>
										<a href="javascript: void(0)">
											<i class="fa fa-check"></i>
										</a>
									</td>
									<td>审核中</td>
									<td width="200px">
										<a href="#" class="btn-outline btn-outline-success">通过</a>
										<a href="#" class="btn-outline btn-outline-info">拒绝</a>
										<a href="#" class="btn-outline btn-outline-danger">删除</a>
									</td>
								</tr>
								<tr>
									<td>
										<div class="thumb pull-left">
											<img src="<%=basePath %>assets/images/default.jpg" alt="" />
										</div>
										<div class="info pull-left">
											<p><a href="" target="_blank">低价活动</a></p>
											<p><a href="" target="_blank">商品名称:金龙鱼花生调和油5L</a></p>
											<p class="help-block">***店铺</p>
										</div>
										<div class="clearfix"></div>
									</td>
									<td>2016-10-25 16:59</td>
									<td>2016-10-25 17:04</td>
									<td>0</td>
									<td>0</td>
									<td>
										<a href="javascript: void(0)">
											<i class="fa fa-check"></i>
										</a>
									</td>
									<td>审核中</td>
									<td width="200px">
										<a href="#" class="btn-outline btn-outline-success">通过</a>
										<a href="#" class="btn-outline btn-outline-info">拒绝</a>
										<a href="#" class="btn-outline btn-outline-danger">删除</a>
									</td>
								</tr>
								<tr>
									<td>
										<div class="thumb pull-left">
											<img src="<%=basePath %>assets/images/default.jpg" alt="" />
										</div>
										<div class="info pull-left">
											<p><a href="" target="_blank">低价活动</a></p>
											<p><a href="" target="_blank">商品名称:金龙鱼花生调和油5L</a></p>
											<p class="help-block">***店铺</p>
										</div>
										<div class="clearfix"></div>
									</td>
									<td>2016-10-25 16:59</td>
									<td>2016-10-25 17:04</td>
									<td>0</td>
									<td>0</td>
									<td>
										<a href="javascript: void(0)">
											<i class="fa fa-check"></i>
										</a>
									</td>
									<td>审核中</td>
									<td width="200px">
										<a href="#" class="btn-outline btn-outline-success">通过</a>
										<a href="#" class="btn-outline btn-outline-info">拒绝</a>
										<a href="#" class="btn-outline btn-outline-danger">删除</a>
									</td>
								</tr>
								<tr>
									<td>
										<div class="thumb pull-left">
											<img src="<%=basePath %>assets/images/default.jpg" alt="" />
										</div>
										<div class="info pull-left">
											<p><a href="" target="_blank">低价活动</a></p>
											<p><a href="" target="_blank">商品名称:金龙鱼花生调和油5L</a></p>
											<p class="help-block">***店铺</p>
										</div>
										<div class="clearfix"></div>
									</td>
									<td>2016-10-25 16:59</td>
									<td>2016-10-25 17:04</td>
									<td>0</td>
									<td>0</td>
									<td>
										<a href="javascript: void(0)">
											<i class="fa fa-check"></i>
										</a>
									</td>
									<td>审核中</td>
									<td width="200px">
										<a href="#" class="btn-outline btn-outline-success">通过</a>
										<a href="#" class="btn-outline btn-outline-info">拒绝</a>
										<a href="#" class="btn-outline btn-outline-danger">删除</a>
									</td>
								</tr>
								<tr>
									<td>
										<div class="thumb pull-left">
											<img src="<%=basePath %>assets/images/default.jpg" alt="" />
										</div>
										<div class="info pull-left">
											<p><a href="" target="_blank">低价活动</a></p>
											<p><a href="" target="_blank">商品名称:金龙鱼花生调和油5L</a></p>
											<p class="help-block">***店铺</p>
										</div>
										<div class="clearfix"></div>
									</td>
									<td>2016-10-25 16:59</td>
									<td>2016-10-25 17:04</td>
									<td>0</td>
									<td>0</td>
									<td>
										<a href="javascript: void(0)">
											<i class="fa fa-check"></i>
										</a>
									</td>
									<td>审核中</td>
									<td width="200px">
										<a href="#" class="btn-outline btn-outline-success">通过</a>
										<a href="#" class="btn-outline btn-outline-info">拒绝</a>
										<a href="#" class="btn-outline btn-outline-danger">删除</a>
									</td>
								</tr>
								<tr>
									<td>
										<div class="thumb pull-left">
											<img src="<%=basePath %>assets/images/default.jpg" alt="" />
										</div>
										<div class="info pull-left">
											<p><a href="" target="_blank">低价活动</a></p>
											<p><a href="" target="_blank">商品名称:金龙鱼花生调和油5L</a></p>
											<p class="help-block">***店铺</p>
										</div>
										<div class="clearfix"></div>
									</td>
									<td>2016-10-25 16:59</td>
									<td>2016-10-25 17:04</td>
									<td>0</td>
									<td>0</td>
									<td>
										<a href="javascript: void(0)">
											<i class="fa fa-check"></i>
										</a>
									</td>
									<td>审核中</td>
									<td width="200px">
										<a href="#" class="btn-outline btn-outline-success">通过</a>
										<a href="#" class="btn-outline btn-outline-info">拒绝</a>
										<a href="#" class="btn-outline btn-outline-danger">删除</a>
									</td>
								</tr>
								<tr>
									<td>
										<div class="thumb pull-left">
											<img src="<%=basePath %>assets/images/default.jpg" alt="" />
										</div>
										<div class="info pull-left">
											<p><a href="" target="_blank">低价活动</a></p>
											<p><a href="" target="_blank">商品名称:金龙鱼花生调和油5L</a></p>
											<p class="help-block">***店铺</p>
										</div>
										<div class="clearfix"></div>
									</td>
									<td>2016-10-25 16:59</td>
									<td>2016-10-25 17:04</td>
									<td>0</td>
									<td>0</td>
									<td>
										<a href="javascript: void(0)">
											<i class="fa fa-check"></i>
										</a>
									</td>
									<td>审核中</td>
									<td width="200px">
										<a href="#" class="btn-outline btn-outline-success">通过</a>
										<a href="#" class="btn-outline btn-outline-info">拒绝</a>
										<a href="#" class="btn-outline btn-outline-danger">删除</a>
									</td>
								</tr>
								<tr>
									<td>
										<div class="thumb pull-left">
											<img src="<%=basePath %>assets/images/default.jpg" alt="" />
										</div>
										<div class="info pull-left">
											<p><a href="" target="_blank">低价活动</a></p>
											<p><a href="" target="_blank">商品名称:金龙鱼花生调和油5L</a></p>
											<p class="help-block">***店铺</p>
										</div>
										<div class="clearfix"></div>
									</td>
									<td>2016-10-25 16:59</td>
									<td>2016-10-25 17:04</td>
									<td>0</td>
									<td>0</td>
									<td>
										<a href="javascript: void(0)">
											<i class="fa fa-check"></i>
										</a>
									</td>
									<td>审核中</td>
									<td width="200px">
										<a href="#" class="btn-outline btn-outline-success">通过</a>
										<a href="#" class="btn-outline btn-outline-info">拒绝</a>
										<a href="#" class="btn-outline btn-outline-danger">删除</a>
									</td>
								</tr>
								<tr>
									<td>
										<div class="thumb pull-left">
											<img src="<%=basePath %>assets/images/default.jpg" alt="" />
										</div>
										<div class="info pull-left">
											<p><a href="" target="_blank">低价活动</a></p>
											<p><a href="" target="_blank">商品名称:金龙鱼花生调和油5L</a></p>
											<p class="help-block">***店铺</p>
										</div>
										<div class="clearfix"></div>
									</td>
									<td>2016-10-25 16:59</td>
									<td>2016-10-25 17:04</td>
									<td>0</td>
									<td>0</td>
									<td>
										<a href="javascript: void(0)">
											<i class="fa fa-check"></i>
										</a>
									</td>
									<td>审核中</td>
									<td width="200px">
										<a href="#" class="btn-outline btn-outline-success">通过</a>
										<a href="#" class="btn-outline btn-outline-info">拒绝</a>
										<a href="#" class="btn-outline btn-outline-danger">删除</a>
									</td>
								</tr>
								<tr>
									<td>
										<div class="thumb pull-left">
											<img src="<%=basePath %>assets/images/default.jpg" alt="" />
										</div>
										<div class="info pull-left">
											<p><a href="" target="_blank">低价活动</a></p>
											<p><a href="" target="_blank">商品名称:金龙鱼花生调和油5L</a></p>
											<p class="help-block">***店铺</p>
										</div>
										<div class="clearfix"></div>
									</td>
									<td>2016-10-25 16:59</td>
									<td>2016-10-25 17:04</td>
									<td>0</td>
									<td>0</td>
									<td>
										<a href="javascript: void(0)">
											<i class="fa fa-check"></i>
										</a>
									</td>
									<td>审核中</td>
									<td width="200px">
										<a href="#" class="btn-outline btn-outline-success">通过</a>
										<a href="#" class="btn-outline btn-outline-info">拒绝</a>
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