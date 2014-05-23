<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<!DOCTYPE html>
<html>
	<head>
		<title>
			WebOrder
		</title>
    	<meta name="author" content="m.jd.com">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
	    <meta name="apple-mobile-web-app-capable" content="yes">
        <meta name="apple-mobile-web-app-status-bar-style" content="black">
        <meta name="format-detection" content="telephone=no">
		<link rel="stylesheet" type="text/css" href="../css/base2013.css?v=20130806100001" charset="gbk"/>
		<link rel="stylesheet" type="text/css" href="../css/login.css" charset="gbk"/>	
		<link rel="apple-touch-icon-precomposed" href="http://m.jd.com/images/apple-touch-icon.png"/>
		<script type="text/javascript" src="../js/jquery-1.6.2.min.js"></script>
		<script type="text/javascript" src="../js/html5/common.js?v=201307121358"></script>
        <script type="text/javascript" src="../js/html5/spin.min.js"></script>
		<script language="javascript">  //登录js
			function fsubmit(obj){
			obj.submit();
			}
			function freset(obj){
			obj.reset();
			}
</script>
	</head>

<body id="body">
<a name="top"></a>
	<header>
		<div class="new-header">
			<a href="javascript:pageBack();" class="new-a-back" id="backUrl"><span>返回</span></a>
			<h2>购物车</h2>
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
	<div><span>恭喜您 注册成功！ 请登录</span></div>
 	<div class="new-ct bind">
		<div class="new-pay-pw">
			<div class="new-set-info">
				<form  action='/ShopWap/login/login.do?action=login' method="post" id="formlogin" name="login" onsubmit="return false;">
					<div class="new-txt-err" id="err" style="display:none;">    </div> 
						<span class="new-input-span mg-b15"><input type="text" value=""  class="new-input" name="loginaccount" id="loginaccount" value="" placeholder="请输入用户名/邮箱/已验证手机" onkeydown="changeColor(0,event)"/></span>
					<span class="new-input-span mg-b15"><input type="password" value="" class="new-input" name="nloginpwd" id="nloginpwd" placeholder="请输入密码" onkeydown="changeColor(1,event)"/></span>
						<input type="hidden" id="remember" value="true" name="remember"/>
					<a href="javascript:fsubmit(document.login);" id="loginSubmit" class="new-abtn-type new-mg-t15">登录</a>
				 </form>
				 <div class="login-register">
					<div class="new-tbl-type">
						<span class="new-tbl-cell">
							<a rel="nofollow" href='/ShopWap/login/register.jsp' class="new-fl" >免费注册</a>
						</span>
						<span class="new-tbl-cell text-right">
							<a href='/findloginpassword/fillAccountName.action?sid=2b72c124b28940efb1893c45b423c653' class="new-fr"> 找回密码</a>  
						</span>
					</div>
				</div>
			</div>
		</div>	               
</div>

<script type="text/javascript" src="/js/html5/user.js" ></script>
<script type="text/javascript" >
    $(function(){
     //如果支持本地存储
     if(testLocalStorage()){
         //自动填充用户名
        if(!$('#username').val()){
            var lName =  window.localStorage.getItem('userName');
            if(lName){
                 $('#username').val(lName);
            }
        }

        //提交同时判断是否勾选记住我按钮   如果勾选则保存本地 否则删除
      $('#frm_login').submit(function(){
	  		var flag = $('.new-a-txt3').find('span').hasClass('on');
			if(flag){
				window.localStorage.removeItem("userName");
				$('#remember').val("false");
			}else{
				window.localStorage.setItem('userName',$('#username').val());
				$('#remember').val("true");
			}
      });
     }
	 	window.name="login";
    });

	function remeber(){
		if($('.new-a-txt3').find('span').hasClass('on')){
			$('.new-a-txt3').find('span').removeClass('on');
		}else{
			$('.new-a-txt3').find('span').addClass('on');
		}
	}
    
	function checkUsername(){
		var username = $("#username").val().trim();
		if(username == ""){
			if(true){
				$("#err").html("\u8d26\u6237\u540d\u4e0d\u80fd\u4e3a\u7a7a");
				$("#err").show();
			}else{
				$("#error").html("\u8d26\u6237\u540d\u4e0d\u80fd\u4e3a\u7a7a");
				$("#error").show();
			}
			return false;
		}
		return true;
	}

	function checkPassword(){
		var password = $("#password").val().trim();
		if(password == ""){
			if(true){
				$("#err").html("\u5bc6\u7801\u4e0d\u80fd\u4e3a\u7a7a");
    			$("#err").show();
			}else{
				$("#error").html("\u5bc6\u7801\u4e0d\u80fd\u4e3a\u7a7a");
    			$("#error").show();
			}
			return false;
		}
		return true;
	}
	
	function checkCode(){
		if($('#codeLevel').val() && $('#codeLevel').val()!='0' ){
			var code = $('#validateCode').val().trim();
			if(code == ""){
				if(true){
					$("#err").html("\u8bf7\u8f93\u5165\u9a8c\u8bc1\u7801");
        			$("#err").show();
    			}else{
    				$("#error").html("\u8bf7\u8f93\u5165\u9a8c\u8bc1\u7801");
        			$("#error").show();
				}
				return false;
			}
		}
		return true;
	}
	
	$(':text').focus(function(){
		$("#error").hide();
		$("#err").hide();
	});

	$(':password').focus(function(){
		$("#error").hide();
		$("#err").hide();
	});
	
	//非空验证
	$(document).ready(function(){
      $('#frm_login').bind('submit',function(e){
       if(!(checkUsername() && checkPassword() && checkCode())){
		   e.preventDefault();
		}
      });
	  
	  $('#loginSubmit').click(function(){
	     $('#frm_login').submit();
	  });
	  
    });
	
	 //刷新验证码
     function refreshCode(d){
    	 if(d.codeKey){
    		if($('#codeLevel').val() && $('#codeLevel').val()!='0' ){
    		  $('#code').attr('src','/validatecode/loginValidateCode.action?key='+d.codeKey);
            }
              $('#codeKey').val(d.codeKey);
          }
     }
            //超链接绑定 click事件
     function getCode(){
                    refreshCodeAjax(refreshCode);
     }
	
	 function changeColor(type,evt){
	 	evt = (evt) ? evt : ((window.event) ? window.event : "");
		var key = evt.keyCode?evt.keyCode:evt.which;
	 	if(type == 0 ){
			if(key == 8 || key == 46){
				var text = $('#username').val().trim();
				if(text.length == 1){
					$('#username').css("color","#DBDBDB");
				}
			}else{
				$('#username').css("color","black");
			}
		}
		if(type == 1 ){
			if(key == 8 || key == 46){
				var text = $('#password').val().trim();
				if(text.length == 1){
					$('#password').css("color","#DBDBDB");
				}
			}else{
				$('#password').css("color","black");
			}
		}
		if(type == 2 ){
			if(key == 8 || key == 46){
				var text = $('#validateCode').val().trim();
				if(text.length == 1){
					$('#validateCode').css("color","#DBDBDB");
				}
			}else{
				$('#validateCode').css("color","black");
			}
		}
	 }
	 
	
</script>
<%
			if (request.getAttribute("Error") != null) {
			String error=request.getAttribute("Error").toString();
			//System.out.println(error);
			
		%>
		<br >
		<h3><span style="color:red" align="center"><%= error %></span></h3>
		</br>
		<%
		}
		 %>
	<%
			if (request.getAttribute("loginFirst") != null) {
			String error=request.getAttribute("loginFirst").toString();
			System.out.println(error);
			
		%>
		<br >
		<h3><span style="color:red" align="center"><%= error %></span></h3>
		</br>
		<%
		}
		 %>
    <footer>
	<div class="new-footer">
        <div class="new-f-login">					
    		<a href="/ShopWap/login/login.jsp">登录</a><span class="new-bar2">|</span><a href="/ShopWap/login/register.jsp">注册</a>
				<span  class="new-back-top"><a href="http://m.jd.com/showvote.html?sid=2b72c124b28940efb1893c45b423c653">反馈</a><span class="new-bar2">|</span><a href="#top">回到顶部</a></span>
            </div>
        	<div class="new-f-section"><a href="#">标准版</a><a href="javascript:void(0)" class="on">触屏版</a><a href="#">电脑版</a></div>
            <div class="new-f-section2"></div>
        </div>
    </footer>

    <div style="display:none;">
        	<img src="/ja.jsp?&amp;utmn=2075484644&amp;utmr=-&amp;utmp=%2Fuser%2Flogin.action%3Fsid%3D2b72c124b28940efb1893c45b423c653%26returnurl%3Dhttp%253A%252F%252Fm.jd.com%252Fuser%252Fhome.action%26ipChanged%3Dfalse&amp;guid=ON&jav=touch&pin=-&utmac=MO-J2011-1" />
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
//	syncCart('2b72c124b28940efb1893c45b423c653',true);
	location.href='http://m.jd.com/cart/cart.action';
});

function reSearch(){
var depCity = window.sessionStorage.getItem("airline_depCityName");
	if(testSessionStorage() && isNotBlank(depCity) && !/^\s*$/.test(depCity) && depCity!=""){
    	var airStr = '<form action="/airline/list.action" method="post" id="reseach">'
        +'<input type="hidden" name="sid"  value="2b72c124b28940efb1893c45b423c653"/>'
        +'<input type="hidden" name="depCity" value="'+ window.sessionStorage.getItem("airline_depCityName") +'"/>'
        +'<input type="hidden" name="arrCity" value="'+ window.sessionStorage.getItem("airline_arrCityName") +'"/>'
        +'<input type="hidden" name="depDate" value="'+ window.sessionStorage.getItem("airline_depDate") +'"/>'
        +'<input type="hidden" name="depTime" value="'+ window.sessionStorage.getItem("airline_depTime") +'"/>'
        +'<input type="hidden" name="classNo" value="'+ window.sessionStorage.getItem("airline_classNo") +'"/>'
        +'</form>';
    	$("body").append(airStr);
    	$("#reseach").submit();
	}else{
    	window.location.href='http://m.jd.com/airline/index.action?sid=2b72c124b28940efb1893c45b423c653';
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
         jQuery.post('http://m.jd.com/index/addClientCookieVal.json',function(d){
               window.location.href=downloadUrl;
        });
    });




	
</script>
</body>
</html>

