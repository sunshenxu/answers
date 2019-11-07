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
	<header>
		<div id="headerbar">
			<ul id="navigation">
				<li><a href="#">首页</a></li>
				<li><a href="#">问答</a></li>
			</ul>
			<ul id="log">
				<li><a href="javascript:void(0);" id="loglink">登录</a></li>
				<li><span></span></li>
				<li><a href="javascript:void(0);" id="registerlink">注册</a></li>
			</ul>
		</div>
	</header>
	<section id="title">
		<div id="titlebar">
			<div id="leftquestion">
				<a href="#">我要提问</a>
			</div>
			<div id="rightquestion">
				<input type="text" placeholder="请输入查询关键字" /> <a href="#"><img
					src="img/ic_search.svg" /></a>
			</div>
		</div>
	</section>
	<section id="main">
		<section id="content">
			<div id="headlist">
				<div id="menu">
					<a href="#" class="menu-item">技术问答</a> <a href="#">面试题</a> <a
						href="#">即时问答</a>
				</div>
				<div id="order">
					<span>排列:</span> <a href="#">最新提问</a> <a href="#">尚未回答</a> <a
						href="#">热门</a>
				</div>
			</div>
			<section class="box">
				<div class="box-f1">
					<ul>
						<li>0 <span>投票</span>
						</li>
						<li style="border: 1px solid #4eaa4c; color: #4eaa4c;">0 <span>回答</span>
						</li>
						<li>0 <span>浏览</span>
						</li>
					</ul>
				</div>
				<div class="box-f2">
					<div class="question_title">
						<a href="#">这是第一个问题的标题</a>
					</div>
					<div class="question_content">
						问题内容的一部分问题内容的一部分问题内容的一部分问题内容的一部分问题内容的一部分问题内容的一部分问题内容的一部分问题内容的一部分</div>
					<div class="question_time">
						<span> 发布人：发布时间 </span> <span class="tag">标签1</span> <span
							class="tag">标签2</span>
					</div>
				</div>
				<div class="box-f3">
					<img src="img/header2.jpg" />
				</div>
			</section>
			<section class="box">
				<div class="box-f1">
					<ul>
						<li>0 <span>投票</span>
						</li>
						<li style="border: 1px solid #4eaa4c; color: #4eaa4c;">0 <span>回答</span>
						</li>
						<li>0 <span>浏览</span>
						</li>
					</ul>
				</div>
				<div class="box-f2">
					<div class="question_title">
						<a href="#">这是第一个问题的标题</a>
					</div>
					<div class="question_content">问题内容的一部分</div>
					<div class="question_time">
						<span> 发布人：发布时间 </span> <span class="tag">标签1</span> <span
							class="tag">标签2</span>
					</div>
				</div>
				<div class="box-f3">
					<img src="img/header2.png" />
				</div>
			</section>
			<section class="box">
				<div class="box-f1">
					<ul>
						<li>0 <span>投票</span>
						</li>
						<li style="border: 1px solid #4eaa4c; color: #4eaa4c;">0 <span>回答</span>
						</li>
						<li>0 <span>浏览</span>
						</li>
					</ul>
				</div>
				<div class="box-f2">
					<div class="question_title">
						<a href="#">这是第一个问题的标题</a>
					</div>
					<div class="question_content">问题内容的一部分</div>
					<div class="question_time">
						<span> 发布人：发布时间 </span> <span class="tag">标签1</span> <span
							class="tag">标签2</span>
					</div>
				</div>
				<div class="box-f3">
					<img src="img/header2.png" />
				</div>
			</section>
			<section class="box">
				<div class="box-f1">
					<ul>
						<li>0 <span>投票</span>
						</li>
						<li style="border: 1px solid #4eaa4c; color: #4eaa4c;">0 <span>回答</span>
						</li>
						<li>0 <span>浏览</span>
						</li>
					</ul>
				</div>
				<div class="box-f2">
					<div class="question_title">
						<a href="#">这是第一个问题的标题</a>
					</div>
					<div class="question_content">问题内容的一部分</div>
					<div class="question_time">
						<span> 发布人：发布时间 </span> <span class="tag">标签1</span> <span
							class="tag">标签2</span>
					</div>
				</div>
				<div class="box-f3">
					<img src="img/header2.png" />
				</div>
			</section>
			<section class="box">
				<div class="box-f1">
					<ul>
						<li>0 <span>投票</span>
						</li>
						<li style="border: 1px solid #4eaa4c; color: #4eaa4c;">0 <span>回答</span>
						</li>
						<li>0 <span>浏览</span>
						</li>
					</ul>
				</div>
				<div class="box-f2">
					<div class="question_title">
						<a href="#">这是第一个问题的标题</a>
					</div>
					<div class="question_content">问题内容的一部分</div>
					<div class="question_time">
						<span> 发布人：发布时间 </span> <span class="tag">标签1</span> <span
							class="tag">标签2</span>
					</div>
				</div>
				<div class="box-f3">
					<img src="img/header2.png" />
				</div>
			</section>
		</section>
		<aside>
			<h4>所有标签：</h4>
			<div class="tag">java</div>
			<div class="tag">mysql</div>
			<div class="tag">css</div>
			<div class="tag">oracle</div>
		</aside>
	</section>










	<!--注册div开始-->
	<div id="register">
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
						type="text" placeholder="手机号" />
				</div>
				<div class="input_password">
					<input type="password" maxlength="15" class="input_cont"
						placeholder="密码 " />
				</div>
				<div class="input_checkbox">
					<input type="checkbox" style="display: none" id="remember" /><label
						class="checkbox" for="remember">记住密码</label>
				</div>
				<div class="btn">
					<input type="submit" id="logbtn" class="btn" value="登录" />
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

					layer.closeAll();
				});
				
				
				

			});

		});
	</script>

	<!--登录div结束-->
</body>
</html>
