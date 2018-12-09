package rental;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import book.Book;

public class RentalDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public RentalDAO() {
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
	
	public ArrayList<Book> rentalList(String userId) {
		ArrayList<Book> myRental = new ArrayList<Book>();
		String SQL = "SELECT * FROM rental, book where book.bookId=rental.bookId and rental.userId=?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Book book =new Book(rs.getInt("bookId"),rs.getString("bookImg"),rs.getString("bookTitle"),rs.getString("bookAuthor"),rs.getString("bookData"),rs.getInt("bookRantal"));
				myRental.add(book);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return myRental;
	}
	
	public void returnBook(String userId, String bookId) {
		String SQL = "delete FROM rental where userId = ? and bookId = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userId);
			pstmt.setString(2, bookId);
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		System.out.println(bookId);
		String SQL2 = "update book set bookRantal = 0 where bookId = ?";
		try {
			pstmt = conn.prepareStatement(SQL2);
			pstmt.setString(1, bookId);
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	
	
}
