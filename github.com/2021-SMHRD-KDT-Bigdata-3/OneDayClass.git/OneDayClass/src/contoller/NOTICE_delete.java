package contoller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.NOTICEDAO;
import DAO.TEACHERSDAO;
 

@WebServlet("/NOTICE_delete")
public class NOTICE_delete extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//�ѱ� ���ڵ�
				request.setCharacterEncoding("euc-kr");
				
				int num = Integer.parseInt(request.getParameter("num"));
				
				NOTICEDAO n_dao = new NOTICEDAO();
				int cnt = n_dao.delete(num);
				
				//insert �������� ��쿡�� main.jsp�� �̵�, �������� ��쿡�� join.jsp�� �̵�
				if(cnt>0){
					System.out.println("�������� ����");
					//ȸ������ jsp�� �̵��ؾ���(������ �����ؾ���)
					response.sendRedirect("main.jsp");
					
					
				}else {
					System.out.println("�������� ����");					
					response.sendRedirect("main.jsp");
				}
	}

}
