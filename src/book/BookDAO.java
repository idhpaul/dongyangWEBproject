package book;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class BookDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	BookDAO(){
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
}
