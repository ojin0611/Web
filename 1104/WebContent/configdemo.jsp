<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.RandomAccessFile, java.io.File" %>
<%
	String path = config.getInitParameter("mariadb.properties");
	String url = application.getInitParameter("db.url");
%>
<ul>
	<li>MariaDB properties : <%=path %></li>
	<li>MySQL url : <%=url %></li>
</ul>
<hr />
<%
	File file = new File(path);
	RandomAccessFile raf = new RandomAccessFile(file, "r");
	String line = null;
	while((line = raf.readLine()) != null){
		out.println(line + "<br />");
	}
	raf.close();
%>