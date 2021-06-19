package contoller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.CLASSDAO;

import DTO.CLASSDTO;

 

@WebServlet("/CLASS_select")
public class CLASS_select extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//�ѱ� ���ڵ�
		request.setCharacterEncoding("euc-kr");
		//join.jsp���� ���� ���� ������ ���
		
		int id = Integer.parseInt(request.getParameter("id"));
		
		
		CLASSDAO c_dao = new CLASSDAO();
		CLASSDTO c_dto = c_dao.allselect(id);
		
		//session��ü ����
		HttpSession session = request.getSession();
		session.setAttribute("CLASS", c_dto);
		response.sendRedirect("class_datil.jsp");
		
		
	}

}
