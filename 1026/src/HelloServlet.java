import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HelloServlet extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse res)
		throws IOException, ServletException{
		PrintWriter pw = res.getWriter();
		res.setContentType("text/html;charset=utf-8");
		pw.println("<html>");
		pw.println("<head>");
		pw.println("<meta charset='utf-8'>");
		pw.println("<head>");
		pw.println("<body>");
		pw.println("<p style='font-size:3em;color:red'>Hello 한글</p>");
		pw.println("</body></html>");
		pw.close();
	}
}
