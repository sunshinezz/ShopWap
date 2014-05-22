<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
	<head>
		<title> weborder </title>
    	<meta name="author" content="m.jd.com">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
	    <meta name="apple-mobile-web-app-capable" content="yes">
        <meta name="apple-mobile-web-app-status-bar-style" content="black">
        <meta name="format-detection" content="telephone=no">
		<meta http-equiv="Expires" CONTENT="-1">           
		<meta http-equiv="Cache-Control" CONTENT="no-cache">           
		<meta http-equiv="Pragma" CONTENT="no-cache">           
	  	<link rel="stylesheet" type="text/css" href="../css/base2013.css?v=20140414100001" charset="gbk"/>
		<link rel="stylesheet" type="text/css" href="../css/2013/ware/search_html5.css" charset="gbk"/>	
		<link rel="stylesheet" type="text/css" href="../css/chapter.css" charset="gbk"/>	
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
		<div class="new-header" id="_jdBox">
        	<a href="javascript:pageBack();" class="new-a-back"><span>返回</span></a>
        	<a href="javascript:void(0)" id="btnJdBox" class="new-srch-box2">weborder</a>
            <a href="javascript:void(0)" id="btnJdkey" class="new-a-jd"><span>京东键</span></a>
    	</div>
		<div class="new-header" id="_jdSearch" style="display:none">
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
			<form action="search.do" id="form1" name="form1" onsubmit="return doValidate();" method="get">
				<input name="sid" value="b39d6855934ae151afcd2d176cf7fb4e" type="hidden" />
				<a href="javascript:void(0)" id="_cancelSearch" class="new-a-cancel">取消</a>
				<div class="new-srch-box new-srch-box-v1">
					<input type="text" class="new-srch-input" id="key" name="key" cleardefault="no" type="text" required value="weborder">
						<a href="javascript:void(0);" target="_self" onclick="cancelHotWord()" class="new-s-close new-s-close-v1"></a>
						<a href="javascript:search()" target="_self" onclick="$('#searchForm').submit();" class="new-s-srch">
							<span></span>
						</a>
					<div class="new-srch-lst" id="shelper" style="display:none"> </div>
				</div>
			</form>
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
<style type="text/css">
	.keyword_append{margin:1px 0 0;padding:0 0}
</style>
	<div style="position: absolute;top:0px;width: 190px;height: 100%;right: 0px;top: 0;z-index: 9999;overflow:hidden;display:none;" id="filterbar">
		<div class="new-tab-type">
			<div class="new-srch-pop" id="slidebar" style="-webkit-transition: -webkit-transform 0.4s;-webkit-transform-origin: 0px 0px; -webkit-transform-style: preserve-3d;-webkit-transform: translate(190px, 0);">
				<div class="new-pop-ul new-p-re" id="filter_prop">
					<ul class="new-ul-lst">
						<li class="new-ul-li">
							<a href="javascript:void(0)" onclick="showHideFilter(this)" class="new-li-a ">品牌</a>
							<div class="new-pop-sel" style="display:">
								<ul>
								<li><a href="javascript:void(0)" onclick="selectExpandSort(this)" data="0" class="on" ><span>全部</span></a></li>
									<li><a href="javascript:void(0)" onclick="selectExpandSort(this)" data="5859" ><span>丹杰仕（DANJIESHI）</span></a></li>
									<li><a href="javascript:void(0)" onclick="selectExpandSort(this)" data="4667" ><span>贝仕顿（Besteonr）</span></a></li>
									<li><a href="javascript:void(0)" onclick="selectExpandSort(this)" data="35518" ><span>Ruaye/睿奕</span></a></li>
									<li><a href="javascript:void(0)" onclick="selectExpandSort(this)" data="56561" ><span>益帛（YIBO）</span></a></li>
									<li><a href="javascript:void(0)" onclick="selectExpandSort(this)" data="15333" ><span>杉杉（FIRS）</span></a></li>
									<li><a href="javascript:void(0)" onclick="selectExpandSort(this)" data="36203" ><span>TZ.mall</span></a></li>
									<li><a href="javascript:void(0)" onclick="selectExpandSort(this)" data="19388" ><span>衣然呈品</span></a></li>
									<li><a href="javascript:void(0)" onclick="selectExpandSort(this)" data="35963" ><span>墨诺佰MANOBLE</span></a></li>
									<li><a href="javascript:void(0)" onclick="selectExpandSort(this)" data="11838" ><span>罗蒙</span></a></li>
									<li><a href="javascript:void(0)" onclick="selectExpandSort(this)" data="1988" ><span>OBM</span></a></li>
									<li><a href="javascript:void(0)" onclick="selectExpandSort(this)" data="18714" ><span>幸福时光</span></a></li>
									<li><a href="javascript:void(0)" onclick="selectExpandSort(this)" data="18907" ><span>雅戈尔</span></a></li>
									<li><a href="javascript:void(0)" onclick="selectExpandSort(this)" data="1190" ><span>ING.CON</span></a></li>
									<li><a href="javascript:void(0)" onclick="selectExpandSort(this)" data="14911" ><span>睿奕（Ruaye）</span></a></li>
									<li><a href="javascript:void(0)" onclick="selectExpandSort(this)" data="9211" ><span>杰克琼斯（Jack Jones）</span></a></li>
									<li><a href="javascript:void(0)" onclick="selectExpandSort(this)" data="20686" ><span>战地吉普（Afs Jeep）</span></a></li>
									<li><a href="javascript:void(0)" onclick="selectExpandSort(this)" data="20677" ><span>詹姆斯俊郎（JAMES&TOSHIRO）</span></a></li>
									<li><a href="javascript:void(0)" onclick="selectExpandSort(this)" data="43744" ><span>刻舟木（KZM）</span></a></li>
									<li><a href="javascript:void(0)" onclick="selectExpandSort(this)" data="13611" ><span>欧比森（OBUTLYHEN）</span></a></li>
									<li><a href="javascript:void(0)" onclick="selectExpandSort(this)" data="21298" ><span>佐龙（Zuo Long）</span></a></li>
									<li><a href="javascript:void(0)" onclick="selectExpandSort(this)" data="14118" ><span>七匹狼（SEPTWOLVES）</span></a></li>
									<li><a href="javascript:void(0)" onclick="selectExpandSort(this)" data="36044" ><span>蛙越（FROGJUMP）</span></a></li>
									<li><a href="javascript:void(0)" onclick="selectExpandSort(this)" data="62517" ><span>朗蒙（LANGMENG）</span></a></li>
									<li><a href="javascript:void(0)" onclick="selectExpandSort(this)" data="2386" ><span>Smart Five</span></a></li>
									<li><a href="javascript:void(0)" onclick="selectExpandSort(this)" data="6360" ><span>动感一族</span></a></li>
									<li><a href="javascript:void(0)" onclick="selectExpandSort(this)" data="48014" ><span>约瑟卡卡（josephcaca）</span></a></li>
									<li><a href="javascript:void(0)" onclick="selectExpandSort(this)" data="44060" ><span>古仕卡特（GUSSKATER）</span></a></li>
									<li><a href="javascript:void(0)" onclick="selectExpandSort(this)" data="45411" ><span>卡迈奴</span></a></li>
									<li><a href="javascript:void(0)" onclick="selectExpandSort(this)" data="20112" ><span>优鲨（U-SHARK）</span></a></li>
									<li><a href="javascript:void(0)" onclick="selectExpandSort(this)" data="606" ><span>DoaVsng</span></a></li>
									<li><a href="javascript:void(0)" onclick="selectExpandSort(this)" data="52049" ><span>ThePALMS</span></a></li>
									<li><a href="javascript:void(0)" onclick="selectExpandSort(this)" data="23861" ><span>巴贝（Babei）</span></a></li>
									<li><a href="javascript:void(0)" onclick="selectExpandSort(this)" data="44141" ><span>TONISOL</span></a></li>
									<li><a href="javascript:void(0)" onclick="selectExpandSort(this)" data="39130" ><span>GUSSKATER </span></a></li>
									<li><a href="javascript:void(0)" onclick="selectExpandSort(this)" data="7835" ><span>海澜之家（heilanhome）</span></a></li>
									<li><a href="javascript:void(0)" onclick="selectExpandSort(this)" data="43017" ><span>ZOOZOON</span></a></li>
									<li><a href="javascript:void(0)" onclick="selectExpandSort(this)" data="65686" ><span>萨克隆（SAKE LONG）</span></a></li>
									<li><a href="javascript:void(0)" onclick="selectExpandSort(this)" data="9615" ><span>劲霸男装（K-Boxing）</span></a></li>
									<li><a href="javascript:void(0)" onclick="selectExpandSort(this)" data="6137" ><span>笛凡（DF）</span></a></li>
									<li><a href="javascript:void(0)" onclick="selectExpandSort(this)" data="8291" ><span>红豆（Hodo）</span></a></li>
									<li><a href="javascript:void(0)" onclick="selectExpandSort(this)" data="5779" ><span>大卫山（dave hill）</span></a></li>
									<li><a href="javascript:void(0)" onclick="selectExpandSort(this)" data="30077" ><span>SUCKUK</span></a></li>
									<li><a href="javascript:void(0)" onclick="selectExpandSort(this)" data="25168" ><span>格蓝凯（GELANKAI）</span></a></li>
									<li><a href="javascript:void(0)" onclick="selectExpandSort(this)" data="25285" ><span>幸福时光（Happytime）</span></a></li>
									<li><a href="javascript:void(0)" onclick="selectExpandSort(this)" data="20243" ><span>有衣有靠（UYUK）</span></a></li>
									<li><a href="javascript:void(0)" onclick="selectExpandSort(this)" data="36357" ><span>慢式优活（MENSWILL）</span></a></li>
									<li><a href="javascript:void(0)" onclick="selectExpandSort(this)" data="1431" ><span>KOOL</span></a></li>
									<li><a href="javascript:void(0)" onclick="selectExpandSort(this)" data="25286" ><span>古莱登（GODLIKE）</span></a></li>
									<li><a href="javascript:void(0)" onclick="selectExpandSort(this)" data="35553" ><span>tzmall</span></a></li>
									<li><a href="javascript:void(0)" onclick="selectExpandSort(this)" data="4517" ><span>北极绒（BEJIROG）</span></a></li>
								</ul>
							</div>
						</li>
						<li class="new-ul-li">
							<a href="javascript:void(0)" onclick="showHideFilter(this)" class="new-li-a on">风格</a>
							<div class="new-pop-sel" style="display:none">
								<ul>
									<li><a href="javascript:void(0)" onclick="selectExpandSort(this)" data="0" class="on" ><span>全部</span></a></li>
										<li><a href="javascript:void(0)" onclick="selectExpandSort(this)" data="71333" ><span>时尚休闲</span></a></li>
										<li><a href="javascript:void(0)" onclick="selectExpandSort(this)" data="71334" ><span>商务正装</span></a></li>
										<li><a href="javascript:void(0)" onclick="selectExpandSort(this)" data="71335" ><span>英伦风格</span></a></li>
										<li><a href="javascript:void(0)" onclick="selectExpandSort(this)" data="97479" ><span>商务休闲</span></a></li>
										<li><a href="javascript:void(0)" onclick="selectExpandSort(this)" data="97482" ><span>设计潮牌</span></a></li>
										<li><a href="javascript:void(0)" onclick="selectExpandSort(this)" data="97483" ><span>格子</span></a></li>
										<li><a href="javascript:void(0)" onclick="selectExpandSort(this)" data="97484" ><span>条纹</span></a></li>
										<li><a href="javascript:void(0)" onclick="selectExpandSort(this)" data="97485" ><span>纯色</span></a></li>
										<li><a href="javascript:void(0)" onclick="selectExpandSort(this)" data="97486" ><span>印花</span></a></li>
										<li><a href="javascript:void(0)" onclick="selectExpandSort(this)" data="205572" ><span>欧美风格</span></a></li>
										<li><a href="javascript:void(0)" onclick="selectExpandSort(this)" data="205573" ><span>学院风格</span></a></li>
										<li><a href="javascript:void(0)" onclick="selectExpandSort(this)" data="205574" ><span>嘻哈风格</span></a></li>
								</ul>
                            </div>
                        </li>
						<li class="new-ul-li">
                        	<a href="javascript:void(0)" onclick="showHideFilter(this)" class="new-li-a on">款式</a>
                            <div class="new-pop-sel" style="display:none">
                            	<ul>
									<li><a href="javascript:void(0)" onclick="selectExpandSort(this)" data="0" class="on" ><span>全部</span></a></li>
									<li><a href="javascript:void(0)" onclick="selectExpandSort(this)" data="64134" ><span>长袖</span></a></li>
									<li><a href="javascript:void(0)" onclick="selectExpandSort(this)" data="64135" ><span>短袖</span></a></li>
									<li><a href="javascript:void(0)" onclick="selectExpandSort(this)" data="97496" ><span>七分袖</span></a></li>
									<li><a href="javascript:void(0)" onclick="selectExpandSort(this)" data="97499" ><span>无袖</span></a></li>
								</ul>
                            </div>
                        </li>
        					                        <li class="new-ul-li">
                        	<a href="javascript:void(0)" onclick="showHideFilter(this)" class="new-li-a on">材质</a>
                            <div class="new-pop-sel" style="display:none">
                            	<ul>
									<li><a href="javascript:void(0)" onclick="selectExpandSort(this)" data="0" class="on" ><span>全部</span></a></li>
									<li><a href="javascript:void(0)" onclick="selectExpandSort(this)" data="97521" ><span>棉</span></a></li>
									<li><a href="javascript:void(0)" onclick="selectExpandSort(this)" data="97523" ><span>涤棉</span></a></li>
									<li><a href="javascript:void(0)" onclick="selectExpandSort(this)" data="97524" ><span>真丝</span></a></li>
									<li><a href="javascript:void(0)" onclick="selectExpandSort(this)" data="97526" ><span>蚕丝</span></a></li>
									<li><a href="javascript:void(0)" onclick="selectExpandSort(this)" data="97527" ><span>亚麻</span></a></li>
									<li><a href="javascript:void(0)" onclick="selectExpandSort(this)" data="97528" ><span>羊毛</span></a></li>
									<li><a href="javascript:void(0)" onclick="selectExpandSort(this)" data="97529" ><span>莫代尔</span></a></li>
									<li><a href="javascript:void(0)" onclick="selectExpandSort(this)" data="205576" ><span>大麻</span></a></li>
									<li><a href="javascript:void(0)" onclick="selectExpandSort(this)" data="205577" ><span>聚酯纤维</span></a></li>
									<li><a href="javascript:void(0)" onclick="selectExpandSort(this)" data="205578" ><span>氨纶</span></a></li>
									<li><a href="javascript:void(0)" onclick="selectExpandSort(this)" data="205580" ><span>锦纶</span></a></li>
									<li><a href="javascript:void(0)" onclick="selectExpandSort(this)" data="308340" ><span>其他</span></a></li>
								</ul>
                            </div>
                        </li>
						<li class="new-ul-li">
                        	<a href="javascript:void(0)" onclick="showHideFilter(this)" class="new-li-a on">价格</a>
                            <div class="new-pop-sel" style="display:none">
                            	<ul>
									<li><a href="javascript:void(0)" onclick="selectExpandSort(this)" data="0" class="on" ><span>全部</span></a></li>
									<li><a href="javascript:void(0)" onclick="selectExpandSort(this)" data="71352" ><span>0-99</span></a></li>
									<li><a href="javascript:void(0)" onclick="selectExpandSort(this)" data="71353" ><span>100-199</span></a></li>
									<li><a href="javascript:void(0)" onclick="selectExpandSort(this)" data="71354" ><span>200-299</span></a></li>
									<li><a href="javascript:void(0)" onclick="selectExpandSort(this)" data="231172" ><span>300-499</span></a></li>
									<li><a href="javascript:void(0)" onclick="selectExpandSort(this)" data="71355" ><span>500以上</span></a></li>
								</ul>
                            </div>
                        </li>
						<li class="new-ul-li">
                        	<a href="javascript:void(0)" onclick="showHideFilter(this)" class="new-li-a on">剪裁</a>
                            <div class="new-pop-sel" style="display:none">
                            	<ul>
									<li><a href="javascript:void(0)" onclick="selectExpandSort(this)" data="0" class="on" ><span>全部</span></a></li>
									<li><a href="javascript:void(0)" onclick="selectExpandSort(this)" data="71336" ><span>标准</span></a></li>
									<li><a href="javascript:void(0)" onclick="selectExpandSort(this)" data="71337" ><span>修身</span></a></li>
									<li><a href="javascript:void(0)" onclick="selectExpandSort(this)" data="97503" ><span>宽松</span></a></li>
									<li><a href="javascript:void(0)" onclick="selectExpandSort(this)" data="97504" ><span>明门襟</span></a></li>
									<li><a href="javascript:void(0)" onclick="selectExpandSort(this)" data="97505" ><span>暗门襟</span></a></li>
									<li><a href="javascript:void(0)" onclick="selectExpandSort(this)" data="97507" ><span>方下摆</span></a></li>
									<li><a href="javascript:void(0)" onclick="selectExpandSort(this)" data="97509" ><span>圆下摆</span></a></li>
								</ul>
                            </div>
                        </li>
						<li class="new-ul-li">
                        	<a href="javascript:void(0)" onclick="showHideFilter(this)" class="new-li-a on">尺码</a>
                            <div class="new-pop-sel" style="display:none">
                            	<ul>
									<li><a href="javascript:void(0)" onclick="selectExpandSort(this)" data="0" class="on" ><span>全部</span></a></li>
									<li><a href="javascript:void(0)" onclick="selectExpandSort(this)" data="71338" ><span>38</span></a></li>
									<li><a href="javascript:void(0)" onclick="selectExpandSort(this)" data="71339" ><span>39</span></a></li>
									<li><a href="javascript:void(0)" onclick="selectExpandSort(this)" data="71340" ><span>40</span></a></li>
									<li><a href="javascript:void(0)" onclick="selectExpandSort(this)" data="71341" ><span>41</span></a></li>
									<li><a href="javascript:void(0)" onclick="selectExpandSort(this)" data="71342" ><span>42</span></a></li>
									<li><a href="javascript:void(0)" onclick="selectExpandSort(this)" data="71343" ><span>43</span></a></li>
									<li><a href="javascript:void(0)" onclick="selectExpandSort(this)" data="71344" ><span>44</span></a></li>
									<li><a href="javascript:void(0)" onclick="selectExpandSort(this)" data="100294" ><span>XS</span></a></li>
									<li><a href="javascript:void(0)" onclick="selectExpandSort(this)" data="100309" ><span>加小</span></a></li>
									<li><a href="javascript:void(0)" onclick="selectExpandSort(this)" data="71345" ><span>S</span></a></li>
									<li><a href="javascript:void(0)" onclick="selectExpandSort(this)" data="71346" ><span>M</span></a></li>
									<li><a href="javascript:void(0)" onclick="selectExpandSort(this)" data="71347" ><span>L</span></a></li>
									<li><a href="javascript:void(0)" onclick="selectExpandSort(this)" data="71348" ><span>XL</span></a></li>
									<li><a href="javascript:void(0)" onclick="selectExpandSort(this)" data="71349" ><span>XXL</span></a></li>
									<li><a href="javascript:void(0)" onclick="selectExpandSort(this)" data="71350" ><span>XXXL</span></a></li>
									<li><a href="javascript:void(0)" onclick="selectExpandSort(this)" data="98290" ><span>均码</span></a></li>
									<li><a href="javascript:void(0)" onclick="selectExpandSort(this)" data="146936" ><span>加肥</span></a></li>
								</ul>
                            </div>
                        </li>
					</ul>
                </div>
			</div>
		</div>
	</div>
<div class="new-ct new-p-re">
	<div class="new-search">
				<div class="new-tab-type">
			<div class="new-tbl-type">
           		<a href="javascript:void(0)" id="btn_sort" f="1" class="new-tbl-cell on"><span class="new-bar"></span><span class="new-p-re">排序<span class="new-icon-down"></span></span></a>
                <a href="javascript:void(0)" id="btn_stock" f="1" class="new-tbl-cell"><span class="new-bar"></span><span class="new-p-re">库存<span class="new-icon-down"></span></span></a>
                <a href="javascript:void(0)" id="btn_delivery" f="1" class="new-tbl-cell"><span class="new-bar"></span><span class="new-p-re">配送<span class="new-icon-down"></span></span></a>
                <a href="javascript:void(0)" id="btn_filter" f="1" class="new-tbl-cell"><span class="new-bar"></span><span class="icon">筛选<span></span></span></a>
            </div>
        </div>
		<div class="new-tab-type2" style="overflow:hidden;height:34px">
        	<div class="new-tbl-type">
				<a href='/products/1315-1342-1348-0-0-0-0-0-0-0-1-1-1.html?cid=1348&stock=&resourceType=&resourceValue=&sid=b39d6855934ae151afcd2d176cf7fb4e' class="new-tbl-cell w60"><span class="on">销量</span></a>
				<a href='/products/1315-1342-1348-0-0-0-0-0-0-0-1-3-1.html?cid=1348&stock=&resourceType=&resourceValue=&sid=b39d6855934ae151afcd2d176cf7fb4e' class="new-tbl-cell w60"><span>价格</span></a>
				<a href='/products/1315-1342-1348-0-0-0-0-0-0-0-1-5-1.html?cid=1348&stock=&resourceType=&resourceValue=&sid=b39d6855934ae151afcd2d176cf7fb4e' class="new-tbl-cell w60"><span >上架时间</span></a>
			</div>
        </div>
																																																																																																																																																																															<div class="new-tab-type3" style="overflow:hidden;display:none;height:34px">
		<div class="new-tbl-type">
			<span class="new-tbl-cell">                	
				<div class="new-city-option">
					<span>地区</span>
					<span class="new-sel-box new-p-re">
						<div id="regionShow">全部<span></span></div>
						<select class="new-select" id="select_region">
							<option value="0" >全部</option>
							<option value="1" >北京</option>
							<option value="2" >上海</option>
							<option value="3" >天津</option>
							<option value="4" >重庆</option>
							<option value="5" >河北</option>
							<option value="6" >山西</option>
							<option value="7" >河南</option>
							<option value="8" >辽宁</option>
							<option value="9" >吉林</option>
							<option value="10" >黑龙江</option>
							<option value="11" >内蒙古</option>
							<option value="12" >江苏</option>
							<option value="13" >山东</option>
							<option value="14" >安徽</option>
							<option value="15" >浙江</option>
							<option value="16" >福建</option>
							<option value="17" >湖北</option>
							<option value="18" >湖南</option>
							<option value="19" >广东</option>
							<option value="20" >广西</option>
							<option value="21" >江西</option>
							<option value="22" >四川</option>
							<option value="23" >海南</option>
							<option value="24" >贵州</option>
							<option value="25" >云南</option>
							<option value="26" >西藏</option>
							<option value="27" >陕西</option>
							<option value="28" >甘肃</option>
							<option value="29" >青海</option>
							<option value="30" >宁夏</option>
							<option value="31" >新疆</option>
							<option value="32" >台湾</option>
							<option value="42" >香港</option>
							<option value="43" >澳门</option>
						</select>
					</span>   			   
				</div>
			</span>
			<a href="javascript:void(0)" id="checkbox_stock" class="new-tbl-cell  new-chk-default "><span class="new-chk  default  "></span>仅显示有货</a>
            </div>
        </div>
		<div class="new-tab-type4" style="overflow:hidden;display:none;height:34px">
        	<div class="new-tbl-type">
           		<a href="javascript:void(0)" id="self_all" class="new-tbl-cell"><span class="new-rdo  on "></span>全部</a>
                <a href="javascript:void(0)" id="self_jd" class="new-tbl-cell"><span class="new-rdo "></span>自提</a>
                <a href="javascript:void(0)" id="self_other" class="new-tbl-cell"><span class="new-rdo "></span>第三方配送</a>
            </div>
        </div>
		
			<form id="condtion" action="/ware/search.action" type="post">
        		<input name="cid" value="1348" type="hidden" />
                <input name="categoryId" value="1348" type="hidden" />
                <input name="expandSortId" id="expandSortId" value="0-0-0-0-0-0-0" type="hidden" />
                <input name="c1" value="1315" type="hidden" />
                <input name="c2" value="1342" type="hidden" />
                <input name="sort" id="sort" value="1" type="hidden" />
				<input name="region" id="region" value="" type="hidden" />
				<input name="stock" id="stock" value="" type="hidden" />
				<input name="self" id="self" value="" type="hidden" />
				<input type="hidden" name="resourceType" value="" />
				<input type="hidden" name="resourceValue" value="" />
				<input name="sid" value="b39d6855934ae151afcd2d176cf7fb4e" type="hidden" />
			</form>
			    <c:if test="${size !=0 }">
				  <ul class="new-mu_l2w"> 
				  <c:forEach items="${itemlist}" var="item">
					<li class="new-mu_l2">
						<a onclick="searchlog(1,337318,0,2)" href="/shop/items/items.do?id=${item.id}" target="_blank" class="new-mu_l2a">
							<span class="new-mu_tmb"><IMG class="err-product" title='' src="${item.img}" width="100" height="100" data-img="1" /></span>
								<span class="new-mu_l2cw">
								<strong class="new-mu_l2h">${item.name }</strong>
								<span class="new-mu_l2h"><span class="new-txt-rd2 new-elps"></span></span>
								<span class="new-mu_l2c"><strong class="new-txt-rd2">￥${item.price}</strong></span>
								<span class="new-mu_l2c new-p-re"><span class="new-txt">已有0人评价</span></span>
							</span>
						</a>
					</li>
						
				  </c:forEach>
				  </ul>
				</c:if> 
				<c:if test="${size ==0 }">
					<DIV>
					&nbsp; &nbsp; &nbsp; &nbsp;对不起，暂时没有该类商品！
					</DIV>
				</c:if>
			</ul>
    </div>
		<div class="new-paging">
    	<div class="new-tbl-type">
        	<div class="new-tbl-cell">
					<span class="new-a-prve"><span>上一页</span>
			</div>
			<div class="new-tbl-cell new-p-re">
            	<div class="new-a-page">
                	<span class="new-open">1/1</span>
                </div>
                <select class="new-select" onchange="window.location.href=this.value;">
					<option value="/products/1315-1342-1348-0-0-0-0-0-0-0-1-1-1.html?cid=1348&stock=&resourceType=&resourceValue=&sid=b39d6855934ae151afcd2d176cf7fb4e" selected>第1页</option>
			
				</select>
			</div>
			<div class="new-tbl-cell">
				<a href='javascript:window.location.href="/products/1315-1342-1348-0-0-0-0-0-0-0-1-1-2.html?cid=1348&stock=&resourceType=&resourceValue=&sid=b39d6855934ae151afcd2d176cf7fb4e"' class="new-a-next"><span>下一页</span></a>
			</div>
		</div>
	</div>
		</div>
<script language="javascript">
	function showHideFilter(obj){
		var hasClass = $(obj).hasClass('on');
		$(obj).parent().siblings().children('div').hide();
		$(obj).siblings().hide();
		$(obj).addClass('on');
		$(obj).parent().siblings().children('a').addClass('on');
		if(hasClass){
			$(obj).removeClass('on');
			$(obj).siblings().show();
		}
	}
	function selectExpandSort(obj){
		$(obj).parent().siblings().children('a').removeClass('on');
		$(obj).addClass('on');
		var div = $('#filter_prop a.on[data]');
		var esId = '';
		for(var i=0,len=div.size();i<len;i++){
			if(esId!='')esId+='-';
			esId+=$(div[i]).attr('data');
		}
		var more = 7-div.length;
		if(more>0){
			for(var i=0;i<more;i++){
				if(esId!='')esId+='-0';
			}
		}
		$('#expandSortId').val(esId);
		$('#condtion').submit();
		closeFilter();
	}
	function selectCategory(obj){
		$(obj).parent().siblings().children('a').removeClass('on');
		$(obj).addClass('on');
		closeFilter();
	}
	function selectCategoryFilter(obj){
		$(obj).parent().siblings().children('a').removeClass('on');
		$(obj).addClass('on');
		
		var param = '';
		var express = $('#filter_prop a.on[data][type="1"]');
		for(var i=0,len=express.size();i<len;i++){
			if($(express[i]).attr('data')!=''){
				if(param!='')param+=',';
				param+=($(express[i]).attr('parent')+":"+$(express[i]).attr('data'));
			}
		}
		$('#expressionKey').val(param);
		
		var price = $('#filter_prop a.on[data][type="2"]');
		$('#minprice').val('');
        $('#maxprice').val('');
		for(var i=0,len=price.size();i<len;i++){
			if($(price[i]).attr('data')!=''){
				content = $(price[i]).attr('data');
				if(content){
        			var tmpPrice = content.split('-');
        			if(tmpPrice.length==2){
        				$('#minprice').val(tmpPrice[0]);
        				$('#maxprice').val(tmpPrice[1]);
        			}
				}
			}
		}
		
		param = '';
		var expand = $('#filter_prop a.on[data][type="3"]');
		for(var i=0,len=expand.size();i<len;i++){
			if($(expand[i]).attr('data')!=''){
				if(param!='')param+=',';
				param+=($(expand[i]).attr('parent')+":"+$(expand[i]).attr('data'));
			}
		}
		$('#expandName').val(param);
		$('#condtion').submit();
		closeFilter();
	}
	function closeFilter(){
		(document.body||document.documentElement).removeChild(document.getElementById('_mask'));
		(document.body||document.documentElement).removeChild(document.getElementById('_maskArrow'));
		//$('a[f="1"]').removeClass('on');
		document.getElementById('slidebar').setAttribute('style','-webkit-transition: -webkit-transform 0.4s;-webkit-transform-origin: 0px 0px; -webkit-transform-style: preserve-3d;-webkit-transform: translate(190px, 0);');
		setTimeout(function(){
			$('#filterbar').hide();
		},400);
	}
	$(function(){
		$('a[f="1"]').click(function(e){
    		var cobj = e.srcElement || e.target;
    		var id = $(cobj).attr('id');
    		if(!id)id=$(cobj).parent('a').attr('id')||$(cobj).parent('span').parent('a').attr('id');
			if($('#'+id).hasClass('on')){return;}
			if(id!='btn_filter'){
    			$('.new-tab-type2').hide();
        		$('.new-tab-type3').hide();
        		$('.new-tab-type4').hide();
			}
			if($('#'+id).hasClass('on')){
				//$('a[f="1"]').removeClass('on');
			}else{
				var tagSort = !$('#btn_sort').hasClass('on');
				var tagStock = !$('#btn_stock').hasClass('on');
				var tagDelivery = !$('#btn_delivery').hasClass('on');
				if(id!='btn_filter'){
					$('a[f="1"]').removeClass('on');
					$('#'+id).addClass('on');
				}
        		if(id=='btn_sort'){
					if(tagStock && tagDelivery){
    					$('.new-tab-type2').css({'display':'block','height':'0px'});
        				$('.new-tab-type2').animate({'height':'34px'},{'duration':'fast'});
					}else{
						//$('.new-tab-type2').css({'display':'block'});
						$('.new-tab-type2').css({'opacity':'0','display':'block'});
						$('.new-tab-type2').animate({'opacity':10},'slow');
					}
        		}else if(id=='btn_stock'){
					if(tagSort && tagDelivery){
    					$('.new-tab-type3').css({'display':'block','height':'0px'});
        				$('.new-tab-type3').animate({'height':'34px'},{'duration':'fast'});
					}else{
						//$('.new-tab-type3').css({'display':'block'});
						$('.new-tab-type3').css({'opacity':'0','display':'block'});
						$('.new-tab-type3').animate({'opacity':10},'slow');
					}
        		}else if(id=='btn_delivery'){
					if(tagSort && tagStock){
    					$('.new-tab-type4').css({'display':'block','height':'0px'});
        				$('.new-tab-type4').animate({'height':'34px'},{'duration':'fast'});
					}else{
						//$('.new-tab-type4').css({'display':'block'});
						$('.new-tab-type4').css({'opacity':'0','display':'block'});
						$('.new-tab-type4').animate({'opacity':10},'slow');
					}
        		}else if(id=='btn_filter'){
					$('#filterbar').show();
					var height = ((document.body||document.documentElement).clientHeight+20)+'px';
					if(parseInt($('#slidebar').css('height').replace('px',''))>parseInt(height.replace('px',''))-20){
						height = (parseInt($('#slidebar').css('height').replace('px',''))+50)+'px';
					}
					$('#filterbar').css('height',(parseInt(height.replace('px',''))-50)+"px");
					var width = '100%';
					var maskArrow = document.createElement("a");
					maskArrow.setAttribute('class','new-abtn-slid');
					maskArrow.setAttribute('style','z-index:8889;left:auto;right:185px;');
					maskArrow.setAttribute('id','_maskArrow');
        			var mask = document.createElement("div");
					mask.setAttribute('id','_mask');
					mask.setAttribute('style','position:absolute;left:0px;top:0px;background-color:rgb(13, 13, 13);filter:alpha(opacity=60);opacity: 0.6;width:'+width+';height:'+height+';z-index:8888;');
					(document.body||document.documentElement).appendChild(mask);
					(document.body||document.documentElement).appendChild(maskArrow);
					var scrolltop = (document.body||document.documentElement).scrollTop;
					$('#filterbar').css("top",(scrolltop-28)+"px");
					document.getElementById('slidebar').setAttribute('style',' -webkit-transform-style: preserve-3d; -webkit-transition: -webkit-transform 0.4s; -webkit-transform-origin: 0px 0px; -webkit-transform: translate(0px, 0); ');
					$('#_maskArrow').click(function(){
            			closeFilter();
            		});
					$('#_mask').click(function(){
            			closeFilter();
            		});
        		}
			}
    	});
		$('#select_region').change(function(){
			var text = document.getElementById('select_region').options[document.getElementById('select_region').selectedIndex].text;
			$('#regionShow').html(text+'<span></span>');
			var val = $('#select_region').val();
			$('#region').val(val);
			if(val=='0'){
				$('#stock').val('');
			}
			$('#condtion').submit();
		});
		if($('#region').val()!='' && $('#region').val()!='0'){
    		$('#checkbox_stock').click(function(){
    			if($('#checkbox_stock').children('span').hasClass('on')){
    				$('#checkbox_stock').children('span').removeClass('on')
    				$('#stock').val("");
    			}else{
    				$('#checkbox_stock').children('span').addClass('on')
    				$('#stock').val("1");
    			}
    			$('#condtion').submit();
    		});
		}
		$('#self_all').click(function(){
			$('#self_all').children('span').removeClass('on');
			$('#self_jd').children('span').removeClass('on');
			$('#self_other').children('span').removeClass('on');
			$('#self_all').children('span').addClass('on');
			$('#self').val("");
			$('#condtion').submit();
		});
		$('#self_jd').click(function(){
			$('#self_all').children('span').removeClass('on');
			$('#self_jd').children('span').removeClass('on');
			$('#self_other').children('span').removeClass('on');
			$('#self_jd').children('span').addClass('on');
			$('#self').val("1");
			$('#condtion').submit();
		});
		$('#self_other').click(function(){
			$('#self_all').children('span').removeClass('on');
			$('#self_jd').children('span').removeClass('on');
			$('#self_other').children('span').removeClass('on');
			$('#self_other').children('span').addClass('on');
			$('#self').val("2");
			$('#condtion').submit();
		});
		$('#btn_prop').click(function(){
			$(this).addClass('on');
			$('#btn_cat').removeClass('on');
			$('#filter_prop').show();
			$('#filter_cat').hide();
		});
		$('#btn_cat').click(function(){
			$(this).addClass('on');
			$('#btn_prop').removeClass('on');
			$('#filter_prop').hide();
			$('#filter_cat').show();
		});
	})
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
//	syncCart('b39d6855934ae151afcd2d176cf7fb4e',true);
	location.href='/cart/cart.action';
});

function reSearch(){
var depCity = window.sessionStorage.getItem("airline_depCityName");
	if(testSessionStorage() && isNotBlank(depCity) && !/^\s*$/.test(depCity) && depCity!=""){
    	var airStr = '<form action="/airline/list.action" method="post" id="reseach">'
        +'<input type="hidden" name="sid"  value="b39d6855934ae151afcd2d176cf7fb4e"/>'
        +'<input type="hidden" name="depCity" value="'+ window.sessionStorage.getItem("airline_depCityName") +'"/>'
        +'<input type="hidden" name="arrCity" value="'+ window.sessionStorage.getItem("airline_arrCityName") +'"/>'
        +'<input type="hidden" name="depDate" value="'+ window.sessionStorage.getItem("airline_depDate") +'"/>'
        +'<input type="hidden" name="depTime" value="'+ window.sessionStorage.getItem("airline_depTime") +'"/>'
        +'<input type="hidden" name="classNo" value="'+ window.sessionStorage.getItem("airline_classNo") +'"/>'
        +'</form>';
    	$("body").append(airStr);
    	$("#reseach").submit();
	}else{
    	window.location.href='/airline/index.action?sid=b39d6855934ae151afcd2d176cf7fb4e';
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
		var needHalfShow = window._needHalfShow || false;
				if($(".download-con").length && (!needHalfShow || ~~(Math.random()*10)%2)){
			_loadScript("../js/2013/installapp.js?v=20140422100001",{},function(){
			});
		}
		
	})
</script>
</body>
</html>
