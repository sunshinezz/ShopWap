<%@ page language="java" import="java.util.*,com.notice.dao.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
 
<!DOCTYPE html>
<html>
	<head>
		<title>	未完成运单 - We购触屏版</title>
    	<meta name="author" content="m.jd.com">
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
		
		<link rel="stylesheet" type="text/css" href="/ShopWap/css/header.css" />
		<link rel="stylesheet" type="text/css" href="/ShopWap/css/top-search.css"/>
		<link rel="stylesheet" type="text/css" href="/ShopWap/css/top-show.css"/>
		
		
		<link rel="stylesheet" type="text/css" href="../css/logistic/top-link.css">
		<link rel="stylesheet" type="text/css" href="../css/logistic/main.css">
		<link rel="stylesheet" type="text/css" href="../css/logistic/order.css">
		</link>
		
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
				<h2>未完成运单</h2>
				
			</div>
			
		</header>
		
		<div class="order-tip">
			<DIV style="DISPLAY: none" id="safeinfo" class="m m3"> </DIV>
			<DIV class="o-mt">
			  <H2> 未完成的运单</H2>
			</DIV>
			<DIV id="order02" class="m m5">
			  <DIV class="mt">
				<UL class="taborder">
				  <LI jQuery1383550193134="32">
					<DIV class="tyies-t"> <STRONG class="ftx-04">全部运单</STRONG><S></S><B></B> </DIV>
				  </LI>
				</UL>
				<script type="text/javascript" language="javascript">
						 function choose()
						 {
						   
							var state = document.getElementById("orderState").value;
							if(!state.length==0)
							{
								window.location.href="/shop/buy/myOrderServlet.do?state="+state;
							}
							
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
				<DIV class="clr"> </DIV>
			  </DIV>
			  <DIV class="mc">
				<DIV class="tb-void">
				  <TABLE border="0" cellSpacing="0" cellPadding="0" width="100%">
					<TBODY>
					  <TR>
						<TH width="100"> 运单号</TH>
						<TH width="100"> 生成时间 </TH>
						<TH width="100"> 更新时间 </TH>
						<TH width="100"> 状态 </TH>
						<TH width="100"> 操作</TH>
					  </TR>
					</TBODY>
				   <c:forEach items="${loglist }" var="list">
					<TBODY id="tb-820609066" class="parent-815410507">
					  <TR id="track820609066" oty="0">
						<TD><DIV class="o-type"> ${list.id } </DIV>
						</TD>
						<TD><SPAN class="ftx-03">${list.cDate } <BR />
						  </SPAN>
						</TD>
						<TD><SPAN class="ftx-03">${list.eDate } <BR />
						  </SPAN>
						</TD>
						<TD><SPAN class="ftx-03">未完成<BR />
						  </SPAN>
						</TD>
						<TD id="operate820609066" class="order-doi" width="100">
						<SPAN id="pay-button-820609066"></SPAN>
						<A href="logManage.do?action=unfinishedshow&id=${list.id}" target="_blank" clstag="click|keycount|orderinfo|order_check">更新</A><BR/>
						<SPAN id="order_comment"></SPAN><SPAN class="pop-recycle-a" jQuery1383550193134="54"> 
						</TD>
					  </TR>
					</TBODY>
					</c:forEach>
					
				  </TABLE>
				</DIV>
			  </DIV>
			</DIV>
			<DIV class="m clearfix">
			  <DIV class="pagin fr">
				<!--  <span class="text">共8条记录</span>    <span class="text">共1页</span> -->
				<SPAN class="prev-disabled">上一页<B></B></SPAN>
				<!-- <span class="prev-disabled">首页</span> -->
				<A class="current">1</A>
				<!-- <span class="next-disabled">末页</span>  -->
				<SPAN class="next-disabled">下一页<B></B></SPAN> </DIV>
			</DIV>
			
		</div>
		
		
		
		
		<div style="display:none;"><img height="1" width="1" alt="" src="http://www.googleadservices.com/pagead/conversion/1066677870/imp.gif?label=LYIpCP7ZgAIQ7uzQ_AM&amp;guid=ON&amp;script=0"/></div>
		<input  type="hidden" id="sid" value="a7a7f53a1ecf86a5af543c61903e2a76"/>
		
		<script type="text/javascript" src="../js/touch_order_common.js"></script>
		<script>
			$("#body").addClass("orderList");
			initVar('','','','','a7a7f53a1ecf86a5af543c61903e2a76');
			
			if(true){
				clearCart();
			}
			
			if (true && window.androidPad) { //androidpad下单成功清除购物车
				 window.androidPad.clearShoppingCart();			 
			}
			function goAndroidPad(){
				 window.androidPad.orderFinish();	
			}
		</script>

	<div class="login-area" id="footer">
		<div class="login">
			
			
			<% boolean login = false;				// 是否登录
			String account = null;				// 帐号
			
			if(request.getCookies() != null){					// 如果Cookie不为空
				for(Cookie cookie : request.getCookies()){		// 遍历Cookie
					if(cookie.getName().equals("logistic"))	// 如果Cookie名为name
						account = cookie.getValue();		// 保存account内容
					
				}
			}
			if(account!=null)
				login=true;
			System.out.println(account);
            %>
			
			

			<% if(login){ %>
				<a href="/ShopWap/buy/myOrderServlet.do?action=myw"> 欢迎您, 物流：${ cookie.logistic.value }. </a>&nbsp;&nbsp; <span class="lg-bar">|</span>
				<a href="../logistic/logistic.do?action=logout">退出</a>
			<% }
				else { %> </a>
				<a href="/ShopWap/login/login.jsp">登录</a><span class="lg-bar">|</span>
				<a href="/ShopWap/login/register.jsp">注册</a> 
				<!--response.sendRedirect("/shop/login/login2.jsp");-->
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
			if(1!=0 && !true && !$teamId){
				$("#html5_cart_num").text(1>0>0);
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
					_loadScript("/js/2013/installapp.js?v=20140422100001",{},function(){
					});
				}
				
			})
		</script>
	</body>
</html>
