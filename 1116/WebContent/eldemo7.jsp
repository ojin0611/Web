<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, java.util.Vector"%>
<%@ page import="java.util.HashMap" %>
<h1>Collection & Array과 EL</h1>
<%
	//List 계열
	//String [] array = {"사과", "딸기", "복숭아", "수박"};
	//ArrayList<String> array = new ArrayList<String>();
	//array.add("사과");   array.add("딸기");  array.add("복숭아");  array.add("수박");
	//Vector<String> array = new Vector<String>(1,1);
	//array.addElement("사과"); array.addElement("수박");
	//array.addElement("오렌지"); array.addElement("복숭아");
	//pageContext.setAttribute("MYFRUITS", array);
	HashMap<String, Object> map = new HashMap<String, Object>();
	map.put("username", "한지민");
	map.put("userage", 24);
	map.put("useraddress", "서울시 강남구 역삼동");
	pageContext.setAttribute("YOURINFO", map);
%>
<ul>
	<li>이름 : ${YOURINFO['username']}</li>
	<li>나이 : ${YOURINFO['userage']} </li>
	<li>주소 : ${YOURINFO['useraddress']} </li>
</ul>