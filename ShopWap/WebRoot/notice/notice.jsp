<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

 
<!DOCTYPE html>
<html>
	<head>
		<title>消息触屏版</title>
    	<meta name="author" content="m.jd.com">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
		<meta name="apple-mobile-web-app-capable" content="yes">
        <meta name="apple-mobile-web-app-status-bar-style" content="black">
        <meta name="format-detection" content="telephone=no">
		<meta http-equiv="Expires" CONTENT="-1">           
		<meta http-equiv="Cache-Control" CONTENT="no-cache">           
		<meta http-equiv="Pragma" CONTENT="no-cache">           
		<link rel="stylesheet" type="text/css" href="../css/base2013.css?v=20140414100001" charset="gbk"/>


		<link rel="stylesheet" type="text/css" href="../css/messages.css" charset="gbk"/>	


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
				<h2>消息中心</h2>
				<a href="javascript:void(0)" id="btnJdkey" class="new-a-jd"><span>京东键</span></a>
			</div>
			<div class="new-jd-tab" style="display:none" id="jdkey">
				<div class="new-tbl-type">
					<a href="/index.html?sid=a7a7f53a1ecf86a5af543c61903e2a76" class="new-tbl-cell">
						<span class="icon">首页</span>
						<p style="color:#6e6e6e;">首页</p>
					</a>
					<a href="/category/all.html?sid=a7a7f53a1ecf86a5af543c61903e2a76" class="new-tbl-cell">
						<span class="icon2">分类搜索</span>
						<p style="color:#6e6e6e;">分类搜索</p>
					</a>
					<a href="javascript:void(0)" id="html5_cart" class="new-tbl-cell">
						<span class="icon3">购物车</span>
						<p style="color:#6e6e6e;">购物车</p>
					</a>
					<a href="/user/home.action?sid=a7a7f53a1ecf86a5af543c61903e2a76" class="new-tbl-cell">
						<span class="icon4">我的京东</span>
						<p style="color:#6e6e6e;">我的京东</p>
					</a>
				</div>
			</div>
			
		
		</header>
		
		
		<div class="new-ct">
			<div class="new-msg-center">
				<div class="new-msg-section">
					<div class="new-tit">
						<span class="new-user">
							<span class="new-elps">用户自提</span>
						</span>
						<span class="new-time">时间：2013-07-16 09:02:15</span>
					</div>
					<div class="new-cont">
						<span class="new-cont-txt">您的订单647455433已到四川大学江安营业厅（江安商业街阳光科技城）如需帮助请致电028-85998518</span>
						<a class="new-a-more" href='/user/oneorderdetail.action?orderId=647455433&passKey=bd18f2721fcf668a02fd1660fcbaff4f&sid=a7a7f53a1ecf86a5af543c61903e2a76'>订单详情<span class="new-arr"></span></a>
					</div>
				</div>
				
				<div class="new-msg-section" id="detail">
					<div class="new-tit" >
						<span class="new-user">
							<span class="new-elps"><H1> ${notice.title} </H1></span>
						</span>
						<span class="new-time"><DIV class="summary"> 时间：${notice.createdate}&nbsp;&nbsp;&nbsp;&nbsp; </DIV></span>
					</div>
					<div class="new-cont">
						<span class="new-cont-txt">${notice.content}<BR /></span>
						<a class="new-a-more" href='/user/oneorderdetail.action?orderId=647455437&passKey=524858363270c9970c8699832e12f40e&sid=a7a7f53a1ecf86a5af543c61903e2a76'>订单详情<span class="new-arr"></span></a>
						<INPUT id="CommentVisible" type="hidden" value="false" />
					</div>	
				</div>
				<DIV id="review_top"> </DIV>
				<DIV id="container"> </DIV>
			
				
									
			</div>
			<div style="padding: 8px 0px 8px;font-size: 16px;color: #333;text-align: center;background:#FFF">
				<a href="/newslist.html?sid=a7a7f53a1ecf86a5af543c61903e2a76">We购快报 &gt;</a>
			</div>
		</div>
	   
		<div class="login-area" id="footer">
			<div class="login">
			
			
				<a rel="nofollow" href='/user/home.action?sid=a7a7f53a1ecf86a5af543c61903e2a76'>jd_5eb33..</a><span class="lg-bar">|</span><a rel="nofollow" href='/user/logout.action?sid=a7a7f53a1ecf86a5af543c61903e2a76'>退出</a>
				<span  class="new-fr"><a href="/showvote.html?sid=a7a7f53a1ecf86a5af543c61903e2a76">反馈</a><span class="lg-bar">|</span><a href="#top">回到顶部</a></span>
			</div>
			<div class="version"><a href="/index.html?v=w&sid=a7a7f53a1ecf86a5af543c61903e2a76">标准版</a><a href="javascript:void(0)" class="on">触屏版</a><a href="/index/pcsite.action" id="toPcHome">电脑版</a></div>
			<div class="copyright">&copy; m.jd.com </div>
		</div>

		<div style="display:none;">
							<img src="/ja.jsp?&amp;utmn=1612064190&amp;utmr=http%3A%2F%2Fm.jd.com%2Fuser%2Fhome.action%3Fsid%3Da7a7f53a1ecf86a5af543c61903e2a76&amp;utmp=%2Fuser%2Fmessages.action%3Fsid%3Da7a7f53a1ecf86a5af543c61903e2a76&amp;guid=ON&jav=html5&pin=jd_5eb33f595301a&utmac=MO-J2011-1" />
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
		//	syncCart('a7a7f53a1ecf86a5af543c61903e2a76',true);
			location.href='/cart/cart.action';
		});

		function reSearch(){
		var depCity = window.sessionStorage.getItem("airline_depCityName");
			if(testSessionStorage() && isNotBlank(depCity) && !/^\s*$/.test(depCity) && depCity!=""){
				var airStr = '<form action="/airline/list.action" method="post" id="reseach">'
				+'<input type="hidden" name="sid"  value="a7a7f53a1ecf86a5af543c61903e2a76"/>'
				+'<input type="hidden" name="depCity" value="'+ window.sessionStorage.getItem("airline_depCityName") +'"/>'
				+'<input type="hidden" name="arrCity" value="'+ window.sessionStorage.getItem("airline_arrCityName") +'"/>'
				+'<input type="hidden" name="depDate" value="'+ window.sessionStorage.getItem("airline_depDate") +'"/>'
				+'<input type="hidden" name="depTime" value="'+ window.sessionStorage.getItem("airline_depTime") +'"/>'
				+'<input type="hidden" name="classNo" value="'+ window.sessionStorage.getItem("airline_classNo") +'"/>'
				+'</form>';
				$("body").append(airStr);
				$("#reseach").submit();
			}else{
				window.location.href='/airline/index.action?sid=a7a7f53a1ecf86a5af543c61903e2a76';
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
