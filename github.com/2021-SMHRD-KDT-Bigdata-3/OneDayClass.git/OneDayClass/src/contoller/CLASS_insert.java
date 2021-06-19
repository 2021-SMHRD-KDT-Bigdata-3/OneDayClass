package contoller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.CLASSDAO;
import DAO.USERSDAO;


@WebServlet("/CLASS_insert")
public class CLASS_insert extends HttpServlet {
	
 
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("euc-kr");

		String id = request.getParameter("id");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String time = request.getParameter("time");
		String place = request.getParameter("place");
		String category = request.getParameter("category");
		String image = request.getParameter("image");

		int cnt = 0;

		
		CLASSDAO c_dao = new CLASSDAO();
		cnt = c_dao.insert_class(id, title, content, time, place, category, image);

		if (cnt > 0) {
			System.out.println("ȸ������ ����!");
			request.setAttribute("id", id);
			request.setAttribute("pw", title);
			request.setAttribute("name", content);
			request.setAttribute("address", time);
			request.setAttribute("address", place);
			request.setAttribute("address", category);
			request.setAttribute("address", image);
			

			// �α��� �������� �̵�
			//������������� �̵��ؾ���
			RequestDispatcher rd = request.getRequestDispatcher("main.jsp");
			rd.forward(request, response);

		}else {
			//��Ͻ����� �������� �̵��ؾ���
			response.sendRedirect("register_user.html");
		}
		
	}

}
