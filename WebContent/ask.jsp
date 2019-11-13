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
			<aside>
				<h4>所有标签：</h4>
				<div class="tag">java</div>
				<div class="tag">mysql</div>
				<div class="tag">struts</div>
				<div class="tag">html</div>
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







</body>

</html>