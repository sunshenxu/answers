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
		<link rel="stylesheet" href="css/loginregister.css" />
		<link rel="stylesheet" href="css/questiondetail.css" />
		<link rel="stylesheet" href="css/common.css" />
		<script>
			$(function() {
				$("#menu a").each(function(index, ele) {
					$(ele).bind("mouseover", function() {
						$("#menu a[class='menu-item']").removeClass(); //已经有menu-item的移除
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
						<a href="indexmain.do">技术问答</a>
						>
						<a href="indexmain.do?tagId=${requestScope.question.tag1.tagId }">Java</a>
					</nav>
					<a href="#answereditor">
						<div class="total_answer">
							10<br />
							<span>回答</span>
						</div>
					</a>
					<span class="question_title_link">问题标题</span>
				</div>
				<section class="content-container">
					<section class="questioncontainer">
						<div>
							<div class="vote_collect_wrapper">
								<div class="vote_collect">
									<a class="vote_up" onclick="questionvote(${requestScope.question.questionId },1)" title="顶">
									</a>
									<span id="questionVoteCount" class="vote_count">5</span>
									<a class="vote_down" onclick="questionvote(${requestScope.question.questionId },-1)" title="踩">
									</a>
								</div>
							</div>
							<div class="question-content-detail">
								<section>
									<p>1+1等于几
									</p>
									<p>可能是2可能是2可能是2可能是2可能是2可能是2可能是2可能是2可能是2可能是2可能是2可能是可能是2可能是2可能是2可能是2可能是2可能是可能是2可能是2可能是2可能是2可能是2可能是</p>
									<p>可能是2可能是2可能是2可能是2可能是2可能是2可能是2可能是2可能是2可能是2可能是2可能是</p>
									<p>可能是2可能是2可能是2可能是2可能是2可能是2可能是2可能是2可能是2可能是2可能是2可能是</p>
									<p>可能是2可能是2可能是2可能是2可能是2可能是2可能是2可能是2可能是2可能是2可能是2可能是</p>
									<p>可能是2可能是2可能是2可能是2可能是2可能是2可能是2可能是2可能是2可能是2可能是2可能是</p>
									<p>可能是2可能是2可能是2可能是2可能是2可能是2可能是2可能是2可能是2可能是2可能是2可能是</p>
									<p>可能是2可能是2可能是2可能是2可能是2可能是2可能是2可能是2可能是2可能是2可能是2可能是</p>
									<p>可能是2可能是2可能是2可能是2可能是2可能是2可能是2可能是2可能是2可能是2可能是2可能是</p>
									<p>可能是2可能是2可能是2可能是2可能是2可能是2可能是2可能是2可能是2可能是2可能是2可能是</p>
									<p>可能是2可能是2可能是2可能是2可能是2可能是2可能是2可能是2可能是2可能是2可能是2可能是</p>
									<p>可能是2可能是2可能是2可能是2可能是2可能是2可能是2可能是2可能是2可能是2可能是2可能是</p>
									<p>可能是2可能是2可能是2可能是2可能是2可能是2可能是2可能是2可能是2可能是2可能是2可能是</p>
								</section>

							</div>
						</div>
						<div class="question-userdetail">
							<div class="userinfo">
								<span class="uname">张三</span>
								<span class="edittime">2011-10-10 09:08:08</span>
							</div>
							<div id="bigheader">
								<img src="img/header2.jpg" />
							</div>
						</div>
					</section>
					<div class="answer_content">
						<div class="answer_count">
							<span>总共有10条回答</span>
							<span class="answer_order"><a class="selected" href="#">按票数排序</a> <a href="#">显示最新答案</a></span>
						</div>
						<div>
							<section class="answer_list">
								<article class="answer_detail">
									<div class="vote_collect_wrapper">
										<div class="vote_collect">
											<a class="vote_up" onclick="answervote(${answer.answerId },1)" title="顶">
											</a>
											<span id="answerVoteCount" class="vote_count">10</span>
											<a class="vote_down" onclick="answervote(${answer.answerId },-1)" title="踩">
											</a>
										</div>
									</div>
									<div class="answer-content-detail">
										<section>
											<p>可能是2可能是2可能是2可能是2可能是2可能是2可能是2可能是2可能是2可能是2可能是2可能是2可能是2可能是2可能是2可能是2可能是2可能是2可能是2可能是</p>
											<p>可能是2可能是2可能是2可能是2可能是2可能是2可能是2可能是2可能是2可能是2可能是2可能是</p>
											<p>可能是2可能是2可能是2可能是2可能是2可能是2可能是2可能是2可能是2可能是2可能是2可能是</p>
											<p>可能是2可能是2可能是2可能是2可能是2可能是2可能是2可能是2可能是2可能是2可能是2可能是</p>
											<p>可能是2可能是2可能是2可能是2可能是2可能是2可能是2可能是2可能是2可能是2可能是2可能是</p>
											<p>可能是2可能是2可能是2可能是2可能是2可能是2可能是2可能是2可能是2可能是2可能是2可能是</p>
										</section>
									</div>
									<div class="userdetail">
										<div class="userinfo">
											<span class="uname">李四</span>
											<span class="edittime">2015-09-09 11:20</span>
										</div>
										<div>
											<img src="img/header2.jpg" />
										</div>
									</div>
								</article>
								<article class="answer_detail">
									<div class="vote_collect_wrapper">
										<div class="vote_collect">
											<a class="vote_up" onclick="answervote(${answer.answerId },1)" title="顶">
											</a>
											<span id="answerVoteCount" class="vote_count">10</span>
											<a class="vote_down" onclick="answervote(${answer.answerId },-1)" title="踩">
											</a>
										</div>
									</div>
									<div class="answer-content-detail">
										<section>
											<p>可能是2可能是2可能是2可能是2可能是2可能是2可能是2可能是2可能是2可能是2可能是2可能是</p>
											<p>可能是2可能是2可能是2可能是2可能是2可能是2可能是2可能是2可能是2可能是2可能是2可能是</p>
											<p>可能是2可能是2可能是2可能是2可能是2可能是2可能是2可能是2可能是2可能是2可能是2可能是</p>
										</section>
									</div>
									<div class="userdetail">
										<div class="userinfo">
											<span class="uname">李四</span>
											<span class="edittime">2015-09-09 11:20</span>
										</div>
										<div>
											<img src="img/header2.jpg" />
										</div>
									</div>
								</article>
								<article class="answer_detail">
									<div class="vote_collect_wrapper">
										<div class="vote_collect">
											<a class="vote_up" onclick="answervote(${answer.answerId },1)" title="顶">
											</a>
											<span id="answerVoteCount" class="vote_count">10</span>
											<a class="vote_down" onclick="answervote(${answer.answerId },-1)" title="踩">
											</a>
										</div>
									</div>
									<div class="answer-content-detail">
										<section>
											<p>可能是2可能是2可能是2可能是2可能是2可能是2可能是2可能是2可能是2可能是2可能是2可能是</p>
											<p>可能是2可能是2可能是2可能是2可能是2可能是2可能是2可能是2可能是2可能是2可能是2可能是</p>
											<p>可能是2可能是2可能是2可能是2可能是2可能是2可能是2可能是2可能是2可能是2可能是2可能是</p>
										</section>
									</div>
									<div class="userdetail">
										<div class="userinfo">
											<span class="uname">李四</span>
											<span class="edittime">2015-09-09 11:20</span>
										</div>
										<div>
											<img src="img/header2.jpg" />
										</div>
									</div>
								</article>
								<article class="answer_detail">
									<div class="vote_collect_wrapper">
										<div class="vote_collect">
											<a class="vote_up" onclick="answervote(${answer.answerId },1)" title="顶">
											</a>
											<span id="answerVoteCount" class="vote_count">10</span>
											<a class="vote_down" onclick="answervote(${answer.answerId },-1)" title="踩">
											</a>
										</div>
									</div>
									<div class="answer-content-detail">
										<section>
											<p>可能是2可能是2可能是2可能是2可能是2可能是2可能是2可能是2可能是2可能是2可能是2可能是</p>
											<p>可能是2可能是2可能是2可能是2可能是2可能是2可能是2可能是2可能是2可能是2可能是2可能是</p>
											<p>可能是2可能是2可能是2可能是2可能是2可能是2可能是2可能是2可能是2可能是2可能是2可能是</p>
										</section>
									</div>
									<div class="userdetail">
										<div class="userinfo">
											<span class="uname">李四</span>
											<span class="edittime">2015-09-09 11:20</span>
										</div>
										<div>
											<img src="img/header2.jpg" />
										</div>
									</div>
								</article>
								<article class="answer_detail">
									<div class="vote_collect_wrapper">
										<div class="vote_collect">
											<a class="vote_up" onclick="answervote(${answer.answerId },1)" title="顶">
											</a>
											<span id="answerVoteCount" class="vote_count">10</span>
											<a class="vote_down" onclick="answervote(${answer.answerId },-1)" title="踩">
											</a>
										</div>
									</div>
									<div class="answer-content-detail">
										<section>
											<p>可能是2可能是2可能是2可能是2可能是2可能是2可能是2可能是2可能是2可能是2可能是2可能是</p>
											<p>可能是2可能是2可能是2可能是2可能是2可能是2可能是2可能是2可能是2可能是2可能是2可能是</p>
											<p>可能是2可能是2可能是2可能是2可能是2可能是2可能是2可能是2可能是2可能是2可能是2可能是</p>
										</section>
									</div>
									<div class="userdetail">
										<div class="userinfo">
											<span class="uname">李四</span>
											<span class="edittime">2015-09-09 11:20</span>
										</div>
										<div>
											<img src="img/header2.jpg" />
										</div>
									</div>
								</article>
								<textarea id="editor"></textarea>
								<script type="text/javascript">
									CKEDITOR.replace("editor");
								</script>
								<div class="answersub">
									<input id="answersubbtn" type="button" value="提交回答">
								</div>
							</section>
						</div>
					</div>
				</section>
			</div>
			<aside>
				<h4>所有标签：</h4>
				<div class="tag">java</div>
				<div class="tag">mysql</div>
				<div class="tag">oracle</div>
				<div class="tag">struts</div>
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