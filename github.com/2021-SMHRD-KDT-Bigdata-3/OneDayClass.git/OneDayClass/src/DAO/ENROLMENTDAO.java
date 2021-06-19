package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

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
		public int insert( String state) {
		
			//��Ÿ�� ���� : ���� ���� �� �߻��ϴ� ���� -> ���� ó��
			try{
				conn();
				//sql �ۼ�
				String sql="insert into ENROLMENT(ID,  class_id, state) values (?,?,sysdate,?)";
				
				//PreparedStatement ��ü ����
				pst = conn.prepareStatement(sql);
				
				//���ε� ����(?) ä���
				pst.setString(1,u_dto.getId());
				pst.setInt(2,c_dto.getId());
				pst.setString(3,state);
			
				
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
		
//		// �α���
//				public ENROLMENTDTO login(String id, String pw) {
//
//					try {
//						conn();
//
//						String sql = "select * from users where id=? and pw=?";
//
//						pst = conn.prepareStatement(sql);
//
//						pst.setString(1, id);
//						pst.setString(2, pw);
//
//						rs = pst.executeQuery();
//						if (rs.next()) {
//							String get_id = rs.getString("id");
//							String get_pw = rs.getString("pw");
//							String get_name = rs.getString("name");
//							String get_address = rs.getString("address");
//							String get_recomm = rs.getString("recomm");
//							
//							
//							dto = new USERSDTO(get_id, get_pw, get_name, get_address ,get_recomm);
//						}
//					} catch (Exception e) {
//						System.out.println("�α��� ����");
//						e.printStackTrace();
//					} finally {
//						close();
//					}
//					return dto;
//				}	

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
