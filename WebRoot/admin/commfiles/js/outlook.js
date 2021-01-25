//outlook function init
var preClassName = ""; 
function list_sub_detail(Id, jiudianyuding) { 
	if(preClassName != "") { 
		getObject(preClassName).className = "left_back" 
	} 
	if(getObject(Id).className == "left_back") { 
		getObject(Id).className = "left_back_onclick"; 
		outlookbar.getbyjiudianyuding(jiudianyuding); 
		preClassName = Id 
	} 
} 

function getObject(objectId) { 
	if(document.getElementById && document.getElementById(objectId)) { 
		return document.getElementById(objectId) 
	} 
	else if(document.all && document.all(objectId)) { 
		return document.all(objectId) 
	} 
	else if(document.layers && document.layers[objectId]) { 
		return document.layers[objectId] 
	} 
	else { 
		return false 
	} 
}
 
function outlook() 
{ 
	this.titlelist = new Array(); 
	this.jiudianyudinglist = new Array(); 
	this.addtitle = addtitle; 
	this.addjiudianyuding = addjiudianyuding; 
	this.getbytitle = getbytitle; 
	this.getbyjiudianyuding = getbyjiudianyuding; 
	this.getdefaultnav = getdefaultnav;
} 

function thejiudianyuding(intitle, insort, inkey, inisdefault) 
{ 
	this.sortname = insort; 
	this.key = inkey; 
	this.title = intitle; 
	this.isdefault = inisdefault; 
} 

function addtitle(intitle, sortname, inisdefault) 
{ 
	outlookbar.jiudianyudinglist[outlookbar.titlelist.length] = new Array(); 
	outlookbar.titlelist[outlookbar.titlelist.length] = new thejiudianyuding(intitle, sortname, 0, inisdefault); 
	return(outlookbar.titlelist.length - 1) 
}

function addjiudianyuding(intitle, parentid, inkey) 
{ 
	if(parentid >= 0 && parentid <= outlookbar.titlelist.length) 
	{
		insort = "jiudianyuding_" + parentid; 
		outlookbar.jiudianyudinglist[parentid][outlookbar.jiudianyudinglist[parentid].length] = new thejiudianyuding(intitle, insort, inkey, 0); 
		return(outlookbar.jiudianyudinglist[parentid].length - 1) 
	} 
	else addjiudianyuding = - 1 
}
 
function getdefaultnav(sortname) 
{ 
	var output = ""; 
	for(i = 0; i < outlookbar.titlelist.length; i ++ ) 
	{ 
		if(outlookbar.titlelist[i].isdefault == 1 && outlookbar.titlelist[i].sortname == sortname) 
		{ 
			output += "<div class=list_tilte id=sub_sort_" + i + " onclick=\"hideorshow('sub_detail_"+i+"')\">"; 
			output += "<span>" + outlookbar.titlelist[i].title + "</span>"; 
			output += "</div>"; 
			output += "<div class=list_detail id=sub_detail_" + i + "><ul>"; 
			for(j = 0; j < outlookbar.jiudianyudinglist[i].length; j ++ ) 
			{ 
				output += "<li id=" + outlookbar.jiudianyudinglist[i][j].sortname + j + " onclick=\"changeframe('"+outlookbar.jiudianyudinglist[i][j].title+"', '"+outlookbar.titlelist[i].title+"', '"+outlookbar.jiudianyudinglist[i][j].key+"')\"><a href=#>" + outlookbar.jiudianyudinglist[i][j].title + "</a></li>" 
			} 
			output += "</ul></div>" 
		} 
	} 
	getObject('right_main_nav').innerHTML = output 
}
 
function getbytitle(sortname) 
{ 
	var output = "<ul>"; 
	for(i = 0; i < outlookbar.titlelist.length; i ++ ) 
	{ 
		if(outlookbar.titlelist[i].sortname == sortname) 
		{ 
			output += "<li id=left_nav_" + i + " onclick=\"list_sub_detail(id, '"+outlookbar.titlelist[i].title+"')\" class=left_back>" + outlookbar.titlelist[i].title + "</li>" 
		} 
	} 

	output += "</ul>"; 
	getObject('left_main_nav').innerHTML = output 
} 

function getbyjiudianyuding(jiudianyuding) 
{ 
	var output = ""; 
	for(i = 0; i < outlookbar.titlelist.length; i ++ ) 
	{ 
		if(outlookbar.titlelist[i].title == jiudianyuding) 
		{ 
			output = "<div class=list_tilte id=sub_sort_" + i + " onclick=\"hideorshow('sub_detail_"+i+"')\">"; 
			output += "<span>" + outlookbar.titlelist[i].title + "</span>"; 
			output += "</div>"; 
			output += "<div class=list_detail id=sub_detail_" + i + " style='display:block;'><ul>"; 
			for(j = 0; j < outlookbar.jiudianyudinglist[i].length; j ++ ) 
			{ 
				output += "<li id=" + outlookbar.jiudianyudinglist[i][j].sortname + "_" + j + " onclick=\"changeframe('"+outlookbar.jiudianyudinglist[i][j].title+"', '"+outlookbar.titlelist[i].title+"', '"+outlookbar.jiudianyudinglist[i][j].key+"')\"><a href=#>" + outlookbar.jiudianyudinglist[i][j].title + "</a></li>" 
			} 
			output += "</ul></div>" 
		} 
	} 
	getObject('right_main_nav').innerHTML = output 
} 


function changeframe(jiudianyuding, sortname, src) 
{ 
	if(jiudianyuding != "" && sortname != "") 
	{ 
		window.top.frames['mainFrame'].getObject('show_text').innerHTML = sortname + "&nbsp;&nbsp;<img src=/marnav/commfiles/images/slide.gif broder=0 />&nbsp;&nbsp;" + jiudianyuding 
	} 
	if(src != "") 
	{ 
		window.top.frames['manFrame'].location = src 
	} 
}
 
function hideorshow(divid) 
{ 
	subsortid = "sub_sort_" + divid.substring(11); 
	if(getObject(divid).style.display == "none") 
	{ 
		getObject(divid).style.display = "block"; 
		getObject(subsortid).className = "list_tilte" 
	} 
	else 
	{ 
		getObject(divid).style.display = "none"; 
		getObject(subsortid).className = "list_tilte_onclick" 
	} 
} 


function initinav(sortname) { 
	outlookbar.getdefaultnav(sortname); 
	outlookbar.getbytitle(sortname); 
}