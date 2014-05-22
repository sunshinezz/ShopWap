<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>	店铺 - 首页 - 触屏版</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0"/>
    <meta content="GongChangDian,GongChangDian专卖店,GongChangDian官网,京东商城," name="description">
	<meta content="GongChangDian,GongChangDian专卖店,GongChangDian官网,京东商城," name="keywords">
	<meta name="msapplication-tap-highlight" content="no" />
		<link rel="stylesheet" type="text/css"  href="http://mall.jd.com/misc/skin/m.base.css?t=1405131828" />
		<style type="text/css">
	.txt-red {
	color: #ce0000;
	}	

	.tmp-responsive {
	position: relative;
	min-width: 320px;
	}

	.hd {
	position: relative;
	background-color: #eef2fb;
	}

	.shop-info {
	height: 40px;
	line-height: 40px;
	text-align: right;
	color: #333;
	background-color: #fff;
	}
	.shop-info a {
	color: #333;
	}
	.shop-info .shop-detail {
	display: inline-block;
	border-radius: 2px;
	padding: 0 0.25em;
	height: 1.4em;
	line-height: 1.4em;
	color: #fff;
	background-color: #E54043;
	}
	.shop-logo .logo-pic{display: block; overflow: hidden; }
	.shop-logo img {
	width: 100%;
	height: auto;
	}
	.collect {
	display: inline-block;
	width: 40px;
	height: 40px;
	margin: 0 0.5em;
	color: #333;
	background: url(http://img13.360buyimg.com/cms/g14/M04/19/04/rBEhV1JzVZ8IAAAAAADihIllH78AAE6SwMpESIAAOKc213.png) no-repeat -26px 5px;
	text-indent: -9999px;
	vertical-align: bottom;
	overflow: hidden;
	}
	.j-shop-collected{
	background: url(http://img13.360buyimg.com/cms/g14/M04/19/04/rBEhV1JzVZ8IAAAAAADihIllH78AAE6SwMpESIAAOKc213.png) no-repeat 7px 6px;
	}

	.search {
	margin: 10px;
	height: 2.25em;
	}
	.search .search-bar {
	position: relative;
	/*margin-right: 6em;*/

	}
	.search .search-bar .ipt {
	margin: 0 -6px;
	border: 1px solid #e43b3d;
	padding: 0 5px;
	width: 100%;
	height: 2.125em;
	line-height: 2.125em;
	color: #999;
	}
	.search .search-bar .btn {
	position: absolute;
	top: 0;
	right: -7px;
	border: 0;
	padding: 0 5px;
	width: 40px;
	height: 2.25em;
	background: #e43b3d url(http://img13.360buyimg.com/cms/g14/M04/19/04/rBEhV1JzVZ8IAAAAAADihIllH78AAE6SwMpESIAAOKc213.png) no-repeat 10px -28px;
	}

	.search-bar .del{position: absolute; right: 35px; top: 0; width: 35px; height: 35px;}
	.search-bar .del i{position: absolute; left: 9px; top: 10px; width: 16px; height: 16px; background: url(http://img10.360buyimg.com/imgzone/g15/M09/18/03/rBEhWlKTAlQIAAAAAAAcRkA4KNkAAF6iwP_O_QAABxe183.png) no-repeat -40px 0;}

	.banner {
	margin: 10px 0;
	}
	.slide {
	position: relative;
	}
	.slide .slide-area {
	position: relative;
	width: 100%;
	overflow: hidden;
	}
	.slide .slide-area img {
	width: 100%;
	}
	.slide .slide-nav {
	position: absolute;
	right: 10px;
	bottom: 10px;
	width: 100%;
	height: 1.75em;
	text-align: center;
	}
	.slide .slide-nav .item {
	display: inline-block;
	margin: 0 5px;
	border-radius: 0.5em;
	width: 0.5em;
	height: 0.5em;
	background-color: rgba(0, 0, 0, 0.5);
	overflow: hidden;
	}
	.slide .slide-nav .item-content {
	display: inline-block;
	border-radius: 0.5em;
	width: 0.5em;
	height: 0.5em;
	text-indent: -9999px;
	}
	.slide .slide-nav .current {
	background-color: #ff3f00;
	}
	.products {
	height: auto;
	overflow: hidden;
	}
	/*默认title 红色#e43b3d*/
	.products .mod-hd {
	clear: both;
	position: relative;
	margin: 0 0 10px;
	padding: 0 10px;
	height: 2.25em;
	line-height: 2.25em;
	background-color: #e43b3d;
	overflow: hidden;
	}
	.products .mod-hd a {
	color: #fff;
	}
	.products .mod-hd .content {
	margin-right: 2.25em;
	}
	.products .mod-hd .more {
	position: absolute;
	top: 10px;
	right: 0;
	padding: 0 10px;
	width: 15px;
	height: 20px;
	background: url(http://img13.360buyimg.com/cms/g14/M04/19/04/rBEhV1JzVZ8IAAAAAADihIllH78AAE6SwMpESIAAOKc213.png) no-repeat -28px -43px;
	text-indent: -9999px;
	}
	/*title 蓝色#1fc0b3*/
	.products .mod-hd-1 {
	background-color: #1fc0b3;
	}
	/*title 橙色#ef7a3f*/
	.products .mod-hd-2 {
	background-color: #ef7a3f;
	}
	.product-shopkeeper {
	border-bottom-color: #f06ba9;
	}
	.products .list {
	margin: 0 10px;
	height: auto;
	overflow: hidden;
	}
	/*默认排版*/
	.products .list .item {
	position: relative;
	float: left;
	margin: 0 1% 10px;
	width: 48%;
	overflow: hidden;
	}
	.products .list .pic-area,
	.products .list img {
	width: 100%;
	}
	.products .list .info {
	position: absolute;
	bottom: 0;
	right: 0;
	padding: 0 10px;
	height: 1.4em;
	line-height: 1.4em;
	background-color: rgba(0, 0, 0, 0.5);
	}
	.products .info a {
	color: #333;
	}
	.products .list .title {
	display: none;
	}
	.products .rmb {
	color: #fff;
	}
	.products .list .label {
	display: none;
	}
	/*排版1*/
	.product-1 .list .item7 {
	width: 100%;
	}
	.load-more {
	margin: 10px 0;
	height: 2.25em;
	line-height: 2.25em;
	text-align: center;
	background-color: #eef2fb;
	}
	.load-more a {
	color: #333;
	}
	.sort {
	margin: 0.5em 0;
	border-top: 2px solid #966;
	height: 2em;
	background-color: #f7f7f7;
	}
	.sort .tab {
	height: 2em;
	overflow: hidden;
	}
	.sort .tab .item {
	float: left;
	height: 100%;
	}
	.sort .tab .item-content {
	display: block;
	padding: 0 1em;
	height: 100%;
	line-height: 2em;
	color: #333;
	background-color: #f7f7f7;
	}
	.sort .tab .current .item-content {
	color: #fff;
	background-color: #966;
	}
	@media screen and (min-width: 320px) {

	.slide-show i{width: 8px; height: 8px; -moz-border-radius: 4px; -webkit-border-radius: 4px; border-radius: 4px;}
	.products .list .info {
	position: relative;
	padding: 0;
	width: 100%;
	height: 2.8em;
	background-color: transparent;
	}
	.products .rmb {
	color: #FF3F00;
	}
	.products .list .title {
	display: block;
	height: 1.4em;
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
	font-size: 0.8em;
	}
	/*排版1*/
	.product-1 .list .item5,
	.product-1 .list .item6,
	.product-1 .list .item7 {
	width: 31.33%;
	}
	}
	@media screen and (min-width: 640px) {

	.slide-show i{width: 10px; height: 10px; -moz-border-radius: 5px; -webkit-border-radius: 5px; border-radius: 5px;}
	.collect {
	display: inline-block;
	}
	.slide .slide-nav .item {
	border-radius: 1.75em;
	width: 1.75em;
	height: 1.75em;
	background-color: rgba(0, 0, 0, 0.35);
	}
	.slide .slide-nav .item-content {
	margin: 0.25em;
	border-radius: 1.25em;
	width: 1.25em;
	height: 1.25em;
	background-color: rgba(0, 0, 0, 0.35);
	}
	.slide .slide-nav .current {
	background-color: #ff3f00;
	}
	.slide .slide-nav .current .item-content {
	background-color: rgba(255, 63, 0, 0.9);
	}
	.products .list .item {
	width: 31.33%;
	}
	/*排版1*/
	.product-1 .list .item1,
	.product-1 .list .item2,
	.product-1 .list .item3 {
	width: 31.33%;
	}
	.product-1 .list .item4,
	.product-1 .list .item5,
	.product-1 .list .item6,
	.product-1 .list .item7 {
	width: 23%;
	}
	}
	@media screen and (min-width: 768px) {
	.s-googds section h4{font-size: 1em;}
	.slide-show i{width: 12px; height: 12px; -moz-border-radius: 6px; -webkit-border-radius: 6px; border-radius: 6px;}
	.collect {
	display: inline-block;
	}
	/*排版1*/
	.product-1 .list .item1,
	.product-1 .list .item2,
	.product-1 .list .item3 {
	width: 31.33%;
	}
	.product-1 .list .item4,
	.product-1 .list .item5,
	.product-1 .list .item6,
	.product-1 .list .item7 {
	width: 23%;
	}
	}

	@charset "utf-8";
	/*@desc 各个宽布局，不支持media query*/
	/*@desc 店铺主页*/
	/*@base CED-PandaRIA-Responsive*/
	/*@time 2013-10-18*/
	.w320 {
	/*排版1*/

	}
	.w320 .products .list .info {
	position: relative;
	padding: 0;
	width: 100%;
	height: 2.8em;
	background-color: transparent;
	}
	.w320 .products .rmb {
	color: #FF3F00;
	}
	.w320 .products .list .title {
	display: block;
	height: 1.4em;
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
	font-size: 0.9em;
	}
	.w320 .product-1 .list .item5,
	.w320 .product-1 .list .item6,
	.w320 .product-1 .list .item7 {
	width: 31.33%;
	}
	.w640 {
	/*排版1*/

	}
	.w640 .collect {
	display: inline-block;
	}
	.w640 .slide .slide-nav .item {
	border-radius: 1.75em;
	width: 1.75em;
	height: 1.75em;
	background-color: rgba(0, 0, 0, 0.35);
	}
	.w640 .slide .slide-nav .item-content {
	margin: 0.25em;
	border-radius: 1.25em;
	width: 1.25em;
	height: 1.25em;
	background-color: rgba(0, 0, 0, 0.35);
	}
	.w640 .slide .slide-nav .current {
	background-color: #ff3f00;
	}
	.w640 .slide .slide-nav .current .item-content {
	background-color: rgba(255, 63, 0, 0.9);
	}
	.w640 .products .list .item {
	width: 31.33%;
	}
	.w640 .product-1 .list .item1,
	.w640 .product-1 .list .item2,
	.w640 .product-1 .list .item3 {
	width: 31.33%;
	}
	.w640 .product-1 .list .item4,
	.w640 .product-1 .list .item5,
	.w640 .product-1 .list .item6,
	.w640 .product-1 .list .item7 {
	width: 23%;
	}
	.w768 {
	/*排版1*/

	}
	.w768 .collect {
	display: inline-block;
	}
	.w768 .product-1 .list .item1,
	.w768 .product-1 .list .item2,
	.w768 .product-1 .list .item3 {
	width: 31.33%;
	}
	.w768 .product-1 .list .item4,
	.w768 .product-1 .list .item5,
	.w768 .product-1 .list .item6,
	.w768 .product-1 .list .item7 {
	width: 23%;
	}

	.products .loading{text-align: center; height: 47px; line-height: 47px; margin-top: 10px; color: #666; background-color: #f4f2f1; font-size: 1em;}
	.products .loading span{display: inline-block; width: 24px; height: 47px; vertical-align: top; background: url(http://img10.360buyimg.com/imgzone/g15/M06/0B/1D/rBEhWFJBNooIAAAAAAAHzRPaIwAAADdXAP_9mAAAAfl063.gif) no-repeat center center;}

	.slide-show{position: relative; overflow: hidden; margin-bottom: 10px;}
	.slide-show .bottom{position: absolute; left: 5px; bottom: 7px; width: 100%; text-align: center; font-size: 0;}
	.slide-show i{display: inline-block; vertical-align: middle; margin: 0 3.5px; background-color: #fff;}
	.slide-show i.current{background-color: #e4393c;}
	.slide-show ul{position: relative; left: 0; white-space: nowrap; font-size: 0; -webkit-transition: all .8s ease-out; transition: all .8s ease-out;}
	.slide-show li{display: inline-block; width: 100%;}
	.slide-show li.current{}
	.slide-show a{display: block;}
	.slide-show a img{width: 100%;}
    </style>
</head>
<body>
		<div class="layout-container">
			<div class="mask-layer hidden">
				<span></span><span></span>
			</div>
				<header>
		<div class="wrap center320">
        <div class="content">店铺</div>
        <a href="http://m.jd.com/index.html?v=t" class="home-wrap">
            <i class="home"></i>
        </a>
        <a class="menu-wrap">
            <i class="menu"></i>
        </a>
    </div>
</header>

<div class="tmp-responsive">
    <div class="hd">
        
        <div class="shop-logo">
            <a  class="logo-pic" >
                <img src="/ShopWap/images/shops/top.jpg" >
            </a>
        </div>
    </div>
    <div class="search">
        <div class="search-bar">
			<script type="text/javascript" language="javascript">
					 function doValidate()
					 {
					   
						var key = document.getElementsByName("key")[0].value;
						if(key=="")
						 {
							 return false;
						}  
						window.location.href="/ShopWap/search/search.do?key="+encodeURIComponent(encodeURIComponent(key));
						return false;
					 }
					function search()
					{ 
					  var key = document.getElementsByName("key")[0].value;
					  if(key=="")
					  {
						return;
					  }  
					  window.location.href="/ShopWap/search/search.do?key="+encodeURIComponent(encodeURIComponent(key));
					}              	
			</script>
			<span class="input-box">
				<form action="search.do" id="form1" name="form1" onsubmit="return doValidate();" method="get">
					<input name="sid" value="e0d0f025d6d3e8e8d7be5428c43ef911" type="hidden" />
					
					
					<input type="text" class="ipt j-search-input" required value="We 购 ！" id="key" name="key" >
					<a href="#" class="j-search-clear del"><i></i></a>
					
				</form>	
				<a href="javascript:search()"  onclick="search()" class="btn-search"><span><button type="submit" class="btn j-search-submit"><i class="icon-search"></i></button></span></a>
			</span>
			
            
        </div>
    </div>
	
	

    <div class="products">
        <div class="mod-hd mod-hd-2">
            <a  class="content">所有宝贝</a>
            <a href="http://gongchangdian.jd.com/m/view_search-62616-0-5-1-20-1.html" class="more">查看更多</a>
        </div>
        <div class="list clearfix body">
            <div class="item ">
                <div class="item-content">
                        <a href="http://m.jd.com/product/1008044145.html?resourceType=jshop.mobile&resourceValue=25353" class="pic-area">
                        <img src="http://misc.360buyimg.com/lib/img/e/blank.gif" srcset="http://img12.360buyimg.com/n2/g14/M00/1C/0A/rBEhV1M2a6EIAAAAAAIEjjB5LOYAALBbQLnzUsAAgSm917.jpg 320W,http://img12.360buyimg.com/n1/g14/M00/1C/0A/rBEhV1M2a6EIAAAAAAIEjjB5LOYAALBbQLnzUsAAgSm917.jpg 640W" >
                    </a>
                    <div class="info">
                        <a href="http://m.jd.com/product/1008044145.html?resourceType=jshop.mobile&resourceValue=25353" class="title">【货到付款 特价】2014夏款热卖男士修身休闲纯莱卡棉圆领项链印花短T 短袖T桖 男T73 白色 48/M</a>
                        <a href="http://m.jd.com/product/1008044145.html?resourceType=jshop.mobile&resourceValue=25353" class="price">
                            <span class="label">现价：</span>
                            <span class="rmb">￥<span class='jdNum'  jshop='price'  jdprice='1008044145' ></span></span>
                        </a>
                    </div>
                </div>
            </div>
            <div class="item ">
                <div class="item-content">
                                        <a href="http://m.jd.com/product/1031422098.html?resourceType=jshop.mobile&resourceValue=25353" class="pic-area">
                        <img src="http://misc.360buyimg.com/lib/img/e/blank.gif" srcset="http://img10.360buyimg.com/n2/g15/M08/10/15/rBEhWlMycn4IAAAAAAOKE8LGmEUAAKtqAA4mo8AA4or302.jpg 320W,http://img12.360buyimg.com/n1/g15/M08/10/15/rBEhWlMycn4IAAAAAAOKE8LGmEUAAKtqAA4mo8AA4or302.jpg 640W" >
                    </a>
                    <div class="info">
                        <a href="http://m.jd.com/product/1031422098.html?resourceType=jshop.mobile&resourceValue=25353" class="title">工厂店【GCD】货到付款夏装热卖修身休闲男士纯莱卡棉圆领印花T恤 短袖T桖男 T90 白色 M/170</a>
                        <a href="http://m.jd.com/product/1031422098.html?resourceType=jshop.mobile&resourceValue=25353" class="price">
                            <span class="label">现价：</span>
                            <span class="rmb">￥<span class='jdNum'  jshop='price'  jdprice='1031422098' ></span></span>
                        </a>
                    </div>
                </div>
            </div>
           
            <div class="item ">
                <div class="item-content">
                                        <a href="http://m.jd.com/product/1103192195.html?resourceType=jshop.mobile&resourceValue=25353" class="pic-area">
                        <img src="http://misc.360buyimg.com/lib/img/e/blank.gif" srcset="http://img11.360buyimg.com/n2/g12/M00/01/18/rBEQYFMur7kIAAAAAAOJWABb3RsAADKzQNmwvkAA4lw396.jpg 320W,http://img12.360buyimg.com/n1/g12/M00/01/18/rBEQYFMur7kIAAAAAAOJWABb3RsAADKzQNmwvkAA4lw396.jpg 640W" >
                    </a>
                    <div class="info">
                        <a href="http://m.jd.com/product/1103192195.html?resourceType=jshop.mobile&resourceValue=25353" class="title">工厂店【GCD】货到付款夏装热卖修身休闲男士纯莱卡棉圆领印花T恤 短袖T桖男 T90 黑色 M/170</a>
                        <a href="http://m.jd.com/product/1103192195.html?resourceType=jshop.mobile&resourceValue=25353" class="price">
                            <span class="label">现价：</span>
                            <span class="rmb">￥<span class='jdNum'  jshop='price'  jdprice='1103192195' ></span></span>
                        </a>
                    </div>
                </div>
            </div>
            <div class="item ">
                <div class="item-content">
                                        <a href="http://m.jd.com/product/1024797324.html?resourceType=jshop.mobile&resourceValue=25353" class="pic-area">
                        <img src="http://misc.360buyimg.com/lib/img/e/blank.gif" srcset="http://img13.360buyimg.com/n2/g14/M09/12/06/rBEhVlMJx4wIAAAAAAK2RRBOLx8AAJDCQBVSg0AArZd533.jpg 320W,http://img13.360buyimg.com/n1/g14/M09/12/06/rBEhVlMJx4wIAAAAAAK2RRBOLx8AAJDCQBVSg0AArZd533.jpg 640W" >
                    </a>
                    <div class="info">
                        <a href="http://m.jd.com/product/1024797324.html?resourceType=jshop.mobile&resourceValue=25353" class="title">【货到付款】GCD工厂店2014夏款热卖男士超舒适运动休闲裤针织裤子卫裤运动裤 男 K90 灰色 M</a>
                        <a href="http://m.jd.com/product/1024797324.html?resourceType=jshop.mobile&resourceValue=25353" class="price">
                            <span class="label">现价：</span>
                            <span class="rmb">￥<span class='jdNum'  jshop='price'  jdprice='1024797324' ></span></span>
                        </a>
                    </div>
                </div>
            </div>

        </div>
       
        
    </div>
</div>

<div class="template-menu-wrap width0">
    <div class="template-menu">
		
			
        <div class="search-bar">
            <input type="text" class="j-search-input" value="年终热卖 货到付款"><a class="j-search-submit"></a><div class="j-search-clear del"><i></i></div>
        </div>
		
        <div class="body">
            <ul>
                 <li>
                    <div>T恤<div></div></div>
					<ul>
						<li>
							<div><a href="http://gongchangdian.jd.com/m/view_search-62616-0-5-1-20-1.html">所有商品</a>
							</div>
						</li>
						<li><a title="长袖T恤261353" href="http://gongchangdian.jd.com/m/view_search-62616-261353-5-0-20-1.html">长袖T恤</a>
						</li>
						<li><a title="短袖T恤261354" href="http://gongchangdian.jd.com/m/view_search-62616-261354-5-0-20-1.html">短袖T恤</a>
						</li>
					</ul>
                </li>
                <li>
                    <div>衬衫<div></div></div>
                                        <ul>
<li><div><a href="http://gongchangdian.jd.com/m/view_search-62616-0-5-1-20-1.html">所有商品</a></div></li>
                                                                        <li><a title="长袖衬衫261356" href="http://gongchangdian.jd.com/m/view_search-62616-261356-5-0-20-1.html">长袖衬衫</a></li>
                                                                        <li><a title="短袖衬衫261357" href="http://gongchangdian.jd.com/m/view_search-62616-261357-5-0-20-1.html">短袖衬衫</a></li>
                                                                                            </ul>
                </li>
                                                                <li>
                    <div>外套<div></div></div>
                                        <ul>
<li><div><a href="http://gongchangdian.jd.com/m/view_search-62616-0-5-1-20-1.html">所有商品</a></div></li>
                                                                        <li><a title="卫衣261259" href="http://gongchangdian.jd.com/m/view_search-62616-261259-5-0-20-1.html">卫衣</a></li>
                                                                        <li><a title="大衣（长款/短款）261260" href="http://gongchangdian.jd.com/m/view_search-62616-261260-5-0-20-1.html">大衣（长款/短款）</a></li>
                                                                        <li><a title="羽绒服860693" href="http://gongchangdian.jd.com/m/view_search-62616-860693-5-0-20-1.html">羽绒服</a></li>
                                                                        <li><a title="外套883634" href="http://gongchangdian.jd.com/m/view_search-62616-883634-5-0-20-1.html">外套</a></li>
                                                                        <li><a title="夹克883635" href="http://gongchangdian.jd.com/m/view_search-62616-883635-5-0-20-1.html">夹克</a></li>
                                                                        <li><a title="棉服883636" href="http://gongchangdian.jd.com/m/view_search-62616-883636-5-0-20-1.html">棉服</a></li>
                                                                        <li><a title="风衣883637" href="http://gongchangdian.jd.com/m/view_search-62616-883637-5-0-20-1.html">风衣</a></li>
                                                                                            </ul>
                </li>
                                                                <li>
                    <div>裤子<div></div></div>
                                        <ul>
<li><div><a href="http://gongchangdian.jd.com/m/view_search-62616-0-5-1-20-1.html">所有商品</a></div></li>
                                                                        <li><a title="休闲长裤261311" href="http://gongchangdian.jd.com/m/view_search-62616-261311-5-0-20-1.html">休闲长裤</a></li>
                                                                        <li><a title="牛仔长裤261312" href="http://gongchangdian.jd.com/m/view_search-62616-261312-5-0-20-1.html">牛仔长裤</a></li>
                                                                        <li><a title="休闲短裤261313" href="http://gongchangdian.jd.com/m/view_search-62616-261313-5-0-20-1.html">休闲短裤</a></li>
                                                                        <li><a title="牛仔短裤261314" href="http://gongchangdian.jd.com/m/view_search-62616-261314-5-0-20-1.html">牛仔短裤</a></li>
                                                                                            </ul>
                </li>
                                                                <li class="no-children">
                    <div><a class="" href="http://gongchangdian.jd.com/m/view_search-62616-261261-5-0-20-1.html" >鞋</a></div>
                </li>
                                                                <li class="no-children">
                    <div><a class="" href="http://gongchangdian.jd.com/m/view_search-62616-261358-5-0-20-1.html" >配饰</a></div>
                </li>
                                                                <li class="no-children">
                    <div><a class="" href="http://gongchangdian.jd.com/m/view_search-62616-327238-5-0-20-1.html" >针织衫</a></div>
                </li>
                                                                <li class="no-children">
                    <div><a class="" href="http://gongchangdian.jd.com/m/view_search-62616-533927-5-0-20-1.html" >连衣裙</a></div>
                </li>
                                                                <li class="no-children">
                    <div><a class="" href="http://gongchangdian.jd.com/m/view_search-62616-533928-5-0-20-1.html" >半身裙</a></div>
                </li>
                                                                <li class="no-children">
                    <div><a class="" href="http://gongchangdian.jd.com/m/view_search-62616-535444-5-0-20-1.html" >女装裤子</a></div>
                </li>
                                                                <li class="no-children">
                    <div><a class="" href="http://gongchangdian.jd.com/m/view_search-62616-640921-5-0-20-1.html" >女装T恤</a></div>
                </li>
                                                                <li class="no-children">
                    <div><a class="" href="http://gongchangdian.jd.com/m/view_search-62616-644822-5-0-20-1.html" >女装外套</a></div>
                </li>
                                                                <li class="no-children">
                    <div><a class="" href="http://gongchangdian.jd.com/m/view_search-62616-729508-5-0-20-1.html" >保暖内衣</a></div>
                </li>
                                                                <li class="no-children">
                    <div><a class="" href="http://gongchangdian.jd.com/m/view_search-62616-835692-5-0-20-1.html" >女装衬衫</a></div>
                </li>
                                            </ul>
        </div>
    </div>
</div>
<input type="hidden" id="mobile_shop_search" value="http://gongchangdian.jd.com/m/view_search-62616-25898-25353-0-5-0-0-1-1-20.html?keyword=" />

        <div class="q-center">
            <ul class="main-area">
                <li><div><a data-href="http://m.jd.com?v=t"><i></i><span>京东首页</span></a></div>
                <li><div><a data-href="http://m.jd.com/cart/cart.action?v=t"><i></i><span>购物车</span></a></div></li>
                <li><div><a data-href="http://m.jd.com/ware/search.action?v=t"><i></i><span>商品搜索</span></a></div></li>
                <li><div><a class="j-m-im" data-href="#\#"><i></i><span>在线客服</span></a></div></li>
                <li><div><a data-href="http://m.jd.com/user/home.action?v=t"><i></i><span>我的京东</span></a></div></li>
                <li><div><a data-href="http://m.jd.com/user/orders.action?v=t"><i></i><span>订单速查</span></a></li>
            </ul>
            <div class="bottom-area">
				<div>
					<a>快捷中心<i class="menu"></i><i class="arrow"></i></a>
				</div>
            </div>
        </div>
    </div>
    <script type="text/javascript" src="http://mall.jd.com/misc/js/m-panda.min.js?t=1405131828"></script>
	<script type="text/javascript" src="http://mall.jd.com/jm.htm?js=/misc/js/mobile/common.js,/misc/js/mobile/slide.js,/misc/js/mobile/imgLazyLoad.js,/misc/js/mobile/jshop.lib-v1.js&t=1405131828"></script>
	
                	<script type="text/javascript">
	
		jshop.common.shopId = 25353;
        jshop.common.headerMenu();
		jshop.common.touchMove();
        jshop.common.search();
        jshop.common.page();
		jshop.common.shopAttention();
		//初始化im
    	(function(){
    		var obj = $('.j-m-im');
			var shopId = 25353;
    		jshop.common.im.show({
				"iconObj": obj,
				"shopId": shopId, 
				"onlineCall": function(seller){
					obj.removeClass("off-line");
					obj.attr("title", "点击我向商家咨询相关问题！"); 		
				},
				"offlineCall": function(seller){
					obj.addClass("off-line");
					for(var i = 0; i<obj.size(); i++){
						if(obj.eq(i).children().length == 0){
							obj.eq(i).html("留言咨询");
						}
					}
					obj.attr("title", "商家客服不在线哦，稍后再来咨询吧！");
				},
				"leaveMessageCall": function(seller){
					obj.addClass("off-line");
					for(var i = 0; i<obj.size(); i++){
						if(obj.eq(i).children().length == 0){
							obj.eq(i).html("留言咨询");
						}
					}
					obj.attr("title", "商家客服不在线，您可以点击留言！"); 
			}});
    	})();
		
	</script>
		
		<style type="text/css">
		.new-footer{margin-top:10px;background-color:#f3f2f2;font-size:14px;color:#6e6e6e;text-align:center}
		.new-footer .new-f-login{position:relative;padding:0 12px;background-color:#a8a8a8;line-height:27px;color:#fff;text-align:left;heigth:27px}
		.new-footer .new-f-login .new-back-top{position:absolute;right:12px}
		.new-footer .new-f-login .new-bar2{margin:0 5px}
		.new-footer .new-f-login a{color:#fff}
		.new-footer .new-f-section a{margin-left:20px;color:#6e6e6e}
		.new-footer .new-f-section .on{color:#c30202}
		.new-footer .new-f-section a:first-child{margin-left:0}
		.new-bl{padding:0 15px}
		.new-footer .new-f-section,.new-footer .new-f-section2{padding:10px 0}
		.new-footer .new-f-section2{padding-top:0;font-size:12px;color:#6e6e6e}
		.new-f-banner{background-color:#fff}
		.new-banner-img,.new-banner-img2{width:320px;height:61px;margin:0 auto;background:url(http://m.jd.com/images/touch2013/banner_footer.gif);background-color:#fff}
		.new-banner-img2{background:url(http://m.jd.com/images/touch2013/banner_footer.gif)}
		.new-banner-img3{width:320px;height:61px;margin:0 auto;background:url(http://m.jd.com/images/touch2013/banner_footer.gif) 0 0 no-repeat;background-color:#fff}
		.new-download-app{display:block;width:320px;height:61px;margin:0 auto;border-bottom:1px solid #dad4cf;border-top:1px solid #fcfaf9;background-color:#fff;font-size:.875em;line-height:44px;text-align:center}
		</style>
		
		
		<footer>
		<div class="new-footer">
			<div class="login-area" id="footer">
        	<div class="login">
				
			<% boolean login = false;				// 是否登录
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
				欢迎您, ${ cookie.account.value }. &nbsp;&nbsp; <span class="lg-bar">|</span>
				<a href="/shop/login/login.do?action=logout">退出</a>
			<% }
			else { %> </a>
				<a href="user/login.action@sid=e0d0f025d6d3e8e8d7be5428c43ef911">登录</a><span class="lg-bar">|</span>
				<a href="user/mobileRegister.action@sid=e0d0f025d6d3e8e8d7be5428c43ef911">注册</a> 
				<%} %>
    				<span  class="new-fr"><a href="showvote.html@sid=e0d0f025d6d3e8e8d7be5428c43ef911">反馈</a><span class="lg-bar">|</span><a href="#top">回到顶部</a></span>
            </div>
        	<div class="version"><a href="index.html@v=w&sid=e0d0f025d6d3e8e8d7be5428c43ef911">标准版</a><a href="javascript:void(0)" class="on">触屏版</a><a href="index/pcsite.action" id="toPcHome">电脑版</a></div>
            <div class="copyright"> </div>
        </div>

    <div style="display:none;">
    					<img src="ja.jsp@&utmn=1670342429&utmr=-&utmp=_252Findex_252Findex.action_253Fv_253Dt&guid=ON&jav=html5&pin=-&utmac=MO-J2011-1" />
			    </div>
		</div>
		</footer>
    </div>
	</body>
<script type="text/javascript">
	 panda.ready(function (){
	 	jshop.common.footer("http://gongchangdian.jd.com");
	});
</script>
<img src="http://jshop2013.jd.com/sys/statistic/mobileView.html" style="display:none"/>
</html>