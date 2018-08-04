<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <div class="layui-logo">商品交易系统</div>
    <!-- 头部区域（可配合layui已有的水平导航） -->
    <ul class="layui-nav layui-layout-left">
      <li class="layui-nav-item layui-this">
        <a href="javascript:;">用户中心</a>
      </li>
    </ul>
    <ul class="layui-nav layui-layout-right">
      <li class="layui-nav-item">
        <a href="javascript:;">
          <img src="<%=path %>/static/layui/images/img2.png" class="layui-nav-img">
          莱昂
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
          <a class="" href="javascript:;">用户权限</a>
          <dl class="layui-nav-child">
          	<c:forEach items="${auths }" var="auth">
      			 <dd><a href="<%=path %>/authority_add.jsp">${auth.name }</a></dd>
      		</c:forEach>
          </dl>
        </li>
      </ul>
    </div>
  </div>
  
  <div class="layui-body">
    <!-- 内容主体区域 -->
    <img style="margin-left: 60px;margin-top: 30px" width="1100px" alt="" src="<%=path %>/static/layui/images/bg.png">
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
		      layer.confirm('真的删除行么', function(index){
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