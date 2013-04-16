<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="sec9.DBBean" %>
<%@page import="java.sql.*" %>

<jsp:useBean id="db2" class="sec9.DBBean" scope="application" >
</jsp:useBean>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>deletework</title>
</head>
<body>
<h3>删除成功</h3>

<%String[] delwork=request.getParameterValues("delwork");%>
<table cellspacing=30>
<tr>
<td>作品名</td><td>删除原因</td>
</tr>
<%for (int i=0;i<delwork.length;i++){ %>
<%
String reason=request.getParameter(delwork[i]+"reason");
db2.update("update WORK set WORK_ISREPORTED=2,WORK_INTRO='"+reason+"' where WORK_NAME='"+delwork[i]+"'");
%>
<tr>
<td><%=delwork[i] %></td><td><%=reason %></td>
</tr>

<%} %>

</table>

</body>
</html>