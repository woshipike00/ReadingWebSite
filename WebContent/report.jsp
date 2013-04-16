<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Report</title>
</head>
<body>
<h3>您已举报成功</h3>
<%String WorkName = request.getParameter("id"); %>
<%=WorkName %>
<%Class.forName("com.ibm.db2.jcc.DB2Driver").newInstance();                        //连接数据库            
String url="jdbc:db2://localhost:50000/SAMPLE";
String user="pike";
String password="8321593";
Connection connection=DriverManager.getConnection(url,user,password);
Statement statement=connection.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
ResultSet result=statement.executeQuery("select * from work where work_name='"+WorkName+"'");
result.next();
//result.updateInt(1,id+1);
int isR=result.getInt(2);
if (isR==0)
{
	result.updateInt(2,1);
	result.updateRow();
}
result.close();
%>
	<form name = "form1" method = "post" action = "/sec09/ReadBook.jsp?id=<%=WorkName %>">
		<input type="submit" name="Submit" value="返回阅读页面" />
		</form>
</body>
</html>