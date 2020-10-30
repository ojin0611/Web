package com.example.libs;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ContextDemoServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ServletContext ctx = this.getServletContext();
		Enumeration<String> enums = ctx.getInitParameterNames();
		while(enums.hasMoreElements()) {
			String name = enums.nextElement();
			String value = ctx.getInitParameter(name);
			System.out.println(name + " ---> " + value);
		}
	}

}
