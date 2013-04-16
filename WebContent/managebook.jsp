<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="sec9.DBBean" %>
<%@page import="java.sql.*" %>
<%@page import="sec9.Writer" %>
<%@page import="sec9.Book" %>


<jsp:useBean id="db2" class="sec9.DBBean" scope="application" >
</jsp:useBean>

<jsp:useBean id="writer" class="sec9.Writer" scope="session">
</jsp:useBean>

<jsp:useBean id="book" class="sec9.Book" scope="session">
</jsp:useBean>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>managebook</title>
</head>
<body>
<h3>管理书籍</h3>
<%
String bookname=request.getParameter("bookname");
book.setname(bookname);
ResultSet rst=db2.query("select WORK_NAME,WORK_INTRO,WORK_PRICE,WORK_CONTENT from WORK where WORK_NAME='"+bookname+"'"); 
rst.next();
%>
<form method="post" action="/sec09/managebook1.jsp">
<p>书名： <%=rst.getString(1) %><br/>
<input type="text" name="bookname" ></p>
<p>简介： <%=rst.getString(2) %><br/>
<input type="text" name="bookintro" ></p>
<p>价钱： <%=rst.getString(3) %><br/>
<input type="text" name="bookprice" ></p>
<p>内容： <%=rst.getString(4) %><br/>
<textarea rows="10" cols="80" name="bookcontent">
<%=rst.getString(4)%>
</textarea>
</p>

<input type="submit" name="Submit" value="修改">
<input type="reset" name="Reset">

</form>
</body>
</html>