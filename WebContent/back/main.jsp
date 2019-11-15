<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<title>后台管理</title>
<link rel="stylesheet" href="<c:url value='/css/goodstudy.css'></c:url>">

<script type="text/javascript" src="<c:url value='/layui/layui.js'></c:url>"></script>
<link rel="stylesheet" href="<c:url value='/layui/css/layui.css'></c:url>" media="all">
<script type="text/javascript" src="<c:url value='/js/jquery-3.3.1.js'></c:url>"></script>

<script language="javascript">
	$(function(){
			//$("li").find("ul").prev(): 有 子节点 ul的 li的前一个节点,ul前的超链接 
			$("li").find("ul").prev().click(
				function(){
					//$(this).next()://嵌套的 ul
					//toggleClass("hide"),切换样式 
					$("[class='secondMenu display']").not($(this).next()).toggleClass("display");//隐藏之前展开的
					$(this).next().toggleClass("display");//展开本次单击的
				}
			);
		}
	);
</script>

<style type="text/css">
#mainheader{
	text-align: right;
}

#mainheader a{
	color:white;
	padding:0px 20px;
	margin-top:35px;
	
	display:inline-block;
}

#updatelink{
	border-right: 3px solid white;
}

#exitlink{
	margin-right:35px;

}

</style>
</head>
<body>
<div>
	<!--头部-->
	
	<div id="mainheader">
	<a id="updatelink" href="javascript:void(0);">欢迎：<c:out value="${sessionScope.backUser.name }" default="未登录"></c:out></a>
	<a href="javascript:void(0);" id="exitlink">退出</a>
	</div>
	<div id="mainaside">
		<ul id="listUL">
			<li class="firstMenu"><a href="javascript:void(0);">问答管理</a>
				<ul class="secondMenu">
					<li><a href="back/mquestion.jsp" target="content">问答管理</a></li>
				</ul>
			</li>
			<li class="firstMenu"><a href="javascript:void(0);">用户管理</a>
				<ul class="secondMenu">
					<li><a href="#">人员管理</a></li>
					<li><a href="back/role.jsp" target="content">角色管理</a></li>
					<li><a href="#">权限管理</a></li>
				</ul>
			</li>
			<li class="firstMenu"><a href="javascript:void(0);">数据统计</a>
				<ul class="secondMenu">
					<li><a href="#">问题统计</a></li>
					<li><a href="#">积分统计</a></li>
				</ul>
			</li>
			<li class="firstMenu"><a href="javascript:void(0);">基础资料</a>
				<ul class="secondMenu">
					<li><a href="#" target="content">客户管理</a></li>
					<li><a href="back/tag.jsp" target="content">标签管理</a></li>
				</ul>
			</li>
		</ul>
	</div>
	<div id="maincontent">
	
		<iframe src="" name="content" id="operate" frameborder="0"
			scrolling="no" width="100%" style="min-height:750px;overflow:hidden;"></iframe>
	</div>
</div>


<!-- 修改密码 -->
<div id="updatepwd" style="display:none">
<form class="layui-form" lay-filter="updateForm" action="" onsubmit="return false">
	<div class="layui-form-item">
		<label class="layui-form-label">原密码</label>
		<div class="layui-input-inline">
			<input type="password" name="oldpasswd" lay-verify="required|pass|passwd"
				placeholder="6-12位密码" autocomplete="off" class="layui-input">
		</div>
	</div>

	<div class="layui-form-item">
		<label class="layui-form-label">新密码</label>
		<div class="layui-input-inline">
			<input type="password" name="newpasswd" lay-verify="required|pass"
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
			<button class="layui-btn" lay-submit lay-filter="up">修改</button>
			<button type="reset" class="layui-btn layui-btn-primary">重置</button>
		</div>
	</div>
	
	<input name="method" value="updatePwd" type="text" hidden />
</form>
</div>


	
<script type="text/javascript">
$(function(){
	//退出
	$("#exitlink").on("click",function(){
		//询问框

		layer.confirm('确认退出？', {
		  btn: ['确定','取消'] //按钮
		}, function(){
			window.location.href= "<c:url value='/back?method=exit'></c:url>";
		  	//layer.msg('的确很重要', {icon: 1});
		}, function(){
		  layer.msg('取消', {
		    time: 1000, //1s后自动关闭
		    
		  });
		});
	});
	
	
	
	
	layui.use('layer', function() {
		var layer = layui.layer;
		//提示信息
		$("#updatelink").on('mouseover ',function(){
			layer.tips('修改密码', '#updatelink', {
				  tips: 3
			});
		});
		
		
		$("#exitlink").on('mouseover ',function(){
			layer.tips('退出', '#exitlink', {
				  tips: 3
			});
		});
		
		
		//弹出修改密码框
		$("#updatelink").bind("click", function() {
			layer.open({
				type : 1,
				title : '修改密码',
				//skin: 'layui-layer-rim', //加上边框
				area : [ '398px', '345px' ], //宽高:398,282;
				//content: $('#sublayer'),//content: $('#sublayer').html()会丢失事件
				resize : false,   //不能改变大小
				content : $("#updatepwd"),
				closeBtn : 1,
			});
		});
		
		
	});
	
	
	//表单操作
	layui.use('form', function() {
		var form = layui.form;
		
		
		
		form.on('submit(up)', function(data) {
			
			var ii = layer.load();
			//layer.msg(JSON.stringify(data.field));
			$.post("<c:url value='/back'></c:url>",data.field,function(result){
				layer.close(ii);
				//console.log(result.logflag);
				
				if(result.updateflag=="true"){
					layer.msg("修改成功,请重新登录",{time:1000});
					setTimeout(function(){
					form.val("updateForm",{   //更改输入框的值
							"oldpasswd":"",
							"passwdAgin":"",
							"newpasswd":"",
						});
						layer.closeAll();
						
						window.location.href="<c:url value='/back/login.jsp'></c:url>";
					},1000);
					
				}else if(result.updateflag=="false"){
					layer.msg("修改失败",{time:1000});
				}
				
				
			},'json');
			
			return false;
		}); 
		
		
		
		
		//自定义的表单验证
		form.verify({
			passAgin : function(value, item) { //value：表单的值、item：表单的DOM对象
				if (value != $("#passwd").val()) {
					return '两次密码不一致';
				}
			},
			passwd : function(value, item) { //value：表单的值、item：表单的DOM对象
				var passwd = "${sessionScope.backUser.passwd}";
				
				if(passwd!=value){
						return '密码错误';
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
	
	
</body>
</html>