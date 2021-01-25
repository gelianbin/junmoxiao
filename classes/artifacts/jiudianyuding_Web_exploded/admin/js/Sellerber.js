$(document).ready(function(){
	//图片放大效果
(function(e) {
    function u(u) {
        function c() {
            function h(e) {
                e.show();
                n.removeClass("loading")
            }
            var t = e(this),
            r = parseInt(n.css("borderLeftWidth")),
            i = s - r * 2,
            u = o - r * 2,
            a = t.width(),
            f = t.height();
            if (a == n.width() && a <= i && f == n.height() && f <= u) {
                h(t);
                return
            }
            if (a > i || f > u) {
                var l = u < f ? u: f,
                c = i < a ? i: a;
                if (l / f <= c / a) {
                    t.width(a * l / f);
                    t.height(l)
                } else {
                    t.width(c);
                    t.height(f * c / a)
                }
            }
            n.animate({
                width: t.width(),
                height: t.height(),
                marginTop: -(t.height() / 2) - r,
                marginLeft: -(t.width() / 2) - r
            },
            200,
            function() {
                h(t)
            })
        }
        if (u) u.preventDefault();
        var a = e(this),
        f = a.attr("href");
        if (!f) return;
        var l = e(new Image).hide();
        e("#zoom .previous, #zoom .next").show();
        if (a.hasClass("zoom")) e("#zoom .previous, #zoom .next").hide();
        if (!r) {
            r = true;
            t.show();
            e("body").addClass("zoomed")
        }
        n.html(l).delay(500).addClass("loading");
        l.load(c).attr("src", f);
        i = a
    }
    function a() {
        var t = i.parent("tr").prev();
        if (t.length == 0) t = e(".gallery tr:last-child");
        t.find("a.zoomimg").trigger("click")
    }
    function f() {
        var t = i.parent("tr").next();
        if (t.length == 0) t = e(".gallery tr:first-child");
        t.children("a.zoomimg").trigger("click")
    }
    function l(s) {
        if (s) s.preventDefault();
        r = false;
        i = null;
        t.hide();
        e("body").removeClass("zoomed");
        n.empty()
    }
    function c() {
        s = e(window).width();
        o = e(window).height()
    }
    e("body").append('<div id="zoom"><a class="close"></a><a href="#previous" class="previous"></a><a href="#next" class="next"></a><div class="content loading"></div></div>');
    var t = e("#zoom").hide(),
    n = e("#zoom .content"),
    r = false,
    i = null,
    s = e(window).width(),
    o = e(window).height(); (function() {
        t.on("click",
        function(t) {
            t.preventDefault();
            if (e(t.target).attr("id") == "zoom") l()
        });
        e("#zoom .close").on("click", l);
        e("#zoom .previous").on("click", a);
        e("#zoom .next").on("click", f);
        e(document).keydown(function(e) {
            if (!i) return;
            if (e.which == 38 || e.which == 40) e.preventDefault();
            if (e.which == 27) l();
            if (e.which == 37 && !i.hasClass("zoom")) a();
            if (e.which == 39 && !i.hasClass("zoom")) f()
        });
        if (e(".gallery tr a.zoomimg").length == 1) e(".gallery tr a.zoomimg")[0].addClass("zoom");
        e(".zoom, .gallery tr a.zoomimg").on("click", u)
    })(); (function() {
        e(window).on("resize", c)
    })(); (function() {
        e(window).on("mousewheel DOMMouseScroll",
        function(e) {
            if (!i) return;
            e.stopPropagation();
            e.preventDefault();
            e.cancelBubble = false
        })
    })()
})(jQuery);
})
var accordion=function(){
	var tm =sp= 10;
	function slider(n){this.nm=n; this.arr=[]}
	slider.prototype.init=function(t,c,k){
		var a,h,s,l,i; a=document.getElementById(t); this.sl=k?k:'';
		h=a.getElementsByTagName('dt'); s=a.getElementsByTagName('dd'); this.l=h.length;
		for(i=0;i<this.l;i++){var d=h[i]; this.arr[i]=d; d.onclick=new Function(this.nm+'.pro(this)'); if(c==i){d.className=this.sl}}
		l=s.length;
		for(i=0;i<l;i++){var d=s[i]; d.mh=d.offsetHeight; if(c!=i){d.style.height=0; d.style.display='none'}}
	};
	slider.prototype.pro=function(d){
		for(var i=0;i<this.l;i++){
			var h=this.arr[i], s=h.nextSibling; s=s.nodeType!=1?s.nextSibling:s; clearInterval(s.tm);
			if((h==d&&s.style.display=='none') || (h==d&&s.style.display=='')){s.style.display=''; su(s,1); h.className=this.sl}
			else if(s.style.display==''){su(s,-1); h.className=''}
		}
	};
	function su(c,f){c.tm=setInterval(function(){sl(c,f)},tm)}
	function sl(c,f){
		var h=c.offsetHeight, m=c.mh, d=f==1?m-h:h; c.style.height=h+(Math.ceil(d/sp)*f)+'px';
		c.style.opacity=h/m; c.style.filter='alpha(opacity='+h*100/m+')';
		if(f==1&&h>=m){clearInterval(c.tm)}else if(f!=1&&h==1){c.style.display='none'; clearInterval(c.tm)}
	}
	return{slider:slider};
}();
$(document).ready(function(){
if(screen.width > 1366 && $(window).width() > 1366)
{
	window.onresize=function(){ location=location };
	$("html").addClass("Narrow");
}
else{
	window.onresize=function(){ location=location };	
	$("html").addClass("Resolution");
	}
});
//全屏显示
(function ($) {
	 "use strict";
    $.learuntab = {
   requestFullScreen: function () {
            var de = document.documentElement;
            if (de.requestFullscreen) {
                de.requestFullscreen();
            } else if (de.mozRequestFullScreen) {
                de.mozRequestFullScreen();
            } else if (de.webkitRequestFullScreen) {
                de.webkitRequestFullScreen();
            }
        },
		 exitFullscreen: function () {
            var de = document;
            if (de.exitFullscreen) {
                de.exitFullscreen();
            } else if (de.mozCancelFullScreen) {
                de.mozCancelFullScreen();
            } else if (de.webkitCancelFullScreen) {
                de.webkitCancelFullScreen();
            }
        }, 
		        refreshTab: function () {
            var currentId = $('.breadcrumb').find('.active span').attr('data-href');
            var target = $('.simei_iframe[data-href="' + currentId + '"]');
            var url = target.attr('src');
            //$.loading(true);
            target.attr('src', url).load(function () {
                //$.loading(false);
            });
        },
		     init:function () {				 
		 $('.tabReload').on('click', $.learuntab.refreshTab);
	     $('.fullscreen').on('click', function () {
                if (!$(this).attr('fullscreen')) {
                    $(this).attr('fullscreen', 'true');
                    $.learuntab.requestFullScreen();
                } else {
                    $(this).removeAttr('fullscreen');
                    $.learuntab.exitFullscreen();
                }
            });
	 },
	} ,
     $(function () {
        $.learuntab.init();
    });
})(jQuery);
      //图片上传预览    IE是用了滤镜。
        function previewImage(file)
        {
          var MAXWIDTH  = 260; 
          var MAXHEIGHT = 180;
          var div = document.getElementById('preview');
          if (file.files && file.files[0])
          {
              div.innerHTML ='<img id=imghead>';
              var img = document.getElementById('imghead');
              img.onload = function(){
                var rect = clacImgZoomParam(MAXWIDTH, MAXHEIGHT, img.offsetWidth, img.offsetHeight);
                img.width  =  rect.width;
                img.height =  rect.height;
//                 img.style.marginLeft = rect.left+'px';
                img.style.marginTop = rect.top+'px';
              }
              var reader = new FileReader();
              reader.onload = function(evt){img.src = evt.target.result;}
              reader.readAsDataURL(file.files[0]);
          }
          else //兼容IE
          {
            var sFilter='filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale,src="';
            file.select();
            var src = document.selection.createRange().text;
            div.innerHTML = '<img id=imghead>';
            var img = document.getElementById('imghead');
            img.filters.item('DXImageTransform.Microsoft.AlphaImageLoader').src = src;
            var rect = clacImgZoomParam(MAXWIDTH, MAXHEIGHT, img.offsetWidth, img.offsetHeight);
            status =('rect:'+rect.top+','+rect.left+','+rect.width+','+rect.height);
            div.innerHTML = "<div id=divhead style='width:"+rect.width+"px;height:"+rect.height+"px;margin-top:"+rect.top+"px;"+sFilter+src+"\"'></div>";
          }
        }
        function clacImgZoomParam( maxWidth, maxHeight, width, height ){
            var param = {top:0, left:0, width:width, height:height};
            if( width>maxWidth || height>maxHeight )
            {
                rateWidth = width / maxWidth;
                rateHeight = height / maxHeight;
                
                if( rateWidth > rateHeight )
                {
                    param.width =  maxWidth;
                    param.height = Math.round(height / rateWidth);
                }else
                {
                    param.width = Math.round(width / rateHeight);
                    param.height = maxHeight;
                }
            }
            
            param.left = Math.round((maxWidth - param.width) / 2);
            param.top = Math.round((maxHeight - param.height) / 2);
            return param;
 }
 /**********滚动条**********/
(function($){document.write("<script language='javascript' src='js/jquery.nicescroll.js'></script>");})(jQuery);
/*设置cookie*/
function setCookie(name, value, Days){
	if(Days == null || Days == ''){
		Days = 300;
	}
	var exp  = new Date();
	exp.setTime(exp.getTime() + Days*24*60*60*1000);
	document.cookie = name + "="+ escape (value) + "; path=/;expires=" + exp.toGMTString();
}

/*获取cookie*/
function getCookie(name) {
    var arr,reg=new RegExp("(^| )"+name+"=([^;]*)(;|$)");
    if(arr=document.cookie.match(reg))
        return unescape(arr[2]); 
    else 
        return null; 
} 
//判断当前页面是否在iframe中
if (top == this) {
    var gohome = '<div class="gohome"><a class="animated bounceInUp" href="index.html?v=4.0" title="返回首页"><i class="fa fa-home"></i></a></div>';
    $('body').append(gohome);
}

//animation.css
function animationHover(element, animation) {
    element = $(element);
    element.hover(
        function () {
            element.addClass('animated ' + animation);
        },
        function () {
            //动画完成之前移除class
            window.setTimeout(function () {
                element.removeClass('animated ' + animation);
            }, 2000);
        });
}
//字数限制
;(function($){
 $.fn.extend({  
        displayPart:function () {  
            var displayLength = 100;  
            displayLength = this.attr("displayLength") || displayLength;  
            var text = this.text();  
            if (!text) return "";  
  
            var result = "";  
            var count = 0;  
            for (var i = 0; i < displayLength; i++) {  
                var _char = text.charAt(i);  
                if (count >= displayLength)  break;  
                if (/[^x00-xff]/.test(_char))  count++;  //双字节字符，//[u4e00-u9fa5]中文  
  
                result += _char;  
                count++;  
            }  
            if (result.length < text.length) {  
                result += "...";  
            }  
            this.text(result);  
        }  
    });  
})(jQuery);
