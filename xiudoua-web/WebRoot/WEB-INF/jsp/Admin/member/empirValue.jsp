<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:include page="/admin/css.do"></jsp:include>
<link type="text/css" rel="stylesheet" href="<%=basePath %>assets/pagecss/admin/member/empirValue.css" />
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
								<li class="selected"><a href="javascript: void(0)"><i class="fa fa-cog"></i> 经验值明细</a></li>
								<li><a href="javascript: void(0)"><i class="fa fa-bolt"></i> 规则设置</a></li>
							</ul>
							<div class="opts pull-right">
								
							</div>
							<div class="clearfix"></div>
						</div>
					</div>
				</div>
			</div>
			
			<!--  JustFresh 2017-07-14 begin 条件查询部分 -->
			<div class="container-fluid conditions">
				<div class="row">
					<div class="col-sm-12 col-md-12">
						<form class="search-form pull-right">
							<span class="form-element">
								<label>
									会员名称
								</label>
								<input type="text" class="input-text" name="" />
							</span>
							<span class="form-element">
								<label>添加时间：</label>
								<input type="text" class="input-text" name="" id="beginTime" /> ~ 
								<input type="text" class="input-text" name="" id="endTime" />
							</span>
							<span class="form-element">
								<label>操作阶段：</label>
								<select class="input-select" name="">
									<option value="10">会员登录</option>
									<option value="20">商品描述</option>
									<option value="20">订单消费</option>
								</select>
							</span>
							<span class="form-element">
								<label>描述：</label>
								<input type="text" class="input-text" name="" />
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
									<th>会员名称</th>
									<th>经验值</th>
									<th>添加时间</th>
									<th>操作阶段</th>
									<th>描述</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>hkttyy</td>
									<td>5</td>
									<td>2016-12-05</td>
									<td>会员登录</td>
									<td>会员登录</td>
								</tr>
								<tr>
									<td>13985919398</td>
									<td>142</td>
									<td>2016-12-04</td>
									<td>订单消费</td>
									<td>订单8000000000456601购物消费</td>
								</tr>
								<tr>
									<td>hkttyy</td>
									<td>5</td>
									<td>2016-12-05</td>
									<td>会员登录</td>
									<td>会员登录</td>
								</tr>
								<tr>
									<td>13985919398</td>
									<td>142</td>
									<td>2016-12-04</td>
									<td>订单消费</td>
									<td>订单8000000000456601购物消费</td>
								</tr>
								<tr>
									<td>hkttyy</td>
									<td>5</td>
									<td>2016-12-05</td>
									<td>会员登录</td>
									<td>会员登录</td>
								</tr>
								<tr>
									<td>13985919398</td>
									<td>142</td>
									<td>2016-12-04</td>
									<td>订单消费</td>
									<td>订单8000000000456601购物消费</td>
								</tr>
								<tr>
									<td>hkttyy</td>
									<td>5</td>
									<td>2016-12-05</td>
									<td>会员登录</td>
									<td>会员登录</td>
								</tr>
								<tr>
									<td>13985919398</td>
									<td>142</td>
									<td>2016-12-04</td>
									<td>订单消费</td>
									<td>订单8000000000456601购物消费</td>
								</tr>
								<tr>
									<td>hkttyy</td>
									<td>5</td>
									<td>2016-12-05</td>
									<td>会员登录</td>
									<td>会员登录</td>
								</tr>
								<tr>
									<td>13985919398</td>
									<td>142</td>
									<td>2016-12-04</td>
									<td>订单消费</td>
									<td>订单8000000000456601购物消费</td>
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
	<script type="text/javascript">
	 $(function () {
        $("#beginTime").jeDate({format:"YYYY-MM-DD hh:mm",isTime:true});
        $("#endTime").jeDate({format:"YYYY-MM-DD hh:mm",isTime:true});
    }); 
	</script>
</body>