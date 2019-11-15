<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>问题管理</title>

<style type="text/css">
#selectType{
	margin-top:30px;
}
#test{
	margin-top:10px;
}
#head{
	background-color: #F2F2F2;
    border-left: 5px solid #33A7FE;
    padding-left: 10px;
    height: 60px;
    line-height: 60px;
    position: relative;
    margin-top:25px;
    margin-left:25px;
    margin-right:25px;
}

</style>

<script type="text/javascript" src="<c:url value='/layui/layui.js'></c:url>"></script>
<link rel="stylesheet" href="<c:url value='/layui/css/layui.css'></c:url>" media="all">
<script type="text/javascript" src="<c:url value='/js/jquery-3.3.1.js'></c:url>"></script>


</head>
<body>
<div id="conten">

 <div id="head">后台> 问答管理> 问题管理</div> 
 
<!--  <div class="demoTable">
  搜索ID：
  <div class="layui-inline">
    <input class="layui-input" name="id" id="demoReload" autocomplete="off">
  </div>
  <button class="layui-btn" data-type="reload">搜索</button>
</div> -->
 

<div class="layui-form" id="selectType">
 <div class="layui-form-item">
    <label class="layui-form-label">问题类型</label>
    <div class="layui-input-block">
      <select name="interest" lay-filter="wenti" id="changeType">
      
        <option value=""></option>
        <option value="1" selected="">技术问答</option>
        <option value="2">面试题</option>
        <option value="3">即时问答</option>
    
      </select>
    </div>
  </div>
</div>
</div>
<table class="layui-hide" id="test" lay-filter="demo"></table>


<script type="text/javascript">
$(function(){
	
	var gtype = "1";  //全局的，标志着问题的类型
	
	
	layui.use('table', function(){
		var table = layui.table;
		
		
		 loaddata("1");   //默认加载技术问答
		 
		 
		 layui.use('form', function(){
			var form = layui.form;
			  
			
				form.on('select(wenti)', function(data){
				  //console.log(data.value); //得到被选中的值
				  //console.log(data.value=="");   true
				  if(data.value==""){
					  loaddata("1");
					  gtype = "1";
				  }else{
					  loaddata(data.value);
					  gtype = "data.value";
				  }
				  
				});  
			  
			});
		 
		 
		
		
		 
		 
		 
		
		 
		function loaddata(qtype){
			//加载层
			 var index = layer.load(1, {
				  shade: [0.1,'#fff'] //0.1透明度的白色背景
			  });
			 
			 
			
			  table.render({
			    elem: '#test'
			    ,url:'/Answers/back'
			    ,cellMinWidth: 80 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
			    ,cols: [[
			      {field:'id', title: 'id', sort: true, align: 'center'}
			      ,{field:'title', title: '标题', align: 'center'} //width 支持：数字、百分比和不填写。你还可以通过 minWidth 参数局部定义当前单元格的最小宽度，layui 2.2.1 新增
			      ,{field:'username', title: '发表人', align: 'center'}
			      ,{field:'type', title: '类型', align: 'center'}
			      ,{field:'createtime', title: '创建时间', sort: true, align: 'center'}
			      ,{field:'alerttime', title: '修改时间', align: 'center', sort: true} //单元格内容水平居中
			      ,{field:'count', title: '答案总数', sort: true, align: 'center', sort: true}
			      ,{field:'status', title: '状态',  align: 'center'}
			      ,{field:'caozuo', title: '审核',align: 'center',toolbar: '#barDemo'}
			    ]] 
			   ,page: true
			  	,where:{method:'questionList',questiontype:qtype}   //url携带的参数
			  });
			  
			  
			//关闭加载层
			layer.close(index);
		} 
		  
		
		  
		  
		  //监听工具条
		  table.on('tool(demo)', function(obj){
		    var data = obj.data;
		    
		    /* if(obj.event === 'detail'){   //查看按钮
		      layer.msg('ID：'+ data.id + ' 的查看操作');    //获取这行的id
		    } else if(obj.event === 'del'){//删除
		      layer.confirm('真的删除行么', function(index){  
		        obj.del();   //删除一行
		        layer.close(index);
		      });
		    } else if(obj.event === 'edit'){//编辑
		      layer.alert('编辑行：<br>'+ JSON.stringify(data)) 
		    } */
		    
		    if(obj.event === 'del'){
		      layer.confirm('不通过？', function(index){  
		        //obj.del();   //删除
		        //0表示不通过，1表示通过
		      	$.post("<c:url value='/back'></c:url>",{'method':'upstatus','id':data.id,'type':gtype,'status':'0'},function(result){
		      		
		      		if(result.f=="true"){
		      			window.location.reload();
		      		}else if(result.f=="false"){
		      			 layer.msg("审批失败");
		      		}
		      		
		      	},'json');
		      
		      
		        layer.close(index);
		      });
		    } else if(obj.event === 'edit'){
		      //layer.alert('编辑行：<br>'+ JSON.stringify(data))  //获取一行的所有数据
		    	layer.confirm('通过？', function(index){
		    		
		    		$.post("<c:url value='/back'></c:url>",{'method':'upstatus','id':data.id,'type':gtype,'status':'1'},function(result){
			      		
			      		if(result.f=="true"){
			      			window.location.reload();
			      		}else if(result.f=="false"){
			      			 layer.msg("审批失败");
			      		}
			      		
			      	},'json');
			      
		    		
		    		
			        layer.close(index);
			      });
			}
		    
		    
		    
		  });
		  
	});
	
	
});

</script>

<script type="text/html" id="barDemo">
  <a class="layui-btn layui-btn-xs" lay-event="edit">通过</a>
  <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">不通过</a>
</script>


</body>
</html>