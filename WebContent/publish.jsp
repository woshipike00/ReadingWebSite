<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="sec9.DBBean" %>
<%@page import="java.sql.*" %>
<%@page import="sec9.Writer" %>


<jsp:useBean id="db2" class="sec9.DBBean" scope="application" >
</jsp:useBean>

<jsp:useBean id="writer" class="sec9.Writer" scope="session">
</jsp:useBean>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>publish</title>
</head>
<body>

<h3>发表</h3>
<form method="post" action="/sec09/publish1.jsp">
<p>
标题：<br/>
 <input type="text" name="workname">
</p>
<p>
简介： <br/>
<textarea rows="3" cols="80" name="workintro">
</textarea>
</p>
<p>
正文： <br/>
<textarea rows="10" cols="80" name="workcontent">
</textarea>
</p>

<input type="submit" value="发表">
</form>
</body>
</html>