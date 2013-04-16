<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="sec9.DBBean" %>
<%@page import="java.sql.*" %>
<%@page import="sec9.Book" %>
<jsp:useBean id="db2" class="sec9.DBBean" scope="application" >
</jsp:useBean>
<jsp:useBean id="book" class="sec9.Book" scope="session">
</jsp:useBean>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>修改成功</h3>
<%
String bookname=request.getParameter("bookname");
int bookprice=Integer.parseInt(request.getParameter("bookprice"));
String bookcontent=request.getParameter("bookcontent").trim();
String bookintro=request.getParameter("bookintro").trim();
db2.update("update WORK set WORK_NAME='"+bookname+"', WORK_INTRO='"+bookintro+"',WORK_PRICE="+bookprice+",WORK_CONTENT='"+bookcontent+"' where WORK_NAME='"+book.getname()+"'");

%>

<p>书名： <%=bookname %></p>
<p>简介： <%=bookintro %></p>
<p>价格： <%=bookprice %></p>
<p>内容： <%=bookcontent %></p>

</body>
</html>