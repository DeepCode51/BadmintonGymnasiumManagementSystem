<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="true" %>
<!-- 新闻资讯 -->
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<title>公告信息</title>
		<link rel="stylesheet" href="../../layui/css/layui.css">
		<!-- 样式 -->
		<link rel="stylesheet" href="../../css/style.css" />
		<!-- 主题（主要颜色设置） -->
		<link rel="stylesheet" href="../../css/theme.css" />
		<!-- 通用的css -->
		<link rel="stylesheet" href="../../css/common.css" />
	</head>
	<style>
		/* lists */
		.news .list .animation-box {
			transform: rotate(0deg) scale(1) skew(0deg, 0deg) translate3d(0px, 0px, 0px);
		}
		
		.news .list .animation-box:hover {
						transform: translate3d(0px, -2px, 0px);
						-webkit-perspective: 1000px;
						perspective: 1000px;
						transition: 0.3s;
					}
		
		.news .list img {
			transform: rotate(0deg) scale(1) skew(0deg, 0deg) translate3d(0px, 0px, 0px);
		}
		
		.news .list img:hover {
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
						<img :src="item.img" />
					</div>
				</div>
			</div>
			<!-- 轮播图 -->
			
			<div id="breadcrumb">
				<span class="en">NEWS / INFORMATION</span>
				<span class="cn">公告信息</span>
			</div>
			
			<div class="news" :style='{"width":"100%","padding":"0","margin":"0px auto","position":"relative","background":"none"}'>
				<form class="layui-form filter" :style='{"padding":"40px 0 10px","margin":"0px 7% 30px","alignItems":"center","flexWrap":"wrap","background":"none","display":"flex","width":"86%","justifyContent":"center","height":"auto"}'>
					<div :style='{"alignItems":"center","margin":"0 10px 0 0","display":"flex"}' class="item-list">
						<div class="lable" :style='{"width":"auto","padding":"0 10px","lineHeight":"42px","fontSize":"14px","color":"#fff"}'>标题</div>
						<input type="text" :style='{"border":"1px solid #eee","padding":"0 10px","margin":"0","outline":"none","color":"#333","borderRadius":"30px","width":"400px","fontSize":"14px","lineHeight":"40px","height":"40px"}' name="title" id="title" placeholder="标题" autocomplete="off" class="layui-input">
					</div>
					<button :style='{"cursor":"pointer","border":"0","padding":"0px 20px","margin":"0 0px 0 0","outline":"none","color":"#fff","borderRadius":"30px","background":"#937937","width":"auto","fontSize":"14px","lineHeight":"40px","height":"40px"}' id="btn-search" type="button" class="layui-btn layui-btn-normal">
						<i :style='{"color":"#fff","margin":"0 10px 0 0","fontSize":"14px"}' class="layui-icon layui-icon-search"></i>搜索
					</button>
				</form>
				




				<div :style='{"padding":"10px 7%","flexWrap":"wrap","background":"#fff","display":"flex","width":"100%","justifyContent":"space-between","height":"auto"}' class="list list-5">
					<div @click="jump('../news/detail.jsp?id='+item.id);" v-for="(item,index) in dataList" :key="index" :style='{"cursor":"pointer","padding":"0 0 20px","margin":"0 0 20px","borderColor":"#ccc","background":"none","borderWidth":"0 0 1px","display":"flex","width":"100%","borderStyle":"dashed","justifyContent":"space-between","height":"auto"}' class="list-item-body animation-box">
						<img :style='{"width":"170px","padding":"20px","objectFit":"cover","background":"url(http://codegen.caihongy.cn/20230207/346e413dce8f4515a5a57219df032ccd.png) no-repeat left top / auto 100%,url(http://codegen.caihongy.cn/20230207/e75d04594fa6401b9993f023e829f7b8.png) no-repeat right bottom / auto 100%","display":"inline-block","height":"170px"}' :src="baseurl+item.picture">
						<div :style='{"width":"calc(100% - 200px)","padding":"10px","display":"inline-block","height":"100%"}' class="infos">
							<div class="title" :style='{"cursor":"pointer","padding":"0 10px","margin":"0 0 6px","whiteSpace":"nowrap","overflow":"hidden","color":"#333","textAlign":"center","background":"linear-gradient(270deg, rgba(255,255,255,1) 0%, rgba(246,244,241,1) 20%, rgba(234,230,225,1) 50%, rgba(246,244,241,1) 80%, rgba(255,255,255,1) 100%),#a6937c","lineHeight":"32px","fontSize":"14px","textOverflow":"ellipsis","fontWeight":"600"}'>{{item.title}}</div>
							<div class="desc" :style='{"padding":"0","overflow":"hidden","color":"#666","background":"none","lineHeight":"24px","fontSize":"14px","textIndent":"2em","height":"120px"}'>{{item.introduction}}</div>
							<div class="tag" :style='{"padding":"0 10px","fontSize":"14px","lineHeight":"32px","color":"#fff","background":"#333","display":"none"}'>新闻动态</div>
						</div>
					</div>
				</div>



				<div class="pager" id="pager"></div>
			</div>
		</div>

		<!-- layui -->
		<script src="../../layui/layui.js"></script>
		<!-- vue -->
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
					// 轮播图
					swiperList: [{
						img: '../../img/banner.jpg'
					}],
					baseurl : '',
					dataList: []
				},
				filters: {
					newsDesc: function(val) {
						if (val) {
							if (val.length > 200) {
								return val.substring(0, 200).replace(/<[^>]*>/g).replace(/undefined/g, '');
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
					}
				}
			})

			layui.use(['layer', 'element', 'carousel', 'laypage', 'http', 'jquery'], function() {
				var layer = layui.layer;
				var element = layui.element;
				var carousel = layui.carousel;
				var laypage = layui.laypage;
				var http = layui.http;
				var jquery = layui.jquery;

				var limit = 5;
				vue.baseurl = http.baseurl;

				// 获取轮播图 数据
				http.request('config/list', 'get', {
					page: 1,
					limit: 3
				}, function(res) {
					if (res.data.list.length > 0) {
						let swiperList = [];
						res.data.list.forEach(element => {
							if (element.value != null) {
							  swiperList.push({
								img: http.baseurl+element.value
							  });
							}
						});
						vue.swiperList = swiperList;
						          
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

      // 分页列表
      pageList();

      // 搜索按钮
      jquery('#btn-search').click(function(e) {
        pageList();
      });

      function pageList() {
		// 获取列表数据
		http.request('news/list', 'get', {
			page: 1,
            sort: 'addtime',
            order: 'desc',
			limit: 12,
			title: '%' + jquery('#title').val() + '%',
		}, function(res) {
			vue.dataList = res.data.list
			// 分页
			laypage.render({
				elem: 'pager',
				count: res.data.total,
				limit: 12,
				groups: 5,
				layout: ["count","prev","page","next","limit","skip"],
				prev: '上一页',
				next: '下一页',
				jump: function(obj, first) {
					//首次不执行
					if (!first) {
						http.request('news/list', 'get', {
							page: obj.curr,
							limit: obj.limit
						}, function(res) {
							vue.dataList = res.data.list
						})
					}
				}
			});
		})
	}
			});
		</script>
	</body>
</html>
