<%@ page import = "sec9.*" %>
<%@ page language="java" contentType="text/html; charset=GBK"
    pageEncoding="GBK"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="registIM" class="sec9.regist" scope="session"></jsp:useBean>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>注册页面</title>
</head>
<body>
<form method="post" action="/sec09/registTemp.jsp">
<p>用户名<input  name="userName"></p>
<p>密        码<input  name="passWord"></p>
<p>个人简介<input  name="introduction"></p>
<p>身份<input  name="is"></p>
<p><input type="submit" name="RE" value="注    册">
</p>
</form>
</body>
</html>