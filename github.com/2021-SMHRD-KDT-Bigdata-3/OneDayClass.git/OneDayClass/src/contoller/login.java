package contoller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.TEACHERSDAO;
import DAO.USERSDAO;
import DTO.TEACHERSDTO;
import DTO.USERSDTO;
 
@WebServlet("/login")
public class login extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("euc-kr");

		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String op = (String) request.getParameter("op");

		if (op.equals("user")) {
			USERSDAO dao = new USERSDAO();
			USERSDTO dto = dao.login(id, pw);

			if (dto != null) {
				System.out.println("�α��� ����!");
				HttpSession session = request.getSession();
				session.setAttribute("type", op);
				session.setAttribute("login", dto);
				response.sendRedirect("main.jsp");
			} else {
				System.out.println("�α��� ����!");
				response.sendRedirect("login_main.html");
			}

		} else {
			TEACHERSDAO dao = new TEACHERSDAO();
			TEACHERSDTO dto = dao.login(id, pw);

			if (dto != null) {
				System.out.println("�α��� ����!");
				HttpSession session = request.getSession();
				session.setAttribute("type", op);
				session.setAttribute("login", dto);
				response.sendRedirect("main.jsp");
			} else {
				System.out.println("�α��� ����!");
				response.sendRedirect("login_main.html");
			}
		}

	}

}
