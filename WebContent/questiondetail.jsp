<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8" />
		<title></title>
		<script type="text/javascript" src="layui/layui.js"></script>
		<link rel="stylesheet" href="layui/css/layui.css" media="all">
		<script type="text/javascript" src="js/jquery-3.3.1.js"></script>
		
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
		
		<style type="text/css">
			#content{
				position:relative;
			}
			
			#returnBut{
			
				display:inline-block;
			 	position: absolute;
				right: 0px;
				top: -10px;
			}
		</style>
	</head>

	<body>
		<header>
			<div id="headerbar">
				<ul id="navigation">
					<li>
						<a href="javascript:void(0);">首页</a>
					</li>
					<!-- <li>
						<a href="#">问答</a>
					</li> -->
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
					<!-- <a href="javascript:void(0);">我要提问</a> -->
				</div>
				<div id="rightquestion">
					<input type="text" placeholder="请输入查询关键字" />
					<a href="javascript:void(0);"><img src="img/ic_search.svg" /></a>
				</div>
			</div>
		</section>
		<section id="main">
			<div id="content">
				<div class="toptitle">
					<nav class="questionnav">
						<c:choose>
							<c:when test="${requestScope.type eq '1' }"><a href="javascript:void(0);">技术问答</a></c:when>
							<c:when test="${requestScope.type eq '2' }"><a href="javascript:void(0);">面试题</a></c:when>
							<c:when test="${requestScope.type eq '3' }"><a href="javascript:void(0);">即时问答</a></c:when>
						</c:choose>
					</nav>
					
					<div id="returnBut">
						<a href="<c:url value='/'></c:url>">
							<img alt="返回" src="img/return.jpg" style="width:50px;height:50px;">
						</a>
					</div>
					
					
					<a href="javascript:void(0);">
						<div class="total_answer">
							<c:out value="${sessionScope.qu.question.answercount }"></c:out><br />
							<span>回答</span>
						</div>
					</a>
					<span class="question_title_link">问题内容</span>
				</div>
				<section class="content-container">
					<section class="questioncontainer">
						<div>
							<div class="vote_collect_wrapper">
								<div class="vote_collect">
									<a class="vote_up" title="顶"></a>
									<span id="questionVoteCount" class="vote_count"><c:out value="${sessionScope.qu.question.votecount }"></c:out></span>
									<a class="vote_down" title="踩"></a>
								</div>
							</div>
							
							<div class="question-content-detail">
								<section>
									<p><c:out value="${sessionScope.qu.question.title }"></c:out></p>
									<c:out value="${sessionScope.qu.question.content }" escapeXml="false"></c:out>
								</section>

							</div>
							
						</div>
						
						<div class="question-userdetail">
							<div class="userinfo">
								<span class="uname"><c:out value="${sessionScope.qu.user.name }"></c:out></span>
								<span class="edittime"><f:formatDate value="${sessionScope.qu.question.releasetime }" pattern="yyyy-MM-dd HH:mm:ss"/></span>
							</div>
							
							<div id="bigheader">
								<img src="img/header2.jpg" />
							</div>
							
						</div>
						
					</section>
					
					<div class="answer_content">
						<div class="answer_count">
							<span>总共有<c:out value="${sessionScope.qu.question.answercount }"></c:out>条回答</span>
							
							<span class="answer_order"><a class="selected" href="javascript:void(0);">显示最新答案</a> <a href="javascript:void(0);">按票数排序</a></span>
						</div>
						
						<div>
						<section class="answer_list">
							
								<!-- 回答内容 -->
								
								<c:forEach items="${sessionScope.pageAnswer.pageList }" var="answer">
									
								<article class="answer_detail">
									<div class="vote_collect_wrapper">
										<div class="vote_collect">
											<a class="vote_up" title="顶">
											</a>
											<span id="answerVoteCount" class="vote_count"><c:out value="${answer.huida.votecount }"></c:out></span>
											<a class="vote_down"  title="踩">
											</a>
										</div>
									</div>
									
									<div class="answer-content-detail">
										<section>
											<c:out value="${answer.huida.content }" escapeXml="false"></c:out>
										</section>
									</div>
									
									<div class="userdetail">
										<div class="userinfo">
											<span class="uname"><c:out value="${answer.user.name }"></c:out></span>
											<span class="edittime"><f:formatDate value="${answer.huida.answertime }" pattern="yyyy-MM-dd HH:mm:ss"/></span>
										</div>
										<div>
											<img src="img/header2.jpg" />
										</div>
									</div>
								</article>
								
								</c:forEach>
								
								
								<textarea id="editor"></textarea>
								<script type="text/javascript">
									CKEDITOR.replace("editor");
								</script>
								
								<div class="answersub">
									<input id="answersubbtn" type="button" value="提交回答">
								</div>
								
							</section>
							
						</div>
						 
						 
						 
						<div id="demo7"></div>
						
						
					</div>
				</section>
			</div>
			<aside id="tagList">
				<h4>所有标签：</h4>
			
			</aside>
		</section>


	
	
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

<!-- 跳转到首页开始-->
<script type="text/javascript">
$(function(){
	layui.use('layer', function() {
		var layer = layui.layer;
	//显示首页
	$("#navigation li a").on('click',function(){
		
		window.location.href = "<c:url value='/'></c:url>";
		
	});
	$("#leftquestion a").on('click',function(){
		window.location.href = "<c:url value='/putquestion?method=islog'></c:url>";
	});
	
	
	});
	
	
});


</script>

<!-- 跳转到首页结束 -->


<script type="text/javascript">
$(function(){
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
	
	
	
	
	//回答问题
	$("#answersubbtn").on('click',function(){
		var huidaContent = CKEDITOR.instances.editor.getData();
		
		var uid = ${sessionScope.user.userId};
		
		var qid = ${sessionScope.qu.question.id};
		
		var type = ${requestScope.type};
		
		$.post("<c:url value='/answerquestion'></c:url>",{'method':'putAnswer','huidaContent':huidaContent,'uid':uid,'qid':qid,'type':type},function(result){
			
			window.location.reload();
			
			//window.location.href = "<c:url value='/'></c:url>";
			
		},'json');
		
		
		
	});
	
	
	//按时间排序
	$(".answer_order a:eq(0)").on('click',function(){
		$(this).addClass("selected");
		$(".answer_order a:eq(1)").removeClass("selected");
		
		window.location.href = "<c:url value='/answerquestion?method=islog&qid="+${sessionScope.qu.question.id}+"&type="+${requestScope.type }+"&cpage=1&size=5&sortType=1'></c:url>";
		
	});
	//按票数排序
	$(".answer_order a:eq(1)").on('click',function(){
		$(this).addClass("selected");
		$(".answer_order a:eq(0)").removeClass("selected");
		
		window.location.href = "<c:url value='/answerquestion?method=islog&qid="+${sessionScope.qu.question.id}+"&type="+${requestScope.type }+"&cpage=1&size=5&sortType=2'></c:url>";
		
	});
	
	
	var flag = ${sessionScope.sortType};
	
	
	if(flag=='1'){  //1表示是最新答案变色、2表示按票数排序变色，刚开始默认的是最新答案变色，请求完servlet后，将sortType存到session中，作为标志
		$(".answer_order a:eq(0)").addClass("selected");
		$(".answer_order a:eq(1)").removeClass("selected");
		
	}else if(flag=='2'){
		$(".answer_order a:eq(1)").addClass("selected");
		$(".answer_order a:eq(0)").removeClass("selected");
	}
	
	
	
	//分页
	layui.use(['laypage', 'layer'], function(){
		var laypage = layui.laypage;
		var layer = layui.layer;
		
		var total = ${sessionScope.qu.question.answercount };
		var cpage = ${sessionScope.pageAnswer.currentPage};
		var psize = ${sessionScope.pageAnswer.pageSize};
		//完整功能
		laypage.render({
		  elem: 'demo7'
		  ,count: total
		  ,layout: ['count', 'prev', 'page', 'next', 'limit', 'refresh', 'skip']
		  ,curr: cpage
		  ,limit:psize
		  ,limits:[5,10,15,20]
		  ,jump: function(obj,first){
			  if(first!=true){//是否首次进入页面
				var currentPage = obj.curr;//获取点击的页码	
				var pageSize = obj.limit;  //获取页面的大小
				window.location.href = "<c:url value='/answerquestion?method=islog&qid="+${sessionScope.qu.question.id}+"&type="+${requestScope.type }+"&cpage="+currentPage+"&size="+pageSize+"&sortType="+${sessionScope.sortType}+"'></c:url>";
			  }
			  
		  }
		});
	
	});
	
	
	
	
});


</script>



		
</body>

</html>