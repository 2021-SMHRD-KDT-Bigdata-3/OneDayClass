package contoller;

import java.io.IOException;
import java.util.ArrayList;

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
		String search1 = request.getParameter("search1");
		
		String search2 = request.getParameter("search2");
		
		String search1_ = "title";
		if(search1 !=null)
			search1_ = search1;
		
		String search2_ ="";
		if(search2 != null)
			search2_ = search2;
		System.out.println(search2_);
		
		CLASSDAO c_dao = new CLASSDAO();
		ArrayList<CLASSDTO> c_dto_title = c_dao.title_select(search2_);
		System.out.println(c_dto_title);
		//session��ü ����
		HttpSession session = request.getSession();
		session.setAttribute("CLASS", c_dto_title);
		response.sendRedirect("main_recomm.jsp");
		
		
	}

}
