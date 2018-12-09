package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.mysql.jdbc.Statement;

public class UserDAO {
	
	private Connection conn;
	private PreparedStatement pstmt;
	private Statement stmt;
	private ResultSet rs;
	
	public UserDAO() {
		try {
		
			//DB CONNECT INFO////////////////////////////////////////////////////////////////////////////
			String dbURL = "jdbc:mysql://localhost:3306/dongyangwebproject?useUnicode=true&characterEncoding=UTF-8";
			String dbID = "root";
			String dbPassword = "123456";
			////////////////////////////////////////////////////////////////////////////////////////////
		
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	
	}

	//�α��� �޼ҵ�
	public int login(String userId,String userPassword) {
		String SQL = "SELECT userPassword FROM user WHERE userId = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userId);

			rs = pstmt.executeQuery();
			if(rs.next()) {
				if(rs.getString(1).equals(userPassword)) {
					return 1;
				}
				else
					return 0;
			}
			return -1;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -2;
	}

	//ȸ������ �޼ҵ� _ �Ϲ�ȸ��
	public int join(User user) {
		String SQL = "Insert into user(userId,userPassword,userName,userGender,userEmail) values(?,?,?,?,?);";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, user.getUserId());
			pstmt.setString(2, user.getUserPassword());
			pstmt.setString(3, user.getUserName());
			pstmt.setString(4, user.getUserGender());
			pstmt.setString(5, user.getUserEmail());
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	//ȸ������ �޼ҵ� _ ������
	public int joinAdmin(User user) {
		String SQL = "Insert into user values(?,?,?,?,?,?);";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, user.getUserId());
			pstmt.setString(2, user.getUserPassword());
			pstmt.setString(3, user.getUserName());
			pstmt.setString(4, user.getUserGender());
			pstmt.setString(5, user.getUserEmail());
			pstmt.setInt(6, user.getAdmin());
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return -1;
	}
	//�������� üũ�ϴ� ������
	public int checkAdmin(String userId) {
		String SQL = "SELECT admin FROM user WHERE userId = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userId);

			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt("admin");
			}
			return -1;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -2;
	}
	//���� ���� ��ü ��� �޼ҵ�
	public ArrayList<User> userPrint(){
		ArrayList<User> userdata = new ArrayList<User>();
		String SQL = "SELECT * FROM user where admin=0";
		try {
			pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				User user=new User();
				user.setUserId(rs.getString("userId"));
				user.setUserPassword(rs.getString("userPassword"));
				user.setUserName(rs.getString("userName"));
				user.setUserGender(rs.getString("userGender"));
				user.setUserEmail(rs.getString("userEmail"));
				userdata.add(user);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return userdata;
	}
	
	public ArrayList<User> userPrint(String userID){
		ArrayList<User> userdata = new ArrayList<User>();
		String SQL = "SELECT * FROM user where admin=0 AND userId LIKE ?";
		String cat = "%"+userID+"%";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, cat);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				User user=new User();
				user.setUserId(rs.getString("userId"));
				user.setUserPassword(rs.getString("userPassword"));
				user.setUserName(rs.getString("userName"));
				user.setUserGender(rs.getString("userGender"));
				user.setUserEmail(rs.getString("userEmail"));
				userdata.add(user);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return userdata;
	}
	
	
	public int deleteUser(String userId) {
		String SQL = "delete from user where userId = ?";
		System.out.println("�̰� ����ü ����Ȱų�?");
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userId);
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
			return -1;
		}
		return 1;
	}
	public int memberAdmin(String userId) {
		String SQL = "update user set admin=1 where userId = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userId);
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
			return -1;
		}
		return 1;
	}
	
	//�Ϲ� ���� ȸ������ ���� �޼ҵ� / ���� - 1)������ȸ, 2)����
	//1) ���� ��ȸ
	//��й�ȣ ��ȸ �޼ҵ�
	public String getPassword(String userId) {
		String SQL = "select userPassword from user where userId='"+userId+"';";
		String out = null;
		try {
			stmt = (Statement) conn.createStatement();
			rs = stmt.executeQuery(SQL);
			while(rs.next()) {
				out=rs.getString("userPassword");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return out;
	}
	//�̸� ��ȸ �޼ҵ�
	public String getName(String userId) {
		String SQL = "select userName from user where userId='"+userId+"';";
		String out = null;
		try {
			stmt = (Statement) conn.createStatement();
			rs = stmt.executeQuery(SQL);
			while(rs.next()) {
				out=rs.getString("userName");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return out;
	}
	//�̸��� ��ȸ �޼ҵ�
	public String getEmail(String userId) {
		String SQL = "select userEmail from user where userId='"+userId+"';";
		String out = null;
		try {
			stmt = (Statement) conn.createStatement();
			rs = stmt.executeQuery(SQL);
			while(rs.next()) {
				out=rs.getString("userEmail");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return out;
	}
	public void changePassword(String userId, String userPassword) {
		String SQL = "update user set userPassword= ? where userId = ? ";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userPassword);
			pstmt.setString(2, userId);
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	public void changeName(String userId, String userName) {
		String SQL = "update user set userName= ? where userId = ? ";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userName);
			pstmt.setString(2, userId);
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	public void changeEmail(String userId, String userEmail) {
		String SQL = "update user set userEmail= ? where userId = ? ";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userEmail);
			pstmt.setString(2, userId);
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
}
	
	

 