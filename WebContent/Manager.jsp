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
<title>Manager</title>
</head>
<body>
<h3>管理员主页</h3>
<h5>被举报作品</h5>
<%ResultSet rs=db2.query("select WORK_NAME,WORK_AUTHOR from WORK where WORK_ISREPORTED=1");%>

<form methoed="post" action="/sec09/deletework.jsp">

<table cellspacing="30">
<tr>
<td>选择</td> <td>作品名</td> <td>作者</td> <td>删除原因</td>
</tr>
<%while(rs.next()) {%>
<tr>
<td><input type="checkbox" name="delwork" value="<%=rs.getString(1) %>"></td>
<td><%=rs.getString(1) %></td>
<td><%=rs.getString(2) %></td>
<td><input type="text" name="<%=rs.getString(1)+"reason" %>"></td>
</tr>
<%} %>
</table>
<input type="submit" name="Submit" value="删除">

</form>


</body>
</html>