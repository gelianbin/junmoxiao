var user = $("#user").val();
if (user == '高级管理员') {
	// alert(user);
	var data = [ {
		id : 1,
		pid : 0,
		url : "#",
		icon : 'fa fa-home',
		name : '系统首页',
	}, {
		id : 10,
		pid : 1,
		icon : 'fa fa-angle-double-right',
		url : 'info.jsp',
		name : '首页',
	}, {
		id : 2,
		pid : 0,
		url : "#",
		icon : 'fa fa-desktop',
		name : '房间管理',
	}, {
		id : 21,
		pid : 2,
		icon : 'fa fa-angle-double-right',
		url : 'doAddHouse.do',
		name : '添加房间',
	}, {
		id : 22,
		pid : 2,
		icon : 'fa fa-angle-double-right',
		url : 'HouseList.do',
		name : '房间列表',
	}, {
		id : 23,
		pid : 2,
		icon : 'fa fa-angle-double-right',
		url : 'fBtypeList.do',
		name : '房间分类管理',
	},
	 {
		id : 24,
		pid : 2,
		icon : 'fa fa-angle-double-right',
		url : 'fBtypeList_dq.do',
		name : '地区管理',
	},{
		id : 3,
		pid : 0,
		url : "#",
		icon : 'fa fa-database',
		name : '订单管理',
	}, {
		id : 31,
		pid : 3,
		icon : 'fa fa-angle-double-right',
		url : 'orderList.do',
		name : '订单管理',
	},  {
		id : 32,
		pid : 3,
		icon : 'fa fa-angle-double-right',
		url : 'order_list_tj.jsp',
		name : '统计分析',
	},{
		id : 5,
		pid : 0,
		url : "#",
		icon : 'fa fa-cogs',
		name : '个人信息管理',
	}, {
		id : 51,
		pid : 5,
		icon : 'fa fa-angle-double-right',
		url : 'showUserInfo.do',
		name : '个人信息管理',
	}, /*{
		id : 6,
		pid : 0,
		url : "#",
		icon : 'fa fa-file-text-o',
		name : '房间排行榜',
	}, {
		id : 61,
		pid : 6,
		icon : 'fa fa-angle-double-right',
		url : 'houseList_phb.do',
		name : '房间排行榜',
	},*/ {
		id : 8,
		pid : 0,
		url : "#",
		icon : 'fa fa-user',
		name : '用户管理',
	}, {
		id : 81,
		pid : 8,
		icon : 'fa fa-angle-double-right',
		url : 'userList_qy.do',
		name : '普通管理员列表',
	}, {
		id : 82,
		pid : 8,
		icon : 'fa fa-angle-double-right',
		url : 'userList.do',
		name : '会员列表',
	}, {
		id : 7,
		pid : 0,
		url : "#",
		icon : 'fa fa-file-photo-o',
		name : '周边旅游管理',
	}, {
		id : 71,
		pid : 7,
		icon : 'fa fa-angle-double-right',
		url : 'newsList.do',
		name : '周边旅游列表',
	},{
		id : 9,
		pid : 0,
		url : "#",
		icon : 'fa fa-file-photo-o',
		name : '用户投诉反馈管理',
	}, {
		id : 91,
		pid : 9,
		icon : 'fa fa-angle-double-right',
		url : 'bbsList.do',
		name : '投诉反馈列表',
	},

	]

} else if (user == '普通管理员') {

	var data = [ {
		id : 1,
		pid : 0,
		url : "#",
		icon : 'fa fa-home',
		name : '系统首页',
	}, {
		id : 10,
		pid : 1,
		icon : 'fa fa-angle-double-right',
		url : 'info.jsp',
		name : '首页',
	}, {
		id : 2,
		pid : 0,
		url : "#",
		icon : 'fa fa-desktop',
		name : '个人信息管理',
	},
	{
		id : 22,
		pid : 2,
		icon : 'fa fa-angle-double-right',
		url : 'showUserInfo.do',
		name : '个人基本信息',
	}, {
		id : 3,
		pid : 0,
		url : "#",
		icon : 'fa fa-desktop',
		name : '房间信息',
	}, {
		id : 31,
		pid : 3,
		icon : 'fa fa-angle-double-right',
		url : 'doAddHouse.do',
		name : '添加房间',
	},{
		id : 32,
		pid : 3,
		icon : 'fa fa-angle-double-right',
		url : 'HouseList.do',
		name : '房间列表',
	}, {
		id : 5,
		pid : 0,
		url : "#",
		icon : 'fa fa-credit-card',
		name : '周边旅游管理',
	}, {
		id : 51,
		pid : 5,
		icon : 'fa fa-angle-double-right',
		url : 'newsList.do',
		name : '周边旅游列表',
	}, {
		id : 6,
		pid : 0,
		url : "#",
		icon : 'fa fa-database',
		name : '订单管理',
	}, {
		id : 61,
		pid : 6,
		icon : 'fa fa-angle-double-right',
		url : 'orderList.do',
		name : '订单管理',
	}, ]
}
