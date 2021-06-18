package contoller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.CLASSDAO;
import DAO.REVIEWDAO;


@WebServlet("/REVIEW_insert")
public class REVIEW_insert extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("euc-kr");

		String id = request.getParameter("id");
		int rating = Integer.parseInt(request.getParameter("rating"));
		String comm = request.getParameter("comm");
		
		
		int cnt = 0;

		
		REVIEWDAO r_dao = new REVIEWDAO();
		cnt = r_dao.insert_review(id, rating, comm);

		if (cnt > 0) {
			System.out.println("ȸ������ ����!");
			request.setAttribute("id", id);
			request.setAttribute("rating", rating);
			request.setAttribute("comm", comm);
			
			

			// �α��� �������� �̵�
			//������������� �̵��ؾ���
			RequestDispatcher rd = request.getRequestDispatcher("main.jsp");
			rd.forward(request, response);

		}else {
			//��Ͻ����� �������� �̵��ؾ���
			response.sendRedirect("main.jsp");
		}
	}

}
