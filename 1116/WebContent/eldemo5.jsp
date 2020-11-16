<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

User Address : <%=request.getRemoteAddr() %><br />
User Address : ${pageContext.request.remoteAddr}<br />
Request URI : <%=request.getRequestURI() %><br />
Request URI :  ${pageContext.request.requestURI}<br />