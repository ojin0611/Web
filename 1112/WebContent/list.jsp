<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- ArrayList와 TelephoneVO를 사용하기 위한 import --%>    
<%@ page import = "java.util.ArrayList" %>
<%@ page import = "com.example.libs.model.TelephoneVO" %>
    
<%-- SelectService로 list를 받아오기 위해 import (useBean)--%>    
<jsp:useBean  id = "select"  class = "com.example.libs.service.SelectService"/>
     
<%
	ArrayList<TelephoneVO> list = select.selectTelephone();
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>재우 전화국 전화요금 관리프로그램</title>

<link rel = "stylesheet"  href = "css/bootstrap.css">
<script src = "js/jquery-3.5.1.js"></script>

</head>
<body>

    <h1 class = "text-center">&lt;&lt;11월 전화요금 명세서&gt;&gt;</h1>       <!--  &lt; : <    &gt; : >  --> <!-- 꺽새를 태그로 보므로-->
    <div class="container">     <!-- BootStrap 사용위해 div 2개-->
        <div class="row">
            <table class="table">
                <tr>
                    <td>[<a href = "input.html">입력하기</a>]</td>
                    <td class = "text-right"><%= select.getCurrentDate() %></td>
                </tr>
            </table>
        </div>
    </div>

    <div class="container">
        <div class="row">
            <table class="table">
            
                <thead>
                    <tr class = "info">
                    	<th>순서</th>
                        <th>구분</th>
                        <th>전화번호</th>
                        <th>이름</th>
                        <th>기본요금</th>
                        <th>통화료</th>
                        <th>세금</th>
                        <th>합계</th>
                    </tr>
                </thead>
                <tbody>
                	<% if(list == null) { %>
                				<tr><td  colspan = "7"  class = "text-center">No Data</td></tr>
                	<% 
                			}else { 		//data가 있다면
                					for(int i = 0 ; i < list.size(); i++) {
                						TelephoneVO telephone = list.get(i);
                	%>
                				<tr>
                					<td><%= telephone.getSeq() %></td>
		                			<td><%= telephone.getKind() %></td>
		                			<td><%= telephone.getTel() %></td>
		                			<td><%= telephone.getName() %></td>
		                			<td><%= telephone.getDefaultFee() %></td>
		                			<td><%= telephone.getFee() %></td>
		                			<td><%= telephone.getTax() %></td>
		                			<td><%= telephone.getTotal() %></td>
		                		</tr>
					<% 		 }  //for end %>                			
                	<% }  //if end %>
                </tbody>
                
            </table>
        </div>
    </div>
    
</body>
</html>