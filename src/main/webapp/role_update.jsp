<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <li class="layui-nav-item">
          <a class="" href="javascript:;">权限管理</a>
          <dl class="layui-nav-child">
            <dd><a href="<%=path %>/authority_index.jsp">查询权限</a></dd>
            <dd><a href="<%=path %>/authority_add.jsp">添加权限</a></dd>
          </dl>
        </li>
        <li class="layui-nav-item layui-nav-itemed">
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
		<form class="layui-form" action="<%=path %>/role/update" method="post">
		
		<div class="layui-form-item">
		    <label class="layui-form-label">角色编号</label>
		    <div class="layui-input-inline" style="width:300px">
		      <input type="text" name="id" value="${role.id }" lay-verify="name" readonly="readonly" autocomplete="off" class="layui-input">
		    </div>
		  </div>
		
		  <div class="layui-form-item">
		    <label class="layui-form-label">角色名</label>
		    <div class="layui-input-inline" style="width:300px">
		      <input type="text" name="name" value="${role.name }" lay-verify="name" placeholder="请输入" autocomplete="off" class="layui-input">
		    </div>
		  </div>
		  
		  <div class="layui-form-item">
		    <label class="layui-form-label">选择权限</label>
		    <div class="layui-input-block">
		    	<c:forEach items="${auths }" var="authority" varStatus="status">
		    		<c:if test="${authority.has}">
		    			<input type="checkbox" name="auths" title="${authority.name }" value="${authority.id }" checked="">
		    		</c:if>
		    		<c:if test="${!authority.has}">
		    			<input type="checkbox" name="auths" title="${authority.name }" value="${authority.id }">
		    		</c:if>
		    	</c:forEach>
		    </div>
		  </div>
		  
		  <div class="layui-form-item">
		    <div class="layui-input-block">
		      <button class="layui-btn" lay-submit="" lay-filter="demo1">立即提交</button>
		      <button type="reset" class="layui-btn layui-btn-primary">重置</button>
		    </div>
		  </div>
		 </form>
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
layui.use(['form'], function(){
  var form = layui.form;
  
  //自定义验证规则
  form.verify({
	  name: function(value){
      if(value.length == 0){
        return '请输入角色名';
      }
    }
  });
 
});
</script>
</body>
</html>



