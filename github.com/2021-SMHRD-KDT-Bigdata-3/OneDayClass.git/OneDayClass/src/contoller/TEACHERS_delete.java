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

 
@WebServlet("/TEACHERS_delete")
public class TEACHERS_delete extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		TEACHERSDTO teacher = (TEACHERSDTO)session.getAttribute("login");
		//�ѱ� ���ڵ�
		request.setCharacterEncoding("euc-kr");
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		TEACHERSDAO t_dao = new TEACHERSDAO();
		int cnt = t_dao.delete(id,pw);
		
		//insert �������� ��쿡�� main.jsp�� �̵�, �������� ��쿡�� join.jsp�� �̵�
		if(cnt>0){
			System.out.println("ȸ������ ����");
			//ȸ������ jsp�� �̵��ؾ���(������ �����ؾ���)
			session.invalidate();
			response.sendRedirect("main.jsp");
			
			
		}else {
			System.out.println("ȸ������ ����");					
			response.sendRedirect("main.jsp");
		}
	}

}
