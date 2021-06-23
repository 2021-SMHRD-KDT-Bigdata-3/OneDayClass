package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import DTO.CLASSDTO;
import DTO.ENROLMENTDTO;
import DTO.USERSDTO;
 


public class ENROLMENTDAO {
	Connection conn = null;
	PreparedStatement pst = null;
	int cnt = 0;
	ResultSet rs = null;
	ENROLMENTDTO dto = null;
	USERSDTO u_dto = null;
	CLASSDTO c_dto = null;
	 ArrayList<CLASSDTO> ClassArray = null;
	//�����ͺ��̽� ����
		public void conn() {
			try {
				//jdbc ���̺귯�� �����ε�
				Class.forName("oracle.jdbc.driver.OracleDriver");
				
				String url = "jdbc:oracle:thin:@localhost:1521:xe";
				String dbid = "hr";
				String dbpw = "hr";			
				//Connection ��ü ����
				conn = DriverManager.getConnection(url,dbid,dbpw);			
			}catch(Exception e) {
				e.printStackTrace();
			}	
		}//�޼ҵ� ��
		
		//�ݾ��ֱ�
		public void close() {
			try{
				if(rs!=null) {
					rs.close();				
				}
				pst.close();
				conn.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}//�޼ҵ峡		
		
		//������û
		public int enrolment(String id, String class_id) {
		
			//��Ÿ�� ���� : ���� ���� �� �߻��ϴ� ���� -> ���� ó��
			try{
				conn();
				//sql �ۼ�
				String sql="insert into ENROLMENT values (?,?,sysdate,?)";
				
				//PreparedStatement ��ü ����
				pst = conn.prepareStatement(sql);
				
				//���ε� ����(?) ä���
				pst.setString(1,id);
				pst.setString(2,class_id);
				pst.setString(3,"attend");
			
				
				//sql�� ����
				 cnt = pst.executeUpdate();
						
			}catch(Exception e){
				e.printStackTrace();
				System.out.println("�������� ����");
			}finally{
				close();
			}
			return cnt;
		}// �޼ҵ峡		
		
		// �α���
				public ArrayList<CLASSDTO> allEnrolment(String id) {

					

						ClassArray = new ArrayList<CLASSDTO>();

					try {
						conn();

						String sql = "select * from class where class_id IN (select class_id from enrolment where id = ?)";

						pst = conn.prepareStatement(sql);

						pst.setString(1, id);

						rs = pst.executeQuery();

						

						while(rs.next()) {

							int get_id = rs.getInt("class_id");
							String get_teacher_id = rs.getString("teacher_id");
							String get_title = rs.getString("title");
							String get_content = rs.getString("content");
							String get_time = rs.getString("time");
							String get_price = rs.getString("price");
							String get_category = rs.getString("category");
							String get_image = rs.getString("image");
							String get_icon = rs.getString("icon");

							c_dto = new CLASSDTO(get_id, get_teacher_id, get_title, get_content, get_time, get_price, get_category,
									get_image, get_icon);
							System.out.println(get_id);
							ClassArray.add(c_dto);
						}
					} catch (Exception e) {
						System.out.println("������û ����Ʈ ����!");
						e.printStackTrace();
					} finally {
						close();
					}
					return ClassArray;
				}	

				//������Ʈ	
				public int update(int Class_id) {
					
					//��Ÿ�� ���� : ���� ���� �� �߻��ϴ� ���� -> ���� ó��
					try{
						conn();
						
						//sql �ۼ�
						String sql="update ENROLMENT set class_id=?";
							
						
						//PreparedStatement ��ü ����
						pst = conn.prepareStatement(sql);
						
						//���ε� ����(?) ä���					
						pst.setInt(1, Class_id);
						
						
						
						//sql�� ����
						cnt = pst.executeUpdate();
						
						//insert �������� ��쿡�� main.jsp�� �̵�, �������� ��쿡�� join.jsp�� �̵�
						
					}catch(Exception e){
						e.printStackTrace();
						
					}finally{
						close();
					}
					return cnt;
					
				}
				// delect �޼ҵ�

				public int delete(int class_id) {
					
					//��Ÿ�� ���� : ���� ���� �� �߻��ϴ� ���� -> ���� ó��
					try{
						conn();
						
						//sql �ۼ�
						String sql="delete from ENROLMENT where class_id = ?";
						
						//PreparedStatement ��ü ����
						pst = conn.prepareStatement(sql);
						
						//���ε� ����(?) ä���
						pst.setInt(1, class_id);
						
						//sql�� ����
						cnt = pst.executeUpdate();
							
					}catch(Exception e){
						e.printStackTrace();
						
					}finally{
						close();
					}
					return cnt;
				}
						
}
