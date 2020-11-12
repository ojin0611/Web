<%@page import="com.example.libs.model.DBClose"%>
<%@page import="com.example.libs.model.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%-- <%@ page import = "com.example.libs.model.*,  java.sql.*" %> --%>
<%
	Connection conn = DBConnection.getConnection();
	
	out.println(conn);
	DBClose.close(conn);	//close : 닫는게 아니라 반납!
%>