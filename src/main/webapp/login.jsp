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
<body>
	<div style="padding: 15px;">
		<form class="layui-form" action="login/login" method="post">
		  <div class="layui-form-item">
		    <label class="layui-form-label">用户名：</label>
		    <div class="layui-input-inline" style="width:300px">
		      <input type="text" name="name" lay-verify="name" placeholder="请输入" autocomplete="off" class="layui-input">
		    </div>
		  </div>
		  <div class="layui-form-item">
		    <div class="layui-input-block">
		      <button class="layui-btn" lay-submit="" lay-filter="demo1">登录</button>
		      <button type="reset" class="layui-btn layui-btn-primary">重置</button>
		    </div>
		  </div>
		 </form>
    </div>
</body>
</html>