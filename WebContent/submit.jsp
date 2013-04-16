<%@ page import = "sec9.*" %>
<%@ page language="java" contentType="text/html; charset=GBK"
    pageEncoding="GBK"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>虚拟在线读书网登录页面</title>
</head>
<body>
<h3>欢迎登录虚拟在线读书网</h3>
<br>
<form method="post" action=/sec09/submitTemp.jsp>
<p>用户名<input  name="userName"></p>
<p>密        码<input  name="passWord"></p>

<p><input type="submit" name="Login" value="登陆">
<input type="button" name="Regist" value="注册" onclick="window.open('/sec09/regist.jsp')">
</p>
</form>
</body>
</html>