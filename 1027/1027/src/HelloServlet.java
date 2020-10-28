import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HelloServlet extends HttpServlet {
	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse res) 
		throws IOException, ServletException{
			PrintWriter out = res.getWriter();
			out.println("<h1>Welcome Servlet</h1>");
			out.println("<div>Hello, World</div>");
			out.println("<div style='color:red;font-size:2em;'>");
			out.println("Hello, World</div>");
			
			out.close();
		
	}
}
