
var projectName = '基于Java的羽毛球馆管理系统的设计与实现 ';
/**
 * 轮播图配置
 */
var swiper = {
	// 设定轮播容器宽度，支持像素和百分比
	width: '100%',
	height: '400px',
	// hover（悬停显示）
	// always（始终显示）
	// none（始终不显示）
	arrow: 'none',
	// default（左右切换）
	// updown（上下切换）
	// fade（渐隐渐显切换）
	anim: 'default',
	// 自动切换的时间间隔
	// 默认3000
	interval: 2000,
	// 指示器位置
	// inside（容器内部）
	// outside（容器外部）
	// none（不显示）
	indicator: 'outside'
}

/**
 * 个人中心菜单
 */
var centerMenu = [{
	name: '个人中心',
	url: '../' + localStorage.getItem('userTable') + '/center.jsp'
}, 
{
	name: '我的收藏',
	url: '../storeup/list.jsp?storeupType=1'
},
]


var indexNav = [

{
	name: '场地信息',
	url: './pages/changdixinxi/list.jsp'
}, 
{
	name: '商品信息',
	url: './pages/shangpinxinxi/list.jsp'
}, 
{
	name: '教练信息',
	url: './pages/jiaolianxinxi/list.jsp'
}, 

{
	name: '公告信息',
	url: './pages/news/list.jsp'
},
{
	name: '留言板',
	url: './pages/messages/list.jsp'
}
]

var adminurl =  "http://localhost:8080/jspm14juj/index.jsp";

var cartFlag = false

var chatFlag = false




var menu = [{"backMenu":[{"child":[{"appFrontIcon":"cuIcon-vipcard","buttons":["新增","查看","修改","删除"],"menu":"用户","menuJump":"列表","tableName":"yonghu"}],"menu":"用户管理"},{"child":[{"appFrontIcon":"cuIcon-addressbook","buttons":["新增","查看","修改","删除"],"menu":"场地类型","menuJump":"列表","tableName":"changdileixing"}],"menu":"场地类型管理"},{"child":[{"appFrontIcon":"cuIcon-cardboard","buttons":["新增","查看","修改","删除"],"menu":"时间段","menuJump":"列表","tableName":"shijianduan"}],"menu":"时间段管理"},{"child":[{"appFrontIcon":"cuIcon-qrcode","buttons":["新增","查看","修改","删除","场地状态统计","查看评论","首页总数","首页统计"],"menu":"场地信息","menuJump":"列表","tableName":"changdixinxi"}],"menu":"场地信息管理"},{"child":[{"appFrontIcon":"cuIcon-similar","buttons":["新增","查看","修改","删除"],"menu":"商品类型","menuJump":"列表","tableName":"shangpinleixing"}],"menu":"商品类型管理"},{"child":[{"appFrontIcon":"cuIcon-wenzi","buttons":["新增","修改","删除","查看","商品库存统计","查看评论","首页总数","首页统计"],"menu":"商品信息","menuJump":"列表","tableName":"shangpinxinxi"}],"menu":"商品信息管理"},{"child":[{"appFrontIcon":"cuIcon-pay","buttons":["新增","查看","修改","删除","查看评论"],"menu":"教练信息","menuJump":"列表","tableName":"jiaolianxinxi"}],"menu":"教练信息管理"},{"child":[{"appFrontIcon":"cuIcon-skin","buttons":["查看","删除","审核"],"menu":"场地预约","menuJump":"列表","tableName":"changdiyuyue"}],"menu":"场地预约管理"},{"child":[{"appFrontIcon":"cuIcon-shop","buttons":["查看","删除","审核"],"menu":"商品订单","menuJump":"列表","tableName":"shangpindingdan"}],"menu":"商品订单管理"},{"child":[{"appFrontIcon":"cuIcon-list","buttons":["查看","删除","审核","每日预约人数统计","首页总数","首页统计"],"menu":"教练预约","menuJump":"列表","tableName":"jiaolianyuyue"}],"menu":"教练预约管理"},{"child":[{"appFrontIcon":"cuIcon-paint","buttons":["查看","回复","删除"],"menu":"留言板管理","tableName":"messages"}],"menu":"留言板管理"},{"child":[{"appFrontIcon":"cuIcon-link","buttons":["查看","修改"],"menu":"关于我们","tableName":"aboutus"},{"appFrontIcon":"cuIcon-link","buttons":["查看","修改"],"menu":"系统简介","tableName":"systemintro"},{"appFrontIcon":"cuIcon-flashlightopen","buttons":["查看","修改"],"menu":"轮播图管理","tableName":"config"},{"appFrontIcon":"cuIcon-news","buttons":["新增","查看","修改","删除"],"menu":"公告信息","tableName":"news"}],"menu":"系统管理"}],"frontMenu":[{"child":[{"appFrontIcon":"cuIcon-paint","buttons":["查看","查看评论","预约"],"menu":"场地信息列表","menuJump":"列表","tableName":"changdixinxi"}],"menu":"场地信息模块"},{"child":[{"appFrontIcon":"cuIcon-qrcode","buttons":["购买","查看评论","查看"],"menu":"商品信息列表","menuJump":"列表","tableName":"shangpinxinxi"}],"menu":"商品信息模块"},{"child":[{"appFrontIcon":"cuIcon-explore","buttons":["查看","查看评论","预约"],"menu":"教练信息列表","menuJump":"列表","tableName":"jiaolianxinxi"}],"menu":"教练信息模块"}],"hasBackLogin":"是","hasBackRegister":"否","hasFrontLogin":"否","hasFrontRegister":"否","roleName":"管理员","tableName":"users"},{"backMenu":[{"child":[{"appFrontIcon":"cuIcon-skin","buttons":["查看","修改","删除"],"menu":"场地预约","menuJump":"列表","tableName":"changdiyuyue"}],"menu":"场地预约管理"},{"child":[{"appFrontIcon":"cuIcon-shop","buttons":["删除","修改","查看","支付"],"menu":"商品订单","menuJump":"列表","tableName":"shangpindingdan"}],"menu":"商品订单管理"},{"child":[{"appFrontIcon":"cuIcon-list","buttons":["查看","修改","删除"],"menu":"教练预约","menuJump":"列表","tableName":"jiaolianyuyue"}],"menu":"教练预约管理"}],"frontMenu":[{"child":[{"appFrontIcon":"cuIcon-paint","buttons":["查看","查看评论","预约"],"menu":"场地信息列表","menuJump":"列表","tableName":"changdixinxi"}],"menu":"场地信息模块"},{"child":[{"appFrontIcon":"cuIcon-qrcode","buttons":["购买","查看评论","查看"],"menu":"商品信息列表","menuJump":"列表","tableName":"shangpinxinxi"}],"menu":"商品信息模块"},{"child":[{"appFrontIcon":"cuIcon-explore","buttons":["查看","查看评论","预约"],"menu":"教练信息列表","menuJump":"列表","tableName":"jiaolianxinxi"}],"menu":"教练信息模块"}],"hasBackLogin":"是","hasBackRegister":"否","hasFrontLogin":"是","hasFrontRegister":"是","roleName":"用户","tableName":"yonghu"}]


var isAuth = function (tableName,key) {
    let role = localStorage.getItem("userTable");
    let menus = menu;
    for(let i=0;i<menus.length;i++){
        if(menus[i].tableName==role){
            for(let j=0;j<menus[i].backMenu.length;j++){
                for(let k=0;k<menus[i].backMenu[j].child.length;k++){
                    if(tableName==menus[i].backMenu[j].child[k].tableName){
                        let buttons = menus[i].backMenu[j].child[k].buttons.join(',');
                        return buttons.indexOf(key) !== -1 || false
                    }
                }
            }
        }
    }
    return false;
}

var isFrontAuth = function (tableName,key) {
    let role = localStorage.getItem("userTable");
    let menus = menu;
    for(let i=0;i<menus.length;i++){
        if(menus[i].tableName==role){
            for(let j=0;j<menus[i].frontMenu.length;j++){
                for(let k=0;k<menus[i].frontMenu[j].child.length;k++){
                    if(tableName==menus[i].frontMenu[j].child[k].tableName){
                        let buttons = menus[i].frontMenu[j].child[k].buttons.join(',');
                        return buttons.indexOf(key) !== -1 || false
                    }
                }
            }
        }
    }
    return false;
}
