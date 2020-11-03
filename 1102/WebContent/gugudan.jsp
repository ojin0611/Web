<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	h1 { text-align:center;}
	table {
		border :1px solid black;
		width:400px;
		margin-left:auto; margin-right:auto;
		border-collapse : collapse;
	}
	th{
		background-color: navy;  color:white;
		width:100px;
	}
	td, th{
		border : 1px solid black;
	}
	td{
		text-align:center;
	}
</style>
</head>
<body>
		<h1>Gugudan</h1>
		<table border='1'>
			<tr>
				<% for(int i = 2;  i < 6 ; i++){ %>
					<th><%=i %>단</th>
				<% } %>
			</tr>
			<tr>
				<% for(int i = 2 ; i < 6 ; i++){ %>
					<td>
						<% for(int j = 1 ; j < 10 ; j++){ %>
							<%=i %> x <%=j %> = <%=i * j %><br />
						<% }  %>
					</td>
				<% } %>
			</tr>
			<tr>
				<% for(int i = 6 ; i < 10 ; i++){ %>
					<th><%=i %>단</th>
				<% }  %>
			</tr>
			<tr>
				<% for(int i = 6 ; i < 10 ; i++){ %>
					<td>
						<% for(int j = 1 ; j < 10 ; j++){ %>
							<%=i %> x <%=j %> = <%= i * j %><br />
						<% }  %>
					</td>
				<% } %>
			</tr>
		</table>
</body>
</html>