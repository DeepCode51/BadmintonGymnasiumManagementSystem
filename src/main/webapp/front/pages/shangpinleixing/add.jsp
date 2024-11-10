<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="true" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<title>注册</title>
		<!-- bootstrap样式，地图插件使用 -->
		<link rel="stylesheet" href="../../css/bootstrap.min.css" />
		<link rel="stylesheet" href="../../layui/css/layui.css">
		<!-- 样式 -->
		<link rel="stylesheet" href="../../css/style.css" />
		<!-- 主题（主要颜色设置） -->
		<link rel="stylesheet" href="../../css/theme.css" />
		<!-- 通用的css -->
		<link rel="stylesheet" href="../../css/common.css" />
	</head>
	<style>
		.layui-form.add .layui-form-item .layui-form-select .layui-input {
						padding: 0 30px 0 10px;
						margin: 0;
						color: #333;
						font-size: 14px;
						border-color: #eee;
						line-height: 40px;
						border-radius: 30px;
						outline: none;
						background: #fff;
						width: 400px;
						border-width: 1px;
						border-style: solid;
						height: 40px;
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
		
			<div class="data-add-container" :style='{"width":"100%","padding":"40px 7% 40px","margin":"0px auto","position":"relative","background":"none"}'>
				<form class="layui-form layui-form-pane add" lay-filter="myForm">
					<div :style='{"padding":"10px","margin":"0 0 10px 0","borderColor":"#efe4d4","alignItems":"center","borderWidth":"0 0 0px","background":"none","display":"flex","borderStyle":"solid"}' class="layui-form-item">
						<div :style='{"width":"150px","padding":"0 15px","lineHeight":"40px","fontSize":"15px","color":"#333","textAlign":"right"}' class="label">商品类型：</div>
						<input :style='{"padding":"0 10px","margin":"0","borderColor":"#eee","color":"#333","outline":"none","borderRadius":"30px","borderWidth":"1px","background":"#fff","width":"400px","fontSize":"14px","lineHeight":"40px","borderStyle":"solid","height":"40px"}' v-model="detail.shangpinleixing" type="text" :readonly="ro.shangpinleixing" name="shangpinleixing" id="shangpinleixing" autocomplete="off" class="layui-input">
					</div>


					<div :style='{"alignItems":"center","margin":"0 0 0 140px","display":"flex"}' class="layui-form-item">
						<button :style='{"cursor":"pointer","padding":"0px 15px","margin":"0 10px","borderColor":"#cbbd9a","color":"#937937","minWidth":"140px","outline":"none","borderRadius":"60px","background":"linear-gradient(30deg, rgba(255,255,255,1) 0%, rgba(207,193,176,1) 20%, rgba(246,236,223,1) 50%, rgba(207,193,176,1) 80%, rgba(255,255,255,1) 100%)","borderWidth":"1px 0","width":"auto","fontSize":"14px","lineHeight":"44px","borderStyle":"solid","height":"44px"}'  class="layui-btn btn-submit" lay-submit lay-filter="*">提交</button>
						<button :style='{"cursor":"pointer","border":"0","padding":"0px 15px","margin":"0 10px","borderColor":"#ddd","color":"#888","minWidth":"140px","outline":"none","borderRadius":"30px","background":"linear-gradient(30deg, rgba(255,255,255,1) 0%, rgba(200,200,200,1) 20%, rgba(240,240,240,1) 50%, rgba(200,200,200,1) 80%, rgba(255,255,255,1) 100%)","borderWidth":"1px 0","width":"auto","fontSize":"14px","lineHeight":"44px","borderStyle":"solid","height":"44px"}' type="reset" class="layui-btn layui-btn-primary">重置</button>
					</div>
				</form>
			</div>
		</div>

		<script src="../../layui/layui.js"></script>
		<script src="../../js/vue.js"></script>
		<!-- 组件配置信息 -->
		<script src="../../js/config.js"></script>
		<!-- 扩展插件配置信息 -->
		<script src="../../modules/config.js"></script>
		<!-- 工具方法 -->
		<script src="../../js/utils.js"></script>
		<!-- 校验格式工具类 -->
		<script src="../../js/validate.js"></script>
		<!-- 地图 -->
		<script type="text/javascript" src="../../js/jquery.js"></script>
		<script type="text/javascript" src="http://webapi.amap.com/maps?v=1.3&key=ca04cee7ac952691aa67a131e6f0cee0"></script>
		<script type="text/javascript" src="../../js/bootstrap.min.js"></script>
		<script type="text/javascript" src="../../js/bootstrap.AMapPositionPicker.js"></script>
		<script>
			var jquery = $;
			
			var vue = new Vue({
				el: '#app',
				data: {
					// 轮播图
					swiperList: [{
						img: '../../img/banner.jpg'
					}],
					baseurl: '',
					dataList: [],
					ro:{
                                        shangpinleixing : false,
					},
                    detail: {
                        shangpinleixing: '',
                    },
					centerMenu: centerMenu
				},
				updated: function() {
					layui.form.render('select', 'myForm');
				},
                computed: {



                },
				methods: {
					jump(url) {
						jump(url)
					}
				}
			})


			layui.use(['layer', 'element', 'carousel', 'http', 'jquery', 'form', 'upload', 'laydate','tinymce'], function() {
				var layer = layui.layer;
				var element = layui.element;
				var carousel = layui.carousel;
				var http = layui.http;
				var jquery = layui.jquery;
				var form = layui.form;
				var upload = layui.upload;
				var laydate = layui.laydate;
				var tinymce = layui.tinymce;
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
				
                // session独取
				let table = localStorage.getItem("userTable");
				http.request(`${table}/session`, 'get', {}, function(data) {
					// 表单赋值
					//form.val("myForm", data.data);
					data = data.data
					for(var key in data){
					}
				});

                // 跨表计算
                if(http.getParam('corss')){
					var obj = JSON.parse(localStorage.getItem('crossObj'));
					//form.val("myForm", obj);
					for(var o in obj){
                        if(o=='shangpinleixing'){
                                vue.detail[o] = obj[o];
                                vue.ro.shangpinleixing = true;
                                continue;
                        }
					}
				}
				

				// 提交
				form.on('submit(*)', function(data) {
					data = data.field;
					
                    // 数据校验
                    if(!data.shangpinleixing){
                        layer.msg('商品类型不能为空', {
							time: 2000,
							icon: 5
						});
                        return false
                    }

					// 跨表计算判断
					
                    // 比较大小

                //更新跨表属性
               var crossuserid;
               var crossrefid;
               var crossoptnum;
                if(http.getParam('corss')){
                        var statusColumnName = localStorage.getItem('statusColumnName');
                        var statusColumnValue = localStorage.getItem('statusColumnValue');
                        if(statusColumnName!='') {
                                var obj = JSON.parse(localStorage.getItem('crossObj'));
				if(!statusColumnName.startsWith("[")) {
					for (var o in obj){
						if(o==statusColumnName){
							obj[o] = statusColumnValue;
						}
					}
					var table = localStorage.getItem('crossTable');
					http.requestJson(`${table}/update`,'post',obj,(res)=>{});
				} else {
                                       crossuserid=Number(localStorage.getItem('userid'));
                                       crossrefid=obj['id'];
                                       crossoptnum=localStorage.getItem('statusColumnName');
                                       crossoptnum=crossoptnum.replace(/\[/,"").replace(/\]/,"");
				}
                        }
                }
                        if(crossrefid && crossuserid) {
                                data.crossuserid=crossuserid;
                                data.crossrefid=crossrefid;
                                http.request('shangpinleixing/list', 'get', {
                                        page: 1,
                                        limit: 10,
                                        crossuserid:crossuserid,
                                        crossrefid:crossrefid,
                                }, function(res) {
                                        if(res.data.total>=crossoptnum) {
                                                layer.msg(localStorage.getItem('tips'), {
                                                        time: 2000,
                                                        icon: 6
                                                })
                                             return false;
                                        } else {
                                            // 跨表计算



                                            // 提交数据
                                            http.requestJson('shangpinleixing' + '/add', 'post', data, function(res) {
                                                    layer.msg('提交成功', {
                                                            time: 2000,
                                                            icon: 6
                                                    }, function() {
                                                            back();
                                                    });
                                             });
                                        }
                                });
                        } else {
                                // 跨表计算

                                // 提交数据
                                http.requestJson('shangpinleixing' + '/add', 'post', data, function(res) {
                                        layer.msg('提交成功', {
                                                time: 2000,
                                                icon: 6
                                        }, function() {
                                                back();
                                        });
                                 });
                        }
			return false
			});
		});
		</script>
	</body>
</html>
