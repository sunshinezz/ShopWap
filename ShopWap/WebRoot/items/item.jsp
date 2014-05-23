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
		<meta name="author" content="zz tzq zr">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">
		<meta name="format-detection" content="telephone=no">
		<meta http-equiv="Expires" CONTENT="-1">           
		<meta http-equiv="Cache-Control" CONTENT="no-cache">           
		<meta http-equiv="Pragma" CONTENT="no-cache">           
		<link rel="stylesheet" type="text/css" href="../css/base2013.css?v=20140414100001" charset="gbk"/>
		<link rel="stylesheet" type="text/css" href="../css/2013/ware/view.css?v=20140318135401" charset="gbk"/>	
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
					<span class="icon4">我的we购</span>
					<p style="color:#6e6e6e;">我的we购</p>
				</a>
			</div>
		</div>
	</header>
<script type="text/javascript" src="/js/2013/ware/view.js?v=201403261759"></script>
<script type="text/javascript" src="/js/2013/ware/newView.js?v=201403181290"></script>
<div id="mainLayout" style="display:-webkit-box;">
    <div class="new-ct" id="mainStay" style="-webkit-box-flex: 1;width: 100%;">
		<div class="new-p-re">
    	<div class="detail-img" >
			<div class="tbl-type"  id="_zoom">
				<div id="imgSlider" style="position:relative;left:0px;">  
					<span class="tbl-cell"><img src="${item.img }" seq="0" width="320" height="292" alt="${item.name }" qvod="0" data-img="1" jqimg=" ../img/item/items.jpg"></span>				
			</div>
			<ul class="new-banner-num new-b-num-v1 new-tbl-type" id="imgSliderPage" >
				<li class="new-tbl-cell on"><a href="javascript:void(0)"></a></li>
				<li class="new-tbl-cell "><a href="javascript:void(0)"></a></li>
				<li class="new-tbl-cell "><a href="javascript:void(0)"></a></li>
				<li class="new-tbl-cell "><a href="javascript:void(0)"></a></li>
				</ul>
			</div>
			</div>
            <div class="detail-price">
            	            	<span class="text" id="price">&yen;${item.price }  </span> 
				
			</div>

        </div>

    	<div class="secton10">
            <div class="info">
                <a href="#">
                    <span class="text">商品信息</span>
                </a>
                <span class="icon-arr"></span>
            </div>
            <p class="detail-title">${item.name }<font color="red"></font></p>
            <p class="text3" id="promotionInfo" style=" display:none ">  </p>
            <p class="text2" id="vender" style=" ">服务：由BOOK  WISTA旗舰店负责发货，并提供售后服务。</p>
                    </div>
        <div class="bg-h15"></div>
        <div id="spinner1" class="spinner" style="left:50%;position: absolute;height:120px;margin-top:50px;z-index:1000"></div>
        <div class="secton10 secton10-v1">
            <div class="info">
                <a href="#!showassess"  id="btnAssess">
					<span class="text">商品评价</span><span class="text-fr" id="comments"><em>1168</em> 人评价  <em>99%</em> 好评</span>
                </a>        
                <span class="icon-arr"></span>
            </div>
        </div>
        
    	<div class="cart-pop" id="cart" style="display:none;position:absolute;bottom:50%;z-index:9999">
			<div class="ico-succ" >
				<span class="att-succ">添加成功！</span>
				<span class="cart-succ">商品已成功加入购物车</span>
			</div>
			<div class="cp-lnk" >
				<a href="javascript:void(0)" onclick="$('#cart').hide();$('#_mask').hide();" id="stroll">再逛逛</a>                    
				<a  id="goCart"><span class="bar"></span>去购物车</a>
			</div>
        </div>
        <div class="bg-h15"></div>
        <div class="secton10 secton10-v1">
            <div class="info border-b-none">
            	<!--[D] 加on 箭头向下 -->
                <a id="kucun" class="btn-option2 on">
                	<span class="s-block">
                        <span class="text-fl2">库存：</span>
                        <span class="text-overflow">
                        	<span class="to-text" id="stockTip"> 北京 >  朝阳区 > 三环以内       </span>
                            <span class="to-text2" id="stockStatus"><font color="#c00">现货，现在至明日16:00前完成下单，预计05月19日-05月21日送达</font></span>
                        </span>
                    </span>
                
					<span class="s-block" id="color_parent" >
						<span class="text-fl2">颜色：</span>
						<span class="text-overflow">
							<span class="to-text3" id="color1">卡其色	</span>
						</span>
					</span>
					<span class="s-block" id="size_parent" >
						<span class="text-fl2">尺寸：</span>
						<span class="text-overflow">
							<span class="to-text3" id="size1">40</span>
						</span>
					</span>  
					<span class="icon-arr"></span>
				</a>
            <div class="detail-option" id="select" style="display:none" data="none">
                <div class="option-section">
                    <span class="text-fl">送到：</span>
                    <div class="option">
						<span>
							<span class="select-box new-mg-b10" id="provincetip">
								<span></span>
								<select class="new-select" id="province" onchange="changeProvince();">
								 <script language=javascript>$('#provincetip').append('北京');</script><option value="1"  selected="selected" > 北京</option> <option value="2" > 上海</option> <option value="3" > 天津</option> <option value="4" > 重庆</option> <option value="5" > 河北</option> <option value="6" > 山西</option> <option value="7" > 河南</option> <option value="8" > 辽宁</option> <option value="9" > 吉林</option> <option value="10" > 黑龙江</option> <option value="11" > 内蒙古</option> <option value="12" > 江苏</option> <option value="13" > 山东</option> <option value="14" > 安徽</option> <option value="15" > 浙江</option> <option value="16" > 福建</option> <option value="17" > 湖北</option> <option value="18" > 湖南</option> <option value="19" > 广东</option> <option value="20" > 广西</option> <option value="21" > 江西</option> <option value="22" > 四川</option> <option value="23" > 海南</option> <option value="24" > 贵州</option> <option value="25" > 云南</option> <option value="26" > 西藏</option> <option value="27" > 陕西</option> <option value="28" > 甘肃</option> <option value="29" > 青海</option> <option value="30" > 宁夏</option> <option value="31" > 新疆</option> <option value="32" > 台湾</option> <option value="42" > 香港</option> <option value="43" > 澳门</option> <option value="84" > 钓鱼岛</option>                                    </select>
							</span>
						</span>
						<span>
                            <span class="select-box new-mg-b10" id="citytip">
                                <span></span>
                                <select class="new-select" id="city" onchange="changeCity();">
    								 <script language=javascript>$('#citytip').append('朝阳区');</script><option value="72"  selected="selected" > 朝阳区</option> <option value="2800" > 海淀区</option> <option value="2801" > 西城区</option> <option value="2802" > 东城区</option> <option value="2803" > 崇文区</option> <option value="2804" > 宣武区</option> <option value="2805" > 丰台区</option> <option value="2806" > 石景山区</option> <option value="2807" > 门头沟</option> <option value="2808" > 房山区</option> <option value="2809" > 通州区</option> <option value="2810" > 大兴区</option> <option value="2812" > 顺义区</option> <option value="2814" > 怀柔区</option> <option value="2816" > 密云区</option> <option value="2901" > 昌平区</option> <option value="2953" > 平谷区</option> <option value="3065" > 延庆县</option>    							</select>
                            </span>
                        </span>
						<span id="country_1">
                            <span class="select-box new-mg-b10" id="countrytip">
                                <span></span>
                                <select class="new-select" id="country" onchange="changeCountry();">
                                 <script language=javascript>$('#countrytip').append('三环以内');</script><option value="2799"  selected="selected" > 三环以内</option> <option value="2819" > 三环到四环之间</option> <option value="2839" > 四环到五环之间</option> <option value="2840" > 五环到六环之间</option> <option value="4137" > 管庄</option> <option value="4139" > 北苑</option> <option value="4211" > 定福庄</option>                                </select>
                            </span>
                        </span>
						<span id="town_1">
						<span class="detail-msg"><span class="text-red" id="stockStatus_1">现货，现在至明日16:00前完成下单，预计05月19日-05月21日送达</span></span>                
                        </div>
                    </div>
					                    <div class="option-section new-mg-t10" >
                        <span class="text-fl">颜色：</span>
                        <div class="option" id="color">
    						<a title="卡其色" date="current" class="btn-color-op new-mg-b10 on">卡其色</a>&nbsp;<a title="浅灰色" date="noCurrent" href="javascript:void(0)" wareId='1105763848' class="btn-color-op new-mg-b10">浅灰色</a>&nbsp;<a title="深蓝色" date="noCurrent" href="javascript:void(0)" wareId='1105763914' class="btn-color-op new-mg-b10">深蓝色</a>&nbsp;                        </div>
                    </div>
										                     <div class="option-section new-mg-t10" >
                        <span class="text-fl">尺寸：</span>
                        <div class="option" id="size">
    						<a title="39" href="javascript:void(0)" date="noCurrentSize" wareId="1105763841" class="btn-color-op new-mg-b10">39</a>&nbsp;<a title="40" class="btn-color-op new-mg-b10 on" date="currentSize">40</a>&nbsp;<a title="41" href="javascript:void(0)" date="noCurrentSize" wareId="1105763843" class="btn-color-op new-mg-b10">41</a>&nbsp;<a title="42" href="javascript:void(0)" date="noCurrentSize" wareId="1105763844" class="btn-color-op new-mg-b10">42</a>&nbsp;<a title="43" href="javascript:void(0)" date="noCurrentSize" wareId="1105763845" class="btn-color-op new-mg-b10">43</a>&nbsp;<a title="44" href="javascript:void(0)" date="noCurrentSize" wareId="1105763846" class="btn-color-op new-mg-b10">44</a>&nbsp;                        </div>
                    </div>
                                        <div class="option-section new-mg-t10">
                        <span class="text-fl">数量：</span>
                        <div class="option">
                            <span class="add-del">
                                <a class="btn-add" id="plus" onclick="reduce();"><span></span></a>
                                <input type="text" class="new-input" value="1" id="number" onblur="modify();"/>
                                <a class="btn-del" id="minus" onclick="add();"><span></span></a>
                            </span>
                        </div>
                    </div>
                
                </div>
            </div>
        </div>     
		<!--
		 <div class="tbl-type detail-tbn detail-tbn-v1" id="jshopAndIm">
			<span class="tbl-cell">
				<a href="http://mall.jd.com/m/index-60967.html"  class="btn-shop"><span></span>进入店铺</a>
			</span>
			<span class="tbl-cell" id="kefu" style="display:none">
				<a href="javascript:void(0)" id="im" class="btn-call"><span></span>联系客服</a>
			</span>
		</div>
		-->
		<div class="img-list-border">
			<div class="img-list">
				<p>也许您还喜欢：</p>
					<div class="img-sild" style="position:relative;height:150px;">
					   <div  ontouchstart="touchStart(event)" ontouchmove="touchMove(event);" ontouchend="touchEnd(event);">
						<div class="tbl-type" style="position:absolute;height:150px;margin-left:-100px" id="slide">
							<a class="tbl-cell" href="#">
								<div class="pro-img">
									<span class="img"><img src="http://img10.360buyimg.com/n4/g14/M0A/1E/1B/rBEhVlNU14IIAAAAAAKzwa4jU2kAAMWfQFPyPkAArPZ866.jpg" width="85" height="85" alt="img"></span>
									<span class="pro-title">BOOK WISTA新款夏季懒人鞋透气休闲鞋帆布鞋 男板鞋驾车鞋012 棕色 41</span>
																														<span class="pro-price">&yen;119.00</span>
								</div>
							</a>
							<a class="tbl-cell" href="#">
								<div class="pro-img">
									<span class="img"><img src="http://img10.360buyimg.com/n4/g12/M00/0A/0B/rBEQYVNU3yMIAAAAAAOQF15exI0AAE2JAOzRrgAA5Av389.jpg" width="85" height="85" alt="img"></span>
									<span class="pro-title">BOOK WISTA新款夏季网布情侣休闲拖鞋透气防臭懒人鞋 男C021 深蓝色 42</span>
																														<span class="pro-price">&yen;99.00</span>
								</div>
							</a>
							<a class="tbl-cell" href="#">
								<div class="pro-img">
									<span class="img"><img src="http://img12.360buyimg.com/n4/g15/M04/09/03/rBEhWVIq_asIAAAAAAHbXpWFHDYAAC6SgOZV6IAAdt2480.jpg" width="85" height="85" alt="img"></span>
									<span class="pro-title">瑞士Pellegrini 男士商务休闲正装鞋 头层牛皮黑棕色英伦真皮皮鞋 男723-02 经典黑 40</span>
																														<span class="pro-price">&yen;299.00</span>
								</div>
							</a>
						 </div>  
					</div>
				</div>
		   </div>
		</div>

		<div class="tbl-type detail-tbn2" id="cart1" style="position:fixed;bottom:0;z-index:10;" >
			<div class="tbl-cell">
				<a id="coll929598" class="btn-buy btn-buy-def" onclick="mark(929598,4);" href="/ShopWap/buy/myOrderServlet.do?action=addLike&itemId=${item.id}">
					<span></span>
					添加关注
				</a>
			</div>
			<div class="tbl-cell">
				<form id="form2" name="form2" action="/ShopWap/shopcar/shopcar.do" method="post">
					<a id="InitCartUrl" class="btn-cart btn-cart-def" onclick="shopcar()" href="javascript:void(0);">
						<span></span>
						加入购物车
					</a>
					<INPUT type="hidden" id="buy-num" name="buy-num" class="text" onkeyup="" value="1" />
					<INPUT type="hidden" id="itemid" name="itemid" value="${item.id }"/>
					<INPUT type="hidden" id="action" name="action" value="add"/>
				</form>
			</div>
		</div>
    </div>
	<script type="text/javascript" language="javascript">
		function shopcar()
		{ 
		  var num = document.getElementsByName("buy-num")[0].value;
		  var form= document.getElementsByName("form2")[0];
		  var reg = new RegExp("^[0-9]*$");
		  if(!reg.test(num))
		  {
			alert("请输入正确的数目!");
			return;
		  }  
		  form.submit();
		}              	
	</script>
	<div id="showassess" style="margin-bottom: 20px;-webkit-box-flex: 1;width: 100%;display: none!important;">
        	<div class="new-ct">
            	<div class="new-goods-details" id="_assessContent">
					
            		<div class="new-gd-introduce">
                    	<div class="new-fl w56 new-mg-r12">
                        	<span class="new-span-block"><span class="new-txt36" id="_assessScale">0</span><span class="new-txt-sign">%</span></span>
                            <span class="new-span-block new-mg-t5">好评度</span>
                        </div>
                        <div class="new-gd-txt3">
                        	<span class="new-span-block" id="_btnGoodScale"><span>好评</span><span class="new-txtb8" id="_goodScale">（0%）</span><span class="new-gd-bar new-mg-l12"><span style="width:0%" id="_goodScaleImg"></span></span></span>
                            <span class="new-span-block" id="_btnMediumScale"><span>中评</span><span class="new-txtb8" id="_mediumScale">（0%）</span><span class="new-gd-bar new-mg-l12"><span style="width:0%" id="_mediumScaleImg"></span></span></span>
                            <span class="new-span-block" id="_btnGoodScale"><span>差评</span><span class="new-txtb8" id="_badScale">（0%）</span><span class="new-gd-bar new-mg-l12"><span style="width:0%" id="_badScaleImg"></span></span></span>
                        </div>
                        <div class="new-estimate new-tbl-type new-mg-t15">
                        	<div class="new-tbl-cell on" id="_tabGoodScale" onclick="changeAssessType(this)">
                            	<span>好评</span><span id="goodNum">0</span>
                            </div>
                            <div class="new-tbl-cell" id="_tabMediumScale"  onclick="changeAssessType(this)">
                            	<span>中评</span><span id="mediumNum">0</span>
                            </div>
                            <div class="new-tbl-cell" id="_tabBadScale" onclick="changeAssessType(this)">
                            	<span>差评</span><span id="badNum">0</span>
                           	</div>
                        </div>
                    </div>
					
                    <div id="_assessItem">
					</div>
					
                </div>
            </div>
			
			<div class="new-paging" id="_assessPage">
            </div>
			
	</div>
</div>
		<span class="pop-attention"  style="position:absolute;z-index:9999;display:none" id="save">
			<span class="icon-succ" id="guanzhu">关注成功</span>
		</span>

	<div class="new-gd-view-img" id="popImg" style="position:absolute;display:none;z-index:9000" onclick="hidePop()">
		<div class="new-banner new-p-re">
			<ul class="new-tbl-type" style="position:absolute;margin-left:0" id="bigImgSlider">
				<li class="new-tbl-cell"><a href="javascript:void(0)"><span class="new-shade-img"><img src="http://img12.360buyimg.com/n1/g13/M02/1F/17/rBEhUlMw6HgIAAAAAAR8aRF8v44AAKqdAIBET8ABHyB899.jpg!q70.jpg" width="300" height="300" alt=""></span></a></li>
			</ul>
			<ul class="new-banner-num new-tbl-type" id="bigImgSliderPage">
				<li class="new-tbl-cell on"><a href="javascript:void(0)"></a></li>
				<li class="new-tbl-cell "><a href="javascript:void(0)"></a></li>
				<li class="new-tbl-cell "><a href="javascript:void(0)"></a></li>
				<li class="new-tbl-cell "><a href="javascript:void(0)"></a></li>
			</ul>
		</div>
	</div>

	<div id="yuyuecart" style="width:100%;position:fixed;bottom:0;display:none">
    	<div class="tbl-type detail-tbn2">
            <div class="tbl-cell">
                <a class="btn-cart" data id="cartyuyue"><span></span>加入购物车</a>
            </div>
        </div>
	</div>
	
	<div id="yuyueing" style="width:100%;position:fixed;bottom:0;display:none">
     <div class="tbl-type detail-tbn2" >
        <div class="tbl-cell">
            <a class="btn-yuyue" data><span class="icon-clock"></span><span id="yuyuetime"></span><span class="txt-yuyue" id="yuyuecontext"><span></span>开始预约</span></a>
        </div>
    </div>
	</div>
	
	<div id="yuyuenow" style="width:100%;position:fixed;bottom:0;display:none">
    <div class="tbl-type detail-tbn2">
        <div class="tbl-cell">
            <a class="btn-yuyue2" href="/yuyue/1105763842.html?sid=c9c69ac685f868916e14f8f32da210ca" id="nowyuyue"><span class="icon-clock"></span><span class="txt-yuyue" id="yuyuenowcontext"><span></span>立即预约</span></a>
        </div>
    </div>
	</div>
	
	<div id="yuyueend" style="position:fixed;bottom:0;display:none">
    	<div class="tbl-type detail-tbn2" >
            <div class="tbl-cell">
                <a class="btn-yuyue2"><span class="icon-clock"></span><span class="txt-yuyue" id="yuyueendcontext"><span></span></span></a>
            </div>
        </div>
	</div>
    <div class="pop" style="position:absolute;z-index:9999;display:none" id="tip">
    	<p><span class="pop-txt"></span>
        </p>
        <div class="pop-txt-area">
           <span class="pop-txt2" id="tips">
    		</span>
        </div>
        <div class="tbl-type">
        	<a href="javascript:void(0)" onclick="$('#tip').hide();$('#_mask').hide();" class="tbl-cell" style="width:50%">知道啦</a>
            <a href="javascript:void(0)" id="myyuyue" class="tbl-cell"  style="width:50%">我的预约</a>
        </div>
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
