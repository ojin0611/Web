<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.File" %>
<%@ page import="java.io.RandomAccessFile" %>

<%!
	private String intConvertToImage(int count){
		String str = "";
		String strCount = String.valueOf(count);   //"101"
		for(int i = 0 ; i < (6 - strCount.length()) ; i++){
			str += "<img src='images/0.png' />";
		}
		for(int i = 0 ; i < strCount.length() ; i++){
			str += "<img src='images/" + strCount.charAt(i) + ".png'>";
		}
		return str;
	}
%>

<%
	String path = application.getRealPath("/");  //1104 context의 물리적 경로
	/*
		Eclispe 의 경우
		D:\WebHome\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\1104\
	*/
	path += "WEB-INF/count.txt";
	RandomAccessFile raf = new RandomAccessFile(new File(path), "rw");
	String strCount = raf.readLine();  //"0"
	int count = Integer.parseInt(strCount);   //0
	count++;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	 방문자 수 : <%=intConvertToImage(count) %>
</body>
</html>
<%
	raf.seek(0);  //이렇게 해야 덮어쓴다.
	raf.writeBytes(String.valueOf(count));
	raf.close();
%>