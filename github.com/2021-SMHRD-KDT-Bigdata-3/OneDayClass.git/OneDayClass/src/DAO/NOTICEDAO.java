package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import DTO.NOTICEDTO;



public class NOTICEDAO {

	Connection conn = null;
	PreparedStatement pst = null;
	int cnt = 0;
	ResultSet rs = null;
	NOTICEDTO dto = null;
	
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
		
		//ȸ������ 
		public int insert_notice(String n_title, String n_content) {
		
			//��Ÿ�� ���� : ���� ���� �� �߻��ϴ� ���� -> ���� ó��
			try{
				conn();
				//sql �ۼ�
				String sql="insert into notice(n_title,n_content) values (NOTICE_NNUM_SEQ.nextval,?,?,sysdate)";
				
				//PreparedStatement ��ü ����
				pst = conn.prepareStatement(sql);
				
				//���ε� ����(?) ä���
				pst.setString(1, n_title);
				pst.setString(2,n_content);
				
				
				//sql�� ����
				 cnt = pst.executeUpdate();
						
			}catch(Exception e){
				e.printStackTrace();
				System.out.println("��� ����");
			}finally{
				close();
			}
			return cnt;
		}// �޼ҵ峡		
		
//		// �α��� 
//				public USERSDTO login(String id, String pw) {
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
				public int update(int num) {
					
					//��Ÿ�� ���� : ���� ���� �� �߻��ϴ� ���� -> ���� ó��
					try{
						conn();
						
						//sql �ۼ�
						String sql="update notice set num=?";
							
						
						//PreparedStatement ��ü ����
						pst = conn.prepareStatement(sql);
						
						//���ε� ����(?) ä���					
						pst.setInt(1, num);
						
						
						
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

				public int delete(int num) {
					
					//��Ÿ�� ���� : ���� ���� �� �߻��ϴ� ���� -> ���� ó��
					try{
						conn();
						
						//sql �ۼ�
						String sql="delete from notice where num = ?";
						
						//PreparedStatement ��ü ����
						pst = conn.prepareStatement(sql);
						
						//���ε� ����(?) ä���
						pst.setInt(1, num);
						
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
