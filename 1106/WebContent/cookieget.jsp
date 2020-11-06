<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%!
	private String getCookieValue(String name, Cookie [] array){
		String value = "";
		if(array == null) {
			return "";
		}else{
			for(int i = 0 ; i < array.length ; i++){
				if(array[i].getName().equals(name)){
					value = array[i].getValue();
				}
			}
			return value;
		}
	}
%>     
    
<%  
	Cookie [] array = request.getCookies();  
%>
<h1>Cookie Get</h1>
<ul>
	<li>이름 : <%=getCookieValue("NAME", array) %></li>
	<li>나이 : <%=getCookieValue("AGE", array) %></li>
	<li>주소 : <%=getCookieValue("ADDRESS", array) %></li>
</ul>
<div>
	<button onclick="javascript:location.href='cookieset.jsp';">Cookie Set</button>
	<button onclick="javascript:location.href='cookiemodify.jsp';">Cookie Modify</button>
	<button onclick="javascript:location.href='cookiedelete.jsp';">Cookie Delete</button>
</div>