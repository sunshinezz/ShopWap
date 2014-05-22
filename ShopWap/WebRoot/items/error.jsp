<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
 
<!DOCTYPE html>
<html>
	<head>
		<title>${item.name }</title>
		<meta name="author" content="m.jd.com">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">
		<meta name="format-detection" content="telephone=no">
		<meta http-equiv="Expires" CONTENT="-1">           
		<meta http-equiv="Cache-Control" CONTENT="no-cache">           
		<meta http-equiv="Pragma" CONTENT="no-cache">           
		<link rel="stylesheet" type="text/css" href="../css/base2013.css?v=20140414100001" charset="gbk"/>
		<link rel="stylesheet" type="text/css" href="../css/2013/ware/view.css?v=20140318135401" charset="gbk"/>	
		<link rel="apple-touch-icon-precomposed" href="http://m.jd.com/images/apple-touch-icon.png"/>
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
				<h2>商品详情</h2>
				<a href="javascript:void(0)" id="btnJdkey" class="new-a-jd"><span>京东键</span></a>
			</div>
			<div class="new-jd-tab" style="display:none" id="jdkey">
				<div class="new-tbl-type">
					<a href="/index.html?sid=c9c69ac685f868916e14f8f32da210ca" class="new-tbl-cell">
						<span class="icon">首页</span>
						<p style="color:#6e6e6e;">首页</p>
					</a>
					<a href="/category/all.html?sid=c9c69ac685f868916e14f8f32da210ca" class="new-tbl-cell">
						<span class="icon2">分类搜索</span>
						<p style="color:#6e6e6e;">分类搜索</p>
					</a>
					<a class="new-tbl-cell" id="settleup-url" href="/ShopWap/shopcar/shopcar.do?action=show">
						<span class="icon3">购物车</span>
						<p style="color:#6e6e6e;">购物车</p>
					</a>
					<a href="/user/home.action?sid=c9c69ac685f868916e14f8f32da210ca" class="new-tbl-cell">
						<span class="icon4">我的京东</span>
						<p style="color:#6e6e6e;">我的京东</p>
					</a>
				</div>
			</div>
		</header>
		<script type="text/javascript" src="/js/2013/ware/view.js?v=201403261759"></script>
		<script type="text/javascript" src="/js/2013/ware/newView.js?v=201403181290"></script>
		
		<div id="imgSlider" style="position:relative;center;">  
			<span class="tbl-cell"><img src="/ShopWap/images/html5/error.png" height="80%" width = "100%" seq="0" alt="${item.name }" qvod="0" data-img="1" jqimg=" ../img/item/items.jpg"></span>				
		</div>

		<script>
			var time,type;
			
			$(function(){
				
				if('true' == 'false'){
					$('#cart1').css("display","none");
				}
				else if(!(true && true && ${item.price }>0))	{
					$('#add_cart').addClass('btn-cart-def');
					$('#directorder').addClass('btn-buy-def');
					$("#add_cart").unbind('click');
					$("#directorder").unbind('click');
				}else{
					$('#add_cart').removeClass('btn-cart-def');
					$('#directorder').removeClass('btn-buy-def');
				}
				
				type = $('#yuyueType').val();
				switch(type){
					case '1':
						$('#yuyueing').find('.btn-yuyue').attr('data','1');
						$('#yuyuecontext').text('\u5f00\u59cb\u9884\u7ea6');
						$('#yuyueing').show();
						time = new Date().getTime()/1000 + parseInt('-1'.length > 0 ? '-1':0);
						getTimes();
						break
					case '2':
						$('.btn-yuyue2').attr('data','2');
						$('#yuyuenow').show();
						$('#yuyuenow').css("display","block");
						time = new Date().getTime()/1000 + parseInt('-1'.length > 0 ? '-1':0);
						getTimes();
						break
					case '3':
						$('#yuyueing').find('.btn-yuyue').attr('data','3');
						$('#yuyuecontext').text('\u5f00\u59cb\u62a2\u8d2d');
						if('-1'.length>0){
							time = new Date().getTime()/1000 + parseInt('-1'.length > 0 ? '-1':0);
							getTimes();
						}else{
							$('#yuyuetime').text('\u62a2\u8d2d\u672a\u5f00\u59cb\uff0c\u656c\u8bf7\u5173\u6ce8');
							$('#yuyuecontext').empty();
						}
						$('#yuyueing').show();
						break
					case '4':
						$('#yuyuecart').show();
						$('#cartyuyue').attr('data','4');
						time = new Date().getTime()/1000 + parseInt('-1'.length > 0 ? '-1':0);
						getTimes();
						break
					case '5':
						if('true' == 'false'){
							$('#yuyueendcontext').text('\u62a2\u8d2d\u5df2\u7ed3\u675f');
							$('#yuyueend').css("display","block");
						}else{
							if(!(true && true && ${item.price }>0)){
								$('#add_cart').addClass('btn-cart-def');
								$('#directorder').addClass('btn-buy-def');
								$("#add_cart").unbind('click');
								$("#directorder").unbind('click');
							}else{
								$('#cart1').css("display","table");
								$('#add_cart').removeClass('btn-cart-def');
								$('#directorder').removeClass('btn-buy-def');
							}
						}
						break
					default:
						break
				}
				
				
				
				var pid=$('#currentWareId').val();
				
				var url = "http://chat1.jd.com/api/checkChat?pid=" +pid + "&entry=m_item&returnCharset=gb2312&callback=?";
				if(true){
					jQuery.getJSON(url, doResult);
				}
			
				 function doResult(json) {
					if ((!json || !json.code) &&(''=='http://mall.jd.com/m/index-60967.html') ) {
						$('#jshopAndIm').css('display','none');
						return
				   }
				   if(!json || !json.code){
						return;
				   }
				   var code = json.code;
				   if(code == 1){
						if($('#currentWareId').val()<1000000000){
							$('#kefu').show();
							$('#im').addClass("btn-call-def");
						}else{
							$('#kefu').show();
							var url="http://im.m.jd.com/merchant/index?v=6&sku="+$('#currentWareId').val()+"&imgUrl="+$('#imgUrl').val()+"&goodName="+encodeURIComponent(encodeURIComponent($("#goodName").val()))+"&jdPrice="+$('#jdPrice').val()+"&sid="+$('#sid').val();
							$('#im').attr('href',url);
						}
				   }else if(code==2 || code==3 || code==9){
						$('#kefu').show();
						$('#im').addClass("btn-call-def");
				   }else if(''=='http://mall.jd.com/m/index-60967.html'){
						$('#jshopAndIm').css('display',none);
				   }
				}
				
				$('#kucun').bind("click",function(){
					if($('#select').attr("data")=='none'){
						$('#select').css("display","block");
						$('#select').attr("data","block")
						$('#kucun').removeClass("on");
					}else{
						$('#select').css("display","none");
						$('#select').attr("data","none")
						$('#kucun').addClass("on");
					}
				});
			
				if(window.localStorage){
					addLocalStorage($('#currentWareId').val());
				}
				$('footer').css('visibility','hidden');
			})
		</script>
		   
		   
			<div class="login-area" id="footer">
				<div class="login">
					 <% boolean login = false;				// 是否登录
					String account = null;				// 帐号
					//String ssid = null;					// SSID标识
					if(request.getCookies() != null){					// 如果Cookie不为空
						for(Cookie cookie : request.getCookies()){		// 遍历Cookie
							if(cookie.getName().equals("account"))	// 如果Cookie名为name
								account = cookie.getValue();		// 保存account内容
								///HttpUtility.UrlDecode(cookie["Simple1"]);
								//URLEncoder.encode(name,"utf-8");
							//if(cookie.getName().equals("ssid"))		// 如果为SSID
							//	ssid = cookie.getValue();			// 保存SSID内容
						}
					}
					if(account!=null)
						login=true;
					System.out.println(account);
					%>
			   
					<% if(login){ %>
						欢迎您, ${ cookie.account.value }. &nbsp;&nbsp; 
						<a href="/ShopWap/login/login.do?action=logout">退出</a>
					<% }
					 else { %> </a>
						<a href="/ShopWap/login/login.jsp">请先登录</a><span class="lg-bar">|</span>
						<a href="/ShopWap/login/login.do?action=register" target="_top">免费注册</a> 
					<%} %>
						
						<span  class="new-fr"><a href="#">反馈</a><span class="lg-bar">|</span><a href="#top">回到顶部</a></span>
				   </div>
					<div class="version"><a href="#">标准版</a><a href="javascript:void(0)" class="on">触屏版</a><a href="#" id="toPcHome">电脑版</a></div>
					<div class="copyright">&copy;</div>
				</div>
			<div style="display:none;">
				<img src="../ja.jsp@&utmn=547066117&utmr=-&utmp=_252Fcategory_252Fall.action_253Fsid_253De0d0f025d6d3e8e8d7be5428c43ef911%26res057A14E15A" />
			</div>
		<script type="text/javascript">
		$("#unsupport").hide();
		if(!testLocalStorage()){ //not support html5
			if(3!=0 && !$clearCart && !$teamId){
				$("#html5_cart_num").text(3>0>0);
			}
		}else{
			updateToolBar('');
		}

		$("#html5_cart").click(function(){
		//	syncCart('c9c69ac685f868916e14f8f32da210ca',true);
			location.href='/cart/cart.action';
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
					_loadScript("../js/2013/installapp.js?v=20140422100001",{},function(){
					});
				}
				
			})
		</script>
	</body>
</html>
