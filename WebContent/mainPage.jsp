<%@ page import = "sec9.*" %>
<%@ page language="java" contentType="text/html; charset=GBK"
    pageEncoding="GBK"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="userIM" class="sec9.submit" scope="session"></jsp:useBean>
<jsp:useBean id="writer" class="sec9.Writer" scope="session">
</jsp:useBean>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>�������߶�������ҳ��</title>
</head>
<body>
<form method="post" action="/sec09/search.jsp">
<input type="text" value="��������������" name="txtName" style="color:Gray'"/>
<input type="submit" name="search" value="����">
<br>
<br>
<%writer.setname(userIM.getUserName()); %>
<% if(userIM.getWriter()==1){%>
<input type="button" name="manage" value="�������ҳ��" onclick="window.open('/sec09/Writer.jsp')">
<%;}else{ %>
<input type="button" name="manage" value="�������ҳ��" onclick="window.open('/sec09/readerPage.jsp')">
<%;} %>
<br>
<br>
<h2>�������а�</h2>
��������������������������������������������������
<%int i,j;
mainPage mp=new mainPage(userIM.getUserName());
j=mp.getNumberOfWriters();
for(i=0;i<j;i++){ %>
<p><h3><%=mp.getName(i) %></h3>
<input type="button" name="works" value="��Ʒ�б�" onclick="window.open('/sec09/workList.jsp?id=<%=mp.getName(i) %>')">

<br>
<br>
<%=mp.getIntroduction(i) %>
<br>
<br>
��������������������������������������������������
<br>
<%} %>
<br>
<br>
<h2>�����Ʒ�Ƽ�</h2>
<%String[] l=mp.getList(); %>
<!--<%=mp.getListSize() %>
--><%for(int k=0;k<3;k++){ 
	if(!l[k].equals("0")){%>
	<h2><%=l[k] %></h2>
	<input type = "button" name = "upload" value = "�Ķ�" onclick = "javascript:location.href='ReadBook.jsp?id=<%=l[k]%>'"/>
	<input type = "button" name = "upload" value = "����" onclick = "javascript:location.href='pay.jsp?id=<%=l[k]%>'"/>
	<br>
	<br>
	<% }
}%>

</body>
</html>