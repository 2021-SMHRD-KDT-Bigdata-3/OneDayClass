package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import DTO.CLASSDTO;
import DTO.TEACHERSDTO;


public class CLASSDAO {
	Connection conn = null;
	PreparedStatement pst = null;
	int cnt = 0;
	ResultSet rs = null;
    CLASSDTO dto = null;
	TEACHERSDTO t_dto = null;
	ArrayList<CLASSDTO> arr = new ArrayList<CLASSDTO>();
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
		public int insert_class(String id, String title, String content, String time,
				String price,String category,String image) {
		
			//��Ÿ�� ���� : ���� ���� �� �߻��ϴ� ���� -> ���� ó��
			try{
				conn();
				//sql �ۼ�
				String sql="insert into class(teacher_id,title,content,time,price,category,image) "
						+ "values(CLASS_CID_SEQ.Nextval,?,?,?,?,?,?,?)";
				
				//PreparedStatement ��ü ����
				pst = conn.prepareStatement(sql);
				
				//���ε� ����(?) ä���
				pst.setString(1,id);
				pst.setString(2,title);
				pst.setString(3,content);
				pst.setString(4,time);
				pst.setString(5,price);
				pst.setString(6,category);
				pst.setString(7,image);
				
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
		

				//������Ʈ	
				public int update(String title,String content,String time,String price,
						String category,String image) {
					
					//��Ÿ�� ���� : ���� ���� �� �߻��ϴ� ���� -> ���� ó��
					try{
						conn();
						
						//sql �ۼ�
						String sql="update USERS set title=?, content=?, time=?, place=?"
								+ "category=? , image=?";
							
						
						//PreparedStatement ��ü ����
						pst = conn.prepareStatement(sql);
						
						//���ε� ����(?) ä���					
						pst.setString(1,title);
						pst.setString(2,content);
						pst.setString(3,time);
						pst.setString(4,price);
						pst.setString(5,category);
						pst.setString(6,image);
						
						
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

				public int delete(int id) {
					
					//��Ÿ�� ���� : ���� ���� �� �߻��ϴ� ���� -> ���� ó��
					try{
						conn();
						
						//sql �ۼ�
						String sql="delete from CLASS where class_id = ?";
						
						//PreparedStatement ��ü ����
						pst = conn.prepareStatement(sql);
						
						//���ε� ����(?) ä���
						pst.setInt(1,id);
						
						//sql�� ����
						cnt = pst.executeUpdate();
							
					}catch(Exception e){
						e.printStackTrace();
						
					}finally{
						close();
					}
					return cnt;
				}
				

				// Ŭ���� ��ȣ�� ã��
					public CLASSDTO allselect(int  id) {
		
						try {
								conn();
		
							String sql = "select * from class where class_id=? ";
	
							pst = conn.prepareStatement(sql);
		
								pst.setInt(1, id);
								
		
								rs = pst.executeQuery();
								if (rs.next()) {
									int get_id = rs.getInt("class_id");
									String get_teacher_id = rs.getString("teacher_id");
									String get_title = rs.getString("title");
									String get_content = rs.getString("content");
									String get_time = rs.getString("time");
									String get_price = rs.getString("price");
									String get_category = rs.getString("category");
									String get_image = rs.getString("image");
								    
									
									
								dto = new CLASSDTO(get_id, get_teacher_id, get_title, get_content, get_time, get_price, get_category, get_image);
								}
							} catch (Exception e) {
								System.out.println("�α��� ����");
								e.printStackTrace();
						} finally {
								close();
						}
						return dto;
						}				
				
		
					// Ŭ���� ��ü ã��
					public ArrayList<CLASSDTO> alldata() {
		
						try {
								conn();
		
							String sql = "select * from class";
	
							pst = conn.prepareStatement(sql);
		
								
								
		
								rs = pst.executeQuery();
								while (rs.next()) {
									int get_id = rs.getInt("class_id");
									String get_teacher_id = rs.getString("teacher_id");
									String get_title = rs.getString("title");
									String get_content = rs.getString("content");
									String get_time = rs.getString("time");
									String get_price = rs.getString("price");
									String get_category = rs.getString("category");
									String get_image = rs.getString("image");
								     
									System.out.println(get_teacher_id);
									
						arr.add(new CLASSDTO(get_id, get_teacher_id, get_title, get_content, get_time, get_price, get_category, get_image)); 
								}
							} catch (Exception e) {
								System.out.println("��������");
								e.printStackTrace();
						} finally {
								close();
						}
						return arr;
						}							
					
					
					
					
}
