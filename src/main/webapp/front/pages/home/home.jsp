<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="true" %>

<!-- 首页 -->
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<title>首页</title>
		<link rel="stylesheet" href="../../layui/css/layui.css" />
		<link rel="stylesheet" href="../../css/swiper.min.css" />
		<!-- 样式 -->
		<link rel="stylesheet" href="../../css/style.css" />
		<!-- 主题（主要颜色设置） -->
		<link rel="stylesheet" href="../../css/theme.css" />
		<!-- 通用的css -->
		<link rel="stylesheet" href="../../css/common.css" />
	</head>
	<style>
		/* recommends */
		.recommends .list-3 .swiper-button-prev {
						left: 10px;
						right: auto;
					}
		
		.recommends .list-3 .swiper-button-prev::after {
						color: #d7272a;
					}
		
		.recommends .list-3 .swiper-button-next {
						left: auto;
						right: 10px;
					}
		
		.recommends .list-3 .swiper-button-next::after {
						color: #d7272a;
					}
		
		.recommends .list-5 .swiper-slide.swiper-slide-prev {
			position: relative;
			z-index: 3;
		}
		.recommends .list-5 .swiper-slide.swiper-slide-next {
			position: relative;
			z-index: 3;
		}
		.recommends .list-5 .swiper-slide.swiper-slide-active {
			position: relative;
			z-index: 5;
		}
		
		.recommends .list-5 .swiper-button-prev {
						left: 10px;
						right: auto;
					}
		
		.recommends .list-5 .swiper-button-prev::after {
						color: rgb(64, 158, 255);
					}
		
		.recommends .list-5 .swiper-button-next {
						left: auto;
						right: 10px;
					}
		
		.recommends .list-5 .swiper-button-next::after {
						color: rgb(64, 158, 255);
					}
		
		.recommends .animation-box {
			transform: rotate(0deg) scale(1) skew(0deg, 0deg) translate3d(0px, 0px, 0px);
		}
		
		.recommends .animation-box:hover {
						transform: translate3d(0px, -10px, 0px);
						-webkit-perspective: 1000px;
						perspective: 1000px;
						transition: 0.3s;
					}
		
		.recommends img {
			transform: rotate(0deg) scale(1) skew(0deg, 0deg) translate3d(0px, 0px, 0px);
		}
		
		.recommends img:hover {
						-webkit-perspective: 1000px;
						perspective: 1000px;
						transition: 0.3s;
					}
		/* recommends */
		
		/* news */
		.news .list-3 .swiper-button-prev {
						left: 10px;
						right: auto;
					}
		
		.news .list-3 .swiper-button-prev::after {
						color: rgb(64, 158, 255);
					}
		
		.news .list-3 .swiper-button-next {
						left: auto;
						right: 10px;
					}
		
		.news .list-3 .swiper-button-next::after {
						color: rgb(64, 158, 255);
					}
		
		.news .list-6 .swiper-button-prev {
						border-radius: 4px;
						padding: 30px 20px;
						left: 10px;
						background: linear-gradient(240deg, rgba(255,255,255,1) 0%, rgba(238,238,238,1) 100%);
						right: auto;
					}
		
		.news .list-6 .swiper-button-prev::after {
						color: #fc8800;
					}
		
		.news .list-6 .swiper-button-next {
						border-radius: 4px;
						padding: 30px 20px;
						left: auto;
						background: linear-gradient(270deg, rgba(255,255,255,1) 0%, rgba(238,238,238,1) 100%);
						right: 10px;
					}
		
		.news .list-6 .swiper-button-next::after {
						color: #fc8800;
					}
		
		.news .animation-box {
			transform: rotate(0deg) scale(1) skew(0deg, 0deg) translate3d(0px, 0px, 0px);
		}
		
		.news .animation-box:hover {
						transform: translate3d(10px,0px, 0px);
						-webkit-perspective: 1000px;
						perspective: 1000px;
						transition: 0.3s;
					}
		
		.news img {
			transform: rotate(0deg) scale(1) skew(0deg, 0deg) translate3d(0px, 0px, 0px);
		}
		
		.news img:hover {
						-webkit-perspective: 1000px;
						perspective: 1000px;
						transition: 0.3s;
					}
		/* news */
		
		/* lists */
		.lists .list-3 .swiper-button-prev {
						left: 10px;
						right: auto;
					}
		
		.lists .list-3 .swiper-button-prev::after {
						color: #d7272a;
					}
		
		.lists .list-3 .swiper-button-next {
						left: auto;
						right: 10px;
					}
		
		.lists .list-3 .swiper-button-next::after {
						color: #d7272a;
					}
		
		.lists .list-5 .swiper-slide.swiper-slide-prev {
			position: relative;
			z-index: 3;
		}
		.lists .list-5 .swiper-slide.swiper-slide-next {
			position: relative;
			z-index: 3;
		}
		.lists .list-5 .swiper-slide.swiper-slide-active {
			position: relative;
			z-index: 5;
		}
		
		.lists .list-5 .swiper-button-prev {
						border-radius: 100%;
						left: 10px;
						background: none;
						width: 40px;
						right: auto;
						height: 40px;
					}
		
		.lists .list-5 .swiper-button-prev::after {
						color: #249940;
					}
		
		.lists .list-5 .swiper-button-next {
						left: auto;
						right: 10px;
					}
		
		.lists .list-5 .swiper-button-next::after {
						color: #249940;
					}
		
		.lists .animation-box {
			transform: rotate(0deg) scale(1) skew(0deg, 0deg) translate3d(0px, 0px, 0px);
		}
		
		.lists .animation-box:hover {
						transform: translate3d(0px, 0px, 0px);
						-webkit-perspective: 1000px;
						perspective: 1000px;
						transition: 0.3s;
					}
		
		.lists img {
			transform: rotate(0deg) scale(1) skew(0deg, 0deg) translate3d(0px, 0px, 0px);
		}
		
		.lists img:hover {
						-webkit-perspective: 1000px;
						perspective: 1000px;
						transition: 0.3s;
					}
		/* lists */
	</style>
	<body>
		<div id="app">
			<!-- 轮播图 -->
			<div id="layui-carousel" class="layui-carousel">
				<div carousel-item>
					<div class="layui-carousel-item" v-for="(item,index) in swiperList" :key="index">
						<img :src="baseurl+item.value" />
					</div>
				</div>
			</div>
			<!-- 轮播图 -->
			

			<div :style='{"width":"100%","margin":"0px auto","flexWrap":"wrap","justifyContent":"center","display":"flex"}'>
			
				


            
					

				<!-- 新闻资讯 -->
				<div class="news" :style='{"padding":"0 7%","margin":"40px 0 0","borderColor":"#98dd90","flexWrap":"wrap","background":"none","borderWidth":"0 0 0px","flex":"1","display":"flex","width":"100%","position":"relative","borderStyle":"dotted","order":"3"}'>
					<div v-if="false && 1 == 1" class="news-idea" :style='{"width":"100%","padding":"0px","flexWrap":"wrap","background":"#d7272a","justifyContent":"space-between","display":"flex"}'>
						<div :style='{"width":"100%","background":"url(http://codegen.caihongy.cn/20230201/56ffd625da7e4aefa5ed423fa197b90f.jpg) no-repeat center center","height":"300px"}' class="box1"></div>
						<div :style='{"width":"20%","background":"#fff","display":"none","height":"80px"}' class="box2"></div>
						<div :style='{"width":"20%","background":"#fff","display":"none","height":"80px"}' class="box3"></div>
						<div :style='{"width":"20%","background":"#fff","display":"none","height":"80px"}' class="box4"></div>
						<div :style='{"width":"20%","background":"#fff","display":"none","height":"80px"}' class="box5"></div>
						<div :style='{"width":"20%","background":"#fff","display":"none","height":"80px"}' class="box6"></div>
						<div :style='{"width":"20%","background":"#fff","display":"none","height":"80px"}' class="box7"></div>
						<div :style='{"width":"20%","background":"#fff","display":"none","height":"80px"}' class="box8"></div>
						<div :style='{"width":"20%","background":"#fff","display":"none","height":"80px"}' class="box9"></div>
						<div :style='{"width":"20%","background":"#fff","display":"none","height":"80px"}' class="box10"></div>
					</div>
					
					<div class="title" :style='{"padding":"0px 20px 0 0px","margin":"0px auto 20px","borderColor":"#7e6b5a","flexDirection":"row","display":"flex","outline":"1px solid #7e6b5a","borderRadius":"0px","top":"0px","outlineOffset":"2px","background":"#f6f5f3","borderWidth":"1px 0","width":"100%","position":"relative","borderStyle":"dashed","zIndex":"99","height":"56px"}'>
						<span :style='{"fontSize":"16px","lineHeight":"56px","color":"#4e4e4e","display":"block","order":"2","textTransform":"uppercase"}'>HOME NEWS</span>
						<span :style='{"padding":"0 20px 0 100px","margin":"0 10px 0 0","color":"#4e4e4e","textAlign":"center","background":"url(http://codegen.caihongy.cn/20230207/cb0df322e9b14cb3b11556207d9fab2b.png) no-repeat 20px -1px,url(http://codegen.caihongy.cn/20230204/3d0265eade294c01aa89244a752baa43.png) no-repeat right 19px","display":"inline-block","width":"auto","fontSize":"18px","lineHeight":"56px","fontWeight":"600"}'>公告信息</span>
					</div>
					
					<div v-if="false && 1 == 2" class="news-idea" :style='{"width":"100%","padding":"0px","flexWrap":"wrap","background":"#d7272a","justifyContent":"space-between","display":"flex"}'>
						<div :style='{"width":"100%","background":"url(http://codegen.caihongy.cn/20230201/56ffd625da7e4aefa5ed423fa197b90f.jpg) no-repeat center center","height":"300px"}' class="box1"></div>
						<div :style='{"width":"20%","background":"#fff","display":"none","height":"80px"}' class="box2"></div>
						<div :style='{"width":"20%","background":"#fff","display":"none","height":"80px"}' class="box3"></div>
						<div :style='{"width":"20%","background":"#fff","display":"none","height":"80px"}' class="box4"></div>
						<div :style='{"width":"20%","background":"#fff","display":"none","height":"80px"}' class="box5"></div>
						<div :style='{"width":"20%","background":"#fff","display":"none","height":"80px"}' class="box6"></div>
						<div :style='{"width":"20%","background":"#fff","display":"none","height":"80px"}' class="box7"></div>
						<div :style='{"width":"20%","background":"#fff","display":"none","height":"80px"}' class="box8"></div>
						<div :style='{"width":"20%","background":"#fff","display":"none","height":"80px"}' class="box9"></div>
						<div :style='{"width":"20%","background":"#fff","display":"none","height":"80px"}' class="box10"></div>
					</div>
						
					<div :style='{"padding":"0px 0 0px","flexWrap":"wrap","background":"none","display":"flex","width":"100%","justifyContent":"space-between","height":"auto"}' v-if="newsList.length" class="list list-10">
						<div v-if="newsList.length>0" @click="jump('../news/detail.jsp?id='+newsList[0].id)" :style='{"cursor":"pointer","width":"48%","margin":"0 0px","position":"relative","background":"none","height":"auto"}' class="new10-list-item animation-box">
							<img :style='{"border":"0px solid #d7272a","padding":"0px","objectFit":"cover","background":"none","display":"block","width":"100%","height":"290px"}' :src="newsList[0].picture?baseurl+newsList[0].picture:''" alt="">
							<div :style='{"padding":"0 20px","margin":"20px 100px 0 0","whiteSpace":"nowrap","overflow":"hidden","color":"#333","background":"#fff","width":"calc(100% - 100px)","fontSize":"16px","lineHeight":"40px","textOverflow":"ellipsis","fontWeight":"500"}' class="new9-list-item-title">{{newsList[0].title}}</div>
							<div :style='{"padding":"0 20px","margin":"0px 100px 0 0","overflow":"hidden","color":"#555","background":"#fff","width":"calc(100% - 100px)","fontSize":"14px","lineHeight":"30px","textIndent":"2em","height":"60px"}' class="new9-list-item-descript">{{newsList[0].introduction}}</div>
							<div :style='{"padding":"0px","color":"#a6937c","textAlign":"center","bottom":"23px","display":"inline-block","right":"0","borderRadius":"100%","background":"radial-gradient(circle, rgba(255,255,255,1) 23%, rgba(233,228,218,1) 100%),#f6f5f3","width":"100px","fontSize":"14px","lineHeight":"100px","position":"absolute","height":"100px"}' class="new9-list-item-time">{{newsList[0].addtime.split(' ')[0]}}</div>
							<div :style='{"padding":"0 10px","margin":"0 10px 10px","color":"#999","background":"#fff","display":"none","fontSize":"12px","lineHeight":"24px"}' class="new9-list-item-identification">新闻动态</div>
						</div>
						<div v-if="newsList.length>1" :style='{"padding":"0 0 0 0px","margin":"0 0px","background":"url() no-repeat left top","flexDirection":"column","display":"block","width":"48%","position":"relative","justifyContent":"space-between","height":"400px"}'>
							<div v-for="(item,index) in newsList" v-if="index<4 && index>0" :key="index" @click="jump('../news/detail.jsp?id='+item.id)" :style='{"cursor":"pointer","padding":"0 120px 0 0","margin":"0 0 55px 0px","background":"#fff","width":"100%","position":"relative","height":"100px"}' class="new10-list-item animation-box">
								<div :style='{"padding":"10px 0 0","whiteSpace":"nowrap","overflow":"hidden","color":"#333","background":"none","width":"calc(100% - 20px)","fontSize":"16px","lineHeight":"1","textOverflow":"ellipsis","fontWeight":"500"}' class="new9-list-item-title">{{ item.title }}</div>
								<div :style='{"padding":"0 20px 0 0","margin":"5px auto 0","overflow":"hidden","color":"#555","background":"none","display":"block","width":"calc(100% - 0px)","fontSize":"14px","lineHeight":"30px","textIndent":"2em","height":"60px"}' class="new9-list-item-descript">{{ item.introduction }}</div>
								<div :style='{"color":"#a6937c","top":"0px","borderRadius":"100%","textAlign":"center","background":"radial-gradient(circle, rgba(255,255,255,1) 23%, rgba(233,228,218,1) 100%),#f6f5f3","width":"100px","fontSize":"14px","lineHeight":"100px","position":"absolute","right":"0","height":"100px"}' class="new9-list-item-time">{{ item.addtime.split(' ')[0] }}</div>
								<div :style='{"padding":"0 10px","fontSize":"12px","lineHeight":"24px","color":"#999","background":"#fff","display":"none"}' class="new9-list-item-identification">新闻动态</div>
							</div>
						</div>
					</div>
					
					<div :style='{"border":"0","cursor":"pointer","padding":"0 12px 0 20px","margin":"0px auto 0","borderColor":"#f0d6dc","textAlign":"center","display":"inline-block","minWidth":"120px","right":"calc(7% + 40px)","borderRadius":"8px","top":"8px","background":"none","borderWidth":"0px","width":"auto","lineHeight":"40px","position":"absolute","borderStyle":"dashed","height":"44px","zIndex":"99"}' @click="jump('../news/list.jsp')">
						<span :style='{"color":"#333","fontSize":"15px"}'>查看更多</span>
						<i v-if='true' :style='{"color":"#333","fontSize":"15px"}' class="layui-icon layui-icon-next"></i>
					</div>
					
					<div v-if="false && 1 == 3" class="recommend-idea" :style='{"width":"100%","padding":"0px","flexWrap":"wrap","background":"#d7272a","justifyContent":"space-between","display":"flex"}'>
						<div :style='{"width":"100%","background":"url(http://codegen.caihongy.cn/20230201/56ffd625da7e4aefa5ed423fa197b90f.jpg) no-repeat center center","height":"300px"}' class="box1"></div>
						<div :style='{"width":"20%","background":"#fff","display":"none","height":"80px"}' class="box2"></div>
						<div :style='{"width":"20%","background":"#fff","display":"none","height":"80px"}' class="box3"></div>
						<div :style='{"width":"20%","background":"#fff","display":"none","height":"80px"}' class="box4"></div>
						<div :style='{"width":"20%","background":"#fff","display":"none","height":"80px"}' class="box5"></div>
						<div :style='{"width":"20%","background":"#fff","display":"none","height":"80px"}' class="box6"></div>
						<div :style='{"width":"20%","background":"#fff","display":"none","height":"80px"}' class="box7"></div>
						<div :style='{"width":"20%","background":"#fff","display":"none","height":"80px"}' class="box8"></div>
						<div :style='{"width":"20%","background":"#fff","display":"none","height":"80px"}' class="box9"></div>
						<div :style='{"width":"20%","background":"#fff","display":"none","height":"80px"}' class="box10"></div>
					</div>
				</div>
			<!-- 新闻资讯 -->

			
				<!-- 关于我们 -->
				<div :style='{"padding":"40px 20px","boxShadow":"0 0px 0px rgba(255, 255, 255, .3)","margin":"40px 7% 0 7%","borderColor":"#98dd90","display":"block","justifyContent":"space-between","flexWrap":"wrap","background":"#f6f5f3","borderWidth":"0 0 0px","width":"86%","position":"relative","borderStyle":"dotted","height":"auto","order":"1"}'>
					<div :style='{"padding":"0 40px","margin":"0","color":"#333","textAlign":"left","top":"100px","left":"50%","background":"none","width":"auto","fontSize":"24px","lineHeight":"40px","position":"absolute","fontWeight":"500","order":"1","height":"auto"}'>{{aboutUsDetail.title}}</div>
					<div :style='{"padding":"0 40px 0","margin":"0px 0 0px","color":"#555","textAlign":"left","display":"inline-block","top":"120px","left":"50%","background":"none","width":"auto","fontSize":"18px","lineHeight":"60px","position":"absolute","zIndex":"9","order":"2","height":"66px"}'>{{aboutUsDetail.subtitle}}</div>
					<div :style='{"padding":"0","margin":"0","flexWrap":"wrap","background":"0","display":"block","width":"50%","position":"relative","float":"left","height":"450px","order":"2"}'>
						<img :style='{"padding":"0px","margin":"0 0 0 0","borderColor":"#249940","objectFit":"cover","borderRadius":"0px","borderWidth":"0px","background":"#fff","display":"block","width":"100%","borderStyle":"outset","height":"100%"}' :src="baseurl+aboutUsDetail.picture1">
						<img :style='{"padding":"8px","margin":"0 0px","objectFit":"cover","top":"180px","left":"0","background":"#fff","display":"none","width":"60%","position":"absolute","height":"240px"}' :src="baseurl+aboutUsDetail.picture2">
						<img :style='{"margin":"0 10px","objectFit":"cover","flex":1,"display":"none","height":"120px"}' :src="baseurl+aboutUsDetail.picture3">
					</div>
					<div :style='{"padding":"100px 20px 0 40px","margin":"40px 0 0 0","borderColor":"#C9A984","color":"#333","textIndent":"2em","float":"right","overflow":"hidden","background":"url(http://codegen.caihongy.cn/20230207/bbae85c30f0d4116bd96ad1da43bd908.png) no-repeat left top,url(http://codegen.caihongy.cn/20230207/b2a2e3d0cd374cc79f6d3942ddc89032.png) no-repeat right top,url(http://codegen.caihongy.cn/20230207/f085b37fc41647baaade291478fd776a.png) no-repeat left bottom,url(http://codegen.caihongy.cn/20230207/abd32f342140451893cd2d99e0f92e53.png) no-repeat right bottom,#fff","borderWidth":"1px 1px 1px 0","width":"50%","lineHeight":"24px","fontSize":"14px","borderStyle":"outset","height":"370px","order":"3"}' v-html="aboutUsDetail.content"></div>
					<div :style='{"top":"183px","background":"url(http://codegen.caihongy.cn/20230207/90986aaa115f4047afc8fce7d329dca7.png) no-repeat left top","display":"block","width":"50%","position":"absolute","right":"10px","height":"450px","zIndex":"9"}'></div>
					<div :style='{"top":"100px","left":"7%","background":"url(http://codegen.caihongy.cn/20230201/8789a999d4d54cd29e168150bd4ea9a4.png) no-repeat","display":"none","width":"38px","position":"absolute","height":"288px"}'></div>
					<div :style='{"width":"285px","background":"url(\"http://codegen.caihongy.cn/20221225/500f7c061d4f469baa2e032077dcccd4.jpeg\") 0% 0% / cover no-repeat","display":"none","height":"100px"}'></div>
					<div :style='{"width":"285px","background":"url(\"http://codegen.caihongy.cn/20221225/500f7c061d4f469baa2e032077dcccd4.jpeg\") 0% 0% / cover no-repeat","display":"none","height":"100px"}'></div>
				</div>
			

			<!-- 图文列表 -->


			
				<!-- 系统简介 -->
				<div :style='{"padding":"0 0 80px","boxShadow":"0 0px 0px rgba(255, 255, 255, .3)","margin":"40px 7% 0 0","borderColor":"#98dd90","display":"flex","flexWrap":"wrap","background":"none","borderWidth":"0 0 0px","width":"23%","position":"relative","borderStyle":"dotted","height":"auto","order":"20"}'>
					<div :style='{"padding":"0 20px 0 100px","margin":"0 0 0px","borderColor":"#7e6b5a","color":"#4e4e4e","textAlign":"left","display":"inline-block","float":"left","justifyContent":"center","outline":"1px solid #7e6b5a","borderRadius":"0px","outlineOffset":"2px","background":"url(http://codegen.caihongy.cn/20230207/cb0df322e9b14cb3b11556207d9fab2b.png) no-repeat 20px -1px,#f6f5f3","borderWidth":"1px 0","width":"100%","fontSize":"18px","lineHeight":"56px","borderStyle":"dashed","fontWeight":"600","height":"56px"}'>{{systemIntroductionDetail.title}}</div>
					<div :style='{"padding":"0 20px","margin":"0px 0 0px","color":"#4e4e4e","textAlign":"left","display":"none","right":"0","float":"left","background":"url(http://codegen.caihongy.cn/20230204/3d0265eade294c01aa89244a752baa43.png) no-repeat left 19px","flex":"1","width":"50%","lineHeight":"56px","fontSize":"16px","position":"absolute","height":"56px"}'>{{systemIntroductionDetail.subtitle}}</div>
					<div :style='{"padding":"0 0px","margin":"20px 0 0","flexWrap":"wrap","display":"block","width":"100%","justifyContent":"space-between","height":"240px"}'>
						<img :style='{"padding":"30px 20px","margin":"0px","borderColor":"#f3d7ca","objectFit":"cover","borderRadius":"0px","borderWidth":"0","background":"url(http://codegen.caihongy.cn/20230207/346e413dce8f4515a5a57219df032ccd.png) no-repeat left top / auto 100%,url(http://codegen.caihongy.cn/20230207/e75d04594fa6401b9993f023e829f7b8.png) no-repeat right bottom / auto 100%","display":"block","width":"100%","borderStyle":"solid","height":"100%"}' :src="baseurl + systemIntroductionDetail.picture1">
						<img :style='{"padding":"0px","margin":"0px 0px 0","borderColor":"#bdefb6","objectFit":"cover","borderRadius":"8px","borderWidth":"0px","background":"none","display":"none","width":"32%","borderStyle":"solid","height":"220px"}' :src="baseurl + systemIntroductionDetail.picture2">
						<img :style='{"border":"0px solid #bdefb6","padding":"0px","margin":"10px 0px 0","objectFit":"cover","borderRadius":"8px","display":"none","width":"32%","height":"220px"}' :src="baseurl + systemIntroductionDetail.picture3">
					</div>
					<div :style='{"padding":"20px 20px 20px","margin":"0px","borderColor":"#d7eef2","color":"#333","textIndent":"2em","overflow":"hidden","borderRadius":"0px","background":"none","borderWidth":"0px 0 0px","width":"100%","lineHeight":"24px","fontSize":"14px","position":"relative","borderStyle":"solid","height":"186px","zIndex":"99"}' v-html="systemIntroductionDetail.content"></div>
					<div :style='{"top":"0","left":"0","background":"url(http://codegen.caihongy.cn/20230201/8018c9bb444643529eebedb9dabba923.png)  no-repeat right top / auto 100%","display":"none","width":"60%","position":"absolute","height":"539px"}'></div>
					<div :style='{"top":"460px","background":"url(http://codegen.caihongy.cn/20230115/ea1e131b397d4fd1908ae293d5f46e0a.png)  no-repeat left top / 240px 240px","display":"none","width":"240px","position":"absolute","right":"7%","height":"240px","zIndex":"1"}'></div>
					<div :style='{"width":"285px","background":"url(\"http://codegen.caihongy.cn/20221225/500f7c061d4f469baa2e032077dcccd4.jpeg\") 0% 0% / cover no-repeat","display":"none","height":"100px"}'></div>
					<div :style='{"width":"285px","background":"url(\"http://codegen.caihongy.cn/20221225/500f7c061d4f469baa2e032077dcccd4.jpeg\") 0% 0% / cover no-repeat","display":"none","height":"100px"}'></div>
				</div>


			</div>
		</div>
		<script src="../../layui/layui.js"></script>
		<script src="../../js/swiper.min.js"></script>
		<script src="../../js/vue.js"></script>
		<!-- 组件配置信息 -->
		<script src="../../js/config.js"></script>
		<!-- 扩展插件配置信息 -->
		<script src="../../modules/config.js"></script>
		<!-- 工具方法 -->
		<script src="../../js/utils.js"></script>

		<script>
			var vue = new Vue({
				el: '#app',
				data: {







                    aboutUsDetail:{},
                    systemIntroductionDetail: {},
                    // 轮播图
					swiperList: [],
					baseurl: '',
					// 新闻资讯
					newsList: [],
					leftNewsList: [],
					rightNewsList: []
				},
				filters: {
					newsDesc: function(val) {
						if (val) {
							if (val.length > 60) {
								return val.substring(0, 60).replace(/<[^>]*>/g).replace(/undefined/g, '');
							} else {
								return val.replace(/<[^>]*>/g).replace(/undefined/g, '');
							}
						}
						return '';
					}
				},
				methods: {
					jump(url) {
						jump(url)
					},
				}
			})

			layui.use(['layer', 'form', 'element', 'carousel', 'http', 'jquery'], function() {
				var layer = layui.layer;
				var element = layui.element;
				var form = layui.form;
				var carousel = layui.carousel;
				var http = layui.http;
				var jquery = layui.jquery;
				vue.baseurl = http.baseurl;

				// 获取轮播图 数据
				http.request('config/list', 'get', {
					page: 1,
					limit: 3
				}, function(res) {
					if (res.data.list.length > 0) {
						vue.swiperList = res.data.list;
						
						vue.$nextTick(() => {
							carousel.render({
								elem: '#layui-carousel',
								width: '100%',
								height: '680px',
								anim: 'fade',
								autoplay: 'true',
								interval: '5000',
								arrow: 'none',
								indicator: 'inside'
							});
						})
					}
				});

                http.request(`aboutus/detail/1`, 'get', {
                }, function(res) {
                    if(res.code == 0) {
                      vue.aboutUsDetail = res.data;
                    }
                });
                http.request(`systemintro/detail/1`, 'get', {
                }, function(res) {
                    if(res.code == 0) {
                      vue.systemIntroductionDetail = res.data;
                    }
                });

                // 新闻资讯
				http.request('news/list', 'get', {
					page: 1,
                    sort: 'addtime',
                    order: 'desc',
					limit: 4,
				}, function(res) {
					var newsList = res.data.list;
					
					vue.newsList = newsList;
					if (newsList.length > 0 && newsList.length <= 2) {
						vue.leftNewsList = res.data.list
					} else {
						var leftNewsList = []
						for (let i = 0; i <= 2; i++) {
							leftNewsList.push(newsList[i]);
						}
						vue.leftNewsList = leftNewsList
					}
					if (newsList.length > 2 && newsList.length <= 8) {
						var rightNewsList = []
						for (let i = 3; i <= newsList.length; i++) {
							rightNewsList.push(newsList[i]);
						}
						vue.rightNewsList = rightNewsList
					}
					
					let flag = 10;
					
					if(flag == 3) {
						let options = {"observer":true,"navigation":{"nextEl":".swiper-button-next","prevEl":".swiper-button-prev"},"observeParents":true,"loop":true,"slidesPerView":5,"speed":500,"spaceBetween":20,"autoplay":{"delay":3000,"disableOnInteraction":false}}
						options.pagination = {el:'null'}
						if(options.slidesPerView) {
							options.slidesPerView = Number(options.slidesPerView);
						}
						if(options.spaceBetween) {
							options.spaceBetween = Number(options.spaceBetween);
						}
						
						vue.$nextTick(() => {
							new Swiper ('#newsnews', options)
						})
					}
					
					if(flag == 6) {
						let options = {"observer":true,"navigation":{"nextEl":".swiper-button-next","prevEl":".swiper-button-prev"},"observeParents":true,"loop":true,"slidesPerView":"3","speed":500,"spaceBetween":10,"autoplay":{"delay":3000,"disableOnInteraction":false}}
						options.pagination = {el:'null'}
						if(options.slidesPerView) {
							options.slidesPerView = Number(options.slidesPerView);
						}
						if(options.spaceBetween) {
							options.spaceBetween = Number(options.spaceBetween);
						}
						options.centeredSlides = true
						options.watchSlidesProgress = true
						
						vue.$nextTick(() => {
							new Swiper('#new-list-6news', options)
						})
					}
				});

                


				


				
			});
		</script>
	</body>
</html>
