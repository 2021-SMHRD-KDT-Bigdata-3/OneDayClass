package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import DTO.REVIEWDTO;

 

public class REVIEWDAO {

	Connection conn = null;
	PreparedStatement pst = null;
	int cnt = 0;
	ResultSet rs = null;
    REVIEWDTO dto = null;
	
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
		public int insert_review(String id,int class_id , int rating, String comm) {
		
			//��Ÿ�� ���� : ���� ���� �� �߻��ϴ� ���� -> ���� ó��
			try{
				conn();
				//sql �ۼ�
				String sql="insert into review values (?,?,?,?,sysdate)";
				
				//PreparedStatement ��ü ����
				pst = conn.prepareStatement(sql);
				
				//���ε� ����(?) ä���
				pst.setString(1,id);
				pst.setInt(2,class_id);
				pst.setInt(3,rating);				
				pst.setString(4,comm);
				
				
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
		
		// �α��� ���� ���� ����
				public ArrayList<REVIEWDTO> review_select(int class_id) {
					ArrayList<REVIEWDTO> arr = new ArrayList<REVIEWDTO>();
					try {
						conn();

						String sql = "select * from REVIEW where class_id=? order by dates";

						pst = conn.prepareStatement(sql);

						pst.setInt(1, class_id); 
						

						rs = pst.executeQuery();
						while (rs.next()) {
							String get_id = rs.getString("id");
							int get_class_id = rs.getInt("class_id");
							int get_rating = rs.getInt("rating");
							String get_comm = rs.getString("comm");
							String get_dates = rs.getString("dates");
							
							
							dto = new REVIEWDTO(get_id, get_class_id, get_rating, get_comm, get_dates);
							arr.add(dto);
						}
					} catch (Exception e) {
						System.out.println("�α��� ����");
						e.printStackTrace();
					} finally {
						close();
					}
					return arr;
				}	

				
				// ���� ���� delect �޼ҵ�

				public int delete(int class_id) {
					
					//��Ÿ�� ���� : ���� ���� �� �߻��ϴ� ���� -> ���� ó��
					try{
						conn();
						
						//sql �ۼ�
						String sql="delete from review where class_id = ?";
						
						//PreparedStatement ��ü ����
						pst = conn.prepareStatement(sql);
						
						//���ε� ����(?) ä���
						pst.setInt(1,class_id);
						
						//sql�� ����
						cnt = pst.executeUpdate();
							
					}catch(Exception e){
						e.printStackTrace();
						
					}finally{
						close();
					}
					return cnt;
				}
				
				public int delete_review(String id, int class_id, String comm) {
					
					//��Ÿ�� ���� : ���� ���� �� �߻��ϴ� ���� -> ���� ó��
					try{
						conn();
						//sql �ۼ�
						String sql="delete from review where id = ? and  class_id = ? and comm = ?";
						System.out.println(id + " " + class_id + " " + comm );
						//PreparedStatement ��ü ����
						pst = conn.prepareStatement(sql);
						
						//���ε� ����(?) ä���
						pst.setString(1,id);
						pst.setInt(2,class_id);
						pst.setString(3,comm);				
						
						
						//sql�� ����
						 cnt = pst.executeUpdate();
						
					}catch(Exception e){
						e.printStackTrace();
						System.out.println("���� ���� ����");
					}finally{
						close();
					}
					return cnt;
				}
							
}
