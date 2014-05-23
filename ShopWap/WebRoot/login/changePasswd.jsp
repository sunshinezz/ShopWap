<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
		<link rel="stylesheet" type="text/css" href="/ShopWap/css/base2013.css?v=20130806100001" charset="gbk"/>
		<link rel="stylesheet" type="text/css" href="/ShopWap/css/mobileRegister.css" charset="gbk"/>	
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
					document.write('<script src="/js/zepto.min.js"><\/script>');
					document.write('<script type="text/javascript">window.jQuery=window.Zepto;<\/script>');
				}else{
					document.write('<script src="/js/jquery-1.6.2.min.js"><\/script>');
				}
			}else{//如果是非webkit内核直接使用jquery
				document.write('<script src="/js/jquery-1.6.2.min.js"><\/script>');
			}
		</script>
		<script type="text/javascript" src="/ShopWap/js/jquery-1.6.2.min.js"></script>
		<script type="text/javascript" src="/ShopWap/js/html5/common.js?v=201307121358"></script>
		<script type="text/javascript" src="/ShopWap/js/html5/spin.min.js"></script>
	</head>

<body id="body">
<a name="top"></a>
<header>
	<header>
		<div class="new-header">
			<a href="javascript:pageBack();" class="new-a-back" id="backUrl"><span>返回</span></a>
			<h2>修改密码</h2>
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
	<div>&nbsp;&nbsp;&nbsp;</div>

	<div class="new-ct bind">
		<form id="personRegForm" name="personRegForm" method="post" action="/ShopWap/login/login.do?action=changePasswd" >
			<div class="new-pay-pw">   		
				<div class="new-set-info">
					<p  id="p_msg" style="display:none;" ></p>
					<span class="new-input-span new-input-span-v1 new-mg-b10">
						<input class="new-input" type="password" id="oldPasswd" name="oldPasswd" placeholder="旧密码" />
						<span  id="second" class="new-get-num" style="display:none;"></span>
					</span>
					<span class="new-input-span new-input-span-v1 new-mg-b10">
						<input class="new-input" type="password" id="newPasswd" name="newPasswd" tabindex="1" placeholder="新密码"/>
						<span  id="second" class="new-get-num" style="display:none;"></span>
					</span>
					<span class="new-input-span new-input-span-v1 new-mg-b10">
						<input class="new-input" type="password" id="newPasswd1" name="newPasswd1" placeholder="请再次输入新密码"/>
						<span  id="second" class="new-get-num" style="display:none;"></span>
					</span>
					<div class="new-txt-err" id="passwordNull" ></div>
					<a href="javascript:check();"  class="new-abtn-type new-mg-t15" id="registsubmit" >提交</a>
				</div>
				<div id="nameNull" class="new-txt-err" >
					<%if(request.getAttribute("Error") != null){
						String error = request.getAttribute("Error").toString();
						//System.out.println(err);
					%>
					<h5><span style="color:red" align="center"><%= error %></span></h5>
					<%}%>
				</div>
			</div>	
		</form>
	</div>
	


	<script type="text/javascript">
		function fsubmit(obj){
		obj.submit();
		}
		function freset(obj){
		obj.reset();
		}
		function check()
		{ 
		  var form= document.getElementsByName("personRegForm")[0];
			if(form.newPasswd.value!=form.newPasswd1.value)
			{
				alert("输入的密码与前面的不一致，请重新输入");
				form.newPasswd.value="";
				form.newPasswd1.value="";
				form.oldPasswd1.value = "";
				return false;
			}
			if(form.newPasswd.value == form.oldPasswd.value){
				alert("新旧密码不能一样，请重新输入");
				form.newPasswd.value="";
				form.newPasswd1.value="";
				form.oldPasswd1.value = "";
			}
			if(form.newPasswd.value <= 5){
				alert("密码要大于6位哦");
				form.newPasswd.value="";
				form.newPasswd1.value="";
				form.oldPasswd1.value = "";
			}
			
		   form.submit();
		} 
	
	</script>
    <footer>
	   
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
    </footer>

    <div style="display:none;">
        	<img src="/ja.jsp?&amp;utmn=1863362385&amp;utmr=-&amp;utmp=%2Fuser%2FmobileRegister.action%3Freturnurl%3Dhttp%253A%252F%252Fm.jd.com%252Fuser%252Fhome.action%253Fsid%253Deaffa2694a3704dd6b5f2c494ab60d77%26sid%3Deaffa2694a3704dd6b5f2c494ab60d77&amp;guid=ON&jav=touch&pin=-&utmac=MO-J2011-1" />
	</div>
</body>
</html>

