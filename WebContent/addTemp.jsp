<%@ page import = "sec9.*" %>
<%@ page language="java" contentType="text/html; charset=GBK"
    pageEncoding="GBK"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="userIM" class="sec9.submit" scope="session"></jsp:useBean>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>��ֵҳ��</title>
</head>
<body>
<%String m1=request.getParameter("money");
int m2=Integer.parseInt(m1);
add a=new add(userIM.getUserName(),m2) ;%>
��ֵ�ɹ�!
</body>
</html>