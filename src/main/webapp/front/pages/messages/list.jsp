<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="true" %>
<!-- 在线留言 -->
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<title>留言板</title>
		<link rel="stylesheet" href="../../layui/css/layui.css">
		<!-- 样式 -->
		<link rel="stylesheet" href="../../css/style.css" />
		<!-- 主题（主要颜色设置） -->
		<link rel="stylesheet" href="../../css/theme.css" />
		<!-- 通用的css -->
		<link rel="stylesheet" href="../../css/common.css" />
	</head>
	<style>
		.forum-container {
			background: #fff;
		}
		
		.layui-laypage .layui-laypage-count {
			padding: 0 10px;
		}
		
		.layui-laypage .layui-laypage-skip {
			padding-left: 10px;
		}
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

			<!-- 标题 -->
			<div id="breadcrumb">
				<span class="en">MESSAGES / ADVICE</span>
				<span class="cn">留言板</span>
			</div>
			<!-- 标题 -->

			<div class="forum-container">
				<form :style='{"boxShadow":"0 0px 0px 0 rgba(0, 0, 0, .1)","padding":"15px","margin":"0 0 20px","borderColor":"#fff","borderWidth":"0px","background":"none","width":"100%","borderStyle":"dotted"}' class="layui-form message-form">
					<div :style='{"width":"100%","background":"none","display":"flex","height":"auto"}' class="layui-form-item layui-form-text">
						<label :style='{"width":"80px","padding":"0 10px 0 0","lineHeight":"40px","fontSize":"14px","color":"#666","textAlign":"right"}' class="layui-form-label">留言</label>
						<textarea :style='{"border":"0","padding":"15px","boxShadow":"inset 0px 0px 0px 0px #c5f1c0","borderColor":"#ddd","color":"#333","minHeight":"150px","outline":"none","borderRadius":"12px","borderWidth":"1px","width":"1058px","lineHeight":"32px","fontSize":"14px","borderStyle":"solid"}' name="content" required lay-verify="required" placeholder="请输入内容" class="layui-textarea"></textarea>
					</div>
					<div :style='{"width":"100%","background":"none","display":"flex","height":"auto"}' class="layui-form-item layui-form-text">
						<label :style='{"width":"80px","padding":"0 10px 0 0","lineHeight":"40px","fontSize":"14px","color":"#666","textAlign":"right"}' class="layui-form-label">图片</label>
						<div v-if="cpicture">
							<img id="cpictureImg" :src="baseurl+cpicture" style="width: 100px;height: 100px;object-fit: cover;margin-right:10px">
							<input type="hidden" :value="cpicture" id="cpicture" name="cpicture" />
						</div>
						<div>
							<button type="button" class="layui-btn btn-theme" id="cpictureUpload">
								<i class="layui-icon">&#xe67c;</i>上传图片
							</button>
						</div>
					</div>
					<div :style='{"width":"100%","padding":"0 0 0 80px","margin":"30px 0 0","textAlign":"center","height":"auto"}' class="layui-form-item">
						<button :style='{"cursor":"pointer","padding":"0","margin":"0 20px 0 0","borderColor":"#cbbd9a","color":"#937937","outline":"none","borderRadius":"30px","background":"linear-gradient(30deg, rgba(255,255,255,1) 0%, rgba(207,193,176,1) 20%, rgba(246,236,223,1) 50%, rgba(207,193,176,1) 80%, rgba(255,255,255,1) 100%)","borderWidth":"1px 0","width":"120px","lineHeight":"40px","fontSize":"14px","borderStyle":"solid","height":"40px"}' class="layui-btn btn-submit" lay-submit lay-filter="*">立即提交</button>
						<button :style='{"cursor":"pointer","padding":"0","margin":"0 20px 0 0","borderColor":"#ddd","color":"#888","outline":"none","borderRadius":"30px","background":"linear-gradient(30deg, rgba(255,255,255,1) 0%, rgba(200,200,200,1) 20%, rgba(240,240,240,1) 50%, rgba(200,200,200,1) 80%, rgba(255,255,255,1) 100%)","borderWidth":"1px 0","width":"120px","lineHeight":"40px","fontSize":"14px","borderStyle":"solid","height":"40px"}' type="reset" class="layui-btn layui-btn-primary">重置</button>
					</div>
				</form>
				<div :style='{"boxShadow":"0 0px 0px 0 rgba(0, 0, 0, .1)","padding":"15px","borderColor":"#fff","borderRadius":"12px","borderWidth":"0px","background":"#f6f5f3","width":"100%","borderStyle":"groove"}' class="message-list" v-if="dataList.length">
					<div :style='{"padding":"10px","boxShadow":"inset 0px 0px 0px 0px #c5f1c0","margin":"0 0 20px","borderColor":"#eee","alignItems":"center","borderWidth":"0px","background":"none","width":"100%","borderStyle":"solid","height":"auto"}' class="message-item" v-for="(item,index) in dataList" v-bind:key="index" >
						<div :style='{"padding":"6px 0","borderColor":"#fff","alignItems":"center","borderWidth":"0 0 0px","display":"flex","width":"100%","borderStyle":"solid","height":"auto"}' class="username-container">
							<img v-if="item.avatarurl" :style='{"width":"40px","margin":"0 10px 0 0","borderRadius":"100%","objectFit":"cover","height":"40px"}' class="avator" :src="baseurl + item.avatarurl">
							<img v-else :style='{"width":"40px","margin":"0 10px 0 0","borderRadius":"100%","objectFit":"cover","height":"40px"}' class="avator" src="../../img/avator.png">
							<div :style='{"color":"#333","fontSize":"16px"}' class="username">{{item.username}}</div>
						</div>
						<div :style='{"padding":"10px","margin":"10px 0px 0px","borderColor":"#c7eec2","color":"#333","borderRadius":"8px","background":"#fff","borderWidth":"0px","lineHeight":"24px","fontSize":"14px","borderStyle":"solid","textIndent":"2em"}'>
							{{item.content}}
						</div>
						<div v-if="item.cpicture">
							<img style="width: 600px; margin-top: 8px;" :src="baseurl+item.cpicture">
						</div>
						<div :style='{"padding":"10px","margin":"10px 0px 0px","borderColor":"#c7eec2","color":"#333","borderRadius":"8px","background":"#fff","borderWidth":"0px","lineHeight":"24px","fontSize":"14px","borderStyle":"solid","textIndent":"2em"}' v-if="item.reply" class="replay">
							回复：{{item.reply}}
						</div>
						<div v-if="item.rpicture">
							<img style="width: 200px; margin-top: 8px;" :src="baseurl+item.rpicture">
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
					cpicture: '',
					baseurl:'',
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

			layui.use(['layer','upload', 'element', 'carousel', 'laypage', 'http', 'jquery', 'form'], function() {
				var layer = layui.layer;
				var upload = layui.upload;
				var element = layui.element;
				var carousel = layui.carousel;
				var laypage = layui.laypage;
				var http = layui.http;
				var form = layui.form;
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

				// 获取列表数据
				init();

				function init() {
					// 获取列表数据
					http.request('messages/list', 'get', {
						page: 1,
						limit: limit,
                        sort:"addtime",
                        order:"desc"
					}, function(res) {
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
								//首次不执行
								if (!first) {
									http.request('messages/list', 'get', {
										page: obj.curr,
										limit: obj.limit,
                                        sort:"addtime",
                                        order:"desc"
									}, function(res) {
										vue.dataList = res.data.list
									})
								}
							}
						});
					})
				}
				//上传图片
                                var cpictureUpload = upload.render({
                                        //绑定元素
                                        elem: '#cpictureUpload',
                                        //上传接口
                                        url: http.baseurl + 'file/upload',
                                         //请求头
                                        headers: {
                                                Token: localStorage.getItem('Token')
                                        },
                                         //允许上传时校验的文件类型
                                        accept: 'images',
                                        before: function() {
                                                //loading层
                                                var index = layer.load(1, {
                                                        shade: [0.1, '#fff'] //0.1透明度的白色背景
                                                });
                                        },
                                         //上传成功
                                        done: function(res) {
                                                console.log(res);
                                                layer.closeAll();
                                                if (res.code == 0) {
                                                        layer.msg("上传成功", {
                                                                time: 2000,
                                                                icon: 6
                                                        })
                                                        var url = 'upload/' + res.file;
                                                        jquery('#cpicture').val(url);
                                                        vue.cpicture = url;
                                                } else {
                                                        layer.msg(res.msg, {
                                                                time: 2000,
                                                                icon: 5
                                                        })
                                                }
                                        },
                                        //请求异常回调
                                        error: function() {
                                                layer.closeAll();
                                                layer.msg("请求接口异常", {
                                                        time: 2000,
                                                        icon: 5
                                                })
                                        }
                                });
				// 提交数据
				form.on('submit(*)', function(data) {
					data = data.field;
					data.userid = localStorage.getItem('userid')
					data.username = localStorage.getItem('adminName')
                    data.avatarurl = localStorage.getItem('headportrait')?localStorage.getItem('headportrait'):'';
                    var sensitiveWords = "";
                    var sensitiveWordsArr = [];
                    if(sensitiveWords) {
                        sensitiveWordsArr = sensitiveWords.split(",");
                    }
                    for(var i=0; i<sensitiveWordsArr.length; i++){
                        //全局替换
                        var reg = new RegExp(sensitiveWordsArr[i],"g");
                        //判断内容中是否包括敏感词
                        if (data.content.indexOf(sensitiveWordsArr[i]) > -1) {
                            // 将敏感词替换为 **
                            data.content = data.content.replace(reg,"**");
                        }
                    }
					http.requestJson('messages/add', 'post', data, function(res) {
						layer.msg('留言成功', {
							time: 2000,
							icon: 6
						}, function() {
							window.location.reload();
						});
						return false
					});
					return false
				});

			});
		</script>
	</body>
</html>
