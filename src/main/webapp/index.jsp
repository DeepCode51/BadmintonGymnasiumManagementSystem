<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
	<%@ include file="jsp/static/head.jsp"%>
</head>
<style>
	#home-container {
				padding: 0 0 240px;
				background: url(http://codegen.caihongy.cn/20221214/dc87cabe853447dd99258c42f1049e0d.png) no-repeat center 100px;
				width: 100%;
				height: 100vh;
			}
	
	#home-container div.home-container-title {
				padding: 40px 0 0;
				margin: 0 auto;
				color: #fff;
				font-weight: 500;
				font-size: 28px;
				text-align: center;
			}
	
	#home-container .cards {
				margin: 180px 0 20px 0;
				display: flex;
				justify-content: center;
				align-items: center;
			}
	
	#home-container .cards .item {
				border: 1px solid #97eacb;
				border-radius: 4px;
				box-shadow: 0 0px 0px rgba(0,0,0,.3);
				margin: 0 10px;
				display: flex;
			}
	
	#home-container .cards .item .link {
				background: url(http://codegen.caihongy.cn/20221215/2d0194302b9347c9ab6966f0b85e5f20.png) no-repeat center top / 100% 100%,#fff;
				width: 80px;
				height: 80px;
			}
	
	#home-container .cards .item .item-body {
				flex-direction: column;
				background: rgba(255,255,255,.3);
				display: flex;
				width: 160px;
				justify-content: center;
				align-items: center;
			}
	
	#home-container .cards .item .item-body .num {
				margin: 5px 0;
				color: #333;
				font-weight: bold;
				font-size: 20px;
				line-height: 24px;
				height: 24px;
			}
	
	#home-container .cards .item .item-body .name {
				margin: 5px 0;
				color: #666;
				font-size: 16px;
				line-height: 24px;
				height: 24px;
			}
	
    .homeCharts{
        display: flex;
        width: 100%;
        align-items: center;
        height: auto;
        box-shadow: 0 4px 10px rgba(0,0,0,.3);
        border-radius: 10px;
        margin-bottom: 20px;
    }
</style> 
<body>
	<div id="main-container">
		<!-- Top Navigation -->
		<%@ include file="jsp/static/topNav.jsp"%>
		
		<!-- Menu -->
		<div id="menu-container" class="navbar">
			<ul class="navbar-nav navbar-vertical" id="navUl">
				
			</ul>
		</div>
		<!-- /Menu -->
			
		<!-- Breadcrumb -->
		<div id="breadcrumb-container">
			<h3 class="breadcrumb-title">主页</h3>
			<ol class="breadcrumb-list">
				<li class="breadcrumb-item-home">
					<a href="#">
						<span class="ti-home"></span>
					</a>
				</li>
			</ol>
		</div>
		<!-- /Breadcrumb -->
			
		<!-- Main Content -->
		<div id="home-container">
			<div class="home-container-title">欢迎使用&nbsp;基于Java的羽毛球馆管理系统的设计与实现 </div>
			
			<div class="cards" :style='{"margin":"180px 0 20px 0","alignItems":"center","justifyContent":"center","display":"flex"}'>
				<div class="item" :style='{"border":"1px solid #97eacb","boxShadow":"0 0px 0px rgba(0,0,0,.3)","margin":"0 10px","borderRadius":"4px","display":"flex"}' v-if="crossBtnControl2('changdixinxi','首页总数')">
					<div class="link" :style='{"width":"80px","background":"url(http://codegen.caihongy.cn/20221215/2d0194302b9347c9ab6966f0b85e5f20.png) no-repeat center top / 100% 100%,#fff","height":"80px"}'></div>
					<div class="item-body" :style='{"width":"160px","alignItems":"center","flexDirection":"column","background":"rgba(255,255,255,.3)","justifyContent":"center","display":"flex"}'>
						<div class="num" :style='{"margin":"5px 0","lineHeight":"24px","fontSize":"20px","color":"#333","fontWeight":"bold","height":"24px"}'>{{changdixinxiCount}}</div>
						<div class="name" :style='{"margin":"5px 0","lineHeight":"24px","fontSize":"16px","color":"#666","height":"24px"}'>场地信息总数</div>
					</div>
				</div>
				<div class="item" :style='{"border":"1px solid #97eacb","boxShadow":"0 0px 0px rgba(0,0,0,.3)","margin":"0 10px","borderRadius":"4px","display":"flex"}' v-if="crossBtnControl2('shangpinxinxi','首页总数')">
					<div class="link" :style='{"width":"80px","background":"url(http://codegen.caihongy.cn/20221215/2d0194302b9347c9ab6966f0b85e5f20.png) no-repeat center top / 100% 100%,#fff","height":"80px"}'></div>
					<div class="item-body" :style='{"width":"160px","alignItems":"center","flexDirection":"column","background":"rgba(255,255,255,.3)","justifyContent":"center","display":"flex"}'>
						<div class="num" :style='{"margin":"5px 0","lineHeight":"24px","fontSize":"20px","color":"#333","fontWeight":"bold","height":"24px"}'>{{shangpinxinxiCount}}</div>
						<div class="name" :style='{"margin":"5px 0","lineHeight":"24px","fontSize":"16px","color":"#666","height":"24px"}'>商品信息总数</div>
					</div>
				</div>
				<div class="item" :style='{"border":"1px solid #97eacb","boxShadow":"0 0px 0px rgba(0,0,0,.3)","margin":"0 10px","borderRadius":"4px","display":"flex"}' v-if="crossBtnControl2('jiaolianyuyue','首页总数')">
					<div class="link" :style='{"width":"80px","background":"url(http://codegen.caihongy.cn/20221215/2d0194302b9347c9ab6966f0b85e5f20.png) no-repeat center top / 100% 100%,#fff","height":"80px"}'></div>
					<div class="item-body" :style='{"width":"160px","alignItems":"center","flexDirection":"column","background":"rgba(255,255,255,.3)","justifyContent":"center","display":"flex"}'>
						<div class="num" :style='{"margin":"5px 0","lineHeight":"24px","fontSize":"20px","color":"#333","fontWeight":"bold","height":"24px"}'>{{jiaolianyuyueCount}}</div>
						<div class="name" :style='{"margin":"5px 0","lineHeight":"24px","fontSize":"16px","color":"#666","height":"24px"}'>教练预约总数</div>
					</div>
				</div>
			</div>
			
			<div class="homeCharts">
				<div id="changdixinxiMain1" v-if="crossBtnControl2('changdixinxi','首页统计')" class="graph" style="width: 100%;height:300px;"></div>
				<div id="shangpinxinxiMain1" v-if="crossBtnControl2('shangpinxinxi','首页统计')" class="graph" style="width: 100%;height:300px;"></div>
				<div id="jiaolianyuyueMain1" v-if="crossBtnControl2('jiaolianyuyue','首页统计')" class="graph" style="width: 100%;height:300px;"></div>
			</div>
		</div>
		<!-- /Main Content -->
	</div>
	
	<!-- Back to Top -->
	<a id="back-to-top" href="#" class="back-to-top">Top</a>
	<!-- /Back to Top -->
	
	<%@ include file="jsp/static/foot.jsp"%>
    <script src="${pageContext.request.contextPath}/resources/js/echarts.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/vue.min.js"></script>

	<script>
		<%@ include file="jsp/utils/menu.jsp"%>
		<%@ include file="jsp/static/setMenu.js"%>
		<%@ include file="jsp/utils/baseUrl.jsp"%>
        <%@ include file="jsp/static/crossBtnControl.js"%>
		// 用户登出
        <%@ include file="jsp/static/logout.jsp"%>
        var vm = new Vue({
            el: '#home-container',
            data: {
            changdixinxiCount: 0,
            shangpinxinxiCount: 0,
            jiaolianyuyueCount: 0,
            }
        });
        function getchangdixinxiCount() {
                $.ajax({
                    type: "GET",
                    url: baseUrl+`changdixinxi/count`,
                    beforeSend: function(xhr) {
                        xhr.setRequestHeader("token", window.sessionStorage.getItem('token'));
                    },
                    success: function(data){
                        if(data.code == 0){
                            vm.changdixinxiCount = data.data;
                        }else if(data.code == 401){
                            <%@ include file="jsp/static/toLogin.jsp"%>
                        }else{
                            alert(data.msg);
                        }
                    },
                });
        }
        function getshangpinxinxiCount() {
                $.ajax({
                    type: "GET",
                    url: baseUrl+`shangpinxinxi/count`,
                    beforeSend: function(xhr) {
                        xhr.setRequestHeader("token", window.sessionStorage.getItem('token'));
                    },
                    success: function(data){
                        if(data.code == 0){
                            vm.shangpinxinxiCount = data.data;
                        }else if(data.code == 401){
                            <%@ include file="jsp/static/toLogin.jsp"%>
                        }else{
                            alert(data.msg);
                        }
                    },
                });
        }
        function getjiaolianyuyueCount() {
                $.ajax({
                    type: "GET",
                    url: baseUrl+`jiaolianyuyue/count`,
                    beforeSend: function(xhr) {
                        xhr.setRequestHeader("token", window.sessionStorage.getItem('token'));
                    },
                    success: function(data){
                        if(data.code == 0){
                            vm.jiaolianyuyueCount = data.data;
                        }else if(data.code == 401){
                            <%@ include file="jsp/static/toLogin.jsp"%>
                        }else{
                            alert(data.msg);
                        }
                    },
                });
        }

                function changdixinxichartDialog1(){

                    $.ajax({
                        type: "GET",
                        url: baseUrl+"changdixinxi/group/zhuangtai",
                        beforeSend: function(xhr) {
                            xhr.setRequestHeader("token", window.sessionStorage.getItem('token'));
                        },
                        success: function(data){
                            if(data.code == 0){
                                if(data.data != null){
                                    let res = data.data;
                                    let xAxis = [];
                                    let yAxis = [];
                                    let pArray = []
                                    for(let i=0;i<res.length;i++){
                                        xAxis.push(res[i].zhuangtai);
                                        yAxis.push(parseFloat((res[i].total)));
                                        pArray.push({
                                            value: parseFloat((res[i].total)),
                                            name: res[i].zhuangtai
                                        })
                                    }

                                    var myChart = echarts.init(document.getElementById('changdixinxiMain1'),'macarons');
                                    var option = {};
                                    option = {
                                            title: {
                                                text: '场地状态统计',
                                                left: 'center'
                                            },
                                            legend: {
                                              orient: 'vertical',
                                              left: 'left'
                                            },
                                            tooltip: {
                                              trigger: 'item',
                                              formatter: '{b} : {c} ({d}%)'
                                            },
                                            series: [
                                                {
                                                    type: 'pie',
                                                    radius: ['25%', '55%'],
                                                    center: ['50%', '60%'],
                                                    data: pArray,
                                                    emphasis: {
                                                        itemStyle: {
                                                            shadowBlur: 10,
                                                            shadowOffsetX: 0,
                                                            shadowColor: 'rgba(0, 0, 0, 0.5)'
                                                        }
                                                    }
                                                }
                                            ]
                                    };

                                    // 使用刚指定的配置项和数据显示图表。
                                    myChart.setOption(option);
                                }
                            }else if(data.code == 401){
                                <%@ include file="jsp/static/toLogin.jsp"%>
                            }else{
                                alert(data.msg);
                            }
                        },
                    });
                }






                function shangpinxinxichartDialog1(){

                    $.ajax({
                        type: "GET",
                        url: baseUrl+`shangpinxinxi/value/shangpinmingcheng/shuliang`,
                        beforeSend: function(xhr) {
                            xhr.setRequestHeader("token", window.sessionStorage.getItem('token'));
                        },
                        success: function(data){
                            if(data.code == 0){
                                if(data.data != null){
                                    let res = data.data;
                                    let xAxis = [];
                                    let yAxis = [];
                                    let pArray = []
                                    for(let i=0;i<res.length;i++){
                                        xAxis.push(res[i].shangpinmingcheng);
                                        yAxis.push(parseFloat((res[i].total)));
                                        pArray.push({
                                            value: parseFloat((res[i].total)),
                                            name: res[i].shangpinmingcheng
                                        })
                                    }

                                    var myChart = echarts.init(document.getElementById('shangpinxinxiMain1'),'macarons');
                                    var option = {};
                                    option = {
                                        title: {
                                            text: '商品库存统计',
                                            left: 'center'
                                        },
                                        tooltip: {
                                          trigger: 'item',
                                          formatter: '{b} : {c}'
                                        },
                                        xAxis: {
                                            type: 'category',
                                            data: xAxis
                                        },
                                        yAxis: {
                                            type: 'value'
                                        },
                                        series: [{
                                            data: yAxis,
                                            type: 'bar'
                                        }]
                                    };

                                    // 使用刚指定的配置项和数据显示图表。
                                    myChart.setOption(option);
                                }
                            }else if(data.code == 401){
                                <%@ include file="jsp/static/toLogin.jsp"%>
                            }else{
                                alert(data.msg);
                            }
                        },
                    });
                }






                function jiaolianyuyuechartDialog1(){

                    $.ajax({
                        type: "GET",
                        url: baseUrl+"jiaolianyuyue/group/shenqingriqi",
                        beforeSend: function(xhr) {
                            xhr.setRequestHeader("token", window.sessionStorage.getItem('token'));
                        },
                        success: function(data){
                            if(data.code == 0){
                                if(data.data != null){
                                    let res = data.data;
                                    let xAxis = [];
                                    let yAxis = [];
                                    let pArray = []
                                    for(let i=0;i<res.length;i++){
                                        xAxis.push(res[i].shenqingriqi);
                                        yAxis.push(parseFloat((res[i].total)));
                                        pArray.push({
                                            value: parseFloat((res[i].total)),
                                            name: res[i].shenqingriqi
                                        })
                                    }

                                    var myChart = echarts.init(document.getElementById('jiaolianyuyueMain1'),'macarons');
                                    var option = {};
                                    option = {
                                        title: {
                                            text: '每日预约人数统计',
                                            left: 'center'
                                        },
                                        tooltip: {
                                          trigger: 'item',
                                          formatter: '{b} : {c}'
                                        },
                                        xAxis: {
                                            type: 'category',
                                            boundaryGap: false,
                                            data: xAxis
                                        },
                                        yAxis: {
                                            type: 'value'
                                        },
                                        series: [{
                                            data: yAxis,
                                            type: 'line',
                                            smooth: true
                                        }]
                                    };

                                    // 使用刚指定的配置项和数据显示图表。
                                    myChart.setOption(option);
                                }
                            }else if(data.code == 401){
                                <%@ include file="jsp/static/toLogin.jsp"%>
                            }else{
                                alert(data.msg);
                            }
                        },
                    });
                }







		$(document).ready(function() {
		//我的后台,session信息转移
		if(window.localStorage.getItem("Token") != null && window.localStorage.getItem("Token") != 'null'){
			  if(window.sessionStorage.getItem("token") == null || window.sessionStorage.getItem("token") == 'null'){
				  window.sessionStorage.setItem("token",window.localStorage.getItem("Token"));
				  window.sessionStorage.setItem("role",window.localStorage.getItem("role"));
				  window.sessionStorage.setItem("accountTableName",window.localStorage.getItem("sessionTable"));
				  window.sessionStorage.setItem("username",window.localStorage.getItem("adminName"));
			  }
		  }			
          $('.dropdown-menu h5').html(window.sessionStorage.getItem('username')+'('+window.sessionStorage.getItem('role')+')')
		  $('.sidebar-header h3 a').html(projectName)
		  var token = window.sessionStorage.getItem("token");
		  if(token == "null" || token == null){
		  	alert("请登录后再操作");
		  	window.location.href = ("jsp/login.jsp");
		  }
			setMenu();
			<%@ include file="jsp/static/myInfo.js"%>
            getchangdixinxiCount();
            changdixinxichartDialog1()
            getshangpinxinxiCount();
            shangpinxinxichartDialog1()
            getjiaolianyuyueCount();
            jiaolianyuyuechartDialog1()
		});
	</script>
</body>

</html>
