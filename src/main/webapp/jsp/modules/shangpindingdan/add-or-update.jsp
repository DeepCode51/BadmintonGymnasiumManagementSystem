<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-cn">

<head>
	<%@ include file="../../static/head.jsp"%>
	<link href="http://www.bootcss.com/p/bootstrap-datetimepicker/bootstrap-datetimepicker/css/datetimepicker.css" rel="stylesheet">
	<script type="text/javascript" charset="utf-8">
	    window.UEDITOR_HOME_URL = "${pageContext.request.contextPath}/resources/ueditor/"; //UEDITOR_HOME_URL、config、all这三个顺序不能改变
	</script>
	<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/resources/ueditor/ueditor.config.js"></script>
	<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/resources/ueditor/ueditor.all.min.js"></script>
	<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/resources/ueditor/lang/zh-cn/zh-cn.js"></script>
</head>
  	<style>
		label.error{
			color: red !important;
			width: auto !important;
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
			<h3 class="breadcrumb-title">编辑商品订单</h3>
			<ol class="breadcrumb-list">
				<li class="breadcrumb-item-home">
					<a href="#">
						<span class="ti-home"></span>
					</a>
				</li>
				<li class="breadcrumb-item-one"><span>商品订单管理</span></li>
				<li class="breadcrumb-item-two"><span>编辑商品订单</span></li>
			</ol>
		</div>

		<!-- Main Content -->
		<div id="add-container">
			<form id="addOrUpdateForm">
				<input id="updateId" name="id" type="hidden">
				<div class="form-item">
					<label>订单编号</label>
					<input id="dingdanbianhao" name="dingdanbianhao" class="form-control" value="" readonly>
				</div>
				<div class="form-item">
					<label>商品名称</label>
					<input name="shangpinmingcheng" id="shangpinmingcheng" name="shangpinmingcheng" class="form-control" placeholder="请输入商品名称">
				</div>
				<div class="form-item">
					<label>商品类型</label>
					<input name="shangpinleixing" id="shangpinleixing" name="shangpinleixing" class="form-control" placeholder="请输入商品类型">
				</div>
				<div class="form-item">
					<label>品牌</label>
					<input name="pinpai" id="pinpai" name="pinpai" class="form-control" placeholder="请输入品牌">
				</div>
				<div class="form-item">
					<label>单价</label>
					<input id="danjia" name="danjia" class="form-control" onchange="calculation()" placeholder="请输入单价">
				</div>
				<div class="form-item">
					<label>数量</label>
					<input id="shuliang" name="shuliang" class="form-control" onchange="calculation()" placeholder="请输入数量">
				</div>
				<div class="form-item">
					<label>应付金额</label>
					<input name="yingfujine" id="yingfujine" name="yingfujine" class="form-control" placeholder="请输入应付金额">
				</div>
				<div class="form-item">
					<label>账号</label>
					<input name="zhanghao" id="zhanghao" name="zhanghao" class="form-control" placeholder="请输入账号">
				</div>
				<div class="form-item">
					<label>姓名</label>
					<input name="xingming" id="xingming" name="xingming" class="form-control" placeholder="请输入姓名">
				</div>
				<div class="form-item">
					<label>手机号码</label>
					<input name="shoujihaoma" id="shoujihaoma" name="shoujihaoma" class="form-control" placeholder="请输入手机号码">
				</div>
				<div class="form-item">
					<label>下单时间</label>
					<input id="xiadanshijian-input" class="date" name="xiadanshijian" size="20" type="text" readonly placeholder="请选择下单时间">
				</div>
				<div class="form-item">
					<label>备注</label>
					<input name="beizhu" id="beizhu" name="beizhu" class="form-control" placeholder="请输入备注">
				</div>
										
				<div class="form-btn">
					<button  id="submitBtn" type="button" class="btn btn-primary btn-add">提交</button>
					<button id="exitBtn" type="button" class="btn btn-primary btn-close">取消</button>
				</div>
			</form>
		</div>
	</div>
	
	<!-- Back to Top -->
	<a id="back-to-top" href="#" class="back-to-top">Top</a>
	<!-- /Back to Top -->
	
	<%@ include file="../../static/foot.jsp"%>
	<script src="${pageContext.request.contextPath}/resources/js/vue.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/jquery.ui.widget.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/jquery.fileupload.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/jquery.form.js"></script>
	<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/resources/js/validate/jquery.validate.min.js"></script>
	<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/resources/js/validate/messages_zh.js"></script>
	<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/resources/js/validate/card.js"></script>
	<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/resources/js/datetimepicker/bootstrap-datetimepicker.min.js"></script>
	<script>
		<%@ include file="../../utils/menu.jsp"%>
		<%@ include file="../../static/setMenu.js"%>
		<%@ include file="../../static/utils.js"%>
		<%@ include file="../../utils/baseUrl.jsp"%>   	

		var tableName = "shangpindingdan";
		var pageType = "add-or-update";
		var updateId = "";
		var crossTableId = -1;
		var crossTableName = '';
		var ruleForm = {};
		var crossRuleForm = {};
				var shuliangKucun = 0;



		function dingdanbianhaoUuid(){
			if($("#dingdanbianhao").val() == null || $("#dingdanbianhao").val() == "null" || $("#dingdanbianhao").val() == ""){
				$("#dingdanbianhao").attr("value",Math.round(new Date().getTime()/1000));
			}
		}				

		var ruleForm = {};
		var vm = new Vue({
		  el: '#addOrUpdateForm',
		  data:{
			  ruleForm : {},
              baseUrl:baseUrl,
			},
		  beforeCreate: function(){
			  var id = window.sessionStorage.getItem("id");
				if(id != null && id != "" && id != "null"){
					$.ajax({ 
		                type: "GET",
		                url: baseUrl + "shangpindingdan/info/" + id,
		                beforeSend: function(xhr) {xhr.setRequestHeader("token", window.sessionStorage.getItem('token'));},
		                success: function(res){               	
		                	if(res.code == 0){
		                		vm.ruleForm = res.data;
				    		}else if(res.code == 401) {
				    			<%@ include file="../../static/toLogin.jsp"%>    
				    		}else{ alert(res.msg)}
		                },
		            });
				}
			},
			methods: { 
            }
	  	});		

		// 文件上传
		function upload(){
		}  
		//取消 
		function cancel() {
            window.location.href = "list.jsp";
		}
		function getQueryString(name) { 
			var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i"); 
			var r = window.location.search.substr(1).match(reg); 
			if (r != null) return unescape(r[2]); 
			return null; 
		}

		// 表单提交
		function submit() {

			var crossFlag = getQueryString("cross");
			if(validform() ==true && compare() == true){
				if(crossFlag) {
					if(Number($('#shuliang').val())<1) {
						alert('请输入正确的数量');
						return false;
					}
					if(Number(shuliangKucun) < Number($('#shuliang').val())){
						alert('数量不能大于'+shuliangKucun+'！请重新输入');
						return false;
					}
				}
				let data = {};
				getContent();
				let value = $('#addOrUpdateForm').serializeArray();
				$.each(value, function (index, item) { 
							data[item.name] = item.value;
						});
				let json = JSON.stringify(data);
				var urlParam;
				var successMes = '';
				if(updateId!=null && updateId!="null" && updateId!=''){
					urlParam = 'update';
					successMes = '修改成功';
				}else{		
					urlParam = 'save';
					successMes = '添加成功';
				}
				//更新跨表属性
			       var crossuserid;
			       var crossrefid;
			       var crossoptnum;
				if(crossFlag) {
					//如果跨表更新失败，不显示成功提示
					flag = crossTableUpdate();
										var statusColumnName = window.sessionStorage.getItem('statusColumnName'); 
					var statusColumnValue = window.sessionStorage.getItem('statusColumnValue'); 
					var obj = JSON.parse(window.sessionStorage.getItem('crossObj'));
					if(statusColumnName!='') {
						if(!statusColumnName.startsWith("[")) {
							for (var o in obj){
								if(o==statusColumnName){
									obj[o] = statusColumnValue;
								}
							}
							var table = window.sessionStorage.getItem('crossTableName');
							httpJson(crossTableName + "/update","POST",obj,(res)=>{
								if(res.code == 0){
									console.log('更新属性成功');
								}
							});   
						} else  {
							crossuserid = Number(window.sessionStorage.getItem('userid'));
							crossrefid = obj["id"];
							crossoptnum = window.sessionStorage.getItem('statusColumnName');
							crossoptnum=crossoptnum.replace(/\[/,"").replace(/\]/,"");
						}
					}
				}
				if(crossrefid && crossuserid) {
					data.crossuserid=crossuserid;
					data.crossrefid=crossrefid;
					http("shangpindingdan/page","GET",{
						page:1,
						limit:10,
						crossuserid:data.crossuserid,
						crossrefid:data.crossrefid,			
					},(res)=>{
						if(res.data.total >= crossoptnum){
							alert(window.sessionStorage.getItem('tips'));
							return false;
						} else {
							httpJson("shangpindingdan/"+urlParam,"POST",data,(res)=>{
								if(res.code == 0){
									window.sessionStorage.removeItem('id');
									let flag = true;
									if(crossFlag) {
									}

									if(flag){
										alert(successMes);
									}
									if(window.sessionStorage.getItem('onlyme') != null && window.sessionStorage.getItem('onlyme') == "true"){
										window.sessionStorage.removeItem('onlyme');
										window.location.href="${pageContext.request.contextPath}/index.jsp";
									}else{
                                        window.location.href = "list.jsp";
									}
									
								}
							});
						}
					});
				} else {
					httpJson("shangpindingdan/"+urlParam,"POST",data,(res)=>{
						if(res.code == 0){
							window.sessionStorage.removeItem('id');
							let flag = true;
							if(crossFlag) {
							}

							if(flag){
								alert(successMes);
							}
							if(window.sessionStorage.getItem('onlyme') != null && window.sessionStorage.getItem('onlyme') == "true"){
								window.sessionStorage.removeItem('onlyme');
								window.location.href="${pageContext.request.contextPath}/index.jsp";
							}else{
                                        window.location.href = "list.jsp";
							}
							
						}
					});
				}
			}else{
				alert("表单未填完整或有错误");
			}
		}

		// 填充富文本框
		function setContent(){
		}  

		// 获取富文本框内容
		function getContent(){
		}

		// 表单校验
		function validform() {
			return $("#addOrUpdateForm").validate({ 
				rules: {
				    dingdanbianhao: {
					},
				    shangpinmingcheng: {
					},
				    shangpinleixing: {
					},
				    pinpai: {
					},
				    danjia: {
					number: true,
					},
				    shuliang: {
					required: true,
					digits: true,
					},
				    yingfujine: {
					number: true,
					},
				    zhanghao: {
					},
				    xingming: {
					},
				    shoujihaoma: {
					},
				    xiadanshijian: {
					},
				    beizhu: {
					},
				    sfsh: {
					},
				    shhf: {
					},
				    ispay: {
					},
				},
				messages: {
					shangpinmingcheng: {
					},
					shangpinleixing: {
					},
					pinpai: {
					},
					danjia: {
						number: "请输入数字",	
					},
					shuliang: {
						required: "数量不能为空",
					},
					yingfujine: {
						number: "请输入数字",	
					},
					zhanghao: {
					},
					xingming: {
					},
					shoujihaoma: {
					},
					xiadanshijian: {
					},
					beizhu: {
					},
					sfsh: {
					},
					shhf: {
					},
					ispay: {
					},
				}
			}).form();
		}
		// 添加表单校验方法
		function addValidation(){
			jQuery.validator.addMethod("isPhone", function(value, element) {
					var length = value.length;
					var mobile = /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1})|(19[0-9]{1})|(17[0-9]{1}))+\d{8})$/;
					return this.optional(element) || (length == 11 && mobile.test(value));
			}, "请填写正确的手机号码");
                        jQuery.validator.addMethod("isIdCardNo", function(value, element) {
                                return this.optional(element) || value.length == 18;
                        }, "请正确输入您的身份证号码");
                        jQuery.validator.addMethod("isTel", function(value, element) {
                          var length = value.length;
                          var phone = /(^(\d{3,4}-)?\d{6,8}$)|(^(\d{3,4}-)?\d{6,8}(-\d{1,5})?$)|(\d{11})/;
                          return this.optional(element) || (phone.test(value));
                         }, "请填写正确的固定电话");//可以自定义默认提示信息
		}
		// 获取当前详情
		function getDetails() {
			var id = window.sessionStorage.getItem("id");
			if(id != null && id != "" && id != "null"){
				updateId = id;
				window.sessionStorage.removeItem('id');
				http("shangpindingdan/info/" + id,"GET",{},(res)=>{
					if(res.code == 0){
						ruleForm = res.data
						// 是/否下拉框回显
						setSelectOption();
						// 设置图片src
						showImg();
						// 数据填充
						dataBind();
						// 富文本框回显	
						setContent();
												//注册表单验证
						$(validform());	
					}
				});
			}else{
				dingdanbianhaoUuid();



		 		fill()
				//注册表单验证
		    		$(validform());
			}
		}	
		// 下拉框选项回显
		function setSelectOption(){
		}			
		// 关联下拉框改变
		function lvSelectChange(level){
			let data = {};
			let value = $('#addOrUpdateForm').serializeArray();
			$.each(value, function (index, item) { 
			            data[item.name] = item.value;
			        });
			
		}		
		// 清除可能会重复渲染的selection
		function clear(className){
			var elements = document.getElementsByClassName(className);
        	for(var i = elements.length - 1; i >= 0; i--) { 
        	  elements[i].parentNode.removeChild(elements[i]); 
        	}
		}		
		function dateTimePick(){
			$.fn.datetimepicker.dates['zh-CN'] = { 
		            days: ["星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六", "星期日"],
		            daysShort: ["周日", "周一", "周二", "周三", "周四", "周五", "周六", "周日"],
		            daysMin:  ["日", "一", "二", "三", "四", "五", "六", "日"],
		            months: ["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"],
		            monthsShort: ["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"],
		            today: "今天",
		            suffix: [],
		            meridiem: ["上午", "下午"]
		    };
			$("#xiadanshijian-input").val(getCurDateTime());
			$("#xiadanshijian-input").datetimepicker({ 
				autoclose: true,
				format:'yyyy-mm-dd hh:ii:00',
				minuteStep:1,
				language:'zh-CN',
			});

		}		
		
		function calculation(){
			//积
			var x = 0;
			//和
			var y = 0;
			var flag = 0;


			if($("#danjia").val() != null && $("#danjia").val() != ""){
				if(x == 0 && flag < 2){
					x = (x+1) * parseFloat($("#danjia").val());
					flag++;
				}else{
					x = x * parseFloat($("#danjia").val());
					flag++;
				}
			}
			if($("#shuliang").val() != null && $("#shuliang").val() != ""){
				if(x == 0 && flag < 2){
					x = (x+1) * parseFloat($("#shuliang").val());
					flag++;
				}else{
					x = x * parseFloat($("#shuliang").val());
					flag++;
				}
			}
			if(flag < 2){
				$("#yingfujine").val(0);
			}else{
				$("#yingfujine").val(x.toFixed(2));
			}

		}		
		function calculationSE(colName){
			//单列求和接口
			http("shangpindingdan"+colName,"GET",{
				tableName: "shangpindingdan",
				columnName: colName
			},(res)=>{
				if(res.code == 0){
					$("#"+colName).attr("value",res.data);
				}
			});
		}	
		function calculationPre(){
			//进入该页面就填充"单列求和"的列
		}			
		
		
			//新增时填充字段
			function fill(){
				var username = window.sessionStorage.getItem('username');
				var accountTableName = window.sessionStorage.getItem('accountTableName');
				http(accountTableName+'/session','GET',{},(res)=>{
					if(res.code == 0){
						var myId = res.data.id;
						if(res.data !=null && res.data.zhanghao != null && res.data.zhanghao != ''){
							$('#zhanghao').val(res.data.zhanghao)
							$("#zhanghao").attr('readonly','readonly');
						}
						if(res.data !=null && res.data.xingming != null && res.data.xingming != ''){
							$('#xingming').val(res.data.xingming)
							$("#xingming").attr('readonly','readonly');
						}
						if(res.data !=null && res.data.shoujihaoma != null && res.data.shoujihaoma != ''){
							$('#shoujihaoma').val(res.data.shoujihaoma)
							$("#shoujihaoma").attr('readonly','readonly');
						}
						$(validform());
					}
				});
							
			}	
			
		function dataBind(){
			$("#updateId").val(ruleForm.id);	
			$("#dingdanbianhao").val(ruleForm.dingdanbianhao);	
			$("#shangpinmingcheng").val(ruleForm.shangpinmingcheng);	
			$("#shangpinleixing").val(ruleForm.shangpinleixing);	
			$("#pinpai").val(ruleForm.pinpai);	
			$("#danjia").val(ruleForm.danjia);	
			$("#shuliang").val(ruleForm.shuliang);	
			$("#yingfujine").val(ruleForm.yingfujine);	
			$("#zhanghao").val(ruleForm.zhanghao);	
			$("#xingming").val(ruleForm.xingming);	
			$("#shoujihaoma").val(ruleForm.shoujihaoma);	
			$("#xiadanshijian-input").val(ruleForm.xiadanshijian);
			$("#beizhu").val(ruleForm.beizhu);	
				
						$("#shhf").val(ruleForm.shhf);	
			$("#ispay").val(ruleForm.ispay);	
		}		
		//图片显示
		function showImg(){
		}		
		//跨表

        //跨表
        function crossTable(){
		crossTableName = window.sessionStorage.getItem('crossTableName');
		crossTableId = window.sessionStorage.getItem('crossTableId');
		if(crossTableName != null && crossTableName != '' && crossTableId != null && crossTableId != '' && crossTableId != -1){
			http(crossTableName + "/info/" + crossTableId,"GET",{},(res)=>{
				if(res.code == 0){
					crossRuleForm = res.data;
					$('#updateId').val(crossTableId);
					if(res.data != null && res.data != '' && res.data.dingdanbianhao != null && res.data.dingdanbianhao != ''){

						$("#dingdanbianhao").val(res.data.dingdanbianhao);
						$("#dingdanbianhao").attr('readonly','readonly');
					}
					if(res.data != null && res.data != '' && res.data.shangpinmingcheng != null && res.data.shangpinmingcheng != ''){

						$("#shangpinmingcheng").val(res.data.shangpinmingcheng);
						$("#shangpinmingcheng").attr('readonly','readonly');
					}
					if(res.data != null && res.data != '' && res.data.shangpinleixing != null && res.data.shangpinleixing != ''){

						$("#shangpinleixing").val(res.data.shangpinleixing);
						$("#shangpinleixing").attr('readonly','readonly');
					}
					if(res.data != null && res.data != '' && res.data.pinpai != null && res.data.pinpai != ''){

						$("#pinpai").val(res.data.pinpai);
						$("#pinpai").attr('readonly','readonly');
					}
					if(res.data != null && res.data != '' && res.data.danjia != null && res.data.danjia != ''){

						$("#danjia").val(res.data.danjia);
						$("#danjia").attr('readonly','readonly');
					}
					if(res.data != null && res.data != '' && res.data.shuliang != null && res.data.shuliang != ''){

						shuliangKucun = res.data.shuliang;
						$("#shuliang").val(res.data.shuliang);
					}
					if(res.data != null && res.data != '' && res.data.yingfujine != null && res.data.yingfujine != ''){

						$("#yingfujine").val(res.data.yingfujine);
						$("#yingfujine").attr('readonly','readonly');
					}
					if(res.data != null && res.data != '' && res.data.zhanghao != null && res.data.zhanghao != ''){

						$("#zhanghao").val(res.data.zhanghao);
						$("#zhanghao").attr('readonly','readonly');
					}
					if(res.data != null && res.data != '' && res.data.xingming != null && res.data.xingming != ''){

						$("#xingming").val(res.data.xingming);
						$("#xingming").attr('readonly','readonly');
					}
					if(res.data != null && res.data != '' && res.data.shoujihaoma != null && res.data.shoujihaoma != ''){

						$("#shoujihaoma").val(res.data.shoujihaoma);
						$("#shoujihaoma").attr('readonly','readonly');
					}
					if(res.data != null && res.data != '' && res.data.xiadanshijian != null && res.data.xiadanshijian != ''){

						$("#xiadanshijian-input").val(res.data.xiadanshijian);
						$('#xiadanshijianFileName').val(res.data.xiadanshijian)
					}
					if(res.data != null && res.data != '' && res.data.beizhu != null && res.data.beizhu != ''){

						$("#beizhu").val(res.data.beizhu);
						$("#beizhu").attr('readonly','readonly');
					}
					if(res.data != null && res.data != '' && res.data.sfsh != null && res.data.sfsh != ''){

					}
					if(res.data != null && res.data != '' && res.data.shhf != null && res.data.shhf != ''){

						$("#shhf").val(res.data.shhf);
						$("#shhf").attr('readonly','readonly');
					}
					if(res.data != null && res.data != '' && res.data.ispay != null && res.data.ispay != ''){

						$("#ispay").val(res.data.ispay);
						$("#ispay").attr('readonly','readonly');
					}
				}
			});  
            }
		window.sessionStorage.removeItem('crossTableName');
		window.sessionStorage.removeItem('crossTableId');
        }
		
		//跨表更新字段
		function crossTableUpdate(){
			let flag = crossTableUpdateValidation();
			if(flag){
				httpJson(crossTableName + "/update","POST",{
					id: crossTableId,
					shuliang: Number(crossRuleForm.shuliang) - Number($('#shuliang').val()),	
				},(res)=>{
					if(res.code == 0){
						console.log('跨表更新成功');
						return true;
					}
				});   
			}
			return false;
		}

		//跨表更新前验证
		function crossTableUpdateValidation(){
			//防止减法导致库存负值
			if(Number(shuliangKucun) < Number($('#shuliang').val())){
				alert('数量不能大于'+shuliangKucun+'！请重新输入');
				return false;
			}
			return true;
		}
		$(document).ready(function() { 
			//设置右上角用户名
            $('.dropdown-menu h5').html(window.sessionStorage.getItem('username')+'('+window.sessionStorage.getItem('role')+')')
			//设置项目名
			$('.sidebar-header h3 a').html(projectName)
			//设置导航栏菜单
			setMenu();
			//初始化时间插件
			dateTimePick();
			//添加表单校验信息文本
			addValidation();
			getDetails();
			//初始化上传按钮
			upload();
			//单列求和
			calculationPre();
			//跨表
			crossTable();
			<%@ include file="../../static/myInfo.js"%>
			$('#submitBtn').on('click', function(e) {
			    e.preventDefault();
			    //console.log("点击了...提交按钮");
			    submit();
			});
			$('#exitBtn').on('click', function(e) {
			    cancel();
			});
			readonly();
		});		

		function readonly(){
            if(window.sessionStorage.getItem('role')!="管理员") {
				$('#money').attr('readonly','readonly');
            }
		}

		//比较大小
		function compare(){
			var largerVal = null;
			var smallerVal = null;
			if(largerVal !=null && smallerVal != null){
				if(parseInt(largerVal)<=parseInt(smallerVal)){
					alert(smallerName+'不能大于等于'+largerName);
					return false;
				}
			}
			return true;
		}


		// 用户登出
        <%@ include file="../../static/logout.jsp"%>		
	</script>
</body>

</html>
