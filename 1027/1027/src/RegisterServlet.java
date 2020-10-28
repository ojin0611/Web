import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class RegisterServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res)
     throws ServletException, IOException{
		req.setCharacterEncoding("utf-8");   // POST 방식일때만 사용
		String username = req.getParameter("username");
		String today = String.format("%1$tY년 %1$tm월 %1$td일입니다.", new Date());
		
		res.setContentType("text/html;charset=utf-8");
		PrintWriter out = res.getWriter();
		out.println("<div>");
		out.println("<span style='color:blue'>" + username + "</span>");
		out.println("님! 귀하의 방문 시간은 </div>");
		out.println("<div>" + today + "</div>");
		out.close();
	}
}
