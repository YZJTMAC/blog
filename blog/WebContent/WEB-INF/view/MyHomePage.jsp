<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
body{
background-image: url(../img/myblog_bg.jpg)
}
#div_head {
	height: 24%;
	width: 100%;
	margin-top: 1%;
	margin-left: 5%;
	font-size: 30px;
}
#div_body a{
font-size: 14px;
}
#div_body {
	height: 70%;
	width: 100%;
}

.div_body {
	float: left;
}

#div_body_left {
	height: 100%;
	width: 70%;
}

#div_body_right {
	height: 100%;
	width: 30%;
}
#a_head_tile{
text-decoration: none;
}
#div_body_left_head{
height: 10%;
width: 100%;
}
#div_body_left_head_right_1{
float: right;
text-decoration: none;
margin-top: 5px;
}
#div_body_left_head_right_2{
float: right;
text-decoration: none;
margin-top: 5px;
}
#div_body_left_head_right_3{
float: right;
text-decoration: none;
margin-top: 5px;
}
#div_body_left_head_left{
float: left;
}
#div_body_left_head_right{
float: right;
}
#div_body_left_body{
display: block;
}
li{
list-style:none;
}
.Calendar {
    font-family:Verdana;
    font-size:12px;
    background-color:#e0ecf9;
    text-align:center;
    width:200px;
    height:160px;
    padding:10px;
    line-height:1.5em;
}
.Calendar a{
    color:#1e5494;
}

.Calendar table{
width:100%;
border:0;
}

.Calendar table thead{color:#acacac;}

.Calendar table td {
    font-size: 11px;
    padding:1px;
}
#idCalendarPre{
    cursor:pointer;
    float:left;
    padding-right:5px;
}
#idCalendarNext{
    cursor:pointer;
    float:right;
    padding-right:5px;
}
#idCalendar td.onToday {
    font-weight:bold;
    color:#C60;
}
#idCalendar td.onSelect {
    font-weight:bold;
}
</style>
<script type="text/javascript">
var $ = function (id) {
    return "string" == typeof id ? document.getElementById(id) : id;
};

var Class = {
  create: function() {
    return function() {
      this.initialize.apply(this, arguments);
    }
  }
}

Object.extend = function(destination, source) {
    for (var property in source) {
        destination[property] = source[property];
    }
    return destination;
}

var Calendar = Class.create();
Calendar.prototype = {
  initialize: function(container, options) {
    this.Container = $(container);//容器(table结构)
    this.Days = [];//日期对象列表
   
    this.SetOptions(options);
   
    this.Year = this.options.Year;
    this.Month = this.options.Month;
    this.SelectDay = this.options.SelectDay ? new Date(this.options.SelectDay) : null;
    this.onSelectDay = this.options.onSelectDay;
    this.onToday = this.options.onToday;
    this.onFinish = this.options.onFinish;   
   
    this.Draw();
  },
  //设置默认属性
  SetOptions: function(options) {
    this.options = {//默认值
        Year:            new Date().getFullYear(),//显示年
        Month:            new Date().getMonth() + 1,//显示月
        SelectDay:        null,//选择日期
        onSelectDay:    function(){},//在选择日期触发
        onToday:        function(){},//在当天日期触发
        onFinish:        function(){}//日历画完后触发
    };
    Object.extend(this.options, options || {});
  },
  //上一个月
  PreMonth: function() {
    //先取得上一个月的日期对象
    var d = new Date(this.Year, this.Month - 2, 1);
    //再设置属性
    this.Year = d.getFullYear();
    this.Month = d.getMonth() + 1;
    //重新画日历
    this.Draw();
  }, 
  //下一个月
  NextMonth: function() {
    var d = new Date(this.Year, this.Month, 1);
    this.Year = d.getFullYear();
    this.Month = d.getMonth() + 1;
    this.Draw();
  },
  //画日历
  Draw: function() {
    //用来保存日期列表
    var arr = [];
    //用当月第一天在一周中的日期值作为当月离第一天的天数
    for(var i = 1, firstDay = new Date(this.Year, this.Month - 1, 1).getDay(); i <= firstDay; i++){ arr.push("&nbsp;"); }
    //用当月最后一天在一个月中的日期值作为当月的天数
    for(var i = 1, monthDay = new Date(this.Year, this.Month, 0).getDate(); i <= monthDay; i++){ arr.push(i); }
   
    var frag = document.createDocumentFragment();
   
    this.Days = [];
   
    while(arr.length > 0){
        //每个星期插入一个tr
        var row = document.createElement("tr");
        //每个星期有7天
        for(var i = 1; i <= 7; i++){
            var cell = document.createElement("td");
            cell.innerHTML = "&nbsp;";
           
            if(arr.length > 0){
                var d = arr.shift();
                cell.innerHTML = d;
                if(d > 0){
                    this.Days[d] = cell;
                    //判断是否今日
                    if(this.IsSame(new Date(this.Year, this.Month - 1, d), new Date())){ this.onToday(cell); }
                    //判断是否选择日期
                    if(this.SelectDay && this.IsSame(new Date(this.Year, this.Month - 1, d), this.SelectDay)){ this.onSelectDay(cell); }
                }
            }
            row.appendChild(cell);
        }
        frag.appendChild(row);
    }
   
    //先清空内容再插入(ie的table不能用innerHTML)
    while(this.Container.hasChildNodes()){ this.Container.removeChild(this.Container.firstChild); }
    this.Container.appendChild(frag);
   
    this.onFinish();
  },
  //判断是否同一日
  IsSame: function(d1, d2) {
    return (d1.getFullYear() == d2.getFullYear() && d1.getMonth() == d2.getMonth() && d1.getDate() == d2.getDate());
  }
};
</script>
<title>Insert title here</title>
</head>
<body>
	<div id="div_head">
		<a href="#" id="a_head_tile">麦子TMAC</a>
	</div>
	<div id="div_body">
		<div id="div_body_left" class="div_body">
			<div id="div_body_left_head">
			<div id="div_body_left_head_left">
								<a href="#" target="_blank">博客园</a> | <a href="#" target="_blank">首页</a>
					| <a href="#" target="_blank">新随笔</a> | <a target="_blank"
						href="#">联系</a> | <a 	href="#" target="_blank">管理</a>
						 | <a href="#" target="_blank">订阅</a>  
			</div>
			<div id="div_body_left_head_right">
							<a href="javascript:volid(0);" target="_blank" id="div_body_left_head_right_1" >随笔-164</a>   
							<a href="javascript:volid(0);" target="_blank" id="div_body_left_head_right_2" >文章-0</a>     
							<a href="javascript:volid(0);" target="_blank" id="div_body_left_head_right_3" >评论-0</a>          
			</div>
			</div>
			<div id="div_body_left_body">
				<h2>This is a body!</h2>
			</div>
		</div>
		
		<div id="div_body_right" class="div_body">
			<div id="div_body_right_myinfo">
				<ul>
					<li>昵称：<a>${account}</a></li>
					<li>园龄：<a>11个月</a></li>
					<li>粉丝：<a>2</a></li>
					<li>关注：<a>1</a></li>
				</ul>
			</div>
			 <div class="Calendar">
  <div id="idCalendarPre">&lt;&lt;</div>
  <div id="idCalendarNext">&gt;&gt;</div>
  <span id="idCalendarYear">2008</span>年 <span id="idCalendarMonth">8</span>月
  <table cellspacing="0">
    <thead>
      <tr>
        <td>日</td>
        <td>一</td>
        <td>二</td>
        <td>三</td>
        <td>四</td>
        <td>五</td>
        <td>六</td>
      </tr>
    </thead>
    <tbody id="idCalendar">
    </tbody>
  </table>
</div>
<script language="JavaScript">

var cale = new Calendar("idCalendar", {
    SelectDay: new Date().setDate(10),
    onSelectDay: function(o){ o.className = "onSelect"; },
    onToday: function(o){ o.className = "onToday"; },
    onFinish: function(){
        $("idCalendarYear").innerHTML = this.Year; $("idCalendarMonth").innerHTML = this.Month;
        var flag = [10,15,20];
        for(var i = 0, len = flag.length; i < len; i++){
            this.Days[flag[i]].innerHTML = "<a href='javascript:void(0);' onclick=\"alert('日期是:"+this.Year+"/"+this.Month+"/"+flag[i]+"');return false;\">" + flag[i] + "</a>";
        }
    }
});

$("idCalendarPre").onclick = function(){ cale.PreMonth(); }
$("idCalendarNext").onclick = function(){ cale.NextMonth(); }

</SCRIPT>
			  <div id="leftcontentcontainer">
				<div id="blog-sidecolumn"><div id="sidebar_search" class="sidebar-block">
<div id="sidebar_search" class="mySearch">
<h3 class="catListTitle">搜索</h3>
<div id="sidebar_search_box">
<div id="widget_my_zzk" class="div_my_zzk"><input id="q" onkeydown="return zzk_go_enter(event);" class="input_my_zzk" type="text">&nbsp;<input onclick="zzk_go()" value="找找看" id="btnZzk" class="btn_my_zzk" type="button"></div>
<div id="widget_my_google" class="div_my_zzk"><input name="google_q" id="google_q" onkeydown="return google_go_enter(event)" class="input_my_zzk" type="text">&nbsp;<input onclick="google_go()" value="谷歌搜索" class="btn_my_zzk" type="button"></div>
</div>
</div>

</div><div id="sidebar_shortcut" class="sidebar-block">
<div class="catListLink">
<h3 class="catListTitle">常用链接</h3>
<ul>
<li><a href="http://www.cnblogs.com/yzjT-mac/p/" title="我的博客的随笔列表">我的随笔</a></li><li><a href="http://www.cnblogs.com/yzjT-mac/MyComments.html" title="我发表过的评论列表">我的评论</a></li><li><a href="http://www.cnblogs.com/yzjT-mac/OtherPosts.html" title="我评论过的随笔列表">我的参与</a></li><li><a href="http://www.cnblogs.com/yzjT-mac/RecentComments.html" title="我的博客的评论列表">最新评论</a></li><li><a href="http://www.cnblogs.com/yzjT-mac/tag/" title="我的博客的标签列表">我的标签</a></li>
<li><a id="itemListLink" onclick="this.blur();WarpClass('itemListLink', 'itemListLin_con');return false;" href="#">更多链接</a></li>
</ul>
<div id="itemListLin_con" style="display:none;">
<ul>

</ul>
</div>
</div></div><div id="sidebar_toptags" class="sidebar-block">
<div class="catListTag">
<h3 class="catListTitle">我的标签</h3>
<ul>
<li><a href="http://www.cnblogs.com/yzjT-mac/tag/android/">android</a>(2)</li><li><a href="http://www.cnblogs.com/yzjT-mac/tag/andorid/">andorid</a>(1)</li><li><a href="http://www.cnblogs.com/yzjT-mac/tag/android%20perssion/">android perssion</a>(1)</li><li><a href="http://www.cnblogs.com/yzjT-mac/tag/android%E4%BE%A7%E8%BE%B9%E6%A0%8F%E5%AE%9E%E7%8E%B0/">android侧边栏实现</a>(1)</li><li><a href="http://www.cnblogs.com/yzjT-mac/tag/android%E5%AE%9E%E7%8E%B0%E4%B8%A4%E4%B8%AAactivity%E6%95%B0%E6%8D%AE%E4%BA%A4%E4%BA%92/">android实现两个activity数据交互</a>(1)</li><li><a href="http://www.cnblogs.com/yzjT-mac/tag/jdbc/">jdbc</a>(1)</li><li><a href="http://www.cnblogs.com/yzjT-mac/tag/ExpandableListView/">ExpandableListView</a>(1)</li><li><a href="http://www.cnblogs.com/yzjT-mac/tag/android%20%E5%8E%BB%E6%8E%89%E6%A0%87%E9%A2%98/">android 去掉标题</a>(1)</li>
</ul>
</div></div><div id="sidebar_categories">
<div class="catListPostCategory">
<h3 class="catListTitle">随笔分类</h3>

<ul>

<li><a id="CatList_LinkList_0_Link_0" href="http://www.cnblogs.com/yzjT-mac/category/894796.html">23设计模式(25)</a> </li>

<li><a id="CatList_LinkList_0_Link_1" href="http://www.cnblogs.com/yzjT-mac/category/881099.html">android (11)</a> </li>

<li><a id="CatList_LinkList_0_Link_2" href="http://www.cnblogs.com/yzjT-mac/category/891198.html">java web(21)</a> </li>

<li><a id="CatList_LinkList_0_Link_3" href="http://www.cnblogs.com/yzjT-mac/category/880336.html">java基础(26)</a> </li>

<li><a id="CatList_LinkList_0_Link_4" href="http://www.cnblogs.com/yzjT-mac/category/941604.html">jQuery(7)</a> </li>

<li><a id="CatList_LinkList_0_Link_5" href="http://www.cnblogs.com/yzjT-mac/category/945446.html">js(1)</a> </li>

<li><a id="CatList_LinkList_0_Link_6" href="http://www.cnblogs.com/yzjT-mac/category/926644.html">linux(13)</a> </li>

<li><a id="CatList_LinkList_0_Link_7" href="http://www.cnblogs.com/yzjT-mac/category/938416.html">Mysql(7)</a> </li>

<li><a id="CatList_LinkList_0_Link_8" href="http://www.cnblogs.com/yzjT-mac/category/906960.html">计算机基础(9)</a> </li>

<li><a id="CatList_LinkList_0_Link_9" href="http://www.cnblogs.com/yzjT-mac/category/907974.html">数据结构和算法(17)</a> </li>

</ul>

</div>

<div class="catListPostArchive">
<h3 class="catListTitle">随笔档案</h3>

<ul>

<li><a id="CatList_LinkList_1_Link_0" href="http://www.cnblogs.com/yzjT-mac/archive/2017/02.html">2017年2月 (19)</a> </li>

<li><a id="CatList_LinkList_1_Link_1" href="http://www.cnblogs.com/yzjT-mac/archive/2017/01.html">2017年1月 (40)</a> </li>

<li><a id="CatList_LinkList_1_Link_2" href="http://www.cnblogs.com/yzjT-mac/archive/2016/12.html">2016年12月 (42)</a> </li>

<li><a id="CatList_LinkList_1_Link_3" href="http://www.cnblogs.com/yzjT-mac/archive/2016/11.html">2016年11月 (18)</a> </li>

<li><a id="CatList_LinkList_1_Link_4" href="http://www.cnblogs.com/yzjT-mac/archive/2016/10.html">2016年10月 (7)</a> </li>

<li><a id="CatList_LinkList_1_Link_5" href="http://www.cnblogs.com/yzjT-mac/archive/2016/09.html">2016年9月 (22)</a> </li>

<li><a id="CatList_LinkList_1_Link_6" href="http://www.cnblogs.com/yzjT-mac/archive/2016/08.html">2016年8月 (15)</a> </li>

<li><a id="CatList_LinkList_1_Link_7" href="http://www.cnblogs.com/yzjT-mac/archive/2016/07.html">2016年7月 (1)</a> </li>

</ul>

</div>

</div><div id="sidebar_recentcomments" class="sidebar-block"><div id="recent_comments_wrap">
<div class="catListComment">
<h3 class="catListTitle">最新评论</h3>

	<div id="RecentCommentsBlock"><ul>
        <li class="recent_comment_title"><a href="http://www.cnblogs.com/yzjT-mac/p/5882655.html#3513159">1. Re:Singleton</a></li>
        <li class="recent_comment_body">博主辛苦了</li>
        <li class="recent_comment_author">--九星九紫</li>
</ul>
</div>
</div>
</div></div><div id="sidebar_topviewedposts" class="sidebar-block"><div id="topview_posts_wrap">
<div class="catListView">
<h3 class="catListTitle">阅读排行榜</h3>
	<div id="TopViewPostsBlock"><ul><li><a href="http://www.cnblogs.com/yzjT-mac/p/6022976.html">1. 关于java中接口定义常量和类定义常量的区别(2070)</a></li><li><a href="http://www.cnblogs.com/yzjT-mac/p/6227288.html">2. 装饰者模式，适配器模式，代理模式区别(496)</a></li><li><a href="http://www.cnblogs.com/yzjT-mac/p/6249686.html">3. java的原子性操作有哪些(459)</a></li><li><a href="http://www.cnblogs.com/yzjT-mac/p/6371468.html">4. Jquery ajax 与 lazyload的混合使用（实现图片异步加载）(443)</a></li><li><a href="http://www.cnblogs.com/yzjT-mac/p/6232121.html">5. 为什么抽象类不能实例化却有构造方法(365)</a></li></ul></div>
</div>
</div></div><div id="sidebar_topcommentedposts" class="sidebar-block"><div id="topfeedback_posts_wrap">
<div class="catListFeedback">
<h3 class="catListTitle">评论排行榜</h3>
	<div id="TopFeedbackPostsBlock"><ul><li><a href="http://www.cnblogs.com/yzjT-mac/p/5882655.html">1. Singleton(1)</a></li></ul></div>
</div>
</div></div><div id="sidebar_topdiggedposts" class="sidebar-block"><div id="topdigg_posts_wrap" style="display: none;">
<div class="catListView">
<h3 class="catListTitle">推荐排行榜</h3>
<div id="TopDiggPostsBlock"></div>
</div></div></div></div><script type="text/javascript">loadBlogSideColumn();</script>
			</div>
		</div>
	</div>
</body>
</html>