package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import DTO.CLASSDTO;


public class CLASSDAO {
	Connection conn = null;
	PreparedStatement pst = null;
	int cnt = 0;
	ResultSet rs = null;
    CLASSDTO dto = null;
    ArrayList<CLASSDTO> classArray = null;
	
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
				String place,String category,String image) {
		
			//��Ÿ�� ���� : ���� ���� �� �߻��ϴ� ���� -> ���� ó��
			try{
				conn();
				//sql �ۼ�
				String sql="insert into class(teacher_id,title,content,time,place,category,image) "
						+ "values(CLASS_CID_SEQ.Nextval,?,?,?,?,?,?,?)";
				
				//PreparedStatement ��ü ����
				pst = conn.prepareStatement(sql);
				
				//���ε� ����(?) ä���
				pst.setString(1,id);
				pst.setString(2,title);
				pst.setString(3,content);
				pst.setString(4,time);
				pst.setString(5,place);
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
				public int update(String title,String content,String time,String place,
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
						pst.setString(4,place);
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
				
		public ArrayList<CLASSDTO> Select_class(int teacher_id) {
		
			//��Ÿ�� ���� : ���� ���� �� �߻��ϴ� ���� -> ���� ó��
			try{
				conn();
				//sql �ۼ�
				String sql="select * from class where teacher_id = ?";
				
				//PreparedStatement ��ü ����
				pst = conn.prepareStatement(sql);
				
				//���ε� ����(?) ä���
				pst.setInt(1,teacher_id);
				
				//sql�� ����
				rs = pst.executeQuery(sql);
				
				classArray = new ArrayList<CLASSDTO>();
				while(rs.next()) {
					CLASSDTO classDto = new CLASSDTO(rs.getInt("class_id"),
							rs.getString("teacher_id"), rs.getString("title")
							, rs.getString("content"), rs.getString("time"),
							rs.getString("price"), rs.getString("category"), rs.getString("image"));
					classArray.add(classDto);
				}
						
			}catch(Exception e){
				e.printStackTrace();
				System.out.println("�ҷ����� ����");
			}finally{
				close();
			}
			return classArray;
		}// �޼ҵ峡	
}
