<%@ page import = "sec9.*" %>
<%@ page language="java" contentType="text/html; charset=GBK"
    pageEncoding="GBK"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="userIM" class="sec9.submit" scope="session"></jsp:useBean>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>充值页面</title>
</head>
<body>
<form method="post" action="/sec09/addTemp.jsp">
输出充值金额：<input  name="money">
<input type="submit" name="sure" value="确认充值">
</body>
</html>