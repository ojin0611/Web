package com.example.libs.view;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.example.libs.controller.SelectService;

@WebServlet("/servlets/servlet/CountryCode")
public class CountryCodeServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res)
	throws ServletException, IOException{
 		ArrayList<String> list = SelectService.getCountryCode();
		
		res.setContentType("text/html;charset=utf-8"); // 한글도 나오게 하는 명령어
		PrintWriter out = res.getWriter();
		out.println("<link rel='stylesheet' href='../../css/style.css'>");
		out.println("<h1>Select CountryCode</h1>");
		out.println("<form action='CityList' method='GET'>");
		out.print("CountryCode : ");
		out.println("<select name='code'>");
		out.println("<option>--선택--</option>");
		for(int i =0; i < list.size(); i++) {
			out.println("<option value='" + list.get(i) + "'>" + list.get(i) + "</option>");
		}
		out.print("</select>&nbsp;&nbsp;");
		out.println("<button>OK</button>");
		out.println("</form>");
		out.close();
	}
}
