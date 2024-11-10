<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="true" %>

<!-- 忘记密码 -->
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<title>忘记密码</title>
		<link rel="stylesheet" href="../../layui/css/layui.css">
		<!-- 样式 -->
		<link rel="stylesheet" href="../../css/style.css" />
		<!-- 主题（主要颜色设置） -->
		<link rel="stylesheet" href="../../css/theme.css" />
		<!-- 通用的css -->
		<link rel="stylesheet" href="../../css/common.css" />
	</head>
	<style type="text/css">
		html,
		body {
			height: 100%;
		}
	</style>
	<body>
        <div id="register" class="register" :style='{"minHeight":"100vh","width":"100%","alignItems":"flex-start","background":"url(http://codegen.caihongy.cn/20230208/952070d58293458e8783441f4360dad4.jpg) no-repeat right bottom / 100% auto,#fff","justifyContent":"flex-end","display":"flex"}'>
            <form id="registerForm" class="layui-form login-form" :style='{"border":"1px solid #eee","padding":"50px 40px 60px","margin":"2% auto","borderRadius":"0","flexWrap":"wrap","background":"url(http://codegen.caihongy.cn/20230207/aa001b8d6ad04dafb8b61875b4d47f88.png) no-repeat 20px 20px / auto 92%,url(http://codegen.caihongy.cn/20230207/95077f59d9664638b304689980646fe9.png) no-repeat 98% 20px / auto 92%,rgba(255,255,255,1)","display":"flex","width":"900px","justifyContent":"center","height":"auto"}' lay-filter="myForm">
                <div v-if="true" :style='{"margin":"0 0 4px","color":"#5bb450","textAlign":"center","display":"none","width":"100%","fontSize":"24px","textShadow":"0px 0px 0px rgba(64, 158, 255, .5)"}'>USER / FORGET</div>
                <div v-if="true" :style='{"boxShadow":"inset 0px 0px 0px 0px #c5f1c0","margin":"40px 0 20px","borderColor":"#bdefb6","whiteSpace":"nowrap","color":"#333","textAlign":"center","overflow":"hidden","background":"linear-gradient(270deg, rgba(255,255,255,1) 0%, rgba(207,193,176,1) 20%, rgba(166,147,124,1) 50%, rgba(207,193,176,1) 80%, rgba(255,255,255,1) 100%),#a6937c","borderWidth":"0px","width":"90%","lineHeight":"40px","fontSize":"16px","textOverflow":"ellipsis","borderStyle":"solid","textShadow":"0px 0px 0px rgba(64, 158, 255, .5)"}'>忘记密码</p></div>

				<div v-if="tabIndex==1" :style='{"width":"100%","padding":"0 8%","margin":"0 auto 10px","height":"auto"}' class="form-item">
					<input :style='{"padding":"0 10px","margin":"0","borderColor":"#eee","color":"#555","outline":"none","borderRadius":"30px","borderWidth":"1px","background":"#fff","width":"400px","fontSize":"14px","lineHeight":"40px","borderStyle":"solid","height":"40px"}' type="text" id="username" name="username" placeholder="请输入用户名" autocomplete="off" class="layui-input">
				</div>
                <div v-if="tabIndex==1" :style='{"width":"100%","padding":"0 8%","margin":"0 auto 10px","height":"auto"}' class="form-item">
                    <select name="roles" id="roles" lay-filter="roles">
                        <option value="">请选择角色</option>
                    </select>
                </div>
				<div v-if="tabIndex==2" :style='{"width":"100%","padding":"0 8%","margin":"0 auto 10px","height":"auto"}' class="form-item">
					<input :style='{"padding":"0 10px","margin":"0","borderColor":"#eee","color":"#555","outline":"none","borderRadius":"30px","borderWidth":"1px","background":"#fff","width":"400px","fontSize":"14px","lineHeight":"40px","borderStyle":"solid","height":"40px"}' type="text" v-model="userinfo.pquestion" placeholder="请输入密保问题" autocomplete="off" class="layui-input" readonly>
				</div>
				<div v-if="tabIndex==2" :style='{"width":"100%","padding":"0 8%","margin":"0 auto 10px","height":"auto"}' class="form-item">
					<input :style='{"padding":"0 10px","margin":"0","borderColor":"#eee","color":"#555","outline":"none","borderRadius":"30px","borderWidth":"1px","background":"#fff","width":"400px","fontSize":"14px","lineHeight":"40px","borderStyle":"solid","height":"40px"}' type="text" v-model="userinfo.panswer1" placeholder="请输入密保答案" autocomplete="off" class="layui-input">
				</div>
				<div v-if="tabIndex==3" :style='{"width":"100%","padding":"0 8%","margin":"0 auto 10px","height":"auto"}' class="form-item">
					<input :style='{"padding":"0 10px","margin":"0","borderColor":"#eee","color":"#555","outline":"none","borderRadius":"30px","borderWidth":"1px","background":"#fff","width":"400px","fontSize":"14px","lineHeight":"40px","borderStyle":"solid","height":"40px"}' type="password" v-model="userinfo.mima" placeholder="请输入密码" autocomplete="off" class="layui-input">
				</div>
				<div v-if="tabIndex==3" :style='{"width":"100%","padding":"0 8%","margin":"0 auto 10px","height":"auto"}' class="form-item">
					<input :style='{"padding":"0 10px","margin":"0","borderColor":"#eee","color":"#555","outline":"none","borderRadius":"30px","borderWidth":"1px","background":"#fff","width":"400px","fontSize":"14px","lineHeight":"40px","borderStyle":"solid","height":"40px"}' type="password" v-model="userinfo.mima1" placeholder="请输入确认密码" autocomplete="off" class="layui-input">
				</div>
				<button v-if="tabIndex==1" :style='{"cursor":"pointer","padding":"0 0px","margin":"20px 0 0","borderColor":"#cca162","color":"#333","textAlign":"right","display":"block","outline":"none","borderRadius":"0px","background":"none","borderWidth":"0px","width":"30%","fontSize":"16px","lineHeight":"40px","borderStyle":"solid","height":"40px"}' class="layui-btn btn-submit" lay-submit lay-filter="getSecurity">获取密保</button>
				<button v-if="tabIndex==2" :style='{"cursor":"pointer","padding":"0 0px","margin":"20px 0 0","borderColor":"#cca162","color":"#333","textAlign":"right","display":"block","outline":"none","borderRadius":"0px","background":"none","borderWidth":"0px","width":"30%","fontSize":"16px","lineHeight":"40px","borderStyle":"solid","height":"40px"}' class="layui-btn btn-submit" lay-submit lay-filter="validateSecurity">校验</button>
				<button v-if="tabIndex==3" :style='{"cursor":"pointer","padding":"0 0px","margin":"20px 0 0","borderColor":"#cca162","color":"#333","textAlign":"right","display":"block","outline":"none","borderRadius":"0px","background":"none","borderWidth":"0px","width":"30%","fontSize":"16px","lineHeight":"40px","borderStyle":"solid","height":"40px"}' class="layui-btn btn-submit" lay-submit lay-filter="updatePassword">修改密码</button>
				<a v-if="tabIndex==1" :style='{"cursor":"pointer","padding":"0","margin":"20px 0 0","color":"#fff","textAlign":"center","display":"inline-block","textDecoration":"none","float":"right","background":"linear-gradient(270deg, rgba(255,255,255,1) 0%, rgba(207,193,176,1) 20%, rgba(166,147,124,1) 50%, rgba(207,193,176,1) 80%, rgba(255,255,255,1) 100%),#a6937c","width":"30%","fontSize":"14px","lineHeight":"40px","height":"40px"}' style="color: inherit;" href="javascript:window.location.href='../login/login.jsp'">已有账号？去登录</a>
			</form>
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
		<script>
			var vue = new Vue({
				el: '#register',
				data: {
					tabIndex: 1,
					userinfo: {}
				},
				updated: function() {
					layui.form.render(null, 'myForm');
				},
				computed: {
					SecondToDate: function() {
						var time = this.count;
						time = parseInt(time) + "秒后重发";
						return time;
					}
				},
				methods: {}
			});

			layui.use(['layer', 'element', 'carousel', 'http', 'jquery', 'form', 'upload', 'laydate'], function() {
				var layer = layui.layer;
				var element = layui.element;
				var carousel = layui.carousel;
				var http = layui.http;
				var jquery = layui.jquery;
				var form = layui.form;
				var upload = layui.upload;
				var laydate = layui.laydate;
                var tableName = '';
				// 注册
				form.on('submit(getSecurity)', function(data) {
                    if(!tableName) {
                        layer.msg('请选择角色', {
                            time: 2000,
                            icon: 5
                        })
                        return false
                    }
					data = data.field;
					var url = tableName + '/security' + '?username=' + data.username
					http.request(url, 'get', {}, function(res) {
						if (res.code == 0 && res.data) {
								vue.tabIndex = 0
							layer.msg('获取成功', {
								time: 2000,
								icon: 6
							}, function() {
								vue.userinfo = res.data
								vue.userinfo.mima = ''
								vue.tabIndex = 2
							})

						} else {
							layer.msg('用户名不存在', {
								time: 2000,
								icon: 5
							})
						}
					});
					return false
				});
				form.on('submit(validateSecurity)', function(data) {
					if (vue.userinfo.panswer !== vue.userinfo.panswer1) {
						layer.msg('密保答案错误', {
							time: 2000,
							icon: 5
						})
						return false
					}
					layer.msg('答案正确', {
						time: 2000,
						icon: 6
					}, function() {
						vue.tabIndex = 3
					})
					return false
				});
				form.on('submit(updatePassword)', function(data) {
					if (vue.userinfo.mima == '') {
						layer.msg('请输入密码', {
							time: 2000,
							icon: 5
						})
						return false
					}
					if (vue.userinfo.mima !== vue.userinfo.mima1) {
						layer.msg('两次密码输入不一致', {
							time: 2000,
							icon: 5
						})
						return false
					}
					http.requestJson(tableName + '/update', 'post', vue.userinfo, function(res) {
						layer.msg('修改成功', {
							time: 2000,
							icon: 6
						}, function() {
							window.location.href = '../login/login.jsp';
						});
					});

					return false
				});

			});
		</script>
	</body>
</html>
