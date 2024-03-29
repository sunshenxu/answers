<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>My JSP 'test.jsp' starting page</title>
<link rel="stylesheet" href="../css/goodstudy.css">

<script type="text/javascript" src="../layui/layui.js"></script>
<link rel="stylesheet" href="../layui/css/layui.css" media="all">
<script type="text/javascript" src="../js/jquery-3.3.1.js"></script>
	

<script>
	$().ready(function() {

	});
</script>
</head>

<body>
	<div id="container">
		<input type="hidden" id="msg" value="" />
		<div class="crumb">
			<span class="breadcrumb"> <a href="javascript:void(0);">后台</a>&gt;
				<a href="javascript:void(0);">用户管理</a>&gt; <a
				href="javascript:void(0);">角色修改</a>
			</span>
		</div>
		<div class="operatewin">
			<form class="editform" action="/GoodStudy/worker/rolesave.do"
				method="post" style="width: 360px;">
				<!-- 添加隐藏的文本框,避免文本框里输入回车自动提交表单的问题 -->
				<input style="display: none" />
				<div class="form-item">
					<div class="form-label">
						<label>角色编号:</label>
					</div>
					<div class="input-inline">
						<input type="text" class="txt" name="roleId" value="1" readOnly />
					</div>
				</div>
				<div class="form-item">
					<div class="form-label">
						<label>角色名称:</label>
					</div>
					<div class="input-inline">
						<input type="text" class="txt" name="roleName" value="管理员" />
					</div>
				</div>
				<div class="form-item">
					<div class="form-label">
						<label>当前权限:</label>
					</div>

				</div>
				<div>
					<div class="form-label">
						<label>标签管理:</label>
					</div>
					<input type="checkbox" name="rights" value="1" checked />新增权限 <input
						type="checkbox" name="rights" value="2" />修改权限 <input
						type="checkbox" name="rights" value="3" checked />删除权限
				</div>
				<div>
					<div class="form-label">
						<label>用户管理:</label>
					</div>
					<input type="checkbox" name="rights" value="4" checked />新增权限 <input
						type="checkbox" name="rights" value="5" />修改权限 <input
						type="checkbox" name="rights" value="6" checked />删除权限
				</div>
				<div class="form-item">
					<div class="form-label">
						<input type="submit" value="保存" class="btn normal" /> <input
							type="reset" value="重置" class="btn normal" />
					</div>
				</div>
			</form>
		</div>
	</div>

</body>
</html>
