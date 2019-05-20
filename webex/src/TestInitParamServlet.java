
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class TestInitParamServlet
 */
@WebServlet(urlPatterns = { "/Test.do" }, initParams = {
		@WebInitParam(name = "managerEmail", value = "manager@aaa.com") })
// 이 서블릿에서만 사용할 initParams 생성

public class TestInitParamServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		ServletConfig servletConfig = getServletConfig();
		// ServletConfig는 인터페이스이기 때문에 new 로 객체 생성 불가

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");

		PrintWriter out = response.getWriter();
		out.println("<html>");
		out.println("<head><title>Test.do</title></head>");
		out.println("<body><h3>Servlet 초기화 파라미터 값 출력1</h3>");
		out.println("	<p>manager email : " + servletConfig.getInitParameter("managerEmail"));
		out.println("	<br>admin email : " + servletConfig.getInitParameter("adminEmail") + "</p></body>");
		// 클라이언트 데이터는 request 객체에 담겨서 온다
		out.println("</html>");
	}

}