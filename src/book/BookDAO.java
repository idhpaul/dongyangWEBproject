package book;

import java.io.File;
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

	//libprocessor.jsp - 게시판 대여 관리
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
	
	
	
	public ArrayList<String> bookDelet(String bookID) {
		String SQL = "SELECT * FROM book where bookId=?";
		String SQL2 = "delete from book where bookId = ?";
		ArrayList<String> filename = new ArrayList<String>();
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, bookID);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				filename.add(rs.getString("bookData"));
				filename.add(rs.getString("bookImg"));
			}
			pstmt = conn.prepareStatement(SQL2);
			pstmt.setString(1, bookID);
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
			return filename;
		}
		return filename;
	}
	public int bookInset(String imgname,String title,String author, String bookdata) {
		String SQL = "insert into book(bookImg,bookTitle,bookAuthor,bookData) values(?,?,?,?)";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, imgname);
			pstmt.setString(2, title);
			pstmt.setString(3, author);
			pstmt.setString(4, bookdata);
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
			return -1;
		}
		return 1;
	}
	public int bookRecomCheck(int bookID) {
		String SQL = "select count(*) from recommand r, book b where r.bookID=?";
		int i = 0;
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, bookID);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				i = rs.getInt("count(*)");
			}
		}catch(Exception e) {
			e.printStackTrace();
			return -1;
		}
		return i;
	}
	public int bookRecomDel(String bookID) {
		String SQL = "delete from recommand where bookId=?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, bookID);
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
			return -1;
		}
		return 1;
	}
	public int bookRInsert(String bookID) {
		String SQL = "insert into recommand(bookid) values(?)";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, bookID);
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return 1;
	}
	public ArrayList<Book> recomList(){
		String SQL="select * from book b,recommand r where b.bookId=r.bookId";
		ArrayList<Book> booklist = new ArrayList<Book>();
		try {
			pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Book book = new Book();
				book.setBookImg(rs.getString("bookImg"));
				book.setBookTitle(rs.getString("bookTitle"));
				book.setBookAuthor(rs.getString("bookAuthor"));
				booklist.add(book);
			}
		}catch(Exception e) {
			
		}
		return booklist;
	}
	
}
