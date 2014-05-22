<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>WebOrder</title>
		<meta name="author" content="m.jd.com">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">
		<meta name="format-detection" content="telephone=no">
		<meta http-equiv="Expires" CONTENT="-1">           
		<meta http-equiv="Cache-Control" CONTENT="no-cache">           
		<meta http-equiv="Pragma" CONTENT="no-cache">   
	  	<link rel="stylesheet" type="text/css" href="css/base2013.css" charset="gbk"/>
		<link rel="stylesheet" type="text/css" href="css/2013/index/index.css" charset="gbk"/>				
		<script type="text/javascript">
			var _winLocation=window.location.href;//获得当前页面的路径，根据路径规则进行逐页替换
			var _isWebKit = '__proto__' in {};//是否是webkit内核
			if(_isWebKit){//如果是webkit内核，则分模块使用zepto
				//要使用zeptojs的路径列表，可以做为分模块替换的开关
				var _locationList=new Array();
				//活动模块
				_locationList.push('activity/proActList');
				_locationList.push('activity/proActWareList');
				_locationList.push('activity/list');
				//商品分类模块
				_locationList.push('category/');
				//京东快讯模块
				_locationList.push('newslist.html');
				_locationList.push('newslist/');
				_locationList.push('news/');
				//机票模块
				_locationList.push('airline/');
				//酒店模块
				_locationList.push('hotel/');
				//团购模块
				_locationList.push('tuan/');
				//首页相关
				_locationList.push('hotbrand.html');//品牌馆
				//商品筛选相关
				_locationList.push('ware/expandSort.action');
				_locationList.push('ware/categoryFilter.action');
				_locationList.push('ware/search.action');
				_locationList.push('products/');
				
				_locationList.push('notice/');//通告模块
				_locationList.push('coupons/');//随地惠模块
				_locationList.push('chongzhi/');//手机充值模块
				_locationList.push('comment/');//手机推荐模块
				_locationList.push('pay/');//支付
				_locationList.push('order/');//订单
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
					document.write('<script src="js/zepto.min.js"><\/script>');
					document.write('<script type="text/javascript">window.jQuery=window.Zepto;<\/script>');
				}else{
					document.write('<script src="js/jquery-1.6.2.min.js"><\/script>');
				}
			}else{//如果是非webkit内核直接使用jquery
				document.write('<script src="js/jquery-1.6.2.min.js"><\/script>');
			}
		</script>
		<script type="text/javascript" src="js/html5/common.js"></script>
        <script type="text/javascript" src="js/html5/spin.min.js"></script>
	</head>

<body id="body">
<a name="top"></a>
<header>
	<div id="unsupport" style="cursor: pointer;display: block;font-size: 0.925em;height: 44px;line-height: 44px; margin: 0 auto; text-align: center; width: 100%;    border-bottom: 1px solid #DAD4CF; border-top: 1px solid #FCFAF9;">
    		<span >
    			显示效果不佳？
    		</span>
    		<a href="index.html@v=w&sid=e0d0f025d6d3e8e8d7be5428c43ef911" style="text-decoration:underline;color:blue;">
    			切换到标准版
    		</a>
    	</div>
		
	</header>
<script type="text/javascript" src="js/2013/index/index.js@v=20140319100001"></script>
<script type="text/javascript">$('body').css('background','#d5d5d6');$(function(){$('.new-footer').css('margin-top','0px');})</script>
<div class="new-ct main">
	<div class="banner scroll-wrapper" id="idContainer2" ontouchstart="touchStart(event)" ontouchmove="touchMove(event);" ontouchend="touchEnd(event);">
		<ul class="scroller" style="position:relative;left:0px;width:600%" id="idSlider2">
			<li style="width:-100.0%">
				<a href='/ShopWap/type/type.do?id=108'>
					<img src="/ShopWap/images/touch2013/index/rBEhWFMxYX4IAAAAAAErPe6Rqk8AAKrYgAI0x4AAStV419.jpg"  alt="家装开工季" />
				</a>
			</li>
			<li style="width:-100.0%">
				<a href='/ShopWap/type/type.do?id=112'>
					<img src="/ShopWap/images/touch2013/index/rBEhU1MxX5YIAAAAAAIQiD3JNtIAAKtOgGueKwAAhCg010.jpg"  alt="折上再满399立减100元" />
				</a>
			</li>
            <li style="width:-100.0%">
				<a href='/ShopWap/type/type.do?id=114'>
					<img src="/ShopWap/images/touch2013/index/rBEhVVMv-jkIAAAAAAHyvYHN4R4AAKwPgLWFe0AAfLV345.jpg"  alt="润视界云未来" />
				</a>
			</li>
			<li style="width:-100.0%">
				<a href='/ShopWap/type/type.do?id=124'>
					<img src="/ShopWap/images/touch2013/index/rBEQYVMr76cIAAAAAAHjiiuIVDUAADE7wHO9sYAAeOi205.jpg"  alt="拒绝思春、宅男御姐出游妆" />
				</a>
			</li>
			<li style="width:-100.0%">
				<a href='/ShopWap/type/type.do?id=104'>
					<img src="/ShopWap/images/touch2013/index/rBEhWlMvr5UIAAAAAAGjI_fslKIAAKlbgIiSMUAAaM7000.jpg"  alt="值得购买手机推荐" />
				</a>
			</li>
			<li style="width:-100.0%">
				<a href='/ShopWap/type/type.do?id=113'>
					<img src="/ShopWap/images/touch2013/index/rBEhWVMyTXsIAAAAAAIyrcrO_9AAAKs5QLmg4MAAjLF440.jpg"  alt="下首单送5元现金券" />
				</a>
			</li>
		 </ul>        
        <ul class="new-banner-num new-tbl-type" id="idNum">
        </ul>
    </div>
    <div class="logo">
    	<img src="/ShopWap/images/touch2013/index/logo.png" alt="logo">
    </div>
	
    <div class="search" style="position:relative">
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
    	<span class="input-box">
			<form action="search.do" id="form1" name="form1" onsubmit="return doValidate();" method="get">
				<input name="sid" value="e0d0f025d6d3e8e8d7be5428c43ef911" type="hidden" />
				<input id="key" name="key" type="text" class="new-input" required value="">
			</form>	
            <a href="javascript:search()"  onclick="search()" class="btn-search"><span>search</span></a>
        </span>
		<div class="new-srch-lst" id="shelper" style="position:absolute;top: 2em;left: 3.28em;display:none;width:201px;z-index:10"></div>
    </div>
    <div class="category">
    	<ul class="cate-menu tbl-type"  id="categoryMenu">
        <li class="tbl-cell route1">
        	<a href="type/type.jsp" class="menu1" onclick="clickResponse(this)" res="1">
            	<span class="menu1-icon"><span></span></span>
                <span class="cate-name">分类</span>
            </a>
        </li>
        <li class="tbl-cell route2">
        	<a href="/ShopWap/shopcar/shopcar.do?action=show" id="settleup-url" class="menu2" onclick="clickResponse(this)" res="1">
            	<span class="menu2-icon"><span></span></span>
                <span class="cate-name">购物车</span>
            </a>
        </li>
        <li class="tbl-cell route3">
        	<a href="/ShopWap/buy/myOrderServlet.do?action=myw" class="menu3" onclick="clickResponse(this)" res="1">
            	<span class="menu3-icon"><span></span></span>
                <span class="cate-name">我的</span>
            </a>
        </li>
        <li class="tbl-cell route4">
        	<a href="/ShopWap/type/type.do?id=104" class="menu4" onclick="clickResponse(this)" res="1">
            	<span class="menu4-icon"><span></span></span>
                <span class="cate-name">手机</span>
            </a>
        </li>
        <li class="tbl-cell route5">
        	<a href="/ShopWap/type/type.do?id=123" class="menu6" onclick="clickResponse(this)" res="1">
            	<span class="menu6-icon"><span></span></span>
                <span class="cate-name">彩票</span>
            </a>
        </li>
        </ul>
    </div>
    
    <div class="ad1 tbl-type">
    	<div class="tbl-cell">
        	<a href="/ShopWap/type/type.do?id=119">
            	<img src="images/touch2013/index/_40img1_1.png" class="half-img" width="160" alt="img">
            </a>
        </div>
        <div class="tbl-cell">
        	<div class="ad1-left">
				<a href="/ShopWap/type/type.do?id=121" class="ad-border">
                	<img src="images/touch2013/index/_40img1_4.png" class="half-img" width="160" alt="img">
                </a>
				<a href="/ShopWap/type/type.do?id=103">
                	<img src="images/touch2013/index/index_hotsale.png" class="half-img" width="160" alt="img">
                </a>
			</div>
        </div>
    </div>
    
    <div class="keyword">
    	<a href="/ShopWap/type/type.do?id=104" class="btn-text" res="1" onclick="clickResponse(this)">手机</a><a href="/ShopWap/type/type.do?id=104" class="btn-text" res="1" onclick="clickResponse(this)">手机套</a><a href="/ShopWap/type/type.do?id=104" class="btn-text" res="1" onclick="clickResponse(this)">手机电池</a><a href="/ShopWap/type/type.do?id=104" class="btn-text" res="1" onclick="clickResponse(this)">手机贴膜</a>
        <a href="/ShopWap/type/type.do?id=105" class="btn-text" res="1" onclick="clickResponse(this)">读卡器</a><a href="/ShopWap/type/type.do?id=105" class="btn-text" res="1" onclick="clickResponse(this)">储存卡</a><a href="/ShopWap/type/type.do?id=105" class="btn-text" res="1" onclick="clickResponse(this)">路由器</a><a href="/ShopWap/type/type.do?id=105" class="btn-text" res="1" onclick="clickResponse(this)">平板电脑</a>
    </div>
    
    <div class="tab-menu">
    	<ul class="tbl-type">
        <li class="tbl-cell" onclick="clickResponse($(this).children('a').children('span').eq(0))">
        	<a href="/ShopWap/type/type.do?id=124" class="bdr-right">
            	<span class="tab-icon1" res="1"></span>
                <span class="tab-text">酒店预订</span>
            </a>
        </li>
        <li class="tbl-cell" onclick="clickResponse($(this).children('a').children('span').eq(0))">
        	<a href="/ShopWap/type/type.do?id=124" class="bdr-right">
            	<span class="tab-icon2" res="1"></span>
                <span class="tab-text">景点门票</span>
            </a>
        </li>
        <li class="tbl-cell" onclick="clickResponse($(this).children('a').children('span').eq(0))">
        	<a href="/ShopWap/type/type.do?id=124" class="bdr-right">
            	<span class="tab-icon3" res="1"></span>
                <span class="tab-text">机  票</span>
            </a>
        </li>
        <li class="tbl-cell" onclick="clickResponse($(this).children('a').children('span').eq(0))">
        	<a href="/ShopWap/type/type.do?id=124">
            	<span class="tab-icon4" res="1"></span>
                <span class="tab-text">电影票</span>
            </a>
        </li>
        </ul>
    </div>
				<div class="ad2 ad2-v1">
                	<h2 class="ad-h2">掌上专享特惠</h2>
                    <div class="ad2-big-img">
                    	<a href="/ShopWap/type/type.do?id=104">
						<img src="/ShopWap/images/touch2013/index/rBEhWVMqgc8IAAAAAABZ260QdDsAAKY-wL1HsQAAFnz698.jpg" class="full-img" width=320  alt="掌上专享特惠"></a>
                    </div>
                </div>

				<div class="ad2">
                	<h2 class="ad-h2">值得买</h2>
					<div class="tbl-type">
                        <div class="tbl-cell">
							<a href="/ShopWap/type/type.do?id=104">
                                <img src="/ShopWap/images/touch2013/index/rBEQYFMvvQkIAAAAAACOw0gac2QAADMtwCT_EQAAI7b031.jpg"  class="half-img" width="160" alt="妈咪宝贝 满300减30">
                            </a>
                        </div>
                        <div class="tbl-cell">
                            <div class="ad1-left">
								<a href="/ShopWap/type/type.do?id=108" class="ad-border">
                                    <img src="/ShopWap/images/touch2013/index/rBEhWFMxALMIAAAAAABl47h_-7QAAKpMQETmuwAAGX7052.jpg"  class="half-img" width="160" alt="家居家纺爆款抢先购">
                                </a>
								<a href="/ShopWap/type/type.do?id=103">
                                    <img src="/ShopWap/images/touch2013/index/rBEQYVMsBxIIAAAAAABFElpfVzIAADFlwO7-lsAAEUq223.jpg" class="half-img" width="160" alt="家电家装节 5折起">
                                </a>
                            </div>
                        </div>
                    </div>
				</div>
								
				<div class="ad2">
                	<h2 class="ad-h2">耍大牌</h2>
					<div class="tbl-type">            
                        <div class="tbl-cell">
                            <div class="ad1-right">
								<a href="" class="ad-border">
                                    <img src="/ShopWap/images/touch2013/index/rBEhVlMwBfEIAAAAAAA3wfX3gGAAAKwcgC1_twAADfZ319.jpg"  class="half-img" width="160" alt="愚人节潮品 低至3折">
                                </a>
								<a href="/ShopWap/type/type.do?id=119">
                                    <img src="/ShopWap/images/touch2013/index/rBEQYFMv2LIIAAAAAAA6qZQ7QlsAADNfQLe7B8AADrB404.jpg"  class="half-img" width="160" alt="母婴低至2折">
								</a>
                            </div>
                        </div>
                        <div class="tbl-cell">
							<a href="/ShopWap/type/type.do?id=112">
                                <img src="/ShopWap/images/touch2013/index/rBEhWFMv2e8IAAAAAABxbcJUJt4AAKmZwL_ZCQAAHGF336.jpg"  class="half-img" width="160" alt="连衣裙满399减100-veromoda&Artka">
                            </a>
                        </div>
                    </div>
				</div>
								
				<div class="ad2 ad2-v1">
                	<h2 class="ad-h2">超市</h2>
                    <div class="ad2-big-img">
                    	<a href="/ShopWap/type/type.do?id=121"><img src="/ShopWap/images/touch2013/index/rBEhVlMsCacIAAAAAADN82rIEPoAAKnpAJKUEwAAM4L751.jpg" class="full-img" width=320  alt="we超市"></a>
                    </div>
                </div>
												
				<div class="ad2 ad2-v1">
                	<h2 class="ad-h2">生活家</h2>
					<div class="tbl-type">
						<div class="tbl-cell" style="width:50%;">
							<a href="/ShopWap/type/type.do?id=126">
                                <img src="/ShopWap/images/touch2013/index/rBEhWVMdUVsIAAAAAACAlGr91aoAAJwBgGCd7sAAICs605.jpg" class="half-img" width="160" alt="we惠">
                            </a>
                        </div>
                        <div class="tbl-cell" style="width:50%;">
                            <div class="ad1-left2" >
								    <a href="/ShopWap/type/type.do?id=109" class="ad-border2">
                                    <img src="/ShopWap/images/touch2013/index/rBEhWlMxYk4IAAAAAAB3AYWEHt8AAKrZAA_D5AAAHcZ946.jpg" class="half-img" width="160" alt="爱家爱生活-爱萌宠">
                                </a>
								<a href="/ShopWap/type/type.do?id=124">
                                    <img src="/ShopWap/images/touch2013/index/rBEhVVLVIDkIAAAAAABx6VZLOAQAAIBogKTFBgAAHIB567.jpg" class="half-img" width="160" alt="生活旅行">
                                </a>
                            </div>
                        </div>
                    </div>
				</div>
								
				<div class="theme-pavilion">
					<div class="tbl-type">
						<span class="tbl-cell">
							<a href="/ShopWap/type/type.do?id=112">
							<img src="/ShopWap/images/touch2013/index/rBEhWVMWxRwIAAAAAAA3R8nql-YAAJeDQP_q4AAADdf450.jpg" class="half-img" width="160" alt="服装鞋帽"></a>
						</span>
													<span class="tbl-cell">
							<a href="/ShopWap/type/type.do?id=103">
							<img src="/ShopWap/images/touch2013/index/rBEhV1MWxUwIAAAAAAA6CBNTYdwAAJmpQPqm6gAADog053.jpg" class="half-img" width="160" alt="数码家电"></a>
						</span>
					</div>
					<div class="tbl-type">
					<span class="tbl-cell">
							<a href="/ShopWap/type/type.do?id=121">
							<img src="/ShopWap/images/touch2013/index/rBEhVFMWxXsIAAAAAAArpMSmaigAAJf-gPVH0wAACu8252.jpg" class="half-img" width="160" alt="百货集"></a>
						</span>
					<span class="tbl-cell">
							<a href="/ShopWap/type/type.do?id=119">
							<img src="/ShopWap/images/touch2013/index/rBEhV1MWxgIIAAAAAAAwtgmYQekAAJmqwGenAUAADDO658.jpg" class="half-img" width="160" alt="亲子屋"></a>
						</span>
					</div>
					<div class="tbl-type">
													<span class="tbl-cell">
							<a href="/ShopWap/type/type.do?id=100">
							<img src="/ShopWap/images/touch2013/index/rBEhVFMWxiQIAAAAAAAwyBcypgwAAJf_gENkREAADDg850.jpg" class="half-img" width="160" alt="好书汇"></a>
						</span>
													<span class="tbl-cell">
							<a href="/ShopWap/type/type.do?id=121">
							<img src="/ShopWap/images/touch2013/index/rBEhUlMWxkcIAAAAAAAz2oYklycAAJf_wDyua4AADPy752.jpg" class="half-img" width="160" alt="美食馆"></a>
						</span>
					</div>
				</div>
			</div>
		<input type="hidden" value="6" id="activity"/>
		<input type="hidden" value="15" id="crazy"/>

		<script>
		//活动轮播图
		var picCount = $("#activity").val();
			$(".pic-num1").css("width",(picCount*30)+"px");
			var forEach = function(array, callback){
				for (var i = 0, len = array.length; i < len; i++) { callback.call(this, array[i], i); }
			}
			var st = createPicMove("idContainer2", "idSlider2", picCount);	//图片数量更改后需更改此数值
			var nums = [];
			//插入数字
			for(var i = 0, n = st._count - 1; i <= n;i++){
				var li = document.createElement("li");
				nums[i] = document.getElementById("idNum").appendChild(li);
			}
			//设置按钮样式
			st.onStart = function(){
				//forEach(nums, function(o, i){ o.className = ""})
				forEach(nums, function(o, i){ o.className = st.Index == i ? "new-tbl-cell on" : "new-tbl-cell"; })
			}
			// 重新设置浮动
			$("#idSlider2").css("position","relative");
			
			var _initX = 0;
			var _finishX = 0;
			var _startX = 0;
			var _startY = 0;
			function touchStart(event) {
				_startX = event.touches[0].clientX;
				_startY = event.touches[0].clientY;
				_initX = _startX;
			}
			function touchMove(event) {
				var touches = event.touches;
				var _endX = event.touches[0].clientX;
				var _endY = event.touches[0].clientY;
				if(Math.abs(_endY-_startY)>Math.abs(_endX-_startX)){
					return;		
				}
				event.preventDefault();
				_finishX = _endX;
				var _absX = Math.abs(_endX-_startX);
				var lastX = $('#idSlider2').css('left').replace('px','');
				if(_startX>_endX){
					st.Stop();
					$('#idSlider2').css('left',(parseInt(lastX)-_absX)+'px');
				}else{
					st.Stop();
					$('#idSlider2').css('left',(parseInt(lastX)+_absX)+'px');
				} 
				_startX = _endX;
			}
			//触屏  离开屏幕事件
			function touchEnd(event) {
				if(_finishX==0){
					return;
				}
				if(_initX>_finishX){
					bindEvent(_initX,_finishX);
				}else if(_initX<_finishX){
					bindEvent(_initX,_finishX);
				}
				_initX = 0;
				_finishX = 0;
			}

			/**
			 *  绑定触屏触发事件
			 * @param start
			 * @param end
			 */
			function bindEvent(start,end){
				 if (start >= end) {
						   st.Next();
						} else {
							st.Previous();
						}
			}
			st.Run();
			var resetScrollEle = function(){
				$("#shelper").css("width",$("#newkeyword").width()+"px");
				var slider2Li = $("#idSlider2 li");
				slider2Li.css("width",$(".scroll-wrapper").width()+"px");
				$("#shelper").css("width",$("#newkeyword").width()+"px");
			}
			
			window.addEventListener("resize",function(){
				st.Change = st._slider.offsetWidth/st._count;
				st.Next();
				resetScrollEle();
			});
			window.addEventListener("orientationchange",function(){
				st.Change = st._slider.offsetWidth/st._count;
				st.Next();
				resetScrollEle();
			})
			resetScrollEle();
			
				$(function(){
				//根据cookie判断用户是否已经主动取消，主动取消了则不再出现提醒
				var cookieName="ucTip";
				var cancel = false;
				var start = document.cookie.indexOf(cookieName+"=");
				if (start !=-1) {
					start = start+cookieName.length+1;
					var end = document.cookie.indexOf(";",start);
					if (end==-1) {end = document.cookie.length;}
					var ucTip = document.cookie.substring(start,end);
					if(ucTip=='1'){
						cancel = true; 
					}
				}
				if(!cancel){
					//外层div元素
					var ucElement = $('<div>').attr('id','ucTip').css({"position":"fixed","bottom":"30%","z-index":"10001","border":"0","display":"none"});
					//frame元素，目前UC只支持该接入类型
					var ucFrame = $('<iframe>').css({"height":"160px","width":"320px","border":"0px"}).attr('src','../app.uc.cn/appstore/AppCenter/frame@uc_param_str=nieidnutssvebipfcp&api_ver=2.0&id=445&bg=#ffffff');
					ucElement.append(ucFrame);
					//将元素添加到页面
					$('body').append(ucElement);
					//回调方法
					window.addEventListener("message",function(event){
						var dt = event.data.type;
						var dm = event.data.message;
						//判断出现的情况
						if(dm!='not android uc' && dm!='not exist' && dm!='browser version error' && dm!='already exist' && dm!=undefined){
							$('#ucTip').show();
						}
						//判断隐藏的情况
						if (dm == 'success' || dm=='cancle' || dm=='close'){
							$('#ucTip').hide();
							//如果用户主动取消，则记录到cookie，30天内不再提醒
							if(dm=='cancle'){
								var expires = new Date();
								expires.setTime(expires.getTime() + 30*24*60*60*1000);
								document.cookie=cookieName+'=1;expires='+expires.toGMTString()+';path=/;domain=.jd.com';
								document.cookie=cookieName+'=1;expires='+expires.toGMTString()+';path=/;domain=.360buy.com';
							}
						}
					},false);
				}
			});
				function clickResponse(obj){
				$('[res]').removeClass('on');
				$(obj).addClass('on');
				setTimeout(function(){
					$(obj).removeClass('on');
				},700);
			}
			$("#newkeyword").focus(function(){
				setTimeout(function(){
					 window.scrollTo(0,$("#newkeyword").offset().top-60);
				 },10);		
			});
			$(document).ready(function(){
				$("#categoryMenu li").addClass("route");
			})
			$(document).ready(function(){
				var script = document.createElement("script");
				script.src = "js/2013/installapp.js@v=20140319100001";
				script.type="text/javascript";
				document.getElementsByTagName("head")[0].appendChild(script);
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
						<a href="/ShopWap/login/registe.jsp">注册</a> 
					<%} %>
					<span  class="new-fr"><a href="showvote.html@sid=e0d0f025d6d3e8e8d7be5428c43ef911">反馈</a><span class="lg-bar">|</span><a href="#top">回到顶部</a></span>
				</div>
				<div class="version"><a href="index.html@v=w&sid=e0d0f025d6d3e8e8d7be5428c43ef911">标准版</a><a href="javascript:void(0)" class="on">触屏版</a><a href="index/pcsite.action" id="toPcHome">电脑版</a></div>
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
			updateToolBar('index');
		}

		$("#html5_cart").click(function(){
		//	syncCart('e0d0f025d6d3e8e8d7be5428c43ef911',true);
			location.href='cart/cart.action';
		});

		function reSearch(){
		var depCity = window.sessionStorage.getItem("airline_depCityName");
			if(testSessionStorage() && isNotBlank(depCity) && !/^\s*$/.test(depCity) && depCity!=""){
				var airStr = '<form action="airline/list.action" method="post" id="reseach">'
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
				window.location.href='airline/index.action@sid=e0d0f025d6d3e8e8d7be5428c43ef911';
			}
		}
		 //banner 关闭点击
			$('.div_banner_close').click(function(){
				$('#div_banner_header').unbind('click');
				jQuery.post('index/addClientCookieVal.json',function(d){
					  $('#div_banner_header').slideUp(500);
				});
			});
			//banner 下载点击
			$('.div_banner_download').click(function(){
				 var downloadUrl = $(this).attr('url');
				 jQuery.post('index/addClientCookieVal.json',function(d){
					   window.location.href=downloadUrl;
				});
			});
			
		</script>
	</body>
</html>
