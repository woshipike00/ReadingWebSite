<%@ page import = "sec9.*" %>
<%@ page language="java" contentType="text/html; charset=GBK"
    pageEncoding="GBK"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="registIM" class="sec9.regist" scope="session"></jsp:useBean>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>ע��ҳ��</title>
</head>
<body>
<form method="post" action="/sec09/registTemp.jsp">
<p>�û���<input  name="userName"></p>
<p>��        ��<input  name="passWord"></p>
<p>���˼��<input  name="introduction"></p>
<p>���<input  name="is"></p>
<p><input type="submit" name="RE" value="ע    ��">
</p>
</form>
</body>
</html>