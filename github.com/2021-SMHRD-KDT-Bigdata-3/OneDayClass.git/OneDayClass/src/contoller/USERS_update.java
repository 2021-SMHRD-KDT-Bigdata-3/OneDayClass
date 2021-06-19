package contoller;
 
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import DAO.USERSDAO;
import DTO.USERSDTO;

 

@WebServlet("/USERS_update")
public class USERS_update extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//�ѱ� ���ڵ�
				request.setCharacterEncoding("euc-kr");
				
				//update.jsp���� ���� ���� ������ ���
						String pw = request.getParameter("pw");
						String address = request.getParameter("address");
						
						
						//�����ؾ��� ������� ������ �˱����� ���ǰ� ��������
						HttpSession session = request.getSession();
						USERSDTO u_dto = (USERSDTO)session.getAttribute("login");
						
						USERSDAO u_dao = new USERSDAO();
						int cnt = u_dao.update(pw, address);
						
						if(cnt>0){
							System.out.println("ȸ�� ���� ���� ����");
							USERSDTO u_dto2 =new USERSDTO(u_dto.getId(),pw, u_dto.getName(), address, u_dto.getRecomm());
							session.setAttribute("login", u_dto2);				
							response.sendRedirect("mypage_user.jsp");
							
						}else {
							System.out.println("ȸ�� ���� ���� ����");
							response.sendRedirect("mypage_user.jsp");
						}
	}

}
