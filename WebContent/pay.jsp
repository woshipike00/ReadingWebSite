<%@ page import = "sec9.*" %>
<%@page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=GBK"
    pageEncoding="GBK"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="userIM" class="sec9.submit" scope="session"></jsp:useBean>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>付款界面</title>
</head>
<body>
<%String WorkName = request.getParameter("id"); %>
<h3><%=WorkName%>作品的付款界面</h3>
<%
Class.forName("com.ibm.db2.jcc.DB2Driver").newInstance();                        //连接数据库            
String url="jdbc:db2://localhost:50000/SAMPLE";
String user="pike";
String password="8321593";
Connection connection=DriverManager.getConnection(url,user,password);
Statement statement=connection.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
ResultSet result=statement.executeQuery("select * from work where work_name='"+WorkName+"'");
result.next();
int price=result.getInt(1);
String name = result.getString("Work_author").trim();
String tempReader=new String();
if (result.getString(8)!=null)
{
	tempReader = result.getString(8).trim();
}
result.close();
String detect = tempReader;
boolean flag=false;
if (detect!=null)
{
	String []tokens=detect.split(",");
	for (int i=0;i<tokens.length;i++)
	{
		if (tokens[i].trim().equals(userIM.getUserName()))
			flag = true;
	}
}

if (name.equals(userIM.getUserName()))
{%>
	自己的作品不用付款
	
<%
}
else if (flag==true)
{%>
	您已经买过这本书了，无需重复购买
<%}
else
{
	System.out.println("**********************************");
	int is = userIM.getWriter();
	ResultSet result2;
	if (is==1) 
	{
		result2=statement.executeQuery("select * from writer where writer_name='"+userIM.getUserName()+"'");
		result2.next();
		int temp = result2.getInt(4);
		if (temp<price)
		{%>
			您的余额不足；
		<%}
		else
		{
			temp = temp -price;
			System.out.println(temp);
			System.out.println("**********************************");
			result2.updateInt(4,temp);
			result2.updateRow();
			result2.close();
			ResultSet result3=statement.executeQuery("select * from writer where writer_name='"+name+"'");
			result3.next();
			int Wprice = result3.getInt(4);
			Wprice = Wprice + price;
			result3.updateInt(4,Wprice);
			result3.updateRow();
			result3.close();
			%>
			您已成功充值；
			<%
			result=statement.executeQuery("select * from work where work_name='"+WorkName+"'");
			result.next();
			if (tempReader==null)
			{
				String isRead = userIM.getUserName();
				result.updateString(8,isRead);
				result.updateRow();
				System.out.println(isRead);
				System.out.println("##############################");
				result.close();
			}
			else
			{
				System.out.println("##############################");
				String isRead = tempReader + "," + userIM.getUserName();
				System.out.println(isRead.length());
				result.updateString(8,isRead);
				result.updateRow();
				result.close();
			}
		}
	}
	else
	{
		result2=statement.executeQuery("select * from Reader where username='"+userIM.getUserName()+"'");
		result2.next();
		int temp = result2.getInt(3);
		if (temp<price)
		{%>
		您的余额不足；
		<%}
		else
		{
			temp = temp -price;
			result2.updateInt(4,temp);
			result2.updateRow();
			result2.close();
			ResultSet result3=statement.executeQuery("select * from writer where writer_name='"+name+"'");
			result3.next();
			int Wprice = result3.getInt(4);
			Wprice = Wprice + price;
			result3.updateInt(4,Wprice);
			result3.updateRow();
			result3.close();
			%>
			您已成功充值；
			<%
			result=statement.executeQuery("select * from work where work_name='"+WorkName+"'");
			result.next();
			if (tempReader==null)
			{
				String isRead = userIM.getUserName();
				result.updateString(8,isRead);
				result.updateRow();
				result.close();
			}
			else
			{
				String isRead = tempReader + "," + userIM.getUserName();
				result.updateString(8,isRead);
				result.updateRow();
				result.close();
			}
		}
	}
}
%>
<br>
<br>


</body>
</html>