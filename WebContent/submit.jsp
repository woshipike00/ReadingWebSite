<%@ page import = "sec9.*" %>
<%@ page language="java" contentType="text/html; charset=GBK"
    pageEncoding="GBK"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>�������߶�������¼ҳ��</title>
</head>
<body>
<h3>��ӭ��¼�������߶�����</h3>
<br>
<form method="post" action=/sec09/submitTemp.jsp>
<p>�û���<input  name="userName"></p>
<p>��        ��<input  name="passWord"></p>

<p><input type="submit" name="Login" value="��½">
<input type="button" name="Regist" value="ע��" onclick="window.open('/sec09/regist.jsp')">
</p>
</form>
</body>
</html>