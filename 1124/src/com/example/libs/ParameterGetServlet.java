package com.example.libs;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/servlets/servlet/ParameterGet")
public class ParameterGetServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
				throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String name = request.getParameter("name");
		String age = request.getParameter("age");
		String phone = request.getParameter("phone");
		String str = "<span style='color:blue;font-weight:900;font-size:2em'>" + 
		                  name + "</span>님의 나이는 " + age + "이고, 휴대폰 번호는 " + 
				          phone + " 입니다.";
		out.println(str);
		out.close();
	}
}
