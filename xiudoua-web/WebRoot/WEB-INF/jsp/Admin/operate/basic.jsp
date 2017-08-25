<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:include page="/admin/css.do"></jsp:include>
<link type="text/css" rel="stylesheet" href="<%=basePath %>assets/pagecss/admin/operate/basic.css" />
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
								<li class="selected"><a href="javascript: void(0)"><i class="fa fa-cogs"></i> 基本设置</a></li>
							</ul>
							<div class="opts pull-right">
								
							</div>
							<div class="clearfix"></div>
						</div>
					</div>
				</div>
			</div>
			<div class="clearfix"></div>
			
			<div class="container-fluid">
				<div class="row">
					<div class="col-sm-12 col-md-12">
						<form action="" method="post">
							<div class="form-line">
								<label>商品促销：</label>
								<input type="radio" name="isPromot" value="1" checked /> 开启 
								<input type="radio" name="isPromot" value="0" /> 关闭
								<p class="help-block">启用商品促销功能后，商家可以通过限时打折、满即送、优惠套装和推荐展位活动，对店铺商品进行促销</p>
							</div>
							<div class="form-line">
								<label>抢购：</label>
								<input type="radio" name="isPanic" value="1" checked /> 开启 
								<input type="radio" name="isPanic" value="0" /> 关闭
								<p class="help-block">抢购功能启用后，商家通过活动发布抢购商品，进行促销</p>
							</div>
							<div class="form-line">
								<label>积分：</label>
								<input type="radio" name="integral" value="1" checked /> 开启 
								<input type="radio" name="integral" value="0" /> 关闭
								<p class="help-block">积分系统启用后，可设置会员的注册、登录、购买商品送一定的积分</p>
							</div>
							<div class="form-line">
								<label>积分中心：</label>
								<input type="radio" name="integralCenter" value="1" checked /> 开启 
								<input type="radio" name="integralCenter" value="0" /> 关闭
								<p class="help-block">积分中心和积分同时启用后，网站将增加积分中心频道</p>
							</div>
							<div class="form-line">
								<label>积分兑换：</label>
								<input type="radio" name="integralExchange" value="1" checked /> 开启 
								<input type="radio" name="integralExchange" value="0" /> 关闭
								<p class="help-block">积分兑换、积分功能以及积分中心启用后，平台发布礼品，会员的积分在达到要求时可以在积分中心中兑换礼品</p>
							</div>
							<div class="form-line">
								<label>代金券：</label>
								<input type="radio" name="cashCoupon" value="1" checked /> 开启 
								<input type="radio" name="cashCoupon" value="0" /> 关闭
								<p class="help-block">代金券功能、积分功能、积分中心启用后，商家可以申请代金券活动；会员积分达到要求时可以在积分中心兑换代金券；
拥有代金的会员可在代金券所属店铺内购买商品时，选择使用而得到优惠</p>
							</div>
							<div class="form-title">
								积分规则如下:
							</div>
							<div class="form-table">
								<table class="table table-striped">
									<tr>
										<th width="25%">项目</th>
										<th colspan="2">赠送积分</th>
									</tr>
									<tr>
										<td>会员注册</td>
										<td colspan="2"><input type="text" name="" value="199" /></td>
									</tr>
									<tr>
										<td>会员每天登录</td>
										<td colspan="2"><input type="text" name="" value="3" /></td>
									</tr>
									<tr>
										<td>订单商品评论</td>
										<td colspan="2"><input type="text" name="" value="10" /></td>
									</tr>
									<tr>
										<td>邀请注册</td>
										<td>
											<input type="text" name="" value="10" />
										</td>
										<td><p class="help-block">积分系统启用后，可设置会员的注册、登录、购买商品送一定的积分</p></td>
									</tr>
									<tr>
										<td>返利比例</td>
										<td><input type="text" name="" value="5" />%</td>
										<td>
											<p class="help-block">被邀请会员购买商品时给邀请人返的积分数(例如设为5%，被邀请人购买100元商品，返给邀请人5积分)</p>
										</td>
									</tr>
									<tr>
										<th colspan="3">购物并付款</th>
									</tr>
									<tr>
										<td>消费额与赠送积分比例</td>
										<td>
											<input type="text" name="" value="10" />
										</td>
										<td><p class="help-block">例:设置为10，表明消费10单位货币赠送1积分</p></td>
									</tr>
									<tr>
										<td>每订单最多赠送积分</td>
										<td>
											<input type="text" name="" value="100" />
										</td>
										<td><p class="help-block">例:设置为100，表明每订单赠送积分最多为100积分</p></td>
									</tr>
								</table>
								<button type="submit" class="btn btn-success"><i class="fa fa-save"></i> 保存设置</button>
							</div>
						</form>
					</div>
				</div>
			</div>

			<div class="clearfix"></div>
			<div style="height: 50px;width: 100%;"></div>
			
		</div>
	</div>
	<jsp:include page="/admin/js.do"></jsp:include>
</body>