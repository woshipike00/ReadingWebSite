<%@ page import = "sec9.*" %>
<%@ page language="java" contentType="text/html; charset=GBK"
    pageEncoding="GBK"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="db2" class="sec9.DBBean" scope="application" >
</jsp:useBean>
<jsp:useBean id="userIM" class="sec9.readerPage" scope="session" >
</jsp:useBean>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>读者个人页面</title>
</head>
<body>
<%readerPage r=new readerPage(userIM.getUserName());
System.out.println(userIM.getUserName()+"99999999999999999999999999999999");%>
用户名：<%=r.getUserName() %>
<br>
<br>
个人介绍：<%=r.getIntroduction() %>
<br>
<br>
积分：<%=r.getIntegral() %>
<br>
<br>
<input type="button" name="Login" value="修改个人信息" onclick="window.open('/sec09/regist.jsp')">
<input type="button" name="Regist" value="充值" onclick="window.open('http:/sec09/add.jsp')">

</body>
</html>