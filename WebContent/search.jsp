<%@ page import = "sec9.*" %>
<%@ page language="java" contentType="text/html; charset=GBK"
    pageEncoding="GBK"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>Insert title here</title>
</head>
<body>
<form method="post" action="/sec09/mainPage.jsp">
<h3>��ѯ��Ŀ��</h3>
<br>
<%=request.getParameter("txtName") %>
<br>
<h3>������£�</h3>
<br>
<%search s=new search(request.getParameter("txtName")); %>
<%=s.getReturns(0) %>
<h2><%=s.getReturns(1) %></h2>
<%String kind=s.getReturns(0);
if(kind.equals("����")){
	%><input type="button" name="works" value="��Ʒ�б�" onclick="window.open('/sec09/workList.jsp?id=<%=s.getReturns(1) %>')">
	<% }else if(kind.equals("��Ʒ")){
		%><input type = "button" name = "upload" value = "�Ķ�" onclick = "javascript:location.href='ReadBook.jsp?id=<%=s.getReturns(1)%>'"/>
		<input type = "button" name = "upload" value = "����" onclick = "javascript:location.href='pay.jsp?id=<%=s.getReturns(1)%>'"/>
		<!--<input type="button" name="works" value="����Ķ�" onclick="window.open('/sec09/search.jsp')">
		--><% 
	}

%>
<br>
<br>
<br>
<input type="submit" name="works" value="������ҳ">

</body>
</html>