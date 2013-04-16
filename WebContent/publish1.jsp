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
<title>Insert title here</title>
</head>
<body>
<h3>发表成功</h3>
<%
String workname=request.getParameter("workname");
String workintro=request.getParameter("workintro");
String workcontent=request.getParameter("workcontent");
db2.execute("insert into WORK values (0,0,0,'"+workcontent+"','"+workintro+"','"+workname+"','"+writer.getname()+"'"+",'"+writer.getname()+"'"+")");
%>
<p>标题： <br/><%=workname %></p>
<p>简介： <br/><%=workintro %></p>
<p>正文： <br/><%=workcontent %></p>

</body>
</html>