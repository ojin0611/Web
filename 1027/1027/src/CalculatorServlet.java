import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class CalculatorServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res)
	throws ServletException, IOException{
		req.setCharacterEncoding("utf-8");
		String result = this.calc(req);
		
		res.setContentType("text/html;charset=utf-8");
		PrintWriter out = res.getWriter();
		out.println(result);
		out.println("<hr>");
		out.println("<img src='../../images/jimin.jpg' alt='한지민 이미지'>");
		out.close();
	}
	private String calc(HttpServletRequest req) {
		int count = 0;
		String name = req.getParameter("irum");
		String today = String.format("귀하가 방문한 날짜는 %1$tY년 %1$tm월 %1$td일입니다.",
				new Date());
		int [] array = {5+6, 8-3, 7*6, 15/3, 8+6-3*2/2};
		for(int i = 1; i < 6; i++) {
			String quest = req.getParameter("question" + i);
			int su = Integer.parseInt(quest);
			if(su == array[i-1]) 
				count++;
		}
		String str = "<span style='color:blue'>" + name + "</span>님! <br />";
		str += today + "<br / >";
		str += array.length + "문제 중 " + (array.length - count) + "개를 틀려서 " +
			   "<span style='color:red'>" + (count * 20) + "점</span>입니다.";
		return str;
	}
}
