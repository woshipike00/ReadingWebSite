<%@ page import = "sec9.*" %>
<%@ page language="java" contentType="text/html; charset=GBK"
    pageEncoding="GBK"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="userIM" class="sec9.submit" scope="session"></jsp:useBean>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>欢迎使用虚拟在线读书网</title>
</head>
<body>
<%System.out.println(222222222);
String tempName=request.getParameter("userName");
String tempPass=request.getParameter("passWord");
userIM.setUserName(tempName);
userIM.setPassWord(tempPass);
userIM.isRight();
//submit sub=new submit(userIM.getUserName(),userIM.getPassWord());
System.out.println(userIM.getUserName());
System.out.println(userIM.getWriter());%>
<%if(userIM.getWriter()==0 && userIM.isRight()){%>
	管理员登录成功
	<meta http-equiv="refresh" content="1; url=/sec09/Manager.jsp" />
<% }else{
	 if(!userIM.isRight()){%>
<%=userIM.getUserName() %>
用户名或密码错误
<%}else{%>
登录成功
<meta http-equiv="refresh" content="1; url=/sec09/mainPage.jsp" />
<%	
}}
%>
</body>
</html>