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
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Writer</title>
</head>
<body>
<h3> 作家主页 </h3>
<p>
<%
  
  //Statement stmt1=db2.con.createStatement();
  //ResultSet rst1=stmt1.executeQuery("select WRITER_INTRO from WRITER where WRITER_NAME='"+writer.getname()+"'"); 
  ResultSet rst1=db2.query("select WRITER_INTRO from WRITER where WRITER_NAME='"+writer.getname()+"'");
  rst1.next();
%>
作家姓名 : <%=writer.getname()%> <br/>
作家简介 : <%=rst1.getString(1)%> <br/>

</p>
<p>
<input type="submit" name="modify" value="修改资料" onclick="javascript:location.href='writermodify.jsp'"/>
</p>


<form method="post" action="/sec09/managebook.jsp">

选择需要管理的书籍： <br/>
<select name="bookname" size="1">
<%

//Statement stmt2=db2.con.createStatement();
//ResultSet rst2=stmt2.executeQuery("select WORK_NAME from WORK where WORK_AUTHOR='"+writer.getname()+"'");
ResultSet rst2=db2.query("select WORK_NAME from WORK where WORK_AUTHOR='"+writer.getname()+"'");


%>

<%while(rst2.next()){%>
<option> <%=rst2.getString(1)%> </option>
<%} %>
</select><br/>
<input type="submit" name="Submit" value="修改"> 
</form>

<p><input type="submit" name="publish" value="发表" onclick="javascript:location.href='publish.jsp'"/></p>

<form method="post" action="/sec09/supplement.jsp">
<p><input type="submit" name="Submit" value="充值">  <input type="text" name="supplement">   </p>
</form>

</body>
</html>