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
			<h2>卖家中心</h2>
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
				<a href="#" id="" class="new-tbl-cell">
					<span class="icon3"> </span>
					<p style="color:#6e6e6e;"> </p>
				</a>
				<a href="/ShopWap/sell/sell.do?action=myw" class="new-tbl-cell">
					<span class="icon4">卖家中心</span>
					<p style="color:#6e6e6e;">卖家中心</p>
				</a>
			</div>
		</div>
	</header>
    
<div class="new-ct">
	<div class="new-addr">
			<form name="userForm" id="userForm" onsubmit="javascript:return checkValue();" action="/ShopWap/sell/sellaction.do?action=modifyaction&id=${item.id }" method="post" enctype="multipart/form-data">
				<div class="new-info-box">
					<div class="new-set-info">
						<span class="new-txt2 new-mg-b5">商品名称：</span>
						<span class="new-input-span new-mg-b10">
							<input type="text" name="name" id="name" maxlength="50" class="new-input" value="${item.name }"/>
						</span>
						<span class="new-txt-err"  id="name_error"  ></span>
						<span class="new-txt2 new-mg-b5">品牌</span>
						<span class="new-span-block new-mg-b10">
							<span class="new-input-span"><input id="brand" name="brand" value="${item.brand }"  class="new-input"/></span>
							<span class="new-txt-err" id="mobile_error"></span>
						</span>
						<span class="new-txt2 new-mg-b5">型号：</span>
						<span class="new-span-block new-mg-b10">
							<span class="new-input-span"><input id="model" name="model" value="${item.model }"  class="new-input"/></span>
							<span class="new-txt-err" id="mobile_error"></span>
						</span>
						<span class="new-txt2 new-mg-b5">颜色：</span>
						<span class="new-span-block new-mg-b10">
							<span class="new-input-span"><input id="color" name="color" value="${item.color }"  class="new-input"/></span>
							<span class="new-txt-err" id="mobile_error"></span>
						</span>
						<span class="new-txt2 new-mg-b5">价格：</span>
						<span class="new-span-block new-mg-b10">
							<span class="new-input-span"><input id="price" name="price" value="${item.price }"  class="new-input"/></span>
							<span class="new-txt-err" id="mobile_error"></span>
						</span>
						<div class="new-paging">
							<div class="new-tbl-type">
								<div class="new-tbl-cell new-p-re">
									<div class="new-a-page" >
										<span class="new-open" id="types">类型</span>
									</div>  
									<select class="new-select" id="typeid" name="typeid" onchange="typeChange();" jQuery1383563473365="2">
										<option value="100">图书</option>
										<option value="101">音像</option>
										<option value="102">数字商品</option>
										<option value="103">家用电器</option>
										<option value="104">手机</option>
										<option value="105">数码</option>
										<option value="106">电脑</option>
										<option value="107">办公</option>
										<option value="108">家居</option>
										<option value="109">家具</option>
										<option value="110">家装</option>
										<option value="111">厨具</option>
										<option value="112">服饰鞋帽</option>
										<option value="113">个护化妆</option>
										<option value="114">礼品箱包</option>
										<option value="115">钟表</option>
										<option value="116">珠宝</option>
										<option value="117">运动健康</option>
										<option value="118">汽车用品</option>
										<option value="119">母婴</option>
										<option value="120">玩具乐趣</option>
										<option value="121">食品饮料</option>
										<option value="122">保健食品</option>
										<option value="123">彩票</option>
										<option value="124">旅游</option>
										<option value="125">充值</option>
										<option value="126">票务</option>
									</select>
								</div>
							</div>
						</div>
					</div>
					<div class="new-ship-addr">
						<strong class="new-tit">商品描述：</strong>
						
						<div class="new-mg-t10">
							<span class="new-tbl-type new-mg-b10">
								<span class="new-tbl-cell new-txt-w38">商品描述：</span>
								<span class="new-tbl-cell">
									<div class="new-post_wr">
										<textarea name="info" id="info" rows="5" cols="30" title="" class="new-textarea" value="${item.info }"></textarea>
									</div>
									 <span class="new-txt-err"	id="where_error"></span>
								</span>                        
							</span>
						</div>
					</div> 
					<INPUT style="DISPLAY: none" id="code" value="148989" />
                    <INPUT style="DISPLAY: none" id="returnpagecode" value="736e6f5f315f67657455736572496e666f7171373539323238313631313438393839" />
					<!--[D] 默认时加  new-abtn-default 把a标签换成span-->
					<a href="javascript:fsubmit(document.userForm);"  name="order_submit" id="address_submit" class="new-abtn-type new-mg-t15">保存信息</a>
				</div>
			</form>
	</div>
</div>
</form>
<script type="text/javascript" src="/ShopWap/js/touch_address_common.src.js"></script>
   
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
function typeChange(){
    var type = document.getElementById("typeid");
    var types = document.getElementById("types");
    switch(type.value){
        case "100":
            types.innerHTML="图书";
            break;
        case "101":
            types.innerHTML="音像";
            break;
        case "102":
            types.innerHTML="数字商品";
            break;
        case "103":
            types.innerHTML="家用电器";
            break;
        case "104":
            types.innerHTML="手机";
            break;
        case "105":
            types.innerHTML="数码";
            break;
        case "106":
            types.innerHTML="电脑";
            break;
        case "107":
            types.innerHTML="办公";
            break;
        case "108":
            types.innerHTML="家居";
            break;
        case "109":
            types.innerHTML="家具";
            break;
        case "110":
            types.innerHTML="家装";
            break;
        case "111":types.innerHTML="厨具";
            break;
        case "112":types.innerHTML="服饰鞋帽";
            break;
        case "113":types.innerHTML="个护化妆";
            break;
        case "114":types.innerHTML="礼品箱包";
            break;
        case "115":types.innerHTML="钟表";
            break;
        case "116":types.innerHTML="珠宝";
            break;
        case "117":types.innerHTML="运动健康";
            break;
        case "118":types.innerHTML="汽车用品";
            break;
        case "119":types.innerHTML="母婴";
            break;
        case "120":types.innerHTML="玩具乐趣";
            break;
        case "121":types.innerHTML="食品饮料";
            break;
        case "122":types.innerHTML="保健食品";
            break;
        case "123":types.innerHTML="彩票";
            break;
        case "124":types.innerHTML="旅游";
            break;
        case "125":types.innerHTML="充值";
            break;
        case "126":
            types.innerHTML="票务";
            break;
    }
    return false;
}

function fsubmit(obj){
obj.submit();
}
function freset(obj){
obj.reset();
}
function check()
{
	var phone=document.getElementsByName("phone")[0];
	var form= document.getElementsByName("modifyAddr")[0];
	if(form.phone.value.length!=11)
	{
		alert("电话号码必须为11位数字");
		form.phone.forcus();
		return false;
	}
	form.submit();
}
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
