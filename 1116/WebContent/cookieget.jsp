<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<ul>
	<li>이름 : ${cookie.username.value}</li>
	<li>나이 : ${cookie['userage'].value + 10}세</li>
	<li>성별 : ${cookie['usergender'].value}</li>
</ul>