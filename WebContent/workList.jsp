<%@ page import = "sec9.*" %>
<%@ page language="java" contentType="text/html; charset=GBK"
    pageEncoding="GBK"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%-- <jsp:useBean id="userIM" class="pages.submit" scope="session"></jsp:useBean>
<jsp:setProperty name="userIM" property="*"/> --%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>������Ʒ�б�</title>
</head>
<body>
<%String WriteName = request.getParameter("id"); %>
<h3><%=WriteName%>����Ʒ�б�</h3>
<%workList wl=new workList(WriteName);
for(int i=0;i<wl.getNumbers();i++){%>
<h2><%=wl.getwork_name(i) %></h2>
��Ʒ�۸�<%=wl.getPrice(i) %>
<br>
<br>
��Ʒ��飺<%=wl.getIntroduction(i) %>
<br>
<br>
��Ʒ�������<%=wl.getPoint(i) %>
<br>
<br>
<input type = "submit" name = "upload" value = "�Ķ�" onclick = "javascript:location.href='ReadBook.jsp?id=<%=wl.getwork_name(i)%>'"/>
<input type = "submit" name = "upload" value = "����" onclick = "javascript:location.href='pay.jsp?id=<%=wl.getwork_name(i)%>'"/>
<% 
}
%>
</body>
</html>