<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title></title>



<script type="text/javascript" src="layui/layui.js"></script>
<link rel="stylesheet" href="layui/css/layui.css" media="all">
<script type="text/javascript" src="js/jquery-3.3.1.js"></script>

<link rel="stylesheet" href="css/daydayup.css" />
<link rel="stylesheet" href="css/loginregister.css" />
<link rel="stylesheet" href="css/common.css" />
<script>
	$(function() {
		$("#menu a").each(function(index, ele) {
			$(ele).bind("mouseover", function() {
				$("#menu a[class='menu-item']").removeClass();//已经有menu-item的移除
				$(ele).toggleClass("menu-item");
			});
		});

		
	});
</script>
</head>
<body>
	<!-- 标识，如果没有登录，而直接通过url地址栏访问我要提问按钮，就会自动跳转到首页，
		不能直接访问，并且提示让你去登录
	 -->
	<span id="logstatus" status="${requestScope.sf }"></span>
	
	<header>
		<div id="headerbar">
			<ul id="navigation">
			
				<li><a href="javascript:void(0);">首页</a></li>
				
				<!-- <li><a href="#">问答</a></li> -->
			</ul>
			
			<c:choose>
				<c:when test="${empty sessionScope.user }">
					<ul id="log">
						<li><a href="javascript:void(0);" id="loglink">登录</a></li><li><span></span></li><li><a href="javascript:void(0);" id="registerlink">注册</a></li>
					</ul>
				</c:when>
				<c:otherwise>
					<ul id="log">
						<li><a href="javascript:void(0);" id="userinfo">欢迎 ：${sessionScope.user.name }</a></li><li><span></span></li><li><a href="javascript:void(0);" id="exitlink">退出</a></li>
					</ul>
				</c:otherwise>
			</c:choose>
			
			
			
		</div>
	</header>
	<section id="title">
		<div id="titlebar">
			<div id="leftquestion">
				<a href="javascript:void(0);">我要提问</a>
			</div>
			<div id="rightquestion">
				<input type="text" placeholder="请输入问题标题进行查询" /> <a href="#"><img
					src="img/ic_search.svg" /></a>
			</div>
		</div>
	</section>
	
	<section id="main">
		<section id="content">
		
			<div id="headlist">
				<div id="menu">
					<a href="javascript:void(0);" class="menu-item">技术问答</a> <a href="javascript:void(0);">面试题</a> <a
						href="javascript:void(0);">即时问答</a>
				</div>
				<div id="order">
					<span>排列:</span> <a href="javascript:void(0);">最新提问</a> <a href="javascript:void(0);">尚未回答</a> <a
						href="javascript:void(0);">热门</a>
				</div>
			</div>
			
		</section>
		
		<aside id="tagList">
			<h4>所有标签：</h4>
			
		</aside>
		
		
	</section>




<!--注册div开始-->
<div id="register" style="display:none">
	<form class="layui-form" action="" lay-filter="regisForm">
		<div class="layui-form-item">
			<label class="layui-form-label">账号</label>
			<div class="layui-input-inline">
				<input type="text" name="userId" lay-verify="required|phone"
					placeholder="手机号" autocomplete="off" class="layui-input">
			</div>
		</div>
		
		<div class="layui-form-item">
			<label class="layui-form-label">姓名</label>
			<div class="layui-input-inline">
				<input type="text" name="userName" lay-verify="required"
					placeholder="输入姓名" autocomplete="off" class="layui-input">
			</div>
		</div>
		

		<div class="layui-form-item">
			<label class="layui-form-label">密码</label>
			<div class="layui-input-inline">
				<input type="password" name="passwd" lay-verify="required|pass"
					placeholder="6-12位密码" autocomplete="off" class="layui-input"
					id="passwd">
			</div>
		</div>


		<div class="layui-form-item">
			<label class="layui-form-label">密码确认</label>
			<div class="layui-input-inline">
				<input type="password" name="passwdAgin" lay-verify="required|passAgin"
					placeholder="密码确认" autocomplete="off" class="layui-input">
			</div>

		</div>


		<div class="layui-form-item" id="submitBtn">
			<div class="layui-input-block">
				<button class="layui-btn" lay-submit lay-filter="regis">注册</button>
				<button type="reset" class="layui-btn layui-btn-primary">重置</button>
			</div>
		</div>
		
		<input name="method" value="addUser" type="text" hidden />
	</form>

</div>

<script>
	$(function() {
		
		layui.use('layer', function() {
			var layer = layui.layer;
			$("#registerlink").bind("click", function() {
				layer.open({
					type : 1,
					title : '注册',
					//skin: 'layui-layer-rim', //加上边框
					area : [ '398px', '345px' ], //宽高:398,282;
					//content: $('#sublayer'),//content: $('#sublayer').html()会丢失事件
					//resize : false,
					content : $("#register"),
					closeBtn : 1,
				});
			});
			
			
		});
		
		
		layui.use('form', function() {
			var form = layui.form;
			
			
			
			//各种基于事件的操作，下面会有进一步介绍
			form.on('submit(regis)', function(data) {

				//关闭所有的弹出层，当注册成功后会关闭弹出层
				//layer.closeAll();
				
				//layer.msg("222");
				var ii = layer.load();
				$.post("<c:url value='/UserServlet'></c:url>",data.field,function(result){
					layer.close(ii);
					if(result.flag == 1){
						layer.msg("注册成功",{time:1000});
						
						setTimeout(function(){
							form.val("regisForm",{
								"userId":"",
								"userName":"",
								"passwd":"",
								"passwdAgin":""
							});
							layer.closeAll();
						},1000);
						
					}else if(result.flag == 0){
						layer.msg("用户已存在",{time:1000});
					}
					
				},"json");

				return false;
				
				
			});

			//自定义的表单验证
			form.verify({
				passAgin : function(value, item) { //value：表单的值、item：表单的DOM对象
					if (value != $("#passwd").val()) {
						return '两次密码不一致';
					}
				}

				//我们既支持上述函数式的方式，也支持下述数组的形式
				//数组的两个值分别代表：[正则匹配、匹配不符时的提示文字]
				,
				pass : [ /^[\S]{6,12}$/, '密码必须6到12位，且不能出现空格' ]
			});

		});

		
		
		
	});
</script>

<!--注册div结束-->
	
	
	
	

<!--登录div开始-->
<div class="loginregister" id="login">
		<div>
			<form>
				<div class="input_box">
					<input name="userInfo.account" maxlength="15" class="input_cont"
						type="text" placeholder="手机号" value="${cookie.userId.value }"/>
				</div>
				<div class="input_password">
					<input type="password" maxlength="15" class="input_cont"
						placeholder="密码 " name="passwd" value="${cookie.userPwd.value }"/>
				</div>
				<div class="input_checkbox">
					<input type="checkbox" style="display: none" id="remember" /><label
						class="checkbox" for="remember">记住密码</label>
				</div>
				<div class="btn">
					<input id="logbtn" class="btn" value="登录" type="button"/>
				</div>
			</form>
		</div>
		<!-- <div class="msg">Xxxxxxxx</div> -->
	</div>
	


<script>
$(function() {
	layui.use('layer', function() {
		var layer = layui.layer;

		$("#loglink").bind("click", function() {
			layer.open({
				type : 1,
				title : '登录',
				//skin: 'layui-layer-rim', //加上边框
				area : [ '398px', '345px' ], //宽高:398,222;
				//content: $('#sublayer'),//content: $('#sublayer').html()会丢失事件
				resize : false,
				content : $("#login"),
				closeBtn : 1,
				
			});
		});
		
		
		
		$("#logbtn").bind("click", function() {
			var $userId = $("#login input[name='userInfo.account']").val();
			var $passWd = $("#login input[name='passwd']").val();
			var $check = $("#remember").prop("checked");
			
			//判断账号和密码是否为空
			if($userId==""||$passWd==""){
				layer.msg("账号或密码不能为空",{time:1000});
				return ;
			}
			
			//判断账号是否存在
			
			
			$.post("<c:url value='/UserServlet'></c:url>",{"method":"queryUserById","userId":$userId},function(result){
				if(result.checkUserId == "false"){
					layer.msg("账号不存在",{time:1000});
					
				}else if(result.checkUserId == "true"){
					var iii = layer.load();
					
					//ajax验证用户是否登录成功
					$.post("<c:url value='/UserServlet'></c:url>",{"method":"login","userId":$userId,"passWd":$passWd,"check":$check},function(result){
						layer.close(iii);
						
						if(result.loginFlag=="true"){
							layer.msg("登录成功",{time:1000});
							setTimeout(function(){
								
								//创建退出按钮，并绑定事件
								//使用jquery将登录注册改为欢迎：xxx和退出，这样就不用再登录成功就刷新页面了
								//每次刷新页面就是在请求一次服务器
								var $logNode = $('<ul id="log"><li><a href="javascript:void(0);" id="userinfo">欢迎 ：'+result.username+'</a></li><li><span></span></li><li><a href="javascript:void(0);" id="exitlink">退出</a></li></ul>')
								$("#log").replaceWith($logNode);
								
								//绑定事件，点击请求servlet清除session，因为这是动态生成的，所以要单独绑定事件
								$("#exitlink").on("click",function(){
									//询问框

									layer.confirm('确认退出？', {
									  btn: ['确定','取消'] //按钮
									}, function(){
										window.location.href = "<c:url value='/UserServlet?method=exit'></c:url>";
									  	//layer.msg('的确很重要', {icon: 1});
									}, function(){
									  layer.msg('取消', {
									    time: 1000, //1s后自动关闭
									    
									  });
									});
									
									
								});
								
								
								
								//创建个人信息，并绑定事件
								
								
								
								
								
								layer.closeAll();
							},1000);
							
							//ajax怎么在不刷新页面的情况下获取最新的session值？？
							
							window.location.href = "<c:url value='/'></c:url>";
							
						}else if(result.loginFlag=="false"){
							layer.msg("密码不正确",{time:1000});
						}
						
					},"json");
					
				}
				
			},"json");
			
			
			//layer.closeAll();
		});
		
	});
	
	
	//如果是记住密码的话，后面再次登录的时候，就会默认选上记住密码
	var flag = "${cookie.check.value}";
	//console.log(flag=="true");
	if(flag == "true"){
		$("#remember").prop("checked",true);
	}else{
		$("#remember").prop("checked",false);
	}
	

});
</script>

<!--登录div结束-->
	
	
<!-- 退出登录开始 -->
<script type="text/javascript">
$(function(){
	//绑定事件，点击请求servlet清除session，这是页面加载时绑定的事件
	$("#exitlink").on("click",function(){
		//询问框

		layer.confirm('确认退出？', {
		  btn: ['确定','取消'] //按钮
		}, function(){
			window.location.href = "<c:url value='/UserServlet?method=exit'></c:url>";
		  	//layer.msg('的确很重要', {icon: 1});
		}, function(){
		  layer.msg('取消', {
		    time: 1000, //1s后自动关闭
		    
		  });
		});
	});
});

</script>
<!-- 退出登录结束 -->

	
<!-- 用户信息页面开始 -->

<!-- 用户信息页面结束 -->



<!-- 显示问题页面开始 -->
<script type="text/javascript">
//页面加载后，发起ajax请求数据库获取第一页的数据

$(function(){
	questionFlag = '1';  //默认是技术问答
	sortFlag = '1';     //默认是按时间加载数据
	loadQuestion(questionFlag,sortFlag,'-1');  //'1'表示技术问答
	
	$("#menu a:eq(0)").on('click',function(){
		//先删除内容
		$(".box").remove();
		questionFlag = '1';//'1'表示技术问答
		loadQuestion(questionFlag,sortFlag,'-1');
		
	});
	$("#menu a:eq(1)").on('click',function(){
		//先删除内容
		$(".box").remove();
		questionFlag = '2';//'2'表示面试题
		loadQuestion(questionFlag,sortFlag,'-1');
		
	});
	$("#menu a:eq(2)").on('click',function(){
		//先删除内容
		$(".box").remove();
		questionFlag = '3';//'3'表示即时回答
		loadQuestion(questionFlag,sortFlag,'-1');
		
	});
	
	//按时间排序:'1'
	$("#order a:eq(0)").on("click",function(){
		//先删除内容
		$(".box").remove();
		sortFlag = '1';    //'1'表示最新提问
		loadQuestion(questionFlag,sortFlag,'-1');
		
		//点击的那一个字体加粗，其余2个的都正常
		$(this).css("font-weight","bold");
		$("#order a:eq(1)").css("font-weight","normal");
		$("#order a:eq(2)").css("font-weight","normal");
	});
	
	//按尚未回答排序：'2'
	$("#order a:eq(1)").on("click",function(){
		//先删除内容
		$(".box").remove();
		sortFlag = '2';    //'2' 表示尚未回答
		loadQuestion(questionFlag,sortFlag,'-1');
		
		//点击的那一个字体加粗，其余2个的都正常
		$(this).css("font-weight","bold");
		$("#order a:eq(0)").css("font-weight","normal");
		$("#order a:eq(2)").css("font-weight","normal");
	});
	
	//按热门排序：'3'
	$("#order a:eq(2)").on("click",function(){
		//先删除内容
		$(".box").remove();
		sortFlag = '3';    //'3' 表示热门
		loadQuestion(questionFlag,sortFlag,'-1');
		
		//点击的那一个字体加粗，其余2个的都正常
		$(this).css("font-weight","bold");
		$("#order a:eq(0)").css("font-weight","normal");
		$("#order a:eq(1)").css("font-weight","normal");
	});
	
	//默认刚开始时，'最新提问' 字体加粗
	$("#order a:eq(0)").css("font-weight","bold");
	
	
	
	//显示所有标签开始
	$.get("<c:url value='/question'></c:url>",{'method':'labelList'},function(result){
		//返回所有的标签的集合
		//console.log(result);
		$.each(result,function(k,v){
			//动态生成标签节点
			var $tag = $('<div class="tag" id="'+v.id+'">'+v.content+'</div>');
			$("#tagList").append($tag);
			
		});
		
		//添加点击事件，按照标签进行查找问题
		$(".tag").css("cursor","pointer");
		$(".tag").on("click",function(){
			//console.log($(this).attr("id"));
			//先删除内容
			$(".box").remove(); 
			loadQuestion(questionFlag,sortFlag,$(this).attr("id"));
			
		});
		
		
		
		
		
	},'json');
	
	//显示所有标签结束
	
	
	
});

//参数1：questionType表示问题的类型 '1':技术问答； '2'：面试问题； '3'：即时问答
//参数2：sortType表示问题排序的类型'1'：最新排序； '2'：尚未回答； '3'：热门
function loadQuestion(questionType,sortType,labelId){
	//一个标志位，当为true的时候，才会触发加载事件。
	//目的：加载完最后一页数据后就不在加载数据了
	edit=true;
	//刚加载页面后就显示第一页的数据
	var cpage = 1;
	loadData(cpage, 10, questionType,sortType,labelId);
	
	//当页面滚动到底后加载第n页数据
	
	
	
	//$(window).off("scroll");   //先清除原来的滚动事件
    $(window).scroll(
	    function () {
	        var scrollTop = $(this).scrollTop();
	        var scrollHeight = $(document).height();
	        var windowHeight = $(this).height();
	        
	        if (scrollTop + windowHeight+20 >= scrollHeight && edit) {
	        	edit = false;   //保证在20px的范围内，滚动事件只会触发一次
	        	cpage++;
	        	loadData(cpage, 10, questionType,sortType,labelId);
	        
	        }
	    }
    );
}



function loadData(currentPage, pageSize, questionType, sortType,labelId){
	
	layui.use('layer', function() {
	var layer = layui.layer;
	
	var iiii = layer.load();
	
	
	$.get("<c:url value='/question'></c:url>",{'method':'questionPage','questionType':questionType,'sortType':sortType,'labelId':labelId,'currentPage':currentPage,'pageSize':pageSize},function(result){
		layer.close(iiii);

		//console.log(result);
		
		$.each(result.pageList,function(k,v){
			//投票数
			var $votecount = v.question.votecount;
			//回答数
			var $answercount = v.question.answercount;
			//浏览数
			var $browsecount = v.question.browsecount;
			//标题
			var $title = v.question.title;
			//发布人
			var $name = v.user.name;
			//发布时间
			var $time = v.question.releasetime.time;
			
			var time = new Date($time);//毫秒转日期格式
		 
		    //调用
		    //var $date = time.toMyDateString();
		    var $date = time.Format("yyyy-MM-dd HH:mm:ss");
			//console.log($date);
			
			//给页面添加元素
			var $box = $('<section class="box"></section>');
			
			var $box1 = $('<div class="box-f1"><ul><li>'+$votecount+' <span>投票</span></li><li style="border: 1px solid #4eaa4c; color: #4eaa4c;">'+$answercount+' <span>回答</span></li><li>'+$browsecount+' <span>浏览</span></li></ul></div>');
			
			var $box2 = $('<div class="box-f2"><div class="question_title"><a href="javascript:void(0);">'+$title+'</a></div><div class="question_time"><span> 发布人：'+$name+'@ '+$date+'</span></div></div>');
			
			
			var $box3 = $('<div class="box-f3"><img src="img/header2.jpg" /></div>');
			
			
			
			$box.append($box1);
			$box.append($box2);
			$box.append($box3);
			
			$.each(v.labelList,function(j,k){
				//标签
				//console.log(k.content);
				
				var $label = $('<span class="tag" id="'+k.id+'">'+k.content+'</span>');
				
				$box2.children('.question_time').append($label);
				
			});
			
			//问题的内容
			//console.log(v.question.content);
			
			$("#content").append($box);
			
			
		});
		
		
		//添加点击事件，按照标签进行查找问题
		$(".tag").css("cursor","pointer");
		$(".tag").on("click",function(){
			//console.log($(this).attr("id"));
			//先删除内容
			$(".box").remove(); 
			loadQuestion(questionFlag,sortFlag,$(this).attr("id"));
			
		});
		
		
		
		//当是最后一页，或者页面没有数据的时候，取消滚动事件
		
		if(currentPage == result.totalPage){
			layer.msg("已经是最后一页啦",{time:1000});  //最后一页的话就不在加载数据了
			$(window).off("scroll");  //取消滚动事件
		}else if(result.totalPage == 0){
			layer.msg("暂时还没有问题，快去提问吧！",{time:1000}); //没有数据也不在加载数据
			$(window).off("scroll");  //取消滚动事件
		}else{
			
			edit = true;   //如果不是最后一页和没有数据的话就继续加载数据
		}
		
		
		
		
		<!-- 未登录点击链接会跳转到登录界面开始 -->
		
		//console.log($('.question_title a'));
		$('.question_title a').on('click',function(){
			
			isLog("<c:url value='/questiondetail.jsp'></c:url>");
			
		});

		
		
		<!-- 未登录点击链接会跳转到登录界面结束 -->
		
		
		
	},"json");
	
	
	
	//时间转换:毫秒类型转成2017-1-2 12:20
    Date.prototype.toMyDateString = function() {
        return this.getFullYear() + "-" + (this.getMonth() + 1) + "-" + this.getDate() + " " + this.getHours() + ":" + this.getMinutes()+ ":" +this.getSeconds();
    }
	
  	 //---------------------------------------------------
	 // 日期格式化
	 // 格式 YYYY/yyyy/YY/yy 表示年份
	 // MM/M 月份
	 // W/w 星期
	 // dd/DD/d/D 日期
	 // hh/HH/h/H 时间
	 // mm/m 分钟
	 // ss/SS/s/S 秒
	 //---------------------------------------------------
	 Date.prototype.Format = function(formatStr){
		 var str = formatStr;
		 var Week = ['日','一','二','三','四','五','六'];
		
		 str=str.replace(/yyyy|YYYY/,this.getFullYear());
		 str=str.replace(/yy|YY/,(this.getYear() % 100)>9?(this.getYear() % 100).toString():'0' + (this.getYear() % 100));
		
		 str=str.replace(/MM/,this.getMonth()>9?this.getMonth().toString():'0' + this.getMonth());
		 str=str.replace(/M/g,this.getMonth());
		
		 str=str.replace(/w|W/g,Week[this.getDay()]);
		
		 str=str.replace(/dd|DD/,this.getDate()>9?this.getDate().toString():'0' + this.getDate());
		 str=str.replace(/d|D/g,this.getDate());
		
		 str=str.replace(/hh|HH/,this.getHours()>9?this.getHours().toString():'0' + this.getHours());
		 str=str.replace(/h|H/g,this.getHours());
		 str=str.replace(/mm/,this.getMinutes()>9?this.getMinutes().toString():'0' + this.getMinutes());
		 str=str.replace(/m/g,this.getMinutes());
		
		 str=str.replace(/ss|SS/,this.getSeconds()>9?this.getSeconds().toString():'0' + this.getSeconds());
		 str=str.replace(/s|S/g,this.getSeconds());
		
		 return str;
	 }

	
	
	
	
	});
	
}

//如果没有登录就跳转到登录界面，登录了就跳转到指定的url的页面
function isLog(url){
	var sessionUser = "${sessionScope.user}";
	//console.log(session==null);
	//console.log(session==""); //未登录的时候为true
	
	if(sessionUser==""){  //session中没有user对象，所以去登录
		layer.open({
			type : 1,
			title : '登录',
			//skin: 'layui-layer-rim', //加上边框
			area : [ '398px', '345px' ], //宽高:398,222;
			//content: $('#sublayer'),//content: $('#sublayer').html()会丢失事件
			resize : false,
			content : $("#login"),
			closeBtn : 1,
			
		});
	}else{
		 //session中有user对象，所以去请求回答页面
		 
		window.location.href=url;
	}
}


</script>


<!-- 显示问题页面结束 -->






<!-- 首页和我要提问 开始-->
<script type="text/javascript">
$(function(){
	layui.use('layer', function() {
		var layer = layui.layer;
		//显示首页
		$("#navigation li a").on('click',function(){
			window.location.href = "<c:url value='/'></c:url>";
			
		});
		
		//跳转到我要提问界面，点击我要提问时，如果没有登录就跳转到登录页面
		$("#leftquestion a").on('click',function(){
			//如果没有登录，跳转到登录页面
			isLog("<c:url value='/putquestion?method=islog'></c:url>");
			
		});
		
		
		//如果没有登录，就会提示让你登录，并可以直接通过url访问提问页面
		var f = $("#logstatus").attr("status");
		
		if(f=="false"){
			layer.msg("会话已经失效，请重新登录",{time:1000});
		}
		
		
	});
	
});

</script>

<!-- 首页和我要提问 结束-->




</body>
</html>
