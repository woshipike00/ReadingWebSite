<%@ page import = "sec9.*" %>
<%@ page language="java" contentType="text/html; charset=GBK"
    pageEncoding="GBK"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%-- <jsp:useBean id="userIM" class="pages.submit" scope="session"></jsp:useBean>
<jsp:setProperty name="userIM" property="*"/> --%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>作家作品列表</title>
</head>
<body>
<%String WriteName = request.getParameter("id"); %>
<h3><%=WriteName%>的作品列表</h3>
<%workList wl=new workList(WriteName);
for(int i=0;i<wl.getNumbers();i++){%>
<h2><%=wl.getwork_name(i) %></h2>
作品价格：<%=wl.getPrice(i) %>
<br>
<br>
作品简介：<%=wl.getIntroduction(i) %>
<br>
<br>
作品点击数：<%=wl.getPoint(i) %>
<br>
<br>
<input type = "submit" name = "upload" value = "阅读" onclick = "javascript:location.href='ReadBook.jsp?id=<%=wl.getwork_name(i)%>'"/>
<input type = "submit" name = "upload" value = "付款" onclick = "javascript:location.href='pay.jsp?id=<%=wl.getwork_name(i)%>'"/>
<% 
}
%>
</body>
</html>