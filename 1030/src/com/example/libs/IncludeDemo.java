package com.example.libs;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class IncludeDemo extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE html>");
		out.println("<html>");
		RequestDispatcher header = 
				request.getRequestDispatcher("/header.html");
		header.include(request, response);
		
		RequestDispatcher body = 
				request.getRequestDispatcher("/servlets/servlet/Now");
		body.include(request, response);
		
		RequestDispatcher footer = 
				request.getRequestDispatcher("/copyright.html");
		footer.include(request, response);
		
		out.println("</html>");
		out.close();
	}

}
