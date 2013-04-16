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
<title>supplement</title>
</head>
<body>
<h3>充值成功</h3>
<%
int point=Integer.parseInt(request.getParameter("supplement")); 
db2.update("update WRITER set WRITER_POINT="+point+" where WRITER_NAME='"+writer.getname()+"'");
%>

<p>积分： <%=point %></p>
</body>
</html>