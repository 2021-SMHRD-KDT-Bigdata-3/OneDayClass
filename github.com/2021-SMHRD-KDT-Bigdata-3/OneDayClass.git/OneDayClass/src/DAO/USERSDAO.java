package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import DTO.USERSDTO;
 
public class USERSDAO {
	Connection conn = null;
	PreparedStatement pst = null;
	int cnt = 0;
	ResultSet rs = null;
    USERSDTO dto = null;
	
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
		public int insert_users(String id, String pw, String name, String address) {
		
			//��Ÿ�� ���� : ���� ���� �� �߻��ϴ� ���� -> ���� ó��
			try{
				conn();
				//sql �ۼ�
				String sql="insert into USERS(ID, PW, NAME, ADDRESS) values (?,?,?,?)";
				
				//PreparedStatement ��ü ����
				pst = conn.prepareStatement(sql);
				
				//���ε� ����(?) ä���
				pst.setString(1,id);
				pst.setString(2,pw);
				pst.setString(3,name);
				pst.setString(4,address);
				
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
				public USERSDTO login(String id, String pw) {

					try {
						conn();

						String sql = "select * from users where id=? and pw=?";

						pst = conn.prepareStatement(sql);

						pst.setString(1, id);
						pst.setString(2, pw);

						rs = pst.executeQuery();
						if (rs.next()) {
							String get_id = rs.getString("id");
							String get_pw = rs.getString("pw");
							String get_name = rs.getString("name");
							String get_address = rs.getString("address");
							String get_recomm = rs.getString("recomm");
							
							
							dto = new USERSDTO(get_id, get_pw, get_name, get_address ,get_recomm);
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
				public int update(String pw,String address) {
					
					//��Ÿ�� ���� : ���� ���� �� �߻��ϴ� ���� -> ���� ó��
					try{
						conn();
						
						//sql �ۼ�
						String sql="update USERS set pw=?, address=?";
							
						
						//PreparedStatement ��ü ����
						pst = conn.prepareStatement(sql);
						
						//���ε� ����(?) ä���					
						pst.setString(1,pw);
						pst.setString(2,address);
						
						
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

				public int delete(String id) {
					
					//��Ÿ�� ���� : ���� ���� �� �߻��ϴ� ���� -> ���� ó��
					try{
						conn();
						
						//sql �ۼ�
						String sql="delete from USERS where id = ?";
						
						//PreparedStatement ��ü ����
						pst = conn.prepareStatement(sql);
						
						//���ε� ����(?) ä���
						pst.setString(1,id);
						
						//sql�� ����
						cnt = pst.executeUpdate();
							
					}catch(Exception e){
						e.printStackTrace();
						
					}finally{
						close();
					}
					return cnt;
				}
						
	
}//�޼ҵ�
