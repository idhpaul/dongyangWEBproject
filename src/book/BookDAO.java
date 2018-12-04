package book;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import user.User;

public class BookDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	public BookDAO(){
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
	
	public ArrayList<Book> bookList() {
		ArrayList<Book> bookdata = new ArrayList<Book>();
		String SQL = "SELECT * FROM book";
		try {
			pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Book book =new Book(rs.getInt("bookId"),rs.getString("bookImg"),rs.getString("bookTitle"),rs.getString("bookAuthor"),rs.getString("bookData"),rs.getInt("bookRantal"));
				bookdata.add(book);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return bookdata;
	}
	public int rentalBook(String userID, int bookID) {
		String SQL = "insert into rental values(?,?)";
		String SQL2 = "update book set bookRantal=1 where bookId=?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			pstmt.setInt(2, bookID);
			pstmt.executeUpdate();
			pstmt = conn.prepareStatement(SQL2);
			pstmt.setInt(1, bookID);
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
			return -1;
		}
		return 1;
	}
	
}
