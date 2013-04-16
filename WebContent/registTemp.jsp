<%@ page import = "sec9.*" %>
<%@ page language="java" contentType="text/html; charset=GBK"
    pageEncoding="GBK"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="registIM" class="sec9.regist" scope="session"></jsp:useBean>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>注册页面</title>
</head>
<body>
<%
registIM.setUserName(request.getParameter("userName"));
registIM.setPassWord(request.getParameter("passWord"));
registIM.setIntroduction(request.getParameter("introduction"));
registIM.setIS(request.getParameter("is"));
if(registIM.isExist(registIM.getUserName())){%>
<%=registIM.getUserName() %>
用户名已存在
<%}else{
registIM.registWR();%>
注册成功
<meta http-equiv="refresh" content="2; url=/sec09/submit.jsp" />
<%	
}
%>
</body>
</html>