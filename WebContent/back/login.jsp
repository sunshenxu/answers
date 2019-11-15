<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>后台登录页面</title>

<script type="text/javascript" src="<c:url value='/layui/layui.js'></c:url>"></script>
<link rel="stylesheet" href="<c:url value='/layui/css/layui.css'></c:url>" media="all">
<script type="text/javascript" src="<c:url value='/js/jquery-3.3.1.js'></c:url>"></script>
<style type="text/css">
#login {
	width: 650px;
	height: 350px;
	margin: 150px auto;
	
}

.layui-form-item{
	margin-top:50px;
}
h1{
	margin-top: 50px;
	margin-left: 215px;
	font-family: "fontnameRegular";
	font-size:30px;
}







@font-face {
 font-family: 'fontnameRegular';
 src: url('<c:url value='/css/fontname.eot'></c:url>');
 src: local('fontname Regular'),
        local('fontname'),
        url('<c:url value='/css/fontname.ttf'></c:url>') format('truetype'),
        url('<c:url value='/css/fontname.svg#fontname'></c:url>') format('svg');
}

</style>



</head>
<body>
	<div id="login">
	<h1>欢迎登录后台系统</h1>
		<form class="layui-form" lay-filter="loginform">
			<div class="layui-form-item">
				<label class="layui-form-label">账号</label>
				<div class="layui-input-block">
					<input type="text" name="userid" lay-verify="required"
						placeholder="请输入账号" autocomplete="off" class="layui-input">
				</div>
			</div>

			<div class="layui-form-item">
				<label class="layui-form-label">密码</label>
				<div class="layui-input-block">
					<input type="password" name="passwd" lay-verify="required|pass"
						placeholder="请输入密码" autocomplete="off" class="layui-input">
				</div>
			</div>


			<div class="layui-form-item" id="submitbtn">
				<div class="layui-input-block">
					<button class="layui-btn layui-btn-lg" lay-submit lay-filter="login">登录</button>
					<button type="reset" class="layui-btn layui-btn-primary layui-btn-lg">重置</button>
				</div>
			</div>
			<input name="method" value="login" type="text" hidden />
			
		</form>


	</div>
	<!-- 标识，如果没有登录，而直接通过url地址栏访问我要提问按钮，就会自动跳转到首页，
		不能直接访问，并且提示让你去登录
	 -->
	<span id="logstatus" status="${requestScope.logstatus }"></span>

<script>
	$(function() {
		layui.use('layer', function() {
			var layer = layui.layer;
			//如果没有登录，就会提示让你登录，并可以直接通过url访问提问页面
			var f = $("#logstatus").attr("status");
			
			if(f=="false"){
				layer.msg("会话已经失效，请重新登录",{time:1000});
			}
			
		});
		
		
		
		layui.use('form', function() {
			var form = layui.form;
			
			form.on('submit(login)', function(data) {
				var ii = layer.load();
				//layer.msg(JSON.stringify(data.field));
				$.post("<c:url value='/back'></c:url>",data.field,function(result){
					layer.close(ii);
					//console.log(result.logflag);
					
					if(result.logflag=="true"){
						layer.msg("登录成功",{time:1000});
						setTimeout(function(){
							window.location.href = "<c:url value='/back?method=isLogin'></c:url>";
							
						},1000);
						
					}else if(result.logflag=="false"){
						layer.msg("登录失败",{time:1000});
					}
					
					
				},'json');
				
				return false;
			});
			
			
			//自定义的表单验证
			form.verify({
				pass : [ /^[\S]{6,12}$/, '密码必须6到12位，且不能出现空格' ]
			});
			

		});

	});
</script>



</body>
</html>

