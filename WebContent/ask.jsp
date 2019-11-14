<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>

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
		<link rel="stylesheet" href="css/ask.css" />
		<link rel="stylesheet" href="css/loginregister.css" />
		<link rel="stylesheet" href="css/common.css" />
	
	
	
		<style type="text/css">
			#content{
				position:relative;
			}
			
			 #returnBut{
				display:inline-block;
				 position: absolute;
				 right: 30px;
				 top: 18px;
			}
			.layui-input-block{
				margin-left: 0px;
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
					<a href="javascript:void(0);">我要提问</a>
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
						<a href="javascript:void(0);">首页</a>
						>
						<a href="javascript:void(0);">提问</a>
					</nav>

					
					<div id="returnBut">
						<a href="<c:url value='/'></c:url>">
							<img alt="返回" src="img/return.jpg" style="width:50px;height:50px;">
						</a>
					</div>
					
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
						<!-- <span class="choice">
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
							</span> -->
							
						
						
						
						
						
							
				<div class="layui-form ">
					<div class="layui-form-item ">
					    <div class="layui-input-block" >
					      <input type="radio" name="radio" value="technical" title="技术问答" checked>
					      <input type="radio" name="radio" value="interview" title="面试题">
					      <input type="radio" name="radio" value="task" title="作业问答" >
					    </div>
					</div>
				</div>
							

				</div>
				
					
				  	
					
				</div>
				<div class="form-item">
					<div class="form-label-small">
						<label>标签:</label>
					</div>
					<div class="form-input-inline-small">
						<span class="tagchoice">
								<input type="checkbox" id="1" name="check" checked="checked"/>
								<label for="1">java</label>
							</span>
						<span class="tagchoice">
								<input type="checkbox" id="2" name="check" />
								<label for="2">html</label>
							</span>
						<span class="tagchoice">
								<input type="checkbox" id="3" name="check" />
								<label for="3">css</label>
							</span>
						<span class="tagchoice">
								<input type="checkbox" id="4" name="check" />
								<label for="4">jquery</label>
							</span>
						<span class="tagchoice">
								<input type="checkbox" id="5" name="check" />
								<label for="5">ajax</label>
							</span>
						<span class="tagchoice">
								<input type="checkbox" id="6" name="check" />
								<label for="6">js</label>
							</span>
							<span class="tagchoice">
								<input type="checkbox" id="7" name="check" />
								<label for="7">jsp</label>
							</span>
					</div>
				</div>
				<div class="form-item">
					<div class="form-label-small">
						<label></label>
					</div>
					<div class="form-input-inline-small">
						
						<span class="tagchoice">
								<input type="checkbox" id="8" name="check" />
								<label for="8">servlet</label>
							</span>
						<span class="tagchoice">
								<input type="checkbox" id="9" name="check" />
								<label for="9">spring</label>
							</span>
						<span class="tagchoice">
								<input type="checkbox" id="10" name="check" />
								<label for="10">mybatis</label>
							</span>
						<span class="tagchoice">
								<input type="checkbox" id="11" name="check" />
								<label for="11">mysql</label>
							</span>
						<span class="tagchoice">
								<input type="checkbox" id="12" name="check" />
								<label for="12">others</label>
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




<!-- 问题提交 -->
<script type="text/javascript">
$(function(){
	
	layui.use('layer', function() {
		var layer = layui.layer;
	//标签最多只能选择3个
	$(":checkbox").on('click',function(){
		//console.log($(".tagchoice input:checked").length);
		//console.log($(".tagchoice input:checked"));
		
		if($(".tagchoice input:checked").length>3){
			
			layer.msg("选中项不能超过三个",{time:1000});
			$(this).prop("checked",false);
		}
	});
	
	$("#answersubbtn").on('click',function(){
		//alert(CKEDITOR.instances['editor'].getData());
	   	//alert(CKEDITOR.instances.editor.getData());
		
		if($(".tagchoice input:checked").length==0){
			
			layer.msg("至少选择一个标签",{time:1000});
			$(this).prop("checked",false);
			return ;
		}
	   	
		var $titleNode = $(".ask");
		var $title = $titleNode.val();  //标题
		
		if($title==""){
			layer.msg("标题不能为空",{time:1000});
			return ;
		}
		
	   var $questionType = $(".layui-input-block input:checked").val();
	   
	   //var $labelNodes = $(".tagchoice input:checked").attr("id");
	   
	   var labelId = "";
	   $($(".tagchoice input:checked")).each(function(k,v){
		  
		   labelId += $(v).attr("id")+",";
	   });
	   
	   
	   var $content = CKEDITOR.instances.editor.getData();
	   
	   $.post("<c:url value='/putquestion'></c:url>",
		{
		   'method':'putQuestions',
		   'title':$title,
		   "labelId":labelId,  //将其转为字符串，然后在提交给后台
		   'questionType':$questionType,
		   'content':$content
		},
		function(result){
		   //console.log(result);
			if(result.putfalg == 'true'){
				window.location.href = "<c:url value='/'></c:url>";
			}else if(result.putfalg == 'false'){
				layer.msg("提问失败",{time:1000});
			}  
			   
			   
	   },'json');
	   
	
	});
	
	
	
	
	
	});
});

</script>
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
});



</script>

<script>
//Demo
layui.use('form', function(){

	
  
  
});
</script>




</body>

</html>