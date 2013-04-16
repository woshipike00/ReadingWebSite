<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="sec9.DBBean" %>
<%@page import="sec9.Writer" %>
<jsp:useBean id="db2" class="sec9.DBBean" scope="application" >
</jsp:useBean>
<jsp:useBean id="writer" class="sec9.Writer" scope="session" >
</jsp:useBean>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>writermodify</title>
</head>
<body>
<h3>修改资料</h3>
<form method="post" action="/sec09/writermodify1.jsp">
<p>设置姓名： <input type="text" name="name" /></p>
<p>设置密码： <input type="text" name="password" /></p>
<p>设置简介： <input type="text" name="intro" /></p>
<p><input type="submit" name="Submit" value="修改" /></p>
<p><input type="reset" name="Reset" /></p>
</form>
</body>
</html>