package com.example.libs;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LocalDemoServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		Enumeration<String> enums = this.getInitParameterNames();
//		while(enums.hasMoreElements()) {
//			String name = enums.nextElement();
//			String value = this.getInitParameter(name);
//			System.out.println(name + " --> " + value);
//		}
		String filename = this.getInitParameter("mariadb.properties");
		//C:/temp/mariadb.properties
		DBConnection dbconn = new DBConnection(filename);
		Connection conn = dbconn.getConnection();//2,3
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.println("<h2>" + conn + "</h2>");
		//System.out.println(conn);
		DBClose.close(conn);  //7
		out.close();
	}

}
