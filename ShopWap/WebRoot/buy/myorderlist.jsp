<%@ page language="java" import="java.util.*,com.notice.dao.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
 
<!DOCTYPE html>
<html>
	<head>
		<title>weborder</title>
		<meta name="author" content="zz zr tzq">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">
		<meta name="format-detection" content="telephone=no">
		<meta http-equiv="Expires" CONTENT="-1">           
		<meta http-equiv="Cache-Control" CONTENT="no-cache">           
		<meta http-equiv="Pragma" CONTENT="no-cache">           
		<link rel="stylesheet" type="text/css" href="../css/base.css?v=20140414100001" charset="gbk"/>
		<link rel="stylesheet" type="text/css" href="../css/extend.css" charset="gbk"/>
		<link rel="stylesheet" type="text/css" href="../css/hotel.css" charset="gbk"/>
		<link rel="stylesheet" type="text/css" href="../css/airline.css" charset="gbk"/>
		<script type="text/javascript">
			var _winLocation=window.location.href;//获得当前页面的路径，根据路径规则进行逐页替换
			var _isWebKit = '__proto__' in {};//是否是webkit内核
			if(_isWebKit){//如果是webkit内核，则分模块使用zepto
				//要使用zeptojs的路径列表，可以做为分模块替换的开关
				var _locationList=new Array();
				//活动模块
				_locationList.push('/activity/proActList');
				_locationList.push('/activity/proActWareList');
				_locationList.push('/activity/list');
				//商品分类模块
				_locationList.push('/category/');
				//京东快讯模块
				_locationList.push('/newslist.html');
				_locationList.push('/newslist/');
				_locationList.push('/news/');
				//机票模块
				_locationList.push('/airline/');
				//酒店模块
				_locationList.push('/hotel/');
				//团购模块
				_locationList.push('/tuan/');
				//首页相关
				_locationList.push('/hotbrand.html');//品牌馆
				//商品筛选相关
				_locationList.push('/ware/expandSort.action');
				_locationList.push('/ware/categoryFilter.action');
				_locationList.push('/ware/search.action');
				_locationList.push('/products/');
				
				_locationList.push('/notice/');//通告模块
				_locationList.push('/coupons/');//随地惠模块
				_locationList.push('/chongzhi/');//手机充值模块
				_locationList.push('/comment/');//手机推荐模块
				_locationList.push('/pay/');//支付
				_locationList.push('/order/');//订单
				var _needReplace = false;
				//如果当前路径符合要使用的路径规则，则进行替换
				for(var i=0;i<_locationList.length;i++){
					if(_winLocation.indexOf(_locationList[i])!=-1){
						_needReplace=true;
						break;
					}
				}
				//如果是首页的话，则使用zepto
				var _tmp = _winLocation.replace(/(^http:\/\/)|(\/*$)/g,'');
				if(_tmp.indexOf('/')<0 || (_tmp.split('/').length<=2 && _tmp.indexOf('/index')>=0)){
					_needReplace=true;
				}
				//如果是商品详情页的话，则使用zepto
                var _dlocationList=new Array();
                _dlocationList.push(/\/product\/([0-9]+)\.html/);
                _dlocationList.push(/\/orderComment\/([0-9]+)\.html/);
                _dlocationList.push(/\/consultations\/([0-9]+)\.html/);
                _dlocationList.push(/\/consultations\/([0-9]+)-([0-9]+)\.html/);
                _dlocationList.push(/\/comments\/([0-9]+)\.html/);
                for(var i=0,len=_dlocationList.length;i<len;i++){
                	if(_dlocationList[i].test(_winLocation)){
                		_needReplace=true;
               			 break;
               		 }
                }
				if(_needReplace){
					document.write('<script src="../js/zepto.min.js"><\/script>');
					document.write('<script type="text/javascript">window.jQuery=window.Zepto;<\/script>');
				}else{
					document.write('<script src="../js/jquery-1.6.2.min.js"><\/script>');
				}
			}else{//如果是非webkit内核直接使用jquery
				document.write('<script src="../js/jquery-1.6.2.min.js"><\/script>');
			}
		</script>
				        <script type="text/javascript" src="../js/html5/common.js?v=201401141358"></script>
        <script type="text/javascript" src="../js/html5/spin.min.js"></script>
	</head>

<body id="body">
<a name="top"></a>
	<header>
		<div class="new-header">
			<a href="javascript:pageBack();" class="new-a-back" id="backUrl"><span>返回</span></a>
			<h2>我的订单</h2>
			<a href="javascript:void(0)" id="btnJdkey" class="new-a-jd"><span>we键</span></a>
		</div>
		<div class="new-jd-tab" style="display:none" id="jdkey">
			<div class="new-tbl-type">
				<a href="/ShopWap/index.jsp" class="new-tbl-cell">
					<span class="icon">首页</span>
					<p style="color:#6e6e6e;">首页</p>
				</a>
				<a href="/ShopWap/type/type.jsp" class="new-tbl-cell">
					<span class="icon2">分类搜索</span>
					<p style="color:#6e6e6e;">分类搜索</p>
				</a>
				<a href="/ShopWap/shopcar/shopcar.do?action=show" id="html5_cart" class="new-tbl-cell">
					<span class="icon3">购物车</span>
					<p style="color:#6e6e6e;">购物车</p>
				</a>
				<a href="/ShopWap/buy/myOrderServlet.do?action=myw" class="new-tbl-cell">
					<span class="icon4">我的京东</span>
					<p style="color:#6e6e6e;">我的京东</p>
				</a>
			</div>
		</div>
	</header>

	<body class="cart list">
		<div style="width:100%;z-index:1001;position:absolute;overflow:hidden;background:rgba(145, 145, 145, .4);display:none" id="background" >
		</div>
		<div class="m" id="m">

		<div class="mc cart-list tl">
			<ul>
			<c:if test="${orders!=null}">
				<c:forEach items="${orders }" var="order">
					<li class="first" id="product645456">
					<div class="clear"> 
						<div class="p-img p-img-v1 fl">
							<a href='/ShopWap/items/items.do?id={order.itemId}' class="pay-img"><img width="50" alt="{order.itemName }" src="${order.itemLogo }"/></a>
						</div>
						<div class="fl fl-v1">
							<p class="p-name"><a href='#'>${order.itemName }</a></p>
							<p class="p-num gray">编号：${order.itemId}</p>
							<p class="p-price">单价：<span class="red">￥${order.price }</span></p> 
							<p class="p-price2"></p>
							<p class="p-amount">状态:
								<c:if test="${order.state==-7}"><span>已删除</span></c:if>
								<c:if test="${order.state==-6}"><span>维权失败</span></c:if>
								<c:if test="${order.state==-5}"><span>正在维权</span></c:if>
								<c:if test="${order.state==-4}"><span>退款失败</span></c:if>
								<c:if test="${order.state==-3}"><span>退款成功</span></c:if>
								<c:if test="${order.state==-2}"><span>已申请退货</span></c:if>
								<c:if test="${order.state==-1}"><span>已关闭</span></c:if>
								<c:if test="${order.state==0}"><span>等待付款</span></c:if>
								<c:if test="${order.state==1}"><span>等待发货</span></c:if>
								<c:if test="${order.state==2}"><span>等待确认收货</span></c:if>
								<c:if test="${order.state==3}"><span>等待评价</span></c:if>
								<c:if test="${order.state==4}"><span>交易已完成</span></c:if>
							</p>
							
							<p class="p-amount">操作: &nbsp;&nbsp;&nbsp;
							
								<a href="/ShopWap/buy/myOrderServlet.do?action=showOrderById&orderId=${order.id }" target="_blank" class="btn" clstag="click|keycount|orderinfo|order_check">查看</a>
								<c:if test="${order.state==0}">
								<a href="/ShopWap/pay/pay.do?action=subpay&orderid=${order.id}&totalprice=${order.price}" class="btn" target="_blank">付款</a>
								</c:if>
								<c:if test="${order.state==2}">
								<a href="#" class="btn" onclick="confirmBuy(${order.id})"clstag="click|keycount|orderinfo|order_comment">确认收货</a>
								<a href="/ShopWap/buy/myOrderServlet.do?action=refund&orderId=${order.id }" class="btn" clstag="click|keycount|orderinfo|order_comment">申请退款</a>
								<a href="/ShopWap/logistic/logshow.do?action=show&orderId=${order.id}" class="btn" clstag="click|keycount|orderinfo|order_comment">查看物流</a>
								</c:if>
								<c:if test="${order.state==3}">
								<a href="/ShopWap/buy/myOrderServlet.do?action=tojudge&orderId=${order.id }" class="btn" clstag="click|keycount|orderinfo|order_comment">评价</a>
								</c:if>
								<c:if test="${order.state==4||order.state==-1}">
								<a href="#"onclick="checkDel(${order.id})" class="btn" clstag="click|keycount|orderinfo|order_comment">删除</a>
								</c:if>
								<c:if test="${order.state==-4}">
								<a href="/ShopWap/buy/myOrderServlet.do?action=right&orderId=${order.id }" class="btn" clstag="click|keycount|orderinfo|order_comment">申请维权</a>
								</c:if>
								<c:if test="${order.state==-7}">
								<a href="/ShopWap/buy/myOrderServlet.do?action=gobackOrder&orderId=${order.id }" class="btn" clstag="click|keycount|orderinfo|order_comment">还原</a>
								</c:if>
								
							</p>					
						</div>  	
					</div>
					<p class="p-price2"></p>
					</li>
					</c:forEach> 			
					<input type="hidden" id="cartNum" value="2" />
				</c:if>
				
				<c:if test="${orders==null }">
					<div class="clear"> 
						<div class="fl fl-v1">
								<p class="p-name">您没有订单哦</p>
						</div>
					</div>
				</c:if>

			<script type="text/javascript" src="/ShopWap/js/html5/cart.js"></script>
			</ul>   
		</div>


		</div>
	</body>
	<input type="hidden" id="resourceType" value="" />
	<input type="hidden" id="resourceValue" value="" />
	<script type="text/javascript" src="../js/html5/cart.js"></script>
	<script>
		
	$(document).ready(function(){
				if(!isBlank(location.hash.replace(/#/g,""))){
					location.hash='';
					location.reload();
				}
				document.getElementById("background").style.height=document.getElementById("m").scrollHeight+20+"px";
				if(isBlank('2')) //no product
				{
					clearCart();
				}else{
					judgeSubmit('85.9');
				}
			});
	</script>
	<div class="login-area" id="footer">
	<div class="login">
		<% 
			boolean login = false;				// 是否登录
			String account = null;				// 帐号
			//String ssid = null;					// SSID标识
			if(request.getCookies() != null){					// 如果Cookie不为空
			for(Cookie cookie : request.getCookies()){		// 遍历Cookie
			if(cookie.getName().equals("account"))	// 如果Cookie名为name
			account = cookie.getValue();		// 保存account内容
			}
			}
			if(account!=null)
			login=true;
			System.out.println(account);
		%>

		<% if(login){ %>
			<a href="/ShopWap/buy/myOrderServlet.do?action=myw"> 欢迎您, ${ cookie.account.value }. </a>&nbsp;&nbsp; <span class="lg-bar">|</span>
			<a href="/ShopWap/login/login.do?action=logout">退出</a>
		<% }
			else { %> </a>
			<a href="/ShopWap/login/login.jsp">登录</a><span class="lg-bar">|</span>
			<a href="/ShopWap/login/register.jsp">注册</a> 
		<%} %>
		<span  class="new-fr"><a href="#">反馈</a><span class="lg-bar">|</span><a href="#top">回到顶部</a></span>
	</div>
	<div class="version"><a href="#">标准版</a><a href="javascript:void(0)" class="on">触屏版</a><a href="#" id="toPcHome">电脑版</a></div>
	<div class="copyright"> </div>
	</div>

	<div style="display:none;">
		<img src="/ja.jsp?&amp;utmn=1612064190&amp;utmr=http%3A%2F%2Fm.jd.com%2Fuser%2Fhome.action%3Fsid%3Da7a7f53a1ecf86a5af543c61903e2a76&amp;utmp=%2Fuser%2Fmessages.action%3Fsid%3Da7a7f53a1ecf86a5af543c61903e2a76&amp;guid=ON&jav=html5&pin=jd_5eb33f595301a&utmac=MO-J2011-1" />
	</div>
	<script type="text/javascript">
	$("#unsupport").hide();
	if(!testLocalStorage()){ //not support html5
	if(2!=0 && !$clearCart && !$teamId){
		$("#html5_cart_num").text(2>0>0);
	}
	}else{
	updateToolBar('');
	}

	$("#html5_cart").click(function(){

	location.href='/ShopWap/shopcar/shopcar.do?action=show';
	});

	function reSearch(){
	var depCity = window.sessionStorage.getItem("airline_depCityName");
	if(testSessionStorage() && isNotBlank(depCity) && !/^\s*$/.test(depCity) && depCity!=""){
		var airStr = '<form action="/airline/list.action" method="post" id="reseach">'
		+'<input type="hidden" name="sid"  value="c9c69ac685f868916e14f8f32da210ca"/>'
		+'<input type="hidden" name="depCity" value="'+ window.sessionStorage.getItem("airline_depCityName") +'"/>'
		+'<input type="hidden" name="arrCity" value="'+ window.sessionStorage.getItem("airline_arrCityName") +'"/>'
		+'<input type="hidden" name="depDate" value="'+ window.sessionStorage.getItem("airline_depDate") +'"/>'
		+'<input type="hidden" name="depTime" value="'+ window.sessionStorage.getItem("airline_depTime") +'"/>'
		+'<input type="hidden" name="classNo" value="'+ window.sessionStorage.getItem("airline_classNo") +'"/>'
		+'</form>';
		$("body").append(airStr);
		$("#reseach").submit();
	}else{
		window.location.href='/airline/index.action?sid=c9c69ac685f868916e14f8f32da210ca';
	}
	}
	//banner 关闭点击
	$('.div_banner_close').click(function(){
		$('#div_banner_header').unbind('click');
		jQuery.post('/index/addClientCookieVal.json',function(d){
			  $('#div_banner_header').slideUp(500);
		});
	});
	//banner 下载点击
	$('.div_banner_download').click(function(){
		 var downloadUrl = $(this).attr('url');
		 jQuery.post('/index/addClientCookieVal.json',function(d){
			   window.location.href=downloadUrl;
		});
	});
	$(document).ready(function(){
		var _loadScript = function(url, options,cb){
			var script = document.createElement("script");
			var def = {
				type: "text/javascript",
				charset:"utf-8"
			}
			options= options|| {
			}
			for(var i in options){
				def[i] = options[i];
			}
			script.src = url;
			
			for(var i in def){
				script.setAttribute(i,def[i]);
			}
			script.addEventListener("load",function(){
				cb && cb();
			},false)
			document.getElementsByTagName("head")[0].appendChild(script);
		}
		
		if($(".download-con").length){
			_loadScript("/js/2013/installapp.js?v=20140422100001",{},function(){
			});
		}
		
	})

	 function choose()
	 {
	   
		var state = document.getElementById("orderState").value;
		if(!state.length==0)
		{
			window.location.href="/shop/buy/myOrderServlet.do?action=showOrder&state="+state;
		}
		
	 }
	 function checkDel(id)
	 {
		if(confirm("你确定要删除该订单吗？"))
			location.href="/shop/buy/myOrderServlet.do?action=deleteOrder&orderId="+id;
	 }
	  function confirmBuy(id)
	 {
		if(confirm("你确定要确认收货吗？小心人财两空哟！"))
			location.href="/shop/buy/myOrderServlet.do?action=confirmBuy&orderId="+id;
	 }
	function search()
	{ 
	  var key = document.getElementsByName("key")[0].value;
	  if(key=="")
	  {
		return;
	  }  
	  window.location.href="/shop/search/search.do?key="+encodeURIComponent(encodeURIComponent(key));
	}              	
	</script>
	</body>
</html>
