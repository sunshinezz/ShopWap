<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
	<head>
		<title>我的w购</title>
		<meta name="author" content="m.jd.com">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">
		<meta name="format-detection" content="telephone=no">
		<meta http-equiv="Expires" CONTENT="-1">           
		<meta http-equiv="Cache-Control" CONTENT="no-cache">           
		<meta http-equiv="Pragma" CONTENT="no-cache">           
		<link rel="stylesheet" type="text/css" href="../css/base2013.css?v=20140414100001" charset="gbk"/>
		<link rel="stylesheet" type="text/css" href="../css/myhome.css" charset="gbk"/>	
		
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
			<h2>我的we购</h2>
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
	<div class="new-ct">
			<div class="new-user-infobox">
			<a class="new-user-photo">
				<img src='../images/html5/defaul.png' width="75" height="75"/>
			</a>
			<div class="new-bg-img">
				<div class="new-user-info">
					<div>
						<span class="new-txt"><span class="new-txt-float new-elps">${ cookie.account.value }</span><span class="new-block-ctr">0</span></span>
						<span class="new-txt2"><span class="new-txt-float new-elps"></span><span class="new-block-ctr">积分</span></span>
					</div>
					<a class="new-a-message" href="/ShopWap/msg/msg.do?action=buy">
						<span class="new-txt4">消息</span>
						<span class="new-txt3">2</span>
					</a>
				</div>
			</div>
			<div class="new-user-info2">
				<div class="new-info-tbl-box">
					<div class="new-info-tbl">
						<a class="new-tbl-cell" href='#'>
							<span>0</span>
							<span>we币</span>
						</a>
						<a class="new-tbl-cell" href='/ShopWap/pay/pay.do?action=torecharge'>
							<span>￥${balance }</span>
							<span>余额</span>
						</a>
						<a class="new-tbl-cell" href='#'>
							<span> <font color="gray">0</font>  </span>
							<span>优惠劵</span>
						</a>
						<a class="new-tbl-cell" href='#'>
							<span> <font color="gray">0</font> </span>
							<span>we卡</span>
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%
		 ArrayList<Integer> numlist = (ArrayList<Integer>)request.getAttribute("numlist");
	%>
	<div class="new-section-lst">
		<ul class="new-lst-ul">
			<li class="new-lst-li">
				<a href='/ShopWap/buy/myOrderServlet.do?action=mylike'>
					我的关注<span class="new-arr"></span>
				</a>
			</li>
		</ul>
		<ul class="new-lst-ul">
			<li class="new-lst-li">
				<a href="/ShopWap/buy/myOrderServlet.do?action=showOrder&state=2">待收货订单<span class="txt-rd">(<%= numlist.get(9)%>)</span><span class="new-arr"></span></a>

			</li>
			<li class="new-lst-li">

				<a href="/ShopWap/buy/myOrderServlet.do?action=showOrder&state=0">待付款订单<span class="txt-rd">(<%= numlist.get(7)%>)</span><span class="new-arr"></span></a>

			</li>
			<li class="new-lst-li">

				<a href="/ShopWap/buy/myOrderServlet.do?action=showOrder&state=1">待发货<span class="txt-rd">(<%= numlist.get(8)%>)</span><span class="new-arr"></span></a>

			</li>
			<li class="new-lst-li">
				<a href='/ShopWap/buy/myOrderServlet.do?action=showAddress'>收货地址管理<span class="new-arr"></span></a>
			</li>
		</ul>
		<ul class="new-lst-ul">
			<li class="new-lst-li">
				<a href='#' >修改登录密码<span class="new-arr"></span></a>
			</li>
			<li class="new-lst-li">                         
				<a href='#' >重置支付密码<span class="new-arr"></span></a>
			</li>
		</ul>
		
	</div>


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
		<img src="ja.jsp@&utmn=1670342429&utmr=-&utmp=_252Findex_252Findex.action_253Fv_253Dt&guid=ON&jav=html5&pin=-&utmac=MO-J2011-1" />
	</div>
		<script type="text/javascript">
		$("#unsupport").hide();
		if(!testLocalStorage()){ //not support html5
			if(0!=0 && !$clearCart && !$teamId){
				$("#html5_cart_num").text(0>0>0);
			}
		}else{
			updateToolBar('');
		}

		$("#html5_cart").click(function(){
		//	syncCart('cb4a3639cc29d400efb04ed9b084c9ef',true);
			location.href='/cart/cart.action';
		});

		function reSearch(){
		var depCity = window.sessionStorage.getItem("airline_depCityName");
			if(testSessionStorage() && isNotBlank(depCity) && !/^\s*$/.test(depCity) && depCity!=""){
				var airStr = '<form action="/airline/list.action" method="post" id="reseach">'
				+'<input type="hidden" name="sid"  value="cb4a3639cc29d400efb04ed9b084c9ef"/>'
				+'<input type="hidden" name="depCity" value="'+ window.sessionStorage.getItem("airline_depCityName") +'"/>'
				+'<input type="hidden" name="arrCity" value="'+ window.sessionStorage.getItem("airline_arrCityName") +'"/>'
				+'<input type="hidden" name="depDate" value="'+ window.sessionStorage.getItem("airline_depDate") +'"/>'
				+'<input type="hidden" name="depTime" value="'+ window.sessionStorage.getItem("airline_depTime") +'"/>'
				+'<input type="hidden" name="classNo" value="'+ window.sessionStorage.getItem("airline_classNo") +'"/>'
				+'</form>';
				$("body").append(airStr);
				$("#reseach").submit();
			}else{
				window.location.href='/airline/index.action?sid=cb4a3639cc29d400efb04ed9b084c9ef';
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
		</script>
	</body>
</html>
