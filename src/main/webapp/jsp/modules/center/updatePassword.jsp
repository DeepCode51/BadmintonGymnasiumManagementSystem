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
			<h3 class="breadcrumb-title">编辑修改密码</h3>
			<ol class="breadcrumb-list">
				<li class="breadcrumb-item-home">
					<a href="#">
						<span class="ti-home"></span>
					</a>
				</li>
				<li class="breadcrumb-item-one"><span>修改密码管理</span></li>
				<li class="breadcrumb-item-two"><span>编辑修改密码</span></li>
			</ol>
		</div>

		<!-- Main Content -->
		<div id="add-container">
			<form id="addOrUpdateForm">
				<input id="updateId" name="id" type="hidden">
				<div class="form-item">
					<label>原密码</label>
					<input id="oldPassword" name="oldPassword" type="password" class="form-control" placeholder="原密码">
				</div>
				<div class="form-item">
					<label>新密码</label>
					<input id="newPassword" name="newPassword" type="password" class="form-control" placeholder="新密码">
				</div>
				<div class="form-item">
					<label>确认密码</label>
					<input id="confirmPassword" type="password" name="confirmPassword" class="form-control" placeholder="确认密码">
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
	<%@ include file="../../static/md5.js"%>
		var tableName = "xiugaimima";
		var pageType = "add-or-update";
		var updateId = "";
		var password = '';
		var accountTableName = ''

		var ruleForm = {};


		// 表单提交
		function submit() {
			if (validform() == true) { 			
				if(password == $('#oldPassword').val()){
					httpJson(accountTableName + "/update","POST",{
						id:updateId,
						mima: $('#newPassword').val(),
						password: $('#newPassword').val()
					},(res)=>{
						if(res.code == 0){
							window.location.href = '../../login.jsp';
							alert('修改成功，请重新登陆');
						}						
					});
				}else{
					alert('原密码输入错误')
				}
			} else {
				alert("表单未填完整或有错误");
			}
		}

		// 表单校验
		function validform() {
			return $("#addOrUpdateForm").validate({
				rules : {
					oldPassword : {
						required : true,
					},
					newPassword : {
						required : true,
					},
					confirmPassword : {
						required : true,
						equalTo: "#newPassword",
					},
				},
				messages : {
					oldPassword : {
						required : "原密码不能为空",
					},
					newPassword : {
						required : "新密码不能为空",
					},
					confirmPassword : {
						required : "确认密码不能为空",
						equalTo: "两次密码输入不一致",
					},
				}
			}).form();
		}

		function getId() {
			var userName = window.sessionStorage.getItem('username')
			accountTableName = window.sessionStorage.getItem('accountTableName')
			http(accountTableName+'/session','GET',{},(res)=>{
				if(res.code == 0){
					updateId = res.data.id;
					if(res.data != null && res.data.mima != null && res.data.mima != ''){
						password = res.data.mima;
					} else if(res.data != null && res.data.password != null && res.data.password != ''){
						password = res.data.password;
					}
					
				}		
			});
		}
		$(document).ready(function() {
            $('.dropdown-menu h5').html(window.sessionStorage.getItem('username')+'('+window.sessionStorage.getItem('role')+')')
			//设置导航栏菜单
			setMenu();
			getId();
			$('#submitBtn').on('click', function(e) {
				e.preventDefault();
				//console.log("点击了...提交按钮");
				submit();
			});
			<%@ include file="../../static/myInfo.js"%>
		});
		// 用户登出
	<%@ include file="../../static/logout.jsp"%>
		
	</script>
</body>

</html>
