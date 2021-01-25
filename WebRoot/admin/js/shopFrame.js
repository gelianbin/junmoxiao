/*!
 * jQuery Frame structure 1.2
 *
 * Copyright 2017 BKUI,
 * Simple and easy to use frame structure
 */
(function($){
"use strict";
    $.fn.frame = function(options){
		var frame = this;
        var defaults ={	
			hheight:70,//顶部高度
			bheight:30,//底部高度
			mwidth:200,//菜单栏宽度
			switchwidth:60,//切换菜单栏目宽度
			close_btn_width:25,//设置点击按钮宽度
            float :'',//位置
			treename:'.tree',
			drag:false,//启用拖动功能
			Rightclick:false,//是否启用右键功能
			minStatue: false,//显示隐藏
			logostyle:'.system_logo',//图片
			time:'',//时间
			pages:'.margin',//内页通过标签
			click_switch:'.switch',//栏目切换
			icon_unfold:'.switch_unfold',
		    prompt:'.prompt_style',
			prompt_btn:'#promptbtn',
			prompt_width:300,//消息框宽度
			color_btn:'',//框架颜色
			content:'.side_content',
		    menu_nav:'#menu_list',//栏目
			close_btn:'.close_btn', //点击隐藏
			show_btn:'.show_btn',	//点击显示		
			column_list:'.column_list',//设置栏目名称
			hover_btn:'',
			Promp:'',
			dragclass:"",//移动参数
			Scroll:"",
		    header:'.Sellerber_header',//框架顶部
			Sellerber_menu:'.list_content',//框架左侧
			Sellerber_left:'.Sellerber_left',//框架左侧
			Sellerber_bottom:'.Sellerber_bottom',//框架底部
			Sellerber_content:'.Sellerber_content',//框架内容
			page_content:'',//内容产品区
			datalist:"",//数据列表高度取值
			data:null,//数据
			mouIconOpen:"fa fa-angle-down",// 菜单
			mouIconClose:"fa fa-angle-up",  // 菜单
			Defining:function(){}
            };
		    var settings = $.extend({},defaults, options);	
            return this.each(function(){	
		   //获取对象
		   var thisBox=$(this), 
		   closeBtn=thisBox.find(settings.close_btn ), //隐藏对象
		   showbtn=thisBox.find(settings.show_btn ), //显示对象
		   colorbtn=thisBox.find(settings.color_btn ), //框架颜色选择
		   sideContent = thisBox.find(settings.content),//对象内容t
		   datetime=thisBox.find(settings.time),//设置时间
		   menutree=thisBox.find(settings.menu_nav ),
		   dragname=thisBox.find(settings.dragclass ),
		   Scrollname=thisBox.find(settings.Scroll ), 
		   Prompname=thisBox.parent().find(settings.Promp ),//提示操作
		   pagesname=thisBox.parents().find(settings.pages ),//
		   treestructure=thisBox.find(settings.treename), //树形结构树形
		   headerheight=thisBox.find(settings.header),//获取顶部高度
		   switchbtn=thisBox.find(settings.click_switch),//栏目切换属性
		   switchunfold=thisBox.find(settings.icon_unfold),//栏目切换属性3
		   leftmenu=thisBox.find(settings.Sellerber_menu),
		   promptname=thisBox.find(settings.prompt),//消息框属性
		   promptbtns=thisBox.find(settings.prompt_btn),
		   hoverbtn=thisBox.find(settings.hover_btn), 
		   hdatalist=thisBox.find(settings.datalist), //获取设置列表高度值
		   page_list=thisBox.find(settings.page_content),
		   menunav=thisBox.find(settings.mwidth_nav),//栏目对象
		   Sellerberleft=thisBox.find(settings.Sellerber_left),
		   bottomheight=thisBox.find(settings.Sellerber_bottom),//底部
		   content=thisBox.find(settings.Sellerber_content),//内容
		   columnlist = thisBox.find(settings.column_list); //获取操作对象名称
		   Sellerberleft.css("float",settings.float);
		   thisBox.css(settings.float, 0);
		   headerheight.css("height", settings.hheight); 
		   leftmenu.width(settings.mwidth);
		   Scrollname.niceScroll({
			    cursorcolor:"#888888",  
				cursoropacitymax:1,  
				touchbehavior:false,  
				cursorwidth:"5px",  
				cursorborder:"0",  
				cursorborderradius:"5px",
		   });
		   if(pagesname.size()>=1){
			  var marginheight=parseInt(pagesname.css("margin-top").replace("px",""))+parseInt(pagesname.css("margin-bottom").replace("px",""))+2;//获取设置margin上下高度值	
			  var marginwidth=parseInt(pagesname.css("margin-left").replace("px",""))+parseInt(pagesname.css("margin-right").replace("px",""))+2;//获取设置margin上下高度值
			  var totalmargin=marginheight+marginwidth;
			  thisBox.height($(window).height()-$(".same_module").outerHeight(true)-marginheight);   //获取内页高度值
			  thisBox.width($(window).width()-marginwidth);
		   }else{	
			   thisBox.height($(window).height()-$(".same_module").outerHeight(true)); //获取内页高度值
			   thisBox.width($(window).width());
		   }
		   bottomheight.height(settings.bheight).css("line-height",(settings.bheight)+"px");
		   //声明样式
			var modezt=(settings.minStatue===true)?settings.mwidth:0;
			promptname.height($(window).height()-((settings.hheight)+(settings.bheight))).css({"top":(settings.hheight),"right":-(settings.prompt_width),"width":(settings.prompt_width),"z-index":99999}); //消息框 
			//消息框点击事件处理
			if($("#page_style").length>0){
					if($(".same_module").size()>=1){
						leftmenu.height($(window).height()-$(".same_module").outerHeight(true)-30); 
					}else{
						 (pagesname.size()>=1)?leftmenu.height($(window).height()-30):leftmenu.height($(window).height()); 	
					}
				}else{
					leftmenu.height($(window).height()-((settings.hheight)+(settings.bheight))); 
			}
			function columnname(){
			   columnlist.height($(window).height()-((settings.hheight)+(settings.bheight))-$(".switch_style").height()-$(".skin_select").height()).niceScroll({
			    cursorcolor:"#888888",  
				cursoropacitymax:1,  
				touchbehavior:false,  
				cursorwidth:"5px",  
				cursorborder:"0",  
				cursorborderradius:"5px",
		   });
			 page_list.css({
				 "width":thisBox.width()-(modezt)-(modezt!=0?1:0),
				 "height":leftmenu.height(),
				 "position":"relative",
				 "float":"left"
			 });					
			}
			//消息框设置
			$(this).on('click',function(e) {
				var target = $(e.target);
				if(target.is(settings.prompt_btn)){ 
					if(promptbtns.hasClass("promptclose")){
				         promptname.animate({"right":-(settings.prompt_width),"display":"none"});
						 promptbtns.removeClass("promptclose");
					}
				else{
					 promptname.css({"display":"block"}).animate({"right":0,},500);
				     promptbtns.addClass("promptclose");	
					}
				}
				if(!target.is(settings.prompt_btn) ){
				   promptname.animate({"right":-(settings.prompt_width),"display":"none"});
				   promptbtns.removeClass("promptclose");
				}		
			});
		    columnname();//获取栏目高度,并设置滚动条样式
			//判断栏目显示方位，栏目显示在左侧
			if(Sellerberleft.css("float")==="left"){
			Sellerberleft.find(".side_title span").css("right",0);
			Sellerberleft.find(".show_btn span").css("left",0);
			content.height($(window).height()-((settings.hheight)+(settings.bheight))).css({"width":$(window).width()-(settings.mwidth),"margin-top":settings.hheight,"margin-left":settings.mwidth,"position":"relative"});
			}
				//判断栏目显示方位，栏目显示在右侧
			if(Sellerberleft.css("float")==="right"){
			Sellerberleft.find(".side_title span").css("left",-(settings.close_btn_width));
			Sellerberleft.find(".show_btn span").css({"right":(settings.close_btn_width),"background-position":-72});
			content.height($(window).height()-((settings.hheight)+(settings.bheight))).css({"width":$(window).width()-(settings.mwidth),"margin-top":settings.hheight,"margin-right":settings.mwidth,"position":"relative"});
			}
			treestructure.css({"height":$(leftmenu).height()-$(".column_title").height()}).niceScroll({
			    cursorcolor:"#21A237",  
				cursoropacitymax:1,  
				touchbehavior:false,  
				cursorwidth:"5px",  
				cursorborder:"0",  
				cursorborderradius:"5px",
		   });	
			//设置树状图高度并设置滚动
				 var modules=thisBox.parent().find(".same_module").outerHeight(true);//获得高度
				function cssheight(){
					hdatalist.css({"height":$(thisBox).height()-(heightsearchs),"overflow":"hidden"}).niceScroll({
						cursorcolor:"#dddddd",  
						cursoropacitymax:1,  
						touchbehavior:false,  
						cursorwidth:"3px",  
						cursorborder:"0",  
						cursorborderradius:"3px",});
				}  
				  if(hdatalist.find("table").hasClass('table_list')){
					 var heightsearchs=thisBox.find(".searchs_style,.same_module").outerHeight()+45;
					  cssheight();
				  }
			  else{
				     var heightsearchs=thisBox.find(".searchs_style,.same_module").outerHeight();
			     	cssheight();
			  }
			Prompname.bind("click",function(){
				$(".Promp_plate").stop(true, true).delay(0).remove();
				thisBox.height($(window).height()-$(".same_module").outerHeight(true)-30); 
				cssheight();
			});
				//设置获取列表高度，并设置滚动条
			if(settings.mwidth >=50 && settings.mwidth <=100){
			switchbtn.parent().css("display","none");
			Sellerberleft.addClass("switch_menu");
			switchbtn.css("display","none");
			menustyle(); 
			}
			//当栏目宽度发生改变时
			function menustyle(){
			 switchunfold.css("display","block");
		     leftmenu.stop(true, true).delay(0).animate({ width:+(settings.switchwidth)+'px'},"fast").css("display","block");
				if(Sellerberleft.css("float")==="left"){
				    content.animate({"margin-left":(settings.switchwidth),"width":$(window).width()-(settings.switchwidth)});
					columnlist.find(".submenu").css("left",settings.switchwidth);
				}
				if(Sellerberleft.css("float")==="right"){
					 content.animate({"margin-right":(settings.switchwidth),"width":$(window).width()-(settings.switchwidth)});
					columnlist.find(".submenu").css("right",settings.switchwidth);
				}
			 Sellerberleft.find(".menu_style").removeAttr("id").removeAttr("style");
			}		
		   //当窗口发生改变是触发
			 $(window).resize(function(){
				 
			   leftmenu.height($(window).height()-((settings.hheight)+(settings.bheight)));//高度值变化
				 //当窗口发生改变栏目显示方位
				 if(Sellerberleft.css("float")==="left"){
					  content.height($(window).height()-((settings.hheight)+(settings.bheight))).css({"width":$(window).width()-(settings.mwidth),"margin-top":settings.hheight,"margin-left":settings.mwidth,"position":"relative"}); 	 
				 }
			     if(Sellerberleft.css("float")==="right"){
					content.height($(window).height()-((settings.hheight)+(settings.bheight))).css({"width":$(window).width()-(settings.mwidth),"margin-top":settings.hheight,"margin-right":settings.mwidth,"position":"relative"});   
				 } 
                 columnname();
			 });
		   //隐藏对象点击事件
			closeBtn.bind("click",function(){		
			  leftmenu.stop(true, true).delay(0).animate({ width:+(0)+'px'},"fast").css("display","none");
			  showbtn.stop(true, true).delay(0).animate({ width:+(settings.close_btn_width)+'px'},"fast").css("display","block");
				if(Sellerberleft.css("float")==="left"){
					 content.css({"margin-left":0,"width":$(window).width()});	
				}
				if(Sellerberleft.css("float")==="right"){
					content.css({"margin-right":0,"width":$(window).width()});	
				}
			  page_list.css({"margin-left":0,"width":thisBox.width()});
				if($("#page_style").length>0){	
					(leftmenu.width()>100)?hdatalist.find("table").removeAttr("style"):hdatalist.find("table").css("width","1540px");
				}
			});
				//设置默认显示模式
			 function statuekj(){
				 content.height($(window).height()-((settings.hheight)+(settings.bheight))).css({"width":$(window).width(),"margin-top":settings.hheight,"margin-left":0,"position":"relative"});
			 }
			 settings.Defining(thisBox,settings);
			if(settings.minStatue===true){
				$(settings.show_btn ).css("float", settings.float);				
				sideContent.css('width', 0);			
				showbtn.css('width', (settings.close_btn_width));	
			    switchbtn.parent().css("display","block");
			}
			if(settings.minStatue===false){
				leftmenu.css({"width":0,"display":"none"});	
			    showbtn.css({"display":"block"});
				switchbtn.parent().css("display","none");
				statuekj();
				 $(window).resize(function(){
				statuekj();
				 });
			} 
			//获得选项卡栏目         
            hoverbtn.hover(function(){
			$(this).addClass("hover");	
		     },function(){
			$(this).removeClass("hover");  
		     }); 	
				
				Sellerberleft.hover( function(){
				var menuwidth=leftmenu.width();
			    if(menuwidth===settings.mwidth){
				 $(this).addClass("display_btn");	
				 $(this).find(".close_btn span").css("display","block");		
				}else{
				$(this).removeClass("display_btn");
		     	$(this).find(".close_btn span").css("display","none");	
				 }
			   },function(){
				$(this).removeClass("display_btn");
				$(this).find(".close_btn span").css("display","none");
			});			
			//显示点击事件
			showbtn.bind("click",function(){
			$(this).animate({width: '0px',border:'1px solid #ddd'},"fast").css('display','none');				
			leftmenu.stop(true, true).delay(0).animate({ width:+(settings.mwidth)+'px'},"fast").css("display","block");
			if(Sellerberleft.css("float")==="left"){
				content.css({"margin-left":settings.mwidth,"width":$(window).width()-(settings.mwidth)});
			}
			if(Sellerberleft.css("float")==="right"){
				content.css({"margin-right":settings.mwidth,"width":$(window).width()-(settings.mwidth)});
			}
		    page_list.css({"width":$(thisBox).width()-(settings.mwidth)-1,"position":"relative","float":"left"}); 
			content.removeClass("full_screen");		
				//设置数量显示宽度。
			if(leftmenu.width()===0){
				hdatalist.find("table").animate({
					width:$(window).outerWidth()-(settings.mwidth)-totalmargin},500);
			}
			});	
			//栏目切换点击事件
			switchbtn.bind("click",function(){
			 Sellerberleft.addClass("switch_menu");
			 $(this).css("display","none");	
		      menustyle();
			});			
		    switchunfold.bind("click",function(){
			   Sellerberleft.removeClass("switch_menu");
			   $(this).css("display","none");	
			   switchbtn.css("display","block");
				if(Sellerberleft.css("float")==="left"){
					content.css({"margin-left":settings.mwidth,"width":$(window).width()-(settings.mwidth)});
					columnlist.find(".submenu").removeClass("area_right").css("left","0");
				}
				if(Sellerberleft.css("float")==="right"){
					content.css({"margin-right":settings.mwidth,"width":$(window).width()-(settings.mwidth)});
					columnlist.find(".submenu").removeClass("area_left").css("right","0");
				}
		       page_list.css({"width":$(thisBox).width()-(settings.mwidth),"position":"relative","float":"left"}); 
			   leftmenu.stop(true, true).delay(0).animate({ width:+(settings.mwidth)+'px'},"fast").css("display","block");	
			});
			if($('.table th').size() >6){
				$.each($('.table th:gt(6)'),function(){
				      var menuwidth=leftmenu.width();
					  var tablewidth=hdatalist.find("table").css({"width":$(window).outerWidth()+settings.mwidth});
					if(menuwidth===settings.mwidth){
						if($(thisBox).width() < 1024){
						   return tablewidth;
						}
						else{
							 hdatalist.find("table").css({"width":$(window).outerWidth()-leftmenu.outerWidth()-totalmargin});
						}
				   }
				  else{
						if($(thisBox).width() < 1024){
						 return  tablewidth;
						}
						else{
							 hdatalist.find("table").css({"width":$(window).outerWidth()-totalmargin});
						}
				 }
				}); 
			 }else{
				 hdatalist.find("table").removeAttr("style");
			 }
		    //设置时间显示
				  function currentTime(){ 
				   var weekday=new Array(7);
					weekday[0]="星期一";
					weekday[1]="星期二";
					weekday[2]="星期三";
					weekday[3]="星期四";
					weekday[4]="星期五";
					weekday[5]="星期六";
					weekday[6]="星期日";	
					var d=new Date(),
					str='';
				    str+='<div class="time_display clearfix">';
					str+='<span class="h com-time ">'+d.getHours()+'</span>'+'<b class="">：</b>'; 
					str+='<span class="m com-time ">'+d.getMinutes()+'</span>'+'<b class="">：</b>'; 
					str+='<span class="s com-time ">'+d.getSeconds()+'</span></div>';		
					str+='<div class="date_display clearfix"><div class="years"><span>AD'+d.getFullYear()+'年'+'</span>'; 
					str+='<span>'+d.getMonth() + 1+'月'+'</span></div>'; 
					str+='<div class="day">'+d.getDate()+'</div>';
					str+='<div>'+weekday[d.getDay()-1]+'</div></div>';  
					return str; 
				}
				setInterval(function(){$(datetime).html(currentTime());},1000); 
			 //判断高度切换样式
		     if(settings.hheight===0){
				$(headerheight).find('.header').remove();
				leftmenu.prepend('<div class="system_logo"><img src="'+(settings.logo_img)+'"></div></div>');
			    leftmenu.prepend('<div class="user_operating"><a class="btn_dropout" href="javascript:void(0)"  id="Exit_system"><i class="fa  fa-close"></i><em>退出系统</em></a><a href="javascript:void(0)" class="btn_usernfo"><i class="fa fa-user"></i><em>个人信息</em></a></div>');
			 }
		   //设置拖动水平拖拽
				function drag_drop(){
				var range = { x: 0, y: 0 };//鼠标元素偏移量 
				var lastPos = { x: 0, y: 0, x1: 0, y1: 0 }; //拖拽对象的四个坐标 
				var tarPos = { x: 0, y: 0, x1: 0, y1: 0 }; //目标元素对象的坐标初始化 
				var theDiv = null, move = false, choose = false; //拖拽对象 拖拽状态 选中状态
				var theDivId =0,  theDivHalf = 0;//拖拽对象的索引、高度、的初始化。 
				var tarDiv = null, tarFirst, tempDiv; //要插入的目标元素的对象, 临时的虚线对象 
				var initPos = {x: 0, y: 0};
				dragname.each(function(){ 
					  $(this).mousedown(function (event){ 
					  choose = true;
					  //拖拽对象 
					  theDiv = $(this); 
					  //记录拖拽元素初始位置
					  initPos.x =theDiv.offset().left;
					  initPos.y =theDiv.offset().top;
					  //鼠标元素相对偏移量 
					  range.x = event.pageX-initPos.x; 
					  range.y = event.pageY-initPos.y; 
					  theDivId = theDiv.index(); 
					  theDivHalf = (theDiv.width())/2; 
					  theDiv.attr("class","moveBar"); 
					  theDiv.css({left: initPos.x + 'px',top: initPos.y + 'px'}); 
					   // 创建新元素 插入拖拽元素之前的位置(虚线框) 
					  $("<div class='dash'></div>").insertBefore(theDiv); 
					  tempDiv = $(".dash");
					  });
					 });
					$(document).mouseup(function() { 
					if(!choose){return false;}
					  if(!move){
				   theDiv.attr("class", "menu_operation");
			 	  	  tempDiv.remove(); // 删除新建的虚线div
					  choose = false;
					   return false;
					  }
					theDiv.insertBefore(tempDiv); // 拖拽元素插入到 虚线div的位置上 
					theDiv.attr("class", "menu_operation"); //恢复对象的初始样式 
					tempDiv.remove(); // 删除新建的虚线div 
					move = false;
					choose = false;
					  }).mousemove(function(event){ 
					 if(!choose){return false;}
					  move = true;
					lastPos.x = event.pageX - range.x; 
					lastPos.y = event.pageY - range.y; 
					lastPos.x1 = lastPos.x + theDiv.width(); 
					// 拖拽元素随鼠标移动 
					theDiv.css({left: lastPos.x + 'px',top: lastPos.y + 'px'}); 
					// 拖拽元素随鼠标移动 查找插入目标元素 
					var $main =$(settings.dragclass); // 局部变量：按照重新排列过的顺序 再次获取 各个元素的坐标， 
					$main.each(function () { 
					  tarDiv = $(this); 
					  tarPos.x = tarDiv.offset().left;
					  tarPos.y = tarDiv.offset().top; 
					  tarPos.x1 = tarPos.x + tarDiv.width()/2; 
					  tarFirst = $main.eq(0); // 获得第一个元素 
					  var tarFirstX = tarFirst.offset().left + theDivHalf ; // 第一个元素对象的中心纵坐标 
					  //拖拽对象 移动到第一个位置 
					  if (lastPos.x <= tarFirstX) { 
					  tempDiv.insertBefore(tarFirst); 
					  } 
					  //判断要插入目标元素的 坐标后， 直接插入 
					  if (lastPos.x >= tarPos.x - theDivHalf && lastPos.x1 >= tarPos.x1 ) { 
					  tempDiv.insertAfter(tarDiv); 
					  } 
					  }); 
					  });
				}
				drag_drop();
		//右键功能模块		
		if(settings.Rightclick===true){
			  $(document).on('contextmenu',thisBox,function (e) {
                  e.preventDefault();
                  e.stopPropagation();
                   });//禁用右键功能
		}else{
			
		}	
		$('#js-tabNav-next').click(function(){
			num===oUl.find('li').length-1?num=oUl.find('li').length-1:num++;
			toNavPos();
		});
		$('#js-tabNav-prev').click(function(){
			num===0?num=0:num--;
			toNavPos();
		});
		//树形
		function toNavPos(){
			oUl.stop().animate({'left':-num*100},100);
			}	
			/*换肤*/
		        var li=colorbtn.find('a');
				li.on('click',function(){
					var v = $(this).attr("data-val");
					colorbtn.find('a').removeClass("selected");
				   $(this).addClass("selected");				
		          $.cookie("MYCssSkin",v,{path:'/',expires:10}); 
				  $("#skin").attr("href","skin/"+v+"/skin.css");				  
					});
					var cookie_skin=$.cookie("MyCssSkin");
				  if(cookie_skin){switchskin(cookie_skin)};
					
				   headerheight.find('.administrator').on('click',function(){					   
				   if($(this).hasClass("open")){
						$(this).removeClass("open");
						$("body").removeClass("big-page");
						$(this).find('i.glyph-icon').attr("class","glyph-icon fa fa-caret-down");
					}else{
						$(this).addClass("open");
						$(this).find('i.glyph-icon').attr("class","glyph-icon fa  fa-caret-up");
						$("body").addClass("big-page");			
					}
			    });				   
				   /*获取顶部选项卡总长度*/
			  function tabNavallwidth(){
				  var topWindow=$(window.parent.document);
				  var taballwidth=0,
					  $tabNav = topWindow.find(".breadcrumb"),
					  $tabNavWp = topWindow.find(".breadcrumbs"),
					  $tabNavitem = topWindow.find(".breadcrumb li"),
					  $tabNavmore =$(".Hui-tabNav-more");
				  if(!$tabNav[0]){return}
				  $tabNavitem.each(function(index, element){
					  taballwidth+=Number(parseFloat($(this).width()+60));
				  });
				  $tabNav.width(taballwidth+25);
				  var w = $tabNavWp.width();
				  if(taballwidth+25>w){
					  $tabNavmore.show();
				  }
				  else{
					  $tabNavmore.hide();
					  $tabNav.css({left:0});
				  }
			  }
		/*选项卡导航*/	
		$(document).on('click',columnlist,function(){	
				    $(this).on('click','.submenu li a',function(){
				if($(this).attr('name')){
				  var bStop=false;
				  var bStopIndex=0;
				  var _href=$(this).attr('name');
				  var _titleName=$(this).text();
				  var topWindow=$(window.parent.document);
				  var show_navLi=topWindow.find("#min_title_list li,#dropdown_menu li");
				  show_navLi.each(function() {
					  if($(this).find('span').attr("data-href")===_href){
						  bStop=true;
						  bStopIndex=show_navLi.index($(this));
						  return false;
					  }
				  });
				  if(!bStop){  
					  creatIframe(_href,_titleName);
					  min_titleList();
				  }
				  else{
					  show_navLi.removeClass("active").eq(bStopIndex).addClass("active");
					  var iframe_box=topWindow.find("#iframe_box");
					  iframe_box.find(".show_iframe").hide().eq(bStopIndex).show().find("iframe").attr({"src":_href,"data-href":_href});
				  }
			  }
			});
		  });
		 $(columnlist).find('.submenu li.home').on('click',function(){ $(columnlist).find('.submenu li.home').removeClass('active'); $(this).addClass('active');});			
		//初始化事件
		  var treeView=frame.find(menutree);//获取执行的对象 
		  var fileData = (settings.data);//获取数据
		  var JSONTreeArr = proJSON(fileData,0);
		  treeView.html=menuHtml(JSONTreeArr);
		  var munlist=treeView.html;
		  var template=munlist; 	
		//生成树形JSON数据
		function proJSON(oldArr, pid){
				var newArr = [];
			     if(oldArr===null){	
					 return false;
				 }
		        else{
					oldArr.map(function(item) {
					if(item.pid === pid) {
						var obj = {
							id: item.id,
							name: item.name,
							icon:item.icon,
							url:item.url
						};
						var child =proJSON(oldArr, item.id);
						if(child.length > 0) {
							obj.child = child;
						}
						newArr.push(obj);
					}
				});   
		       }
				return newArr;
			}
		   function menuHtml(data) {
				var ulHtml = "";
			  if(data===false){
				  return false;
			  }else{
					data.map(function(item) {
					var lihtml = "<li>";
					if(item.child && item.child.length > 0) {
						lihtml += "<a href='javascript:void(0)' ischek='false' class='menuUl_title' name='" + item.url + "' title='"+item.name+"'><i ischek='false' class='" + item.icon + "'></i>" +
							"<span id='" + item.id + "' class='menu-text'>" + item.name + "</span><i ischek='false' class='arrow "+ settings.mouIconOpen + "'></i></a>";
						var _ul =menuHtml(item.child);
						lihtml +="<ul class='submenu'>"+ _ul + "</ul></li>";
					} else {
						lihtml += "<a href='javascript:void(0)' name='" + item.url + "' title='"+item.name+"' class='name menuUl_title' data-name='" + item.id + "'><i class='" + item.icon + "'></i>"+ "<span id='" + item.id + "' class='menu-text'>" +item.name + "</span></a>";
					}
					ulHtml += lihtml;
				}); 
			  }
		    	ulHtml += "";
				return ulHtml;	
			}
		   function bindEvent() {
				var column= frame.find(menutree).append(template);  
				frame.find(".menuUl li a").on("click",function() {
			        var labeul =$(this).closest("li").find(">ul");
					var parent = $(this).parent().parent();	 
					var ischek = $(this).attr("ischek");
					var menuUl = $(this).closest("li").children(".submenu");
				    if(ischek === 'false'){
						parent.find('ul').slideUp(300);
						parent.find("li").removeClass("open");
						parent.find("li i").attr("ischek", 'false');
						parent.find("li .arrow").removeClass(settings.mouIconClose).addClass(settings.mouIconOpen);
						$(this).find(".arrow").removeClass(settings.mouIconOpen).addClass(settings.mouIconClose);
						$(this).attr("ischek", 'true');
						$(this).closest("li").addClass("open").find(labeul).slideDown(300);
					}
					else if(ischek === 'true'){
						$(this).closest("li").removeClass("open");
						$(this).find(".arrow").removeClass(settings.mouIconClose).addClass(settings.mouIconOpen);
						menuUl.slideUp(300);
						$(this).attr("ischek", 'false');
					} 
				});
				return column;
			}
            bindEvent();
	    if(settings.mwidth >=50 && settings.mwidth <=100){
		     columnlist.find(".submenu").css("left",settings.mwidth); //当菜单栏的宽度为设置宽度设置样式
		}
		function min_titleList(){
		var topWindow=$(window.parent.document);
		var show_nav=topWindow.find("#min_title_list,#dropdown_menu");
		var aLi=show_nav.find("li");
	    }
		  function creatIframe(href,titleName){
			  var topWindow=$(window.parent.document);
			  var show_nav=topWindow.find('#min_title_list');
			  var id_name=$(".show_iframe").each(function(i){$(this).attr('id',"Sort_link_"+i);$(this).addClass("selected")});
			  show_nav.find('li').removeClass("active");
			  var iframe_box=topWindow.find('#iframe_box');
			  show_nav.append('<li class="active name"><span data-href="'+href+'">'+titleName+'</span><em class="close_icon"></em></li>');
			  tabNavallwidth();
			  var iframeBox=iframe_box.find('.show_iframe');
			  iframeBox.hide().addClass("selected");
			  iframe_box.append('<div class="show_iframe" date-id="'+id_name+'"><div class="loading"></div><iframe class="simei_iframe" frameborder="0" src='+href+' data-href='+href +'></iframe></div>');
			  var showBox=iframe_box.find('.show_iframe:visible');
			  showBox.find('iframe').attr("src",href).load(function(){
				  showBox.find('.loading').hide();
			  });
		  }
		  var num=0;
		  var oUl=$("#min_title_list");
		  var hide_nav=menunav;
		  $(document).on("click","#min_title_list li",function(){
			  var bStopIndex=$(this).index();
			  var iframe_box=$("#iframe_box");
			  $("#min_title_list li").removeClass("active").eq(bStopIndex).addClass("active");
			  iframe_box.find(".show_iframe").hide().removeClass("selected").eq(bStopIndex).show().addClass("selected");
		  });
		  $(document).on("click","#min_title_list li em.close_icon",function(){
			  var aCloseIndex=$(this).parents("li").index();
			  $(this).parent().remove();
			  $('#iframe_box').find('.show_iframe').eq(aCloseIndex).remove();	
			  num==0?num=0:num--;
			  tabNavallwidth();
		  });
		   $(document).on("click","#dropdown_menu .tabCloseCurrent", function () {       		
			 var aCloseIndex=$("#breadcrumbs .breadcrumb>li.active").index();//获取当前栏目为第几个
			 $("#breadcrumbs").find(' .breadcrumb_style .breadcrumb>li.active').remove();//关闭当前栏目
			 $("#iframe_box").find('.show_iframe').eq(aCloseIndex).remove();//关闭当前页iframe
			 $("#breadcrumbs").find(' .breadcrumb_style .breadcrumb>li').siblings("li:last").addClass("active");  //删除当前栏目并赋值给最后一个样式class
			 $("#iframe_box").find('.show_iframe').css("display","block");				 
			  num==0?num=0:num--;
			  tabNavallwidth();										  	   
          });
		  //关闭打开的栏目以外的栏目
		  $(document).on("click","#dropdown_menu .tabCloseOther", function () {
		   var aCloseIndex=$("#breadcrumbs .breadcrumb>li.active").index();//获取当前栏目为第几个   
		   var iframeindex=$("#breadcrumbs .breadcrumb>li").length;
			  $("#breadcrumbs").find(' .breadcrumb_style .breadcrumb>li').not(".active,.home").remove();//关闭打开栏目以外的栏目（除首页）	  
			  $("#iframe_box").find('.show_iframe').not(".selected,.index_home").remove();  			  
		    num==0?num=0:num--;
	        tabNavallwidth();	
		  });
		  //除首页以外全部关闭
		     $(document).on("click","#dropdown_menu .tabCloseAll", function () {  
			  var $tabCloseAll=$("#breadcrumbs .breadcrumb li");
			  if($tabCloseAll.not(".name").length){	
			   $($tabCloseAll).not(".home").remove();//关闭除首页以外的全部栏目			
			   $("#iframe_box").find('.show_iframe').not("#Sort_link_0").remove();//关闭除首页以外的全部栏目	
			   $("#breadcrumbs").find('.breadcrumb_style .breadcrumb>li').addClass("active") ; 
			   $("#iframe_box").find('.show_iframe').css("display","block");			 
				num==0?num=0:num--;
			    tabNavallwidth();	
			 }   													  	   
          });
		  $(document).on("dblclick","#min_title_list li",function(){
			  var aCloseIndex=$(this).index();
			  var iframe_box=$("#iframe_box");
			  if(aCloseIndex>0){
				  $(this).remove();
				  $('#iframe_box').find('.show_iframe').eq(aCloseIndex).remove();	
				  num==0?num=0:num--;
				  $("#min_title_list li").removeClass("active").eq(aCloseIndex-1).addClass("active");
				  iframe_box.find(".show_iframe").hide().eq(aCloseIndex-1).show();
				  tabNavallwidth();
			  }else{
				  return false;
			  }
		  });
		  tabNavallwidth();
		});
     };
})(jQuery);

