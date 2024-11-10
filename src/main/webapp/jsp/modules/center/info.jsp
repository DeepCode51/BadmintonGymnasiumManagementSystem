<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-cn">

<head>
<%@ include file="../../static/head.jsp"%>
<link
	href="http://www.bootcss.com/p/bootstrap-datetimepicker/bootstrap-datetimepicker/css/datetimepicker.css"
	rel="stylesheet">
<script type="text/javascript" charset="utf-8">
	window.UEDITOR_HOME_URL = "${pageContext.request.contextPath}/resources/ueditor/"; //UEDITOR_HOME_URL、config、all这三个顺序不能改变
</script>
<script type="text/javascript" charset="utf-8"
	src="${pageContext.request.contextPath}/resources/ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8"
	src="${pageContext.request.contextPath}/resources/ueditor/ueditor.all.min.js"></script>
<script type="text/javascript" charset="utf-8"
	src="${pageContext.request.contextPath}/resources/ueditor/lang/zh-cn/zh-cn.js"></script>
</head>
<style>
.error {
	color: red;
}

</style>
<body>
	<div id="main-container">
		<!-- Top Navigation -->
		<%@ include file="../../static/topNav.jsp"%>
		
		<!-- Menu -->
		<div id="menu-container" class="navbar">
			<ul class="navbar-nav navbar-vertical" id="navUl">
				
			</ul>
		</div>
		<!-- /Menu -->
		
		<!-- Breadcrumb -->
		<div id="breadcrumb-container">
			<h3 class="breadcrumb-title">编辑个人信息</h3>
			<ol class="breadcrumb-list">
				<li class="breadcrumb-item-home">
					<a href="#">
						<span class="ti-home"></span>
					</a>
				</li>
				<li class="breadcrumb-item-one"><span>个人信息管理</span></li>
				<li class="breadcrumb-item-two"><span>编辑个人信息</span></li>
			</ol>
		</div>

		<!-- Main Content -->
		<div id="add-container">
			<form id="addOrUpdateForm">
				<input id="updateId" name="id" type="hidden">
				<div class="form-item">
					<label>用户名</label>
					<input id="username" name="username" class="form-control" placeholder="用户名">
				</div>
				<div class="form-btn">
					<button id="submitBtn" type="button" class="btn btn-primary btn-add">提交</button>
				</div>
			</form>
		</div>
	</div>
	
	<!-- Back to Top -->
	<a id="back-to-top" href="#" class="back-to-top">Top</a>
	<!-- /Back to Top -->
	
	<%@ include file="../../static/foot.jsp"%>
	<script
		src="${pageContext.request.contextPath}/resources/js/vue.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.ui.widget.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.fileupload.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.form.js"></script>
	<script type="text/javascript" charset="utf-8"
		src="${pageContext.request.contextPath}/resources/js/validate/jquery.validate.min.js"></script>
	<script type="text/javascript" charset="utf-8"
		src="${pageContext.request.contextPath}/resources/js/validate/messages_zh.js"></script>
	<script type="text/javascript" charset="utf-8"
		src="${pageContext.request.contextPath}/resources/js/validate/card.js"></script>
	<script type="text/javascript" charset="utf-8"
		src="${pageContext.request.contextPath}/resources/js/datetimepicker/bootstrap-datetimepicker.min.js"></script>

	<script>
		
	<%@ include file="../../utils/menu.jsp"%>
		
	<%@ include file="../../static/setMenu.js"%>
		
	<%@ include file="../../utils/baseUrl.jsp"%>
		var tableName = "";
		var pageType = "add-or-update";
		var updateId = "";
		var accountTableName = ''
		
		var ruleForm = {};

		// 表单提交
		function submit() {
			if (validform() == true) {

				$.ajax({
					type : "POST",
					url : baseUrl + accountTableName + "/update",
					contentType : "application/json",
					data : JSON.stringify({id: updateId,username: $('#username').val()}),
					beforeSend : function(xhr) {
						xhr.setRequestHeader("token", window.sessionStorage
								.getItem('token'));
					},
					success : function(res) {
						if (res.code == 0) {
							alert("修改成功");
							window.sessionStorage.setItem('username',$('#username').val())
							window.location.reload();
						} else if (res.code == 401) {
							<%@ include file="../../static/toLogin.jsp"%>
						} else {
							alert(res.msg)
						}
					},
				});
			} else {
				alert("表单未填完整或有错误");
			}
		}

		// 表单校验
		function validform() {
			return $("#addOrUpdateForm").validate({
				rules : {
					username: {
						required : true,
					},
				},
				messages : {
					username: {
						required : "用户名不能为空",
					},
				}
			}).form();
		}
		// 添加表单校验方法
		function addValidation() {
			jQuery.validator
					.addMethod(
							"isPhone",
							function(value, element) {
								var length = value.length;
								var mobile = /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1})|(17[0-9]{1}))+\d{8})$/;
								return this.optional(element)
										|| (length == 11 && mobile.test(value));
							}, "请填写正确的手机号码");
			jQuery.validator.addMethod("isIdCardNo", function(value, element) {
				return this.optional(element)
						|| idCardNoUtil.checkIdCardNo(value);
			}, "请正确输入您的身份证号码");
		}
	
		function getId() {
			var userName = window.sessionStorage.getItem('username')
			accountTableName = window.sessionStorage.getItem('accountTableName')
			$.ajax({
				type : "GET",
				url : baseUrl + accountTableName + "/page",
				data : {
					username : userName
				},
				beforeSend : function(xhr) {
					xhr.setRequestHeader("token", window.sessionStorage
							.getItem('token'));
				},
				success : function(res) {
					if (res.code == 0) {
						updateId = res.data.list[0].id
						$('#username').val(res.data.list[0].username)						
					} else if (res.code == 401) {
						<%@ include file="../../static/toLogin.jsp"%>
					} else {
						alert(res.msg);
					}
				},
			});
		}
		
		$(document).ready(function() {
            $('.dropdown-menu h5').html(window.sessionStorage.getItem('username')+'('+window.sessionStorage.getItem('role')+')')
			//设置导航栏菜单
			setMenu();
			
			//添加表单校验信息文本
			addValidation();
			getId();				
			$('#submitBtn').on('click', function(e) {
				e.preventDefault();
				//console.log("点击了...提交按钮");
				submit();
			});
		});
		// 用户登出
	<%@ include file="../../static/logout.jsp"%>
		
	</script>
</body>

</html>
