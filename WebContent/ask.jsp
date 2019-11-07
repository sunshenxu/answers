<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>

<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8" />
		<title></title>
		<script type="text/javascript" src="js/jquery.js"></script>
		<script type="text/javascript" src="js/layer.js"></script>
		<script type="text/javascript" src="ckeditor/ckeditor.js"></script>
		<script src="highlight/highlight.pack.js"></script>
		<link rel="stylesheet" href="highlight/styles/default.css">
		<link rel="stylesheet" href="css/daydayup.css" />
		<link rel="stylesheet" href="css/ask.css" />
		<link rel="stylesheet" href="css/loginregister.css" />
		<link rel="stylesheet" href="css/common.css" />
		<script>
			$(function() {
				$("#menu a").each(function(index, ele) {
					$(ele).bind("mouseover", function() {
						$("#menu a[class='menu-item']").removeClass(); //已经有menu-item的移除
						$(ele).toggleClass("menu-item");
					});
				});

                $("#answersubbtn").click(function(){
				
				   
				   alert(CKEDITOR.instances['editor'].getData());
				   alert(CKEDITOR.instances.editor.getData());

				    
				
				})
			});
		</script>
	</head>

	<body>
		<header>
			<div id="headerbar">
				<ul id="navigation">
					<li>
						<a href="#">首页</a>
					</li>
					<li>
						<a href="#">问答</a>
					</li>
				</ul>
				<ul id="log">
					<li>
						<a href="#" id="loglink">登录</a>
					</li>
					<li><span></span></li>
					<li>
						<a href="#" id="registerlink">注册</a>
					</li>
				</ul>
			</div>
		</header>
		<section id="title">
			<div id="titlebar">
				<div id="leftquestion">
					<a href="#">我要提问</a>
				</div>
				<div id="rightquestion">
					<input type="text" placeholder="请输入查询关键字" />
					<a href="#"><img src="img/ic_search.svg" /></a>
				</div>
			</div>
		</section>
		<section id="main">
			<div id="content">
				<div class="toptitle">
					<nav class="questionnav">
						<a href="#">怎么办</a>
						>
						<a href="indexmain.do?tagId=${requestScope.question.tag1.tagId }">Java</a>
					</nav>
				</div>
				<div class="form-item">
					<div class="form-label">
						<label>标题:</label>
					</div>
					<div class="form-input-inline">
						<input type="text" class="ask" name="roleId" value="" placeholder="你有什么技术问题，请在此输入" />
					</div>
				</div>
				<div class="form-item">
					<div class="form-label">
						<label>分类:</label>
					</div>
					<div class="form-input-inline">
						<span class="choice">
								<input type="radio" id="rdo1" name="radio" checked="checked" />
								<label for="rdo1">技术问答</label>
						</span>
						<span class="choice">
								<input type="radio" id="rdo3" name="radio" />
								<label for="rdo3">面试题</label>
							</span>
						<span class="choice">
								<input type="radio" id="rdo4" name="radio" />
								<label for="rdo4">即时问答</label>
							</span>

					</div>
				</div>
				<div class="form-item">
					<div class="form-label-small">
						<label>标签:</label>
					</div>
					<div class="form-input-inline-small">
						<span class="tagchoice">
								<input type="checkbox" id="check1" name="check" checked="checked"/>
								<label for="check1">java</label>
							</span>
						<span class="tagchoice">
								<input type="checkbox" id="check2" name="check" />
								<label for="check2">html</label>
							</span>
						<span class="tagchoice">
								<input type="checkbox" id="check3" name="check" />
								<label for="check3">css</label>
							</span>
						<span class="tagchoice">
								<input type="checkbox" id="check4" name="check" />
								<label for="check4">jquery</label>
							</span>
						<span class="tagchoice">
								<input type="checkbox" id="check5" name="check" />
								<label for="check5">ajax</label>
							</span>
						<span class="tagchoice">
								<input type="checkbox" id="check6" name="check" />
								<label for="check6">jsp</label>
							</span>
						<span class="tagchoice">
								<input type="checkbox" id="check7" name="check" />
								<label for="check7">javascript</label>
							</span>
					</div>
				</div>
				<div class="form-item">
					<div class="form-label-small">
						<label></label>
					</div>
					<div class="form-input-inline-small">
						<span class="tagchoice">
								<input type="checkbox" id="check8" name="check" />
								<label for="check8">servlet</label>
							</span>
						<span class="tagchoice">
								<input type="checkbox" id="check9" name="check" />
								<label for="check9">struts</label>
							</span>
						<span class="tagchoice">
								<input type="checkbox" id="check10" name="check" />
								<label for="check10">spring</label>
							</span>
						<span class="tagchoice">
								<input type="checkbox" id="check11" name="check" />
								<label for="check11">struts</label>
							</span>
						<span class="tagchoice">
								<input type="checkbox" id="check12" name="check" />
								<label for="check12">mybatis</label>
							</span>
						<span class="tagchoice">
								<input type="checkbox" id="check13" name="check" />
								<label for="check13">database</label>
							</span>
						<span class="tagchoice">
								<input type="checkbox" id="check14" name="check" />
								<label for="check14">others</label>
						</span>
					</div>
				</div>
				<div style="margin-top: 50px;">
					<textarea id="editor"></textarea>
					<script type="text/javascript">
						CKEDITOR.replace("editor");
					</script>
				</div>
				<div class="answersub">
					<input id="answersubbtn" type="button" value="提交回答">
				</div>
			</div>
			<aside>
				<h4>所有标签：</h4>
				<div class="tag">java</div>
				<div class="tag">mysql</div>
				<div class="tag">struts</div>
				<div class="tag">html</div>
			</aside>
		</section>

		<!--注册div开始-->
		<div class="loginregister" id="login">
			<div>
				<form>
					<div class="input_box">
						<input name="userInfo.account" maxlength="15" class="input_cont" type="text" placeholder="用户名/邮箱/手机号" />
					</div>
					<div class="input_password">
						<input type="password" maxlength="15" class="input_cont" placeholder="密码 " />
					</div>
					<div class="input_checkbox">
						<input type="checkbox" style="display: none" id="remember" /><label class="checkbox" for="remember">记住密码</label>
					</div>
					<div class="btn">
						<input type="submit" id="logbtn" class="btn" value="登录" />
					</div>
				</form>
			</div>
			<div class="msg">Xxxxxxxx</div>
		</div>
		<script>
			$(function() {
				$("#loglink").bind("click", function() {
					layer.open({
						type: 1,
						title: '登录',
						//skin: 'layui-layer-rim', //加上边框
						area: ['398px', '345px'], //宽高:398,222;
						//content: $('#sublayer'),//content: $('#sublayer').html()会丢失事件
						resize: false,
						content: $("#login"),
						closeBtn: 1,
					});
				});
				$("#logbtn").bind("click", function() {
					layer.closeAll();
				});
			});
		</script>
		<!--注册div结束-->
		<!--登录div开始-->
		<div class="loginregister" style="height:280px;" id="register">
			<div>
				<form>
					<div class="input_box">
						<input name="userInfo.account" maxlength="15" class="input_cont" type="text" placeholder="用户名/邮箱/手机号" />
						<span class="mark">*</span>
					</div>
					<div class="input_password">
						<input type="password" maxlength="15" class="input_cont" placeholder="密码" />
						<span class="mark">*</span>
					</div>
					<div class="input_password">
						<input type="password" maxlength="15" class="input_cont" placeholder="密码确认" />
						<span class="mark">*</span>
					</div>
					<div class="btn">
						<input type="submit" class="btn" id="registerbtn" value="注册" />
					</div>
				</form>
			</div>
			<div class="msg">Xxx</div>
		</div>
		<script>
			$(function() {
				$("#registerlink").bind("click", function() {
					layer.open({
						type: 1,
						title: '注册',
						//skin: 'layui-layer-rim', //加上边框
						area: ['398px', '345px'], //宽高:398,282;
						//content: $('#sublayer'),//content: $('#sublayer').html()会丢失事件
						resize: false,
						content: $("#register"),
						closeBtn: 1,
					});
				});
				$("#registerbtn").bind("click", function() {
					layer.closeAll();
				});
			});
		</script>
		<!--登录div结束-->
	</body>

</html>