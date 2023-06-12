﻿<%@ page language="java" import="java.util.*"  contentType="text/html;charset=UTF-8"%> 
<%@ page import="com.chengxusheji.po.OrderInfo" %>
<%@ page import="com.chengxusheji.po.OrderItem" %>
<%@ page import="com.chengxusheji.po.UserInfo" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	//获取所有的userObj信息
	List<UserInfo> userInfoList = (List<UserInfo>) request
			.getAttribute("userInfoList");
	OrderInfo orderInfo = (OrderInfo) request.getAttribute("orderInfo");
	List<OrderItem> orderItemList = (ArrayList<OrderItem>) request
			.getAttribute("orderItemList");
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1 , user-scalable=no">
  <TITLE>查看订单详情</TITLE>
  <link href="<%=basePath%>plugins/bootstrap.css" rel="stylesheet">
  <link href="<%=basePath%>plugins/bootstrap-dashen.css" rel="stylesheet">
  <link href="<%=basePath%>plugins/font-awesome.css" rel="stylesheet">
  <link href="<%=basePath%>plugins/animate.css" rel="stylesheet"> 
</head>
<body style="margin-top:70px;"> 
<jsp:include page="../header.jsp"></jsp:include>
<div class="container">
	<ul class="breadcrumb">
  		<li><a href="<%=basePath%>index.jsp">首页</a></li>
  		<li><a href="<%=basePath%>OrderInfo/frontlist">订单信息</a></li>
  		<li class="active">详情查看</li>
	</ul>
	<div class="row bottom15"> 
		<div class="col-md-2 col-xs-4 text-right bold">订单编号:</div>
		<div class="col-md-10 col-xs-6"><%=orderInfo.getOrderNo()%></div>
	</div>
	<div class="row bottom15"> 
		<div class="col-md-2 col-xs-4 text-right bold">下单用户:</div>
		<div class="col-md-10 col-xs-6"><%=orderInfo.getUserObj().getName()%></div>
	</div>
	<div class="row bottom15"> 
		<div class="col-md-2 col-xs-4 text-right bold">订单总金额:</div>
		<div class="col-md-10 col-xs-6"><%=orderInfo.getTotalMoney()%></div>
	</div>
	<div class="row bottom15"> 
		<div class="col-md-2 col-xs-4 text-right bold">支付方式:</div>
		<div class="col-md-10 col-xs-6"><%=orderInfo.getPayWay()%></div>
	</div>
	<div class="row bottom15"> 
		<div class="col-md-2 col-xs-4 text-right bold">订单状态:</div>
		<div class="col-md-10 col-xs-6"><%=orderInfo.getOrderStateObj()%></div>
	</div>
	<div class="row bottom15"> 
		<div class="col-md-2 col-xs-4 text-right bold">下单时间:</div>
		<div class="col-md-10 col-xs-6"><%=orderInfo.getOrderTime()%></div>
	</div>
	<div class="row bottom15"> 
		<div class="col-md-2 col-xs-4 text-right bold">收货人:</div>
		<div class="col-md-10 col-xs-6"><%=orderInfo.getReceiveName()%></div>
	</div>
	<div class="row bottom15"> 
		<div class="col-md-2 col-xs-4 text-right bold">收货人电话:</div>
		<div class="col-md-10 col-xs-6"><%=orderInfo.getTelephone()%></div>
	</div>
	<div class="row bottom15"> 
		<div class="col-md-2 col-xs-4 text-right bold">收货地址:</div>
		<div class="col-md-10 col-xs-6"><%=orderInfo.getAddress()%></div>
	</div>
	<div class="row bottom15"> 
		<div class="col-md-2 col-xs-4 text-right bold">订单备注:</div>
		<div class="col-md-10 col-xs-6"><%=orderInfo.getOrderMemo()%></div>
	</div>
	<div class="row bottom15"> 
		<div class="col-md-2 col-xs-4 text-right bold">商家:</div>
		<div class="col-md-10 col-xs-6"><%=orderInfo.getSellObj().getName()%></div>
	</div>
	<div class="row bottom15"> 
		<div class="col-md-2 col-xs-4 text-right bold">订购的商品:</div>
		<div class="col-md-10 col-xs-6">


					<div class="row">
						<div class="col-md-8 top5">
							<div class="table-responsive">
								<table class="table table-condensed table-hover">
									<tr class="success bold">
										<td>
											序号
										</td>  
										<td>
											订单商品
										</td>
										<td>
											商品单价
										</td>
										<td>
											购买数量
										</td>
										 
									</tr>
									<%
										/*计算起始序号*/
										int startIndex = 0;
										/*遍历记录*/
										for (int i = 0; i < orderItemList.size(); i++) {
											int currentIndex = startIndex + i + 1; //当前记录的序号
											OrderItem orderItem = orderItemList.get(i); //获取到订单条目对象
									%>
									<tr>
										<td><%=currentIndex%></td> 
										<td><a href="<%=basePath %>Product/<%=orderItem.getProductObj().getProductId() %>/frontshow" target="_blank"><%=orderItem.getProductObj().getProductName()%></a></td>
										<td><%=orderItem.getPrice()%></td>
										<td><%=orderItem.getOrderNumer()%></td>
										 
									</tr>
									<%
										}
									%>
								</table>
							</div>
						</div>
					</div>


				</div>
	</div>
	<div class="row bottom15">
		<div class="col-md-2 col-xs-4"></div>
		<div class="col-md-6 col-xs-6">
			<button onclick="history.back();" class="btn btn-primary">返回</button>
		</div>
	</div>
</div> 
<jsp:include page="../footer.jsp"></jsp:include>
<script src="<%=basePath%>plugins/jquery.min.js"></script>
<script src="<%=basePath%>plugins/bootstrap.js"></script>
<script src="<%=basePath%>plugins/wow.min.js"></script>
<script>
var basePath = "<%=basePath%>";
$(function(){
        /*小屏幕导航点击关闭菜单*/
        $('.navbar-collapse a').click(function(){
            $('.navbar-collapse').collapse('hide');
        });
        new WOW().init();
 })
 </script> 
</body>
</html>

