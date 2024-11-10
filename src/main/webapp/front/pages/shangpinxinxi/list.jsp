<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="true" %>

<!-- 商品信息 -->
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<title>商品信息</title>
		<link rel="stylesheet" href="../../layui/css/layui.css">
		<!-- 样式 -->
		<link rel="stylesheet" href="../../css/style.css" />
		<!-- 主题（主要颜色设置） -->
		<link rel="stylesheet" href="../../css/theme.css" />
		<!-- 通用的css -->
		<link rel="stylesheet" href="../../css/common.css" />
	</head>
	<style>
		.layui-form .layui-form-item .layui-form-select .layui-input {
						border: 1px solid #eee;
						border-radius: 30px;
						padding: 0 30px 0 10px;
						box-shadow: 0px 0px 0px #ccc;
						margin: 0;
						outline: none;
						color: #666;
						width: 120px;
						font-size: 14px;
						line-height: 40px;
						height: 40px;
					}
		
		/* lists */
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
						<img :src="item.img" />
					</div>
				</div>
			</div>
			<!-- 轮播图 -->
			
			<div id="breadcrumb">
				<span class="en">DATA SHOW</span>
				<span class="cn">商品信息展示</span>
			</div>

			<!-- 图文列表 -->
			<div class="recommend" :style='{"padding":"0","margin":"0px auto","flexWrap":"wrap","background":"none","display":"flex","width":"100%","position":"relative"}'>
				<div class="category-1" :style='{"border":"0px solid #bdefb6","padding":"40px 0 0px","boxShadow":"inset 0px 0px 0px 0px #c5f1c0","margin":"0px 0 0","borderColor":"#e6a4b4","display":"flex","justifyContent":"center","flexWrap":"wrap","background":"none","borderWidth":"0 0 0px","width":"100%","borderStyle":"solid","height":"auto"}'>
					<div class="category-search" :index="-1" :style='swiperIndex == -1 ? {"cursor":"pointer","boxShadow":"inset 0px 0px 0px 0px #40a8c4","margin":"0 10px 10px 0","borderColor":"#40a8c4","color":"#fff","textAlign":"center","minWidth":"110px","borderRadius":"30px","background":"linear-gradient(140deg, rgba(255,255,255,1) 0%, rgba(207,193,176,1) 20%, rgba(166,147,124,1) 50%, rgba(207,193,176,1) 80%, rgba(255,255,255,1) 100%),#a6937c","borderWidth":"0px 0px","width":"auto","lineHeight":"44px","fontSize":"15px","borderStyle":"solid"} : {"cursor":"pointer","padding":"0 10px","boxShadow":"inset 0px 0px 0px 0px #b6d7de","margin":"0 10px 10px 0","borderColor":"#a8c4d9","color":"#333","textAlign":"center","minWidth":"110px","borderRadius":"30px","background":"linear-gradient(30deg, rgba(255,255,255,1) 0%, rgba(207,193,176,1) 20%, rgba(166,147,124,1) 50%, rgba(207,193,176,1) 80%, rgba(255,255,255,1) 100%),#a6937c","borderWidth":"0px 0px","width":"auto","lineHeight":"44px","fontSize":"15px","borderStyle":"solid","height":"44px"}'>全部</div>
					<div class="category-search" :index="index" :style='swiperIndex == index ? {"cursor":"pointer","boxShadow":"inset 0px 0px 0px 0px #40a8c4","margin":"0 10px 10px 0","borderColor":"#40a8c4","color":"#fff","textAlign":"center","minWidth":"110px","borderRadius":"30px","background":"linear-gradient(140deg, rgba(255,255,255,1) 0%, rgba(207,193,176,1) 20%, rgba(166,147,124,1) 50%, rgba(207,193,176,1) 80%, rgba(255,255,255,1) 100%),#a6937c","borderWidth":"0px 0px","width":"auto","lineHeight":"44px","fontSize":"15px","borderStyle":"solid"} : {"cursor":"pointer","padding":"0 10px","boxShadow":"inset 0px 0px 0px 0px #b6d7de","margin":"0 10px 10px 0","borderColor":"#a8c4d9","color":"#333","textAlign":"center","minWidth":"110px","borderRadius":"30px","background":"linear-gradient(30deg, rgba(255,255,255,1) 0%, rgba(207,193,176,1) 20%, rgba(166,147,124,1) 50%, rgba(207,193,176,1) 80%, rgba(255,255,255,1) 100%),#a6937c","borderWidth":"0px 0px","width":"auto","lineHeight":"44px","fontSize":"15px","borderStyle":"solid","height":"44px"}' v-for="(item,index) in categoryList" :key="index">
						{{categoryList[index]}}
					</div>
				</div>

					
				<form class="layui-form filter" :style='{"padding":"30px 20px 30px","borderColor":"#bcdbdf","margin":"20px 7% 0","alignItems":"center","background":"url(http://codegen.caihongy.cn/20230206/544f501163914411bf89e5cb898e10ac.png) no-repeat center bottom,linear-gradient(30deg, rgba(255,255,255,1) 0%, rgba(207,193,176,1) 20%, rgba(246,236,223,1) 50%, rgba(207,193,176,1) 80%, rgba(255,255,255,1) 100%),#fff","borderWidth":"0px 0px 0px","display":"flex","width":"100%","borderStyle":"outset","justifyContent":"center","height":"auto"}'>

					<div :style='{"alignItems":"center","margin":"0 4px 0 0","display":"flex"}' class="item-list">
						<div class="lable" :style='{"width":"auto","padding":"0 10px","lineHeight":"42px"}'>商品名称</div>
						<input type="text" :style='{"border":"1px solid #eee","padding":"0 10px","boxShadow":"0px 0px 0px #ccc","margin":"0","outline":"none","color":"#666","borderRadius":"30px","width":"140px","fontSize":"14px","lineHeight":"40px","height":"40px"}' name="shangpinmingcheng" id="shangpinmingcheng" placeholder="商品名称" autocomplete="off" class="layui-input">
					</div>
					<div :style='{"alignItems":"center","margin":"0 4px 0 0","display":"flex"}' class="item-list">
						<div class="lable" :style='{"width":"auto","padding":"0 10px","lineHeight":"42px"}'>商品类型</div>
						<select name="shangpinleixing" id="shangpinleixing" lay-filter="shangpinleixing">
							<option value="">请选择</option>
							<option v-for="(item,index) in shangpinleixingOptions" v-bind:key="index" :value="item">{{item}}</option>
						</select>
					</div>
					<div :style='{"alignItems":"center","margin":"0 4px 0 0","display":"flex"}' class="item-list">
						<div class="lable" :style='{"width":"auto","padding":"0 10px","lineHeight":"42px"}'>生产地</div>
						<input type="text" :style='{"border":"1px solid #eee","padding":"0 10px","boxShadow":"0px 0px 0px #ccc","margin":"0","outline":"none","color":"#666","borderRadius":"30px","width":"140px","fontSize":"14px","lineHeight":"40px","height":"40px"}' name="shengchandi" id="shengchandi" placeholder="生产地" autocomplete="off" class="layui-input">
					</div>
					<div :style='{"alignItems":"center","margin":"0 4px 0 0","display":"flex"}' class="item-list">
						<div class="lable" :style='{"width":"auto","padding":"0 10px","lineHeight":"42px"}'>品牌</div>
						<input type="text" :style='{"border":"1px solid #eee","padding":"0 10px","boxShadow":"0px 0px 0px #ccc","margin":"0","outline":"none","color":"#666","borderRadius":"30px","width":"140px","fontSize":"14px","lineHeight":"40px","height":"40px"}' name="pinpai" id="pinpai" placeholder="品牌" autocomplete="off" class="layui-input">
					</div>

					<button :style='{"cursor":"pointer","padding":"0px 10px","margin":"0 10px 0","borderColor":"#feabab","color":"#fff","minWidth":"90px","outline":"none","borderRadius":"30px","background":"#937937","borderWidth":"0px","width":"auto","fontSize":"14px","lineHeight":"42px","borderStyle":"dashed","height":"42px"}' id="btn-search" type="button" class="layui-btn layui-btn-normal">
						<i :style='{"color":"#fff","margin":"0 10px 0 0","fontSize":"14px"}' class="layui-icon layui-icon-search"></i>搜索
					</button>
					<button :style='{"cursor":"pointer","padding":"0px 10px","margin":"0 4px 0 0","borderColor":"#fda100","color":"#fff","minWidth":"90px","outline":"none","borderRadius":"30px","background":"#C99D6B","borderWidth":"0px","width":"auto","fontSize":"14px","lineHeight":"42px","borderStyle":"solid","height":"42px"}' v-if="isAuth('shangpinxinxi','新增')" @click="jump('../shangpinxinxi/add.jsp')" type="button" class="layui-btn btn-theme">
						<i :style='{"color":"#fff","margin":"0 10px 0 0","fontSize":"14px"}' class="layui-icon">&#xe654;</i>添加
					</button>
				</form>
						
				<div :style='{"padding":"0px 0 20px","margin":"20px 7% 0px","borderColor":"#f3d7ca","background":"none","flex":"1","borderWidth":"0 0px 0 0","width":"100%","minWidth":"900px","borderStyle":"solid","order":"3"}' class="lists">
					<!-- 样式一 -->
					<div :style='{"padding":"0px","margin":"30px 0 0","overflow":"hidden","flexWrap":"wrap","background":"none","display":"block","width":"100%","justifyContent":"space-between","height":"auto"}' class="list list-1">
						<div :style='{"padding":"0px","boxShadow":"0px 0px 0px #e6e6e6","margin":"0 3% 20px 0","borderColor":"#ccc","display":"flex","float":"left","justifyContent":"space-between","borderRadius":"0px","flexWrap":"wrap","background":"none","borderWidth":"0 0 0px","width":"30%","position":"relative","borderStyle":"dashed","height":"auto"}' @click="jump('../shangpinxinxi/detail.jsp?id='+item.id)" v-for="(item,index) in dataList" :key="index" class="list-item animation-box">
							<img :style='{"cursor":"pointer","border":"0px solid #bdefb6","padding":"30px","boxShadow":"0px 0px 0px #ccc","margin":"0 0 10px","objectFit":"cover","borderRadius":"0px","background":"url(http://codegen.caihongy.cn/20230207/346e413dce8f4515a5a57219df032ccd.png) no-repeat left top / auto 100%,url(http://codegen.caihongy.cn/20230207/e75d04594fa6401b9993f023e829f7b8.png) no-repeat right bottom / auto 100%","display":"block","width":"100%","height":"260px"}' :src="item.shangpintupian?baseurl+item.shangpintupian.split(',')[0]:''">
							<div v-if="item.price" :style='{"padding":"4px 10px","color":"red","textAlign":"center","width":"100%","lineHeight":"24px","fontSize":"14px","order":"2"}' class="price">￥{{Number(item.price).toFixed(2)}}</div>
							<div v-if="item.vipprice&&item.vipprice>0" :style='{"padding":"4px 10px","color":"red","textAlign":"center","width":"100%","lineHeight":"24px","fontSize":"14px","order":"2"}' class="price">￥{{Number(item.vipprice).toFixed(2)}} 会员价</div>
							<div v-if="item.jf" :style='{"padding":"4px 10px","color":"red","textAlign":"center","width":"100%","lineHeight":"24px","fontSize":"14px","order":"2"}' class="price">{{Number(item.jf).toFixed(0)}}积分</div>
							<div :style='{"cursor":"pointer","padding":"4px 0px","borderColor":"#ccc","margin":"0 auto","whiteSpace":"nowrap","color":"#fff","textAlign":"center","overflow":"hidden","borderWidth":"0 0 0px","background":"linear-gradient(270deg, rgba(255,255,255,1) 0%, rgba(207,193,176,1) 20%, rgba(166,147,124,1) 50%, rgba(207,193,176,1) 80%, rgba(255,255,255,1) 100%),#a6937c","width":"86%","lineHeight":"24px","fontSize":"14px","textOverflow":"ellipsis","borderStyle":"dashed"}' class="name">商品名称:{{item.shangpinmingcheng}}</div>
							<div :style='{"cursor":"pointer","padding":"4px 0px","borderColor":"#ccc","margin":"0 auto","whiteSpace":"nowrap","color":"#fff","textAlign":"center","overflow":"hidden","borderWidth":"0 0 0px","background":"linear-gradient(270deg, rgba(255,255,255,1) 0%, rgba(207,193,176,1) 20%, rgba(166,147,124,1) 50%, rgba(207,193,176,1) 80%, rgba(255,255,255,1) 100%),#a6937c","width":"86%","lineHeight":"24px","fontSize":"14px","textOverflow":"ellipsis","borderStyle":"dashed"}' class="name">{{item.shangpinleixing}}</div>
							<div :style='{"cursor":"pointer","padding":"4px 0px","borderColor":"#ccc","margin":"0 auto","whiteSpace":"nowrap","color":"#fff","textAlign":"center","overflow":"hidden","borderWidth":"0 0 0px","background":"linear-gradient(270deg, rgba(255,255,255,1) 0%, rgba(207,193,176,1) 20%, rgba(166,147,124,1) 50%, rgba(207,193,176,1) 80%, rgba(255,255,255,1) 100%),#a6937c","width":"86%","lineHeight":"24px","fontSize":"14px","textOverflow":"ellipsis","borderStyle":"dashed"}' class="name">{{item.shangpinguige}}</div>
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
		<script type="text/javascript" src="../../js/jquery.js"></script>
		<script>
			var vue = new Vue({
				el: '#app',
				data: {
					// 轮播图
					swiperList: [{
						img: '../../img/banner.jpg'
					}],
					categoryList: [],

				        shangpinleixingOptions: [],
					baseurl: '',
					dataList: []
				},
				methods: {
					isAuth(tablename, button) {
						return isFrontAuth(tablename, button)
					},
					jump(url) {
						jump(url)
					}
				}
			})

			layui.use(['form', 'layer', 'element', 'carousel', 'laypage', 'http', 'jquery','laydate', 'slider'], function() {
				var form = layui.form;
				var layer = layui.layer;
				var element = layui.element;
				var carousel = layui.carousel;
				var laypage = layui.laypage;
				var http = layui.http;
				var jquery = layui.jquery;
				var laydate = layui.laydate;
                var slider = layui.slider;
				var limit = 12;
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
        			http.request(`option/shangpinleixing/shangpinleixing`,'get',{},(res)=>{
                			vue.shangpinleixingOptions = res.data
							vue.$nextTick(() => {form.render()})
        			});

				//类型查询
			      categoryList();
				//类型搜索
			      $(document).on("click", ".category-search", function(e){
					  vue.swiperIndex = $(this).attr('index')
				  pageList(e.target.innerText);
			      });

			      function categoryList() {
				  // 获取列表数据
				  http.request('option/shangpinleixing/shangpinleixing', 'get', {}, function(res) {
				    vue.categoryList = res.data
				  })

				}
			      var vCategory = '';


				// 分页列表
				pageList();

				// 搜索按钮
				jquery('#btn-search').click(function(e) {
					pageList();
				});

				function pageList(category) {
					var param = {
						page: 1,
						limit: limit
					}
				if(category!=null && category!='全部') {
					vCategory = category;
					if (jquery('#shangpinmingcheng').val()) {
						param['shangpinmingcheng'] = '';
					}
					if (jquery('#shangpinleixing').val()) {
						param['shangpinleixing'] = '';
					}
					if (jquery('#shengchandi').val()) {
						param['shengchandi'] = '';
					}
					if (jquery('#pinpai').val()) {
						param['pinpai'] = '';
					}
				}
				if(vCategory!='' && category!='全部') {
					param['shangpinleixing'] = category;
				}

			        if (jquery('#shangpinmingcheng').val()) {
			          param['shangpinmingcheng'] = jquery('#shangpinmingcheng').val() ? '%' + jquery('#shangpinmingcheng').val() + '%' : '';
			        }
			        if (jquery('#shangpinleixing').val()) {
			          param['shangpinleixing'] = jquery('#shangpinleixing').val() ? jquery('#shangpinleixing').val() : '';
			        }
			        if (jquery('#shengchandi').val()) {
			          param['shengchandi'] = jquery('#shengchandi').val() ? '%' + jquery('#shengchandi').val() + '%' : '';
			        }
			        if (jquery('#pinpai').val()) {
			          param['pinpai'] = jquery('#pinpai').val() ? '%' + jquery('#pinpai').val() + '%' : '';
			        }


				if (jquery('#shangpinmingcheng').val()) {
					param['shangpinmingcheng'] = jquery('#shangpinmingcheng').val() ? '%' + jquery('#shangpinmingcheng').val() + '%' : '';
				}  
				if (jquery('#shangpinleixing').val()) {
					param['shangpinleixing'] = jquery('#shangpinleixing').val() ? '%' + jquery('#shangpinleixing').val() + '%' : '';
				}  
				if (jquery('#shengchandi').val()) {
					param['shengchandi'] = jquery('#shengchandi').val() ? '%' + jquery('#shengchandi').val() + '%' : '';
				}  
				if (jquery('#pinpai').val()) {
					param['pinpai'] = jquery('#pinpai').val() ? '%' + jquery('#pinpai').val() + '%' : '';
				}  

					// 获取列表数据
					http.request('shangpinxinxi/list', 'get', param, function(res) {
						vue.dataList = res.data.list
						// 分页
						laypage.render({
							elem: 'pager',
							count: res.data.total,
							limit: limit,
							groups: 5,
							layout: ["count","prev","page","next","limit","skip"],
							prev: '上一页',
							next: '下一页',
							jump: function(obj, first) {
								param.page = obj.curr;
								//首次不执行
								if (!first) {
									http.request('shangpinxinxi/list', 'get', param, function(res) {
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
