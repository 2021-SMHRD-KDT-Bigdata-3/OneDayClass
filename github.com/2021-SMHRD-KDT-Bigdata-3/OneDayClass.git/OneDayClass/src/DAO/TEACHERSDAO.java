package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import DTO.TEACHERSDTO;
import DTO.USERSDTO;

public class TEACHERSDAO {
	Connection conn = null;
	PreparedStatement pst = null;
	int cnt = 0;
	ResultSet rs = null;
   TEACHERSDTO dto = null;
	
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
		public int insert_teachers(String id, String pw, String name, String tel) {
		
			//��Ÿ�� ���� : ���� ���� �� �߻��ϴ� ���� -> ���� ó��
			try{
				conn();
				//sql �ۼ�
				String sql="insert into TEACHERS values (?,?,?,?)";
				
				//PreparedStatement ��ü ����
				pst = conn.prepareStatement(sql);
				
				//���ε� ����(?) ä���
				pst.setString(1,id);
				pst.setString(2,pw);
				pst.setString(3,name);
				pst.setString(4,tel);
				
				//sql�� ����
				 cnt = pst.executeUpdate();
						
			}catch(Exception e){
				e.printStackTrace();
				System.out.println("���� ����");
			}finally{
				close();
			}
			return cnt;
		}// �޼ҵ峡		
		
		// �α���
				public TEACHERSDTO login(String id, String pw) {

					try {
						conn();

						String sql = "select * from teachers where teacher_id=? and teacher_pw=?";

						pst = conn.prepareStatement(sql);

						pst.setString(1, id);
						pst.setString(2, pw);

						rs = pst.executeQuery();
						if (rs.next()) {
							String get_id = rs.getString("teacher_id");
							String get_pw = rs.getString("teacher_pw");
							String get_name = rs.getString("teacher_name");
							String get_tel = rs.getString("tel");
						
							
							
							dto = new TEACHERSDTO(get_id, get_pw, get_name, get_tel);
						}
					} catch (Exception e) {
						System.out.println("�α��� ����");
						e.printStackTrace();
					} finally {
						close();
					}
					return dto;
				}	

				//������Ʈ	
				public int update(String pw,String tel, String teacher_id) {
					
					//��Ÿ�� ���� : ���� ���� �� �߻��ϴ� ���� -> ���� ó��
					try{
						conn();
						
						//sql �ۼ�
						String sql="update TEACHERS set teacher_pw=?, tel=? where teacher_id=?";
							
						
						//PreparedStatement ��ü ����
						pst = conn.prepareStatement(sql);
						
						//���ε� ����(?) ä���					
						pst.setString(1,pw);
						pst.setString(2,tel);
						pst.setString(3,teacher_id);
						
						
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

				public int delete(String id, String pw) {
					
					//��Ÿ�� ���� : ���� ���� �� �߻��ϴ� ���� -> ���� ó��
					try{
						conn();
						
						//sql �ۼ�
						String sql="delete from TEACHERS where teacher_id = ? and teacher_pw = ?";
						
						//PreparedStatement ��ü ����
						pst = conn.prepareStatement(sql);
						
						//���ε� ����(?) ä���
						pst.setString(1,id);
						pst.setString(2,pw);
						//sql�� ����
						cnt = pst.executeUpdate();
							
					}catch(Exception e){
						e.printStackTrace();
						
					}finally{
						close();
					}
					return cnt;
				}
				
				// �α���
				public String who(String id) {
					String get_id = "";
					try {
						conn();

						String sql = "select teacher_name from teachers where teacher_id=?";

						pst = conn.prepareStatement(sql);

						pst.setString(1, id);
						
						rs = pst.executeQuery();
						if (rs.next()) {
							get_id = rs.getString("teacher_name"); 
						}
					} catch (Exception e) {
						System.out.println("�α��� ����");
						e.printStackTrace();
					} finally {
						close();
					}
					return get_id;
				}
				
						
}
