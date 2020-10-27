import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HelloServlet extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse res)
	throws IOException, ServletException{
		// System.out.println("Hello, World"); // 콘솔 표준 출력
		
		PrintWriter pw = res.getWriter(); // res는 나가는 것 
		pw.println("<p style='font-size:3em;color:red'>Hello Servlet 한글도 인식해요</p>");
		
		pw.close();
		
		// HTML속에 JAVA : JSP (MVC중) V
		// JAVA 속에 HTML : SERVLET (MVC중) C
	}
}
