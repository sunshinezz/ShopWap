<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
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
		<link rel="stylesheet" type="text/css" href="../css/base2013.css" charset="gbk"/>
		<link rel="stylesheet" type="text/css" href="../css/2013/category/all_html5.css" charset="gbk"/>	
		<script type="text/javascript">
			var _winLocation=window.location.href;//获得当前页面的路径，根据路径规则进行逐页替换
			var _isWebKit = '__proto__' in {};//是否是webkit内核
			if(_isWebKit){//如果是webkit内核，则分模块使用zepto
				//要使用zeptojs的路径列表，可以做为分模块替换的开关
				var _locationList=new Array();
				//活动模块
				_locationList.push('../activity/proActList');
				_locationList.push('../activity/proActWareList');
				_locationList.push('../activity/list');
				//商品分类模块
				_locationList.push('./');
				//京东快讯模块
				_locationList.push('../newslist.html');
				_locationList.push('../newslist/');
				_locationList.push('../news/');
				//机票模块
				_locationList.push('../airline/');
				//酒店模块
				_locationList.push('../hotel/');
				//团购模块
				_locationList.push('../tuan/');
				//首页相关
				_locationList.push('../hotbrand.html');//品牌馆
				//商品筛选相关
				_locationList.push('../ware/expandSort.action');
				_locationList.push('../ware/categoryFilter.action');
				_locationList.push('../ware/search.action');
				_locationList.push('../products/');
				
				_locationList.push('../notice/');//通告模块
				_locationList.push('../coupons/');//随地惠模块
				_locationList.push('../chongzhi/');//手机充值模块
				_locationList.push('../comment/');//手机推荐模块
				_locationList.push('../pay/');//支付
				_locationList.push('../order/');//订单
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
		<script type="text/javascript" src="../js/html5/common.js"></script>
        <script type="text/javascript" src="../js/html5/spin.min.js"></script>
	</head>

	<body id="body">
	<a name="top"></a>
	<header>
		<div class="new-header">
			<a href="javascript:pageBack();" class="new-a-back" id="backUrl"><span>返回</span></a>
			<h2>商品分类</h2>
			<a href="javascript:void(0)" id="btnJdkey" class="new-a-jd"><span>京东键</span></a>
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
	<script type="text/javascript" language="javascript">
		function doValidate()
		{

			var key = document.getElementsByName("key")[0].value;

			window.location.href="/ShopWap/search/search.do?key="+encodeURIComponent(encodeURIComponent(key));
			return false;
		}
		function search()
		{ 
			var key = document.getElementsByName("key")[0].value;

			window.location.href="/ShopWap/search/search.do?key="+encodeURIComponent(encodeURIComponent(key));
		}
	</script>
	<form action="/ShopWap/search/search.do" id="searchForm" id="form1" name="form1" onsubmit="return doValidate();" method="get">
		<input name="sid" value="e0d0f025d6d3e8e8d7be5428c43ef911" type="hidden" />
		<div class="new-cate-srch">
			<div class="new-srch-box">
				<input id="key" name="key" type="text" required class="new-srch-input" value="WebOrder">
				<a href="javascript:void(0);" target="_self" onclick="cancelHotWord()" class="new-s-close"></a>
				<a href="javascript:search()" target="_self" onclick="$('#searchForm').submit();" class="new-s-srch">
					<span></span>
				</a>
			</div>
			<div class="new-srch-lst" id="shelper" style="display:none"></div>
		</div>
	</form>
    
<div class="new-ct">
    <div class="new-category">
     	<ul class="new-category-lst">
    		<li class="new-category-li">
    			<a href="javascript:void(0)" id="1315" class="new-category-a"><span class="icon"></span>图书</a>
    			<ul class="new-category2-lst" id="category1315" style="display:none">
					<li class="new-category2-li" >
						<a href="/ShopWap/type/type.do?id=100" class="new-category2-a"><span class="new-bar"></span>图书</a>
						<a href="/ShopWap/type/type.do?id=101" class="new-category2-a"><span class="new-bar"></span>音像</a>
						<a href="/ShopWap/type/type.do?id=102" class="new-category2-a"><span class="new-bar"></span>数字商品</a>
					</li>
				</ul>
			</li>
			<li class="new-category-li">
				<a href="javascript:void(0)" id="11729" class="new-category-a"><span class="icon"></span>家用电器</a>
				<ul class="new-category2-lst" id="category11729" style="display:none">
					<li class="new-category2-li" >
						<a href="/ShopWap/type/type.do?id=103" class="new-category2-a"><span class="new-bar"></span>家用电器</a>
						<a href="#" class="new-category2-a"><span class="new-bar"></span></a>
						<a href="javascript:void(0)" class="new-category2-a"><span class="new-bar"></span></a>
					</li>
				</ul>
			</li>
			<li class="new-category-li">
    			<a href="javascript:void(0)" id="9987" class="new-category-a"><span class="icon"></span>数码</a>
    			<ul class="new-category2-lst" id="category9987" style="display:none">
    			    <li class="new-category2-li" >
    				    <a href="/ShopWap/type/type.do?id=104" class="new-category2-a"><span class="new-bar"></span>手机</a>
						<a href="/ShopWap/type/type.do?id=105" class="new-category2-a"><span class="new-bar"></span>数码</a>
						<a href="#" class="new-category2-a"><span class="new-bar"></span></a>
					</li>
    			</ul>
			</li>
			<li class="new-category-li">
    			<a href="javascript:void(0)" id="670" class="new-category-a"><span class="icon"></span>办公</a>
    			<ul class="new-category2-lst" id="category670" style="display:none">
					<li class="new-category2-li" >
						<a href="/ShopWap/type/type.do?id=106" class="new-category2-a"><span class="new-bar"></span>电脑</a>
						<a href="/ShopWap/type/type.do?id=107" class="new-category2-a"><span class="new-bar"></span>办公</a>
						<a href="#" class="new-category2-a"><span class="new-bar"></span></a>
					</li>
				</ul>
			</li>
			<li class="new-category-li">
    			<a href="javascript:void(0)" id="1316" class="new-category-a"><span class="icon"></span>家具</a>
    			<ul class="new-category2-lst" id="category1316" style="display:none">
					<li class="new-category2-li" >
						<a href="/ShopWap/type/type.do?id=108" class="new-category2-a"><span class="new-bar"></span>家具</a>
						<a href="/ShopWap/type/type.do?id=109" class="new-category2-a"><span class="new-bar"></span>家居</a>
						<a href="/ShopWap/type/type.do?id=110" class="new-category2-a"><span class="new-bar"></span>家装</a>
					</li>
					<li class="new-category2-li" >
						<a href="/ShopWap/type/type.do?id=111" class="new-category2-a"><span class="new-bar"></span>厨具</a>
						<a href="#" class="new-category2-a"><span class="new-bar"></span></a>
						<a href="#" class="new-category2-a"><span class="new-bar"></span></a>
					</li>
				</ul>
			</li>
			<li class="new-category-li">
    			<a href="javascript:void(0)" id="1713" class="new-category-a"><span class="icon"></span>服饰鞋帽</a>
					<ul class="new-category2-lst" id="category1713" style="display:none">
						<li class="new-category2-li" >
							<a href="/ShopWap/type/type.do?id=112" class="new-category2-a"><span class="new-bar"></span>服饰鞋帽</a>
        				    <a href="#" class="new-category2-a"><span class="new-bar"></span></a>
							<a href="#" class="new-category2-a"><span class="new-bar"></span></a>
						</li>
    				</ul>
			</li>
			<li class="new-category-li">
    			<a href="javascript:void(0)" id="737" class="new-category-a"><span class="icon"></span>个性化妆</a>
					<ul class="new-category2-lst" id="category737" style="display:none">
						<li class="new-category2-li" >
							<a href="/ShopWap/type/type.do?id=113" class="new-category2-a"><span class="new-bar"></span>个性化妆</a>
							<a href="#" class="new-category2-a"><span class="new-bar"></span></a>
							<a href="#" class="new-category2-a"><span class="new-bar"></span></a>
						</li>
    				</ul>
			</li>
			<li class="new-category-li">
    			<a href="javascript:void(0)" id="1319" class="new-category-a"><span class="icon"></span>礼品</a>
					<ul class="new-category2-lst" id="category1319" style="display:none">
    			    	<li class="new-category2-li" >
							<a href="/ShopWap/type/type.do?id=114" class="new-category2-a"><span class="new-bar"></span>礼品箱包</a>
							<a href="/ShopWap/type/type.do?id=115" class="new-category2-a"><span class="new-bar"></span>钟表</a>
							<a href="/ShopWap/type/type.do?id=116" class="new-category2-a"><span class="new-bar"></span>珠宝</a>
						</li>
    				</ul>
        	</li>
			<li class="new-category-li">
    			<a href="javascript:void(0)" id="1320" class="new-category-a"><span class="icon"></span>运动健康</a>
    			<ul class="new-category2-lst" id="category1320" style="display:none">
					<li class="new-category2-li" >
						<a href="/ShopWap/type/type.do?id=117" class="new-category2-a"><span class="new-bar"></span>运动健康</a>
        				<a href="#" class="new-category2-a"><span class="new-bar"></span></a>
						<a href="#" class="new-category2-a"><span class="new-bar"></span></a>
					</li>
				</ul>
			</li>
			<li class="new-category-li">
    			<a href="javascript:void(0)" id="1620" class="new-category-a"><span class="icon"></span>汽车用品</a>
    			<ul class="new-category2-lst" id="category1620" style="display:none">
					<li class="new-category2-li" >
						<a href="/ShopWap/type/type.do?id=118" class="new-category2-a"><span class="new-bar"></span>汽车用品</a>
						<a href="#" class="new-category2-a"><span class="new-bar"></span></a>
						<a href="#" class="new-category2-a"><span class="new-bar"></span></a>
					</li>
				</ul>
			</li>
			<li class="new-category-li">
    			<a href="javascript:void(0)" id="1672" class="new-category-a"><span class="icon"></span>母婴</a>
    			<ul class="new-category2-lst" id="category1672" style="display:none">
					<li class="new-category2-li" >
						<a href="/ShopWap/type/type.do?id=119" class="new-category2-a"><span class="new-bar"></span>母婴</a>
						<a href="/ShopWap/type/type.do?id=120" class="new-category2-a"><span class="new-bar"></span>玩具乐器</a>
						<a href="#" class="new-category2-a"><span class="new-bar"></span></a>
					</li>
				</ul>
			</li>
			<li class="new-category-li">
    			<a href="javascript:void(0)" id="1318" class="new-category-a"><span class="icon"></span>食品</a>
    			<ul class="new-category2-lst" id="category1318" style="display:none">
					<li class="new-category2-li" >
						<a href="/ShopWap/type/type.do?id=121" class="new-category2-a"><span class="new-bar"></span>食品饮料</a>
						<a href="/ShopWap/type/type.do?id=122" class="new-category2-a"><span class="new-bar"></span>保健食品</a>
						<a href="#" class="new-category2-a"><span class="new-bar"></span></a>
					</li>
				</ul>
			</li>
    		<li class="new-category-li">
    			<a href="javascript:void(0)" id="6233" class="new-category-a"><span class="icon"></span>票务</a>
    			<ul class="new-category2-lst" id="category6233" style="display:none">
					<li class="new-category2-li" >
						<a href="/ShopWap/type/type.do?id=123" class="new-category2-a"><span class="new-bar"></span>彩票</a>
						<a href="/ShopWap/type/type.do?id=124" class="new-category2-a"><span class="new-bar"></span>旅行</a>
						<a href="/ShopWap/type/type.do?id=125" class="new-category2-a"><span class="new-bar"></span>充值</a>
					</li>
					<li class="new-category2-li" >
						<a href="/ShopWap/type/type.do?id=126" class="new-category2-a"><span class="new-bar"></span>票务</a>
						<a href="#" class="new-category2-a"><span class="new-bar"></span></a>
						<a href="#" class="new-category2-a"><span class="new-bar"></span></a>
					</li>
    			</ul>
			</li>

        </ul>
    </div>
</div>
<script language="javascript">
	$(function(){
		$("li.new-category-li>a").click(function(){
    		var obj = $(this).parent().children().eq(1);
    		if(obj.css('display')=='none'){
    			$(".new-category2-lst").hide();
    			obj.fadeIn();
    			$("li.new-category-li>a").removeClass("new-category-a new-on").addClass("new-category-a");
    			$(this).addClass("new-category-a new-on");
    		}else{
    			obj.fadeOut();
    			$("li.new-category-li>a").removeClass("new-category-a new-on").addClass("new-category-a");
    			$(this).removeClass("new-category-a new-on").addClass("new-category-a");
    		}
    	})
	});
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
				<a href="login/login.do?action=logout">退出</a>
			<% }
			 else { %> </a>
				<a href="/ShopWap/login/login.jsp">请先登录</a><span class="lg-bar">|</span>
				<a href="/ShopWap/login/login.do?action=register" target="_top">免费注册</a> 
			<%} %>
				
    			<span  class="new-fr"><a href="#">反馈</a><span class="lg-bar">|</span><a href="#top">回到顶部</a></span>
           </div>
        	<div class="version"><a href="#">标准版</a><a href="javascript:void(0)" class="on">触屏版</a><a href="#" id="toPcHome">电脑版</a></div>
            <div class="copyright">&copy;  </div>
        </div>
    <div style="display:none;">
    	<img src="../ja.jsp@&utmn=547066117&utmr=-&utmp=_252Fcategory_252Fall.action_253Fsid_253De0d0f025d6d3e8e8d7be5428c43ef911%26res057A14E15A" />
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
//	syncCart('e0d0f025d6d3e8e8d7be5428c43ef911',true);
	location.href='../cart/cart.action';
});

function reSearch(){
var depCity = window.sessionStorage.getItem("airline_depCityName");
	if(testSessionStorage() && isNotBlank(depCity) && !/^\s*$/.test(depCity) && depCity!=""){
    	var airStr = '<form action="../airline/list.action" method="post" id="reseach">'
        +'<input type="hidden" name="sid"  value="e0d0f025d6d3e8e8d7be5428c43ef911"/>'
        +'<input type="hidden" name="depCity" value="'+ window.sessionStorage.getItem("airline_depCityName") +'"/>'
        +'<input type="hidden" name="arrCity" value="'+ window.sessionStorage.getItem("airline_arrCityName") +'"/>'
        +'<input type="hidden" name="depDate" value="'+ window.sessionStorage.getItem("airline_depDate") +'"/>'
        +'<input type="hidden" name="depTime" value="'+ window.sessionStorage.getItem("airline_depTime") +'"/>'
        +'<input type="hidden" name="classNo" value="'+ window.sessionStorage.getItem("airline_classNo") +'"/>'
        +'</form>';
    	$("body").append(airStr);
    	$("#reseach").submit();
	}else{
    	window.location.href='../airline/index.action@sid=e0d0f025d6d3e8e8d7be5428c43ef911';
	}
}
 //banner 关闭点击
    $('.div_banner_close').click(function(){
        $('#div_banner_header').unbind('click');
        jQuery.post('../index/addClientCookieVal.json',function(d){
              $('#div_banner_header').slideUp(500);
        });
    });
    //banner 下载点击
    $('.div_banner_download').click(function(){
         var downloadUrl = $(this).attr('url');
         jQuery.post('../index/addClientCookieVal.json',function(d){
               window.location.href=downloadUrl;
        });
    });
	
</script>
</body>
</html>
