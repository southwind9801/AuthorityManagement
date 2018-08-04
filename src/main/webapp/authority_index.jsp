<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="<%=path %>/static/layui/css/layui.css">
	<script type="text/javascript" src="<%=path %>/static/layui/layui.js"></script>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
  <div class="layui-header">
    <div class="layui-logo">后台管理系统</div>
    <!-- 头部区域（可配合layui已有的水平导航） -->
    <ul class="layui-nav layui-layout-left">
      <li class="layui-nav-item"><a href="">控制台</a></li>
      <li class="layui-nav-item"><a href="">信息管理</a></li>
      <li class="layui-nav-item layui-this">
        <a href="javascript:;">权限管理</a>
      </li>
    </ul>
    <ul class="layui-nav layui-layout-right">
      <li class="layui-nav-item">
        <a href="javascript:;">
          <img src="<%=path %>/static/layui/images/img.png" class="layui-nav-img">
          南风
        </a>
        <dl class="layui-nav-child">
          <dd><a href="">基本资料</a></dd>
          <dd><a href="">安全设置</a></dd>
        </dl>
      </li>
      <li class="layui-nav-item"><a href="">退出</a></li>
    </ul>
  </div>
  
  <div class="layui-side layui-bg-black">
    <div class="layui-side-scroll">
      <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
      <ul class="layui-nav layui-nav-tree"  lay-filter="test">
        <li class="layui-nav-item layui-nav-itemed">
          <a class="" href="javascript:;">权限管理</a>
          <dl class="layui-nav-child">
            <dd class="layui-this"><a href="<%=path %>/authority_index.jsp">查询权限</a></dd>
            <dd><a href="<%=path %>/authority_add.jsp">添加权限</a></dd>
          </dl>
        </li>
        <li class="layui-nav-item">
          <a href="javascript:;">角色管理</a>
           <dl class="layui-nav-child">
            <dd><a href="<%=path %>/role_index.jsp">查询角色</a></dd>
            <dd><a href="<%=path %>/role/getAuths">添加角色</a></dd>
          </dl>
        </li>
        <li class="layui-nav-item"><a href="javascript:;">用户管理</a>
          <dl class="layui-nav-child">
            <dd><a href="<%=path %>/user_index.jsp">查询用户</a></dd>
            <dd><a href="<%=path %>/user/getRoles">添加用户</a></dd>
          </dl>
        </li>
      </ul>
    </div>
  </div>
  
  <div class="layui-body">
    <!-- 内容主体区域 -->
    <div style="padding: 15px;">
<table class="layui-table" lay-data="{width: 892, height:483, url:'authority/getAll', page:true, id:'idTest'}" lay-filter="demo">
  <thead>
    <tr>
      <th lay-data="{type:'checkbox', fixed: 'left'}"></th>
      <th lay-data="{field:'id', sort: true, fixed: true}">ID</th>
      <th lay-data="{field:'name', }">权限名</th>
      <th lay-data="{fixed: 'right', width:178, align:'center', toolbar: '#barDemo'}"></th>
    </tr>
  </thead>
</table>
 
<script type="text/html" id="barDemo">
  <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
  <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>

    </div>
  </div>
  
  <div class="layui-footer">
    <!-- 底部固定区域 -->
    © 南风
  </div>
</div>
<script>
layui.use('element', function(){
	  var element = layui.element;
	  
	});
	layui.use('table', function(){
		  var table = layui.table;
		  //监听工具条
		  table.on('tool(demo)', function(obj){
		    var data = obj.data;
		    if(obj.event === 'del'){
		      layer.confirm('确定要删除吗？', function(index){
		    	 window.location.href="authority/deleteById/"+data.id;
		      });
		    } else if(obj.event === 'edit'){
		    	window.location.href="authority/findById/"+data.id;
		    }
		  });
		 
		});
</script>
</body>
</html>