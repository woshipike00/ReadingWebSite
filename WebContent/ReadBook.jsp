<%@ page import = "sec9.*" %>
<%@page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; 

charset=GBK"
    pageEncoding="GBK"%>

<jsp:useBean id="userIM" class="sec9.submit" 

scope="session"></jsp:useBean>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; 

charset=GBK">
<title>作品界面</title>
</head>
<body>
<%String WorkName = request.getParameter("id"); %>
<h3><%=WorkName%>的全文阅读</h3>
<%Class.forName("com.ibm.db2.jcc.DB2Driver").newInstance();                        //连接数据库            
String url="jdbc:db2://localhost:50000/SAMPLE";
String user="pike";
String password="8321593";
Connection connection=DriverManager.getConnection(url,user,password);
Statement statement=connection.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
ResultSet result=statement.executeQuery("select * from work where WORK_NAME='"+WorkName+"'");
result.next();
String name = userIM.getUserName().trim();
String isRead = result.getString(8);
boolean flag=false;
if (isRead!=null)
{
	String []tokens=isRead.split(",");
	for (int i=0;i<tokens.length;i++)
	{
		if (tokens[i].trim().equals(name))
			flag = true;
	}
}
String WriterName = result.getString("WORK_AUTHOR").trim();
if (name.equals(WriterName))
	flag = true;

if (flag==true)
{
	int PressNum = result.getInt(3);
	PressNum++;
	result.updateInt(3,PressNum);
	result.updateRow();
	%>
	<%=result.getString("WORK_CONTENT") %>
<%
}
else
{
%>
	你无权观看此书，必须先付款；
<%
}
result.close();
%>
<br>
<br>
<p><input type="button" name="isReported" value="举报" onclick="javascript:location.href='report.jsp?id=<%=WorkName%>'" /></p>
<input type="button" name="isReported" value="返回上一页" onclick="javascript:location.href='workList.jsp?id=<%=WriterName%>'">
</body>
</html>