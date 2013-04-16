<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="sec9.DBBean" %>
<%@page import="sec9.Writer" %>
<%@page import="java.sql.*" %>
<jsp:useBean id="db2" class="sec9.DBBean" scope="application" >
</jsp:useBean>
<jsp:useBean id="writer" class="sec9.Writer" scope="session" >
</jsp:useBean>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>writermodify1</title>
</head>
<body>
<%
  String temp=writer.getname();
  writer.setname(request.getParameter("name").trim());
  writer.setpassword(request.getParameter("password").trim());
  writer.setintro(request.getParameter("intro").trim());
  
  db2.update("update WRITER set WRITER_NAME='"+writer.getname()+"',WRITER_PASSWORD='"+writer.getpassword()+"',WRITER_INTRO='"+writer.getintro()+"' where WRITER_NAME='"+temp+"'");
  db2.update("update WORK set WORK_AUTHOR='"+writer.getname()+"' where WORK_AUTHOR='"+temp+"'");
  //System.out.println(writer.getname()+" "+temp);
%>
 <h3>设置成功</h3>
 <p>姓名： <%=writer.getname() %></p>
 <p>密码： <%=writer.getpassword() %></p>
 <p>简介： <%=writer.getintro() %></p>
</body>
</html>