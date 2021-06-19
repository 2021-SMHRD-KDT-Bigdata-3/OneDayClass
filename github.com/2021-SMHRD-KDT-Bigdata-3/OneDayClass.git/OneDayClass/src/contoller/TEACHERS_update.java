package contoller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.TEACHERSDAO;

import DTO.TEACHERSDTO;

 

@WebServlet("/TEACHERS_update")
public class TEACHERS_update extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//�ѱ� ���ڵ�
		request.setCharacterEncoding("euc-kr");
		
		//update.jsp���� ���� ���� ������ ���
				String pw = request.getParameter("pw");
				String tel = request.getParameter("tel");
				
				
				//�����ؾ��� ������� ������ �˱����� ���ǰ� ��������
				HttpSession session = request.getSession();
				TEACHERSDTO t_dto = (TEACHERSDTO)session.getAttribute("login");
				
				TEACHERSDAO t_dao = new TEACHERSDAO();
				int cnt = t_dao.update(pw, tel);
				
				if(cnt>0){
					System.out.println("ȸ�� ���� ���� ����");
					TEACHERSDTO t_dto2 =new TEACHERSDTO(t_dto.getTeacher_id(), pw, t_dto.getTeacher_name(), tel);
					session.setAttribute("login", t_dto2);				
					response.sendRedirect("mypage_teacher.jsp");
					
				}else {
					System.out.println("ȸ�� ���� ���� ����");
					response.sendRedirect("mypage_teacher.jsp");
				}	
		
		
		
	}

}
