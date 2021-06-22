package contoller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.CLASSDAO;
import DAO.USERSDAO;
import DTO.CLASSDTO;
import DTO.USERSDTO;

 
@WebServlet("/CLASS_update")
public class CLASS_update extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//�ѱ� ���ڵ�
		request.setCharacterEncoding("euc-kr");
		
		//update.jsp���� ���� ���� ������ ���
		
				String title = request.getParameter("title");
				String content = request.getParameter("content");
				String time = request.getParameter("time");
				String place = request.getParameter("place");
				String category = request.getParameter("category");
				String image = request.getParameter("image");
				String icon =  request.getParameter("icon");
				
				
				//�����ؾ��� ������� ������ �˱����� ���ǰ� ��������
				HttpSession session = request.getSession();
				CLASSDTO c_dto = (CLASSDTO)session.getAttribute("CLASS");
				
				CLASSDAO c_dao = new CLASSDAO();
				int cnt = c_dao.update(title, content, time, place, category, image);
				
				if(cnt>0){
					System.out.println("Ŭ���� ���� ����");
					CLASSDTO c_dto2 =new CLASSDTO(c_dto.getId(),c_dto.getTeacher_id(), title, content,time, place,  category, image, icon);
					session.setAttribute("CLASS", c_dto2);				
					response.sendRedirect("main.jsp");
					
				}else {
					System.out.println("Ŭ���� ���� ����");
					response.sendRedirect("main.jsp");
				}
	}

}
