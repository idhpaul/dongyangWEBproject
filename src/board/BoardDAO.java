package board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import user.User;

public class BoardDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public BoardDAO() {
		// TODO Auto-generated constructor stub
		try {
			
			//DB CONNECT INFO////////////////////////////////////////////////////////////////////////////
			String dbURL = "jdbc:mysql://localhost:3306/dongyangwebproject?useUnicode=true&characterEncoding=UTF-8";
			String dbID = "root";
			String dbPassword = "root";
			////////////////////////////////////////////////////////////////////////////////////////////
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public int boardAllList(){
		ArrayList<Board> boardList = new ArrayList<Board>();
		try {
			String SQL = "SELECT * FROM board";
				pstmt = conn.prepareStatement(SQL);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
						Board board = new Board(rs.getInt("bno"), rs.getString("title"), rs.getString("content"), rs.getString("writer"), rs.getTimestamp("write_date"));
						boardList.add(board);
					}
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("errrrrr");
			return boardList.size();
		}
		return boardList.size();
	}
	
	public ArrayList<Board> boardList(int pageNum){
		ArrayList<Board> boardList = new ArrayList<Board>();
		try {
			pageNum=(pageNum-1)*10;
			String SQL = "SELECT * FROM board order by bno desc LIMIT ?, 10 ";
				pstmt = conn.prepareStatement(SQL);
				pstmt.setInt(1, pageNum);
				rs = pstmt.executeQuery();
				while(rs.next()) {
						Board board = new Board(rs.getInt("bno"), rs.getString("title"), rs.getString("content"), rs.getString("writer"), rs.getTimestamp("write_date"));
						boardList.add(board);
					}
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("errrrrr");
			return boardList;
		}
		return boardList;
	}
	
	
	
	public Board boardView(String bno) {
		Board board = null;
		try {
			
			String SQL = "SELECT * FROM board where bno=?";
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, bno);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				board = new Board(rs.getInt("bno"), rs.getString("title"), rs.getString("content"), rs.getString("writer"), rs.getTimestamp("write_date"));
			}
		}catch(Exception e){
			e.printStackTrace();
			return board;
		}
		return board;
	}
	
	public Board boardDelet(String bno) {
		Board board = null;
		try {
			String SQL = "delete from board where bno=?";
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, bno);
			pstmt.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
			return board;
		}
		return board;
	}
	public int boardUpdate(String bno,String title,String content) {
		try {
			String SQL = "update board set title=?,content=? where bno=?";
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, title);
			pstmt.setString(2, content);
			pstmt.setString(3, bno);
			System.out.println(bno);
			pstmt.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
			return -1;
		}
		return 1;
	}
	public int boardInsert(String title,String content,String userId) {
		try {
			String SQL = "insert into board(title,content,writer) values(?,?,?)";
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, title);
			pstmt.setString(2, content);
			pstmt.setString(3, userId);
			pstmt.executeUpdate();
			return 1;
		}catch(Exception e){
			e.printStackTrace();
			return -1;
		}
	}
}
	

