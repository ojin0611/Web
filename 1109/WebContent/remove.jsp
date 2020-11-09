<%@ page import="java.util.Vector" pageEncoding="utf-8" session="false"%>
<h1>삭제할 CD를 선택해 주세요.</h1>
<form method="POST">
  <select name="item">
    <option value="">--선택--</option>
    <%
    	Vector<String> cart = (Vector<String>)application.getAttribute("mycart");
    	for(int i = 0 ; i < cart.size() ; i++){
    %>
    		<option value="<%=cart.get(i) %>"><%=cart.get(i) %></option>
    <%  } // for end  %>
  </select><br />
  <input type="hidden" name="step" value="remove"><br />
  <input type="submit" value="카트에서 빼기">
</form>