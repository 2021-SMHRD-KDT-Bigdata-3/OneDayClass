package contoller;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.CLASSDAO;
import DAO.USERSDAO;
import DTO.TEACHERSDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/CLASS_insert")
public class CLASS_insert extends HttpServlet {
	
 
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("euc-kr");
		HttpSession session = request.getSession();
		
		// img ������ ������ ���
		String savePath = request.getServletContext().getRealPath("img");
		
		// ������ �ִ� ũ�� ����
		int maxSize = 5 * 1024 * 1024; // 5Mb
		
		// ���ڵ� ��� ����
		String encoding = "euc-kr";
		
		MultipartRequest multi = new MultipartRequest(request,
				savePath, maxSize, encoding, new DefaultFileRenamePolicy());
		String title = multi.getParameter("title");
		String file = multi.getFilesystemName("img");
		if(file==null) {
			file = "X";
		}
		String content = multi.getParameter("content");
		
		TEACHERSDTO teacher = (TEACHERSDTO) session.getAttribute("login");
		String id = teacher.getTeacher_id();
		String time = multi.getParameter("time");
		String price = multi.getParameter("price");
		String category = multi.getParameter("category");
		String image = "img" + '/' + file;
		String icon = image;
		System.out.println(id + " " + title + " " + content + " " + time + " " + price + " " + category + " " + image);
		int cnt = 0;

		CLASSDAO c_dao = new CLASSDAO();
		cnt = c_dao.insert_class(id, title, content, time, price, category, image, icon);

		if (cnt > 0) {
			System.out.println("�� �ۼ� ����!");

			// �α��� �������� �̵�
			//������������� �̵��ؾ���
			RequestDispatcher rd = request.getRequestDispatcher("mypage_teacher.jsp");
			rd.forward(request, response);

		}else {
			//��Ͻ����� �������� �̵��ؾ���
			response.sendRedirect("mypage_teacher2.jsp");
		}
		
	}

}
