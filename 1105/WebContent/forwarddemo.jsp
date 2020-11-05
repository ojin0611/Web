<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");
	String username = request.getParameter("username");
	int userage = Integer.parseInt(request.getParameter("userage"));
	
	if(userage < 20){
%>
	<jsp:forward page="teenage.jsp">
		<jsp:param value="<%=username %>" name="username"/>
		<jsp:param value="<%=userage %>" name="userage" />
	</jsp:forward>
<%  } else if(userage < 65){  %>
	<jsp:forward page="adult.jsp">
		<jsp:param value="<%=username %>" name="username"/>
		<jsp:param value="<%=userage %>" name="userage" />
	</jsp:forward>
<%  }else { %>
	<jsp:forward page="silver.jsp">
		<jsp:param value="<%=username %>" name="username"/>
		<jsp:param value="<%=userage %>" name="userage" />
	</jsp:forward>
<%  } %>