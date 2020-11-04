<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String name = request.getParameter("username");
	String age = request.getParameter("age");
	double weight = Double.parseDouble(request.getParameter("weight"));
	double height = Double.parseDouble(request.getParameter("height")) / 100;
	double bmi = weight / Math.pow(height, 2);
	if(bmi >= 40){
		out.print("<span style='color:red'>고도비만<br>");
	}else if(bmi >= 35 && bmi < 40){
		out.print("<span style='color:orange'>중등도비만<br>");
	}else if(bmi >= 30 && bmi < 35){
		out.print("<span style='color:yellow'>경도비반<br>");
	}else if(bmi >= 23 && bmi < 30){
		out.print("<span style='color:green'>과체중<br>");
	}else if(bmi >= 18.5 && bmi < 23){
		out.print("<span style='color:blue'>정상<br>");
	}else{
		out.print("<span style='color:purple'>저체중<br>");
	}
	out.println(name + "(" + age + ")<br>");
	out.println(bmi + "</span>");
%>