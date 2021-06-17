package contoller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import DAO.USERSDAO;


@WebServlet("/USERS_delete")
public class USERS_delete extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//�ѱ� ���ڵ�
				request.setCharacterEncoding("euc-kr");
				
				String id = request.getParameter("id");
				
				USERSDAO dao = new USERSDAO();
				int cnt = dao.delete(id);
				
				//insert �������� ��쿡�� main.jsp�� �̵�, �������� ��쿡�� join.jsp�� �̵�
				if(cnt>0){
					System.out.println("ȸ������ ����");
					//ȸ������ jsp�� �̵��ؾ���(������ �����ؾ���)
					response.sendRedirect("main.jsp");
					
					
				}else {
					System.out.println("ȸ������ ����");					
					response.sendRedirect("main.jsp");
				}
			}

	}


