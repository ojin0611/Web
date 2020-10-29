package com.example.libs.view;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.example.libs.controller.InsertService;

@WebServlet("/servlets/servlet/Register")
public class RegisterServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res)
     throws ServletException, IOException{
		req.setCharacterEncoding("utf-8");
		String username = req.getParameter("username");
		String userage = req.getParameter("userage");
		if(userage.equals("")) userage = "0";
		int age = Integer.parseInt(userage);
		String gender = req.getParameter("gender");
		String hobby = "";
		String [] hobbyArray = req.getParameterValues("hobby");
		if(hobbyArray == null || hobbyArray.length ==0) {
			hobby = "";
		}else {
			for(int i = 0 ; i < hobbyArray.length ;i++) {
				hobby += hobbyArray[i] + ",";
			}  //낚시,등산,게임,영화 감상,
			hobby = hobby.substring(0, hobby.length() - 1);
		}
	
		String city = req.getParameter("city");
		if(city.equals("")) city ="";
		
		res.setContentType("text/html;charset=utf-8");
		PrintWriter out = res.getWriter();

		int row = InsertService.insertMember(username, age, gender, hobby, city);
		if(row==1) {
			res.sendRedirect("../../");
			//out.println("<script>");                      이건 성공했을때 뜨는 화면 명령어다
			//out.println("alert('축하합니다. 회원가입에 성공하셨습니다.');");
			//out.println("location.href = '../../';");
			//out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('회원가입에 실패했습니다. 확인 후 다시 가입해 주세요.');");
			out.println("history.back();");
			out.println("</script>");
		}
		out.close();
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res)
		     throws ServletException, IOException{
		this.doGet(req, res);
	}
}
