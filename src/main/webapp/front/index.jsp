<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="true" %>
<!-- 首页 -->
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<title>基于Java的羽毛球馆管理系统的设计与实现 </title>
		<link rel="stylesheet" href="./layui/css/layui.css">
		<!-- 主题（主要颜色设置） -->
		<link rel="stylesheet" href="./css/theme.css" />
		<!-- 样式 -->
		<link rel="stylesheet" href="./css/style.css" />
		<!-- 通用的css -->
		<link rel="stylesheet" href="./css/common.css" />
	</head>
	<style type="text/css">
		html, body {
			height: 100%;
		}
		
		

		#navs.horizontal li {
						border: 0;
						background: none;
					}
		
		#navs.horizontal li a {
						cursor: pointer;
						padding: 0 10px;
						margin: 0 10px 0 0;
						color: #936837;
						font-size: 16px;
						border-color: #fff;
						line-height: 40px;
						border-radius: 50%;
						box-shadow: 0px 4px 0px 0px #ebe7e3;
						background: #f6f6f6;
						border-width: 0 0 0px;
						border-style: solid;
						min-width: 80px;
						height: 40px;
					}
		
		#navs.horizontal li a:hover{
						cursor: pointer;
						border-radius: 50%;
						padding: 0 10px;
						box-shadow: 0px 4px 0px 0px #b8aa9a;
						color: #333;
						background: #f2ebe4;
						font-size: 16px;
						border-color: #936837;
						border-width: 0 0 2px;
						line-height: 40px;
						border-style: solid;
						height: 40px;
					}
		
		#navs.horizontal li.current a {
						cursor: pointer;
						padding: 0 10px;
						margin: 0 10px 0 0;
						color: #333;
						font-size: 16px;
						border-color: #936837;
						line-height: 40px;
						border-radius: 50%;
						box-shadow: 0px 4px 0px 0px #b8aa9a;
						background: #f2ebe4;
						border-width: 0 0 2px;
						border-style: solid;
						min-width: 80px;
						height: 40px;
					}
		
		#navs.horizontal li a i {
						padding: 0;
						margin: 0 4px 0 0;
						color: inherit;
						display: inline-block;
						width: 14px;
						font-size: 16px;
					}
		
		#navs.horizontal li a span {
						padding: 0;
						font-size: 16px;
					}
		
		#navs.horizontal .layui-nav-item.layui-this::after{
			content: none;
		}
		
		#navs.horizontal .layui-nav .layui-nav-bar {
			opacity: 0 !important;
			height: 0 !important;
		}
	</style>
	<body>
	<div id="apps">
		<div id="header" :style='{"boxShadow":"0 0px 0px rgba(90, 180, 80, .2)","padding":"0px","borderColor":"#936837","alignItems":"center","display":"flex","right":"0","justifyContent":"flex-end","overflow":"hidden","top":"0","left":"0","background":"url(http://codegen.caihongy.cn/20230208/b3d599c40b114881b081c4468440bae5.png) no-repeat center bottom,#f6f5f3","borderWidth":"10px 0 0","position":"fixed","borderStyle":"solid","height":"64px","zIndex":"1002"}'>
			<img :style='{"width":"44px","objectFit":"cover","borderRadius":"100%","display":"none","height":"44px"}' class="nav-top-img" src='http://codegen.caihongy.cn/20221225/500f7c061d4f469baa2e032077dcccd4.jpeg'>
			<div v-if="projectName" :style='{"margin":"0 7% 0 7%","color":"#000","textAlign":"center","background":"none","width":"86%","lineHeight":"50px","fontSize":"18px","position":"absolute","height":"50px"}' class="nav-top-title">{{projectName}}</div>
			<div :style='{"padding":"0 60px 0 0","margin":"0 7% 0 0","alignItems":"center","textAlign":"right","display":"block","width":"50%","zIndex":"999"}'>
				<div :style='{"color":"#666","fontSize":"14px","display":"inline-block"}'></div>
				<button v-if="!Token" :style='{"cursor":"pointer","border":"0","padding":"0 10px","boxShadow":"inset 0px 0px 0px 0px #c5f1c0","margin":"0 0 0 10px","color":"#000","display":"inline-block","minWidth":"60px","borderRadius":"0px","background":"url(http://codegen.caihongy.cn/20230208/97cd55e743fc4fc6959ad4343f4e75f4.png) no-repeat right center","fontSize":"14px","lineHeight":"32px","height":"32px"}' @click="jumpLogin('./pages/login/login.jsp')">登录/注册</button>
				<button v-if="Token" :style='{"border":"0px solid #ddd","cursor":"pointer","padding":"0 10px","boxShadow":"inset 0px 0px 0px 0px #eee","margin":"0 0 0 0px","color":"#000","display":"inline-block","minWidth":"50px","borderRadius":"2px","background":"none","fontSize":"14px","lineHeight":"32px","height":"32px"}' @click="logout()">退出</button>
			</div>
		</div>
		
		
		<!-- 横向 -->
		<div id="navs" class="horizontal" :style='{"padding":"0px 0 0","margin":"64px auto 0px","background":"none","width":"100%","position":"fixed","height":"64px","zIndex":"999"}'>
			<ul class="layui-nav" lay-bar="disabled" :style='{"border":0,"padding":"6px 0 0","listStyle":"none","margin":"0","borderColor":"#249940","textAlign":"center","background":"url(http://codegen.caihongy.cn/20230208/02f74f9b2e6f44a3ace848f090a2bfaf.png) no-repeat center bottom","borderWidth":"0 0 0px","position":"relative","borderStyle":"solid","height":"100%"}'>
				<li class='layui-nav-item current'><a href="javascript:navPage('./pages/home/home.jsp')" class="menumain"><i class="layui-icon layui-icon-home"></i><span>首页</span></a></li>
				<li class='layui-nav-item' v-for="(item,index) in indexNav" v-bind:key="index"><a :href="'javascript:navPage(\''+item.url+'\')'" class="menumain" style="cursor: pointer;"><i class="layui-icon" :class="iconArr[index]"></i><span>{{item.name}}</span></a></li>
				<li v-if="Token" class='layui-nav-item'><a href="javascript:centerPage();" class="menumain"><i class="layui-icon layui-icon-username"></i>个人中心</a></li>
				<li v-if="Token" class='layui-nav-item'><a v-if="adminurl" :href="adminurl" target="_blank" class="menumain" style="cursor: pointer;"><i class="layui-icon layui-icon-link"></i><span>后台管理</span></a></li>
			</ul>
		</div>

		<iframe src="./pages/home/home.jsp" id="iframe" frameborder="0" scrolling="no" width="100%" onload="changeFrameHeight()"></iframe>
		<div id="tabbar" class="tabbar" :style='{"minHeight":"150px","padding":"20px 0","borderColor":"#cfa66a","margin":"0 auto","alignItems":"center","background":"#6E563A","flexDirection":"column","borderWidth":"0px 0 0","display":"flex","width":"100%","borderStyle":"solid","justifyContent":"center"}'>
			<img :style='{"width":"44px","objectFit":"cover","borderRadius":"100%","display":"none","height":"44px"}' src='http://codegen.caihongy.cn/20221225/500f7c061d4f469baa2e032077dcccd4.jpeg' />
			<div :style='{"margin":"10px 0 0","fontSize":"14px","lineHeight":"28px","color":"#fff"}' class="company"></div>
			<div :style='{"margin":"0px 0 0","fontSize":"14px","lineHeight":"28px","color":"#fff"}' class="record"></div>
			<div :style='{"margin":"0px 0 0","fontSize":"14px","lineHeight":"28px","color":"#fff"}' class="desc"></div>
		</div>
	</div>
		<script src="./js/jquery.js"></script>
		<!-- layui bottom---{"img":{"hover":{},"default":{"width":"44px","objectFit":"cover","borderRadius":"100%","display":"none","height":"44px"},"url":"http://codegen.caihongy.cn/20221225/500f7c061d4f469baa2e032077dcccd4.jpeg"},"box":{"hover":{},"default":{"minHeight":"150px","padding":"20px 0","borderColor":"#cfa66a","margin":"0 auto","alignItems":"center","background":"#6E563A","flexDirection":"column","borderWidth":"0px 0 0","display":"flex","width":"100%","borderStyle":"solid","justifyContent":"center"}},"company":{"hover":{},"default":{"margin":"10px 0 0","fontSize":"14px","lineHeight":"28px","color":"#fff"},"text":""},"record":{"hover":{},"default":{"margin":"0px 0 0","fontSize":"14px","lineHeight":"28px","color":"#fff"},"text":""},"desc":{"hover":{},"default":{"margin":"0px 0 0","fontSize":"14px","lineHeight":"28px","color":"#fff"},"text":""}}-->
		<script src="./layui/layui.js"></script>
		<!-- vue.js menu----{"horizontal":{"menu":{"title":{"hover":{},"default":{"padding":"0 20px","verticalAlign":"middle","color":"#fff","textAlign":"center","display":"none","width":"auto","lineHeight":"42px","fontSize":"16px","height":"42px"},"text":""},"item":{"icon":{"hover":{},"default":{"width":"14px","padding":"0","margin":"0 4px 0 0","fontSize":"16px","color":"inherit","display":"inline-block"},"flag":false},"a":{"hover":{"cursor":"pointer","padding":"0 10px","boxShadow":"0px 4px 0px 0px #b8aa9a","borderColor":"#936837","color":"#333","borderRadius":"50%","background":"#f2ebe4","borderWidth":"0 0 2px","lineHeight":"40px","fontSize":"16px","borderStyle":"solid","height":"40px"},"active":{"cursor":"pointer","padding":"0 10px","boxShadow":"0px 4px 0px 0px #b8aa9a","borderColor":"#936837","margin":"0 10px 0 0","color":"#333","minWidth":"80px","borderRadius":"50%","background":"#f2ebe4","borderWidth":"0 0 2px","lineHeight":"40px","fontSize":"16px","borderStyle":"solid","height":"40px"},"default":{"cursor":"pointer","padding":"0 10px","boxShadow":"0px 4px 0px 0px #ebe7e3","borderColor":"#fff","margin":"0 10px 0 0","color":"#936837","minWidth":"80px","borderRadius":"50%","background":"#f6f6f6","borderWidth":"0 0 0px","lineHeight":"40px","fontSize":"16px","borderStyle":"solid","height":"40px"}},"box":{"default":{"border":"0","background":"none"}},"title":{"hover":{},"default":{"padding":"0","fontSize":"16px"}}},"box":{"hover":{},"default":{"border":0,"padding":"6px 0 0","listStyle":"none","margin":"0","borderColor":"#249940","textAlign":"center","background":"url(http://codegen.caihongy.cn/20230208/02f74f9b2e6f44a3ace848f090a2bfaf.png) no-repeat center bottom","borderWidth":"0 0 0px","position":"relative","borderStyle":"solid","height":"100%"}}},"contentBox":{"hover":{},"default":{"padding":"0 0 10px","margin":"0","position":"relative","background":"#fff"}},"box":{"hover":{},"default":{"padding":"0px 0 0","margin":"64px auto 0px","background":"none","width":"100%","position":"fixed","height":"64px","zIndex":"999"}}},"vertical":{"menu":{"title":{"hover":{},"default":{"margin":"0 0 10px","color":"#333","textAlign":"center","background":"linear-gradient(320deg, rgba(91,180,80,1) 0%, rgba(198,255,191,1) 80%, rgba(91,180,80,1) 100%)","width":"100%","lineHeight":"60px","fontSize":"16px","height":"60px"},"text":"测试前台boo"},"item":{"icon":{"hover":{},"default":{"width":"16px","margin":"0 16px 0 0","fontSize":"14px","color":"inherit"},"flag":true},"a":{"hover":{"padding":"0 20px","boxShadow":"2px 4px 4px #a3bca0","borderColor":"#5bb450","color":"#333","background":"linear-gradient(90deg, rgba(209,235,207,1) 0%, rgba(242,249,241,1) 50%, rgba(161,222,154,1) 100%)","borderWidth":"6px","display":"block","fontSize":"14px","borderStyle":"outset"},"active":{"padding":"0 20px","boxShadow":"2px 4px 4px #a3bca0","borderColor":"#5bb450","color":"#333","background":"linear-gradient(90deg, rgba(209,235,207,1) 0%, rgba(242,249,241,1) 50%, rgba(161,222,154,1) 100%)","borderWidth":"6px","display":"block","fontSize":"14px","lineHeight":"40px","borderStyle":"outset","height":"50px"},"default":{"padding":"0 20px","borderColor":"#5bb450","color":"#333","background":"linear-gradient(270deg, rgba(209,235,207,1) 0%, rgba(242,249,241,1) 50%, rgba(161,222,154,1) 100%)","borderWidth":"6px","display":"block","lineHeight":"40px","fontSize":"14px","borderStyle":"inset","height":"50px"}},"box":{"default":{"width":"90%","margin":"0 auto 10px","background":"none","display":"block"}},"title":{"hover":{},"default":{"color":"inherit","padding":"0","fontSize":"16px"}}},"box":{"hover":{},"default":{"width":"100%","padding":"0","background":"none"}}},"contentBox":{"hover":{},"default":{"padding":"80px 20px 20px","margin":"0 0 0 210px","position":"relative","background":"url(http://codegen.caihongy.cn/20230103/7c32383be93d4c67bdfc16328df9eb4e.png) no-repeat center top,#f6f6f6","display":"block"}},"box":{"hover":{},"default":{"padding":"64px 0 0","boxShadow":"0px 0 6px  #ccc","overflow":"hidden","top":"0","left":"0","background":"#fff","bottom":"0","width":"210px","fontSize":"0px","position":"fixed","height":"100%","zIndex":"1001"}}},"base":{"mode":"horizontal"}}-->
		<script src="./js/vue.js"></script>
		<!-- 组件配置信息 -->
		<script src="./js/config.js"></script>

		<script>
			var vue = new Vue({
				el: '#apps',
				data: {
					iconArr: ['layui-icon-gift','layui-icon-email','layui-icon-logout','layui-icon-transfer','layui-icon-slider','layui-icon-print','layui-icon-cols','layui-icon-snowflake','layui-icon-note','layui-icon-flag','layui-icon-theme','layui-icon-website','layui-icon-console','layui-icon-face-surprised','layui-icon-template-1','layui-icon-app','layui-icon-read','layui-icon-component','layui-icon-file-b','layui-icon-unlink','layui-icon-tabs','layui-icon-form','layui-icon-chat'],
					indexNav: indexNav,
					cartFlag: cartFlag,
					adminurl: adminurl,
					chatFlag: chatFlag,
					projectName: projectName,
                    Token: localStorage.getItem('Token'),
                    baseurl: '',
				},
				mounted: function() {
					this.bindClickOnLi();
				},
				created() {
					this.iconArr.sort(()=>{
					  return (0.5-Math.random())
					})
				},
				methods: {
					jumpLogin(url) {
                        window.location.href = './pages/login/login.jsp'
					},
                    logout(){
                        localStorage.removeItem('Token');
                        localStorage.removeItem('role');
                        localStorage.removeItem('sessionTable');
                        localStorage.removeItem('adminName');
                        localStorage.removeItem('userid');
                        localStorage.removeItem('vip');
                        localStorage.removeItem('userTable');
                        window.location.href = './index.jsp';
                    },
					bindClickOnLi() {
						let list = document.getElementsByTagName("li");
						for(var i = 0;i<list.length;i++){
							list[i].onclick = function(){
								$(this).addClass("current").siblings().removeClass("current");
                                localStorage.setItem("checkedLiIndex",$(this).index());
							}
						}
					},
				}
			});

			layui.use(['element','layer', 'http', 'slider'], function() {
				var element = layui.element;
				var layer = layui.layer;
                var http = layui.http;
                var slider = layui.slider;
                vue.baseurl = http.baseurl;
			});
			
			// 导航栏跳转
			function navPage(url) {
				localStorage.setItem('iframeUrl', url);
				document.getElementById('iframe').src = url;
			}
			// 跳转到个人中心也
			function centerPage() {
				var userTable = localStorage.getItem('userTable');
				if (userTable) {
					localStorage.setItem('iframeUrl', './pages/' + userTable + '/center.jsp');
					document.getElementById('iframe').src = './pages/' + userTable + '/center.jsp';
				} else {
					window.location.href = './pages/login/login.jsp'
				}
			}

			var iframeUrl = localStorage.getItem('iframeUrl');
			document.getElementById('iframe').src = iframeUrl || './pages/home/home.jsp';

            let list = document.getElementsByTagName("li");
            for(var i = 0;i<list.length;i++){
                if(i==localStorage.getItem("checkedLiIndex")) {
                    $(list[i]).addClass("current").siblings().removeClass("current");
                }
            }

			// alert(iframeUrl)

			setInterval(function(){
			  // i++;
			  // if(i<50) changeFrameHeight();
			  changeFrameHeight();
			},200)
			
			function changeFrameHeight() {
			  var iframe = document.getElementById('iframe');
			  // iframe.height = 'auto';
			    if (iframe) {
			        var iframeWin = iframe.contentWindow || iframe.contentDocument.parentWindow;
			        if (iframeWin.document.body) {
			            iframe.height = iframeWin.document.body.scrollHeight;
			        }
			    }
			};

			//  窗口变化时候iframe自适应
			// function changeFrameHeight() {
			// 	var header = document.getElementById('header').scrollHeight;
			// 	// var swiper = document.getElementById('swiper').scrollHeight;
			// 	var ifm = document.getElementById("iframe");
			// 	ifm.height = document.documentElement.clientHeight - header;
			// 	ifm.width = document.documentElement.clientWidth;
			// 	console.log(ifm.height)
			// }

			// reasize 事件 窗口大小变化后执行的方法
			window.onresize = function() {
				changeFrameHeight();
			}
		</script>
	</body>
</html>
