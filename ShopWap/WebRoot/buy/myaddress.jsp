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
		<link rel="stylesheet" type="text/css" href="/ShopWap/css/base2013.css?v=20140414100001" charset="gbk"/>
		<link rel="stylesheet" type="text/css" href="/ShopWap/css/address.css" charset="gbk"/>	
		
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
			<h2>收货地址管理</h2>
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
	<div class="new-addr">   
		<ul class="new-mu_l2w">
			<c:if test="${user.name1!=null }">
				<li class="new-mu_l2">
					<p class="new-tit new-p-re">
						<span class="new-txt"> ${user.name1 }</span>
						<span class="new-txt-rd2">${user.phone1 }</span>
						<span  class="new-txt-rd2 new-option-r" ><span class="new-icon2"></span>默认地址</span> 
					</p>
					<span class="new-mu_l2a new-p-re">
						<span class="new-mu_l2cw">${user.address1 }</span>     
						<div class="new-addr-btn">
							<a href='/ShopWap/buy/myOrderServlet.do?action=tomodify&number=1'>编辑</a><span class="new-addr-bar">|
							</span><a  href="/ShopWap/buy/myOrderServlet.do?action=delete&num=1" id="editeasybuy59116386"  onclick="delClick(this);"   >删除</a>
						</div>
					</span>
				</li>
			</c:if>
			<c:if test="${user.name2!=null }">
				<li class="new-mu_l2">
					<p class="new-tit new-p-re">
						<span class="new-txt"> ${user.name2 }</span>
						<span class="new-txt-rd2">${user.phone2 }</span>
						<span  class="new-txt-rd2 new-option-r" ><span class="new-icon2"></span>默认地址</span> 
					</p>
					<span class="new-mu_l2a new-p-re">
						<span class="new-mu_l2cw">${user.address2 }</span>     
						<div class="new-addr-btn">
							<a href='/ShopWap/buy/myOrderServlet.do?action=tomodify&number=2'>编辑</a><span class="new-addr-bar">|
							</span><a  href="/ShopWap/buy/myOrderServlet.do?action=delete&num=2" id="editeasybuy59116386"  onclick="delClick(this);"   >删除</a>
						</div>
					</span>
				</li>
			</c:if>
			<c:if test="${user.name3!=null }">
				<li class="new-mu_l2">
					<p class="new-tit new-p-re">
						<span class="new-txt"> ${user.name3 }</span>
						<span class="new-txt-rd2">${user.phone3 }</span>
						<span  class="new-txt-rd2 new-option-r" ><span class="new-icon2"></span>默认地址</span> 
					</p>
					<span class="new-mu_l2a new-p-re">
						<span class="new-mu_l2cw">${user.address3 }</span>     
						<div class="new-addr-btn">
							<a href='/ShopWap/buy/myOrderServlet.do?action=tomodify&number=3'>编辑</a><span class="new-addr-bar">|
							</span><a  href="/ShopWap/buy/myOrderServlet.do?action=delete&num=3" id="editeasybuy59116386"  onclick="delClick(this);"   >删除</a>
						</div>
					</span>
				</li>
			</c:if>
		</ul>
		<c:if test="${addrsize<3 }">
			<a  href='/ShopWap/buy/myOrderServlet.do?action=toadd&number=-${addrsize }' class="new-abtn-type new-mg-tb30" onclick="addnewtype()">添加新地址</a>
			<span >已有收货地址<span >${addrsize }</span>个,还可添加<span >${3-addrsize}</span>个收货地址 </span>
		</c:if>
		<c:if test="${addrsize==3 }">
			<span class="fl ftx-03">已有收货地址<span class="ftx-04">${addrsize }</span>个,不能再添加<span class="ftx-04"></span> </span> 
		</c:if>
    </div>
</div>

<script type="text/javascript">

	  function  delClick(param){
		if (confirm("确定要删除收货地址吗？")){
		       var id = $(param).attr("addressId");
		        jQuery.get('/address/doDelete.json?',
				{addressId:id},
				function(data){
					    if(data.isSuccess == "T"){ //提交表单到未绑定的手机验证
						  window.location.href='/address/addressList.action?sid=24fbb35a860be8f8212d18928939f614';
						}else{
						   alert('删除失败');
						}
					});
			}
	}


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
//	syncCart('24fbb35a860be8f8212d18928939f614',true);
	location.href='/cart/cart.action';
});

function reSearch(){
var depCity = window.sessionStorage.getItem("airline_depCityName");
	if(testSessionStorage() && isNotBlank(depCity) && !/^\s*$/.test(depCity) && depCity!=""){
    	var airStr = '<form action="/airline/list.action" method="post" id="reseach">'
        +'<input type="hidden" name="sid"  value="24fbb35a860be8f8212d18928939f614"/>'
        +'<input type="hidden" name="depCity" value="'+ window.sessionStorage.getItem("airline_depCityName") +'"/>'
        +'<input type="hidden" name="arrCity" value="'+ window.sessionStorage.getItem("airline_arrCityName") +'"/>'
        +'<input type="hidden" name="depDate" value="'+ window.sessionStorage.getItem("airline_depDate") +'"/>'
        +'<input type="hidden" name="depTime" value="'+ window.sessionStorage.getItem("airline_depTime") +'"/>'
        +'<input type="hidden" name="classNo" value="'+ window.sessionStorage.getItem("airline_classNo") +'"/>'
        +'</form>';
    	$("body").append(airStr);
    	$("#reseach").submit();
	}else{
    	window.location.href='/airline/index.action?sid=24fbb35a860be8f8212d18928939f614';
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
