package rental;

public class Rental {
	private String userId;
	private int bookId;
	
	public Rental(String userId, int bookId) {
		this.userId = userId;
		this.bookId = bookId;
	}
	
	//GETTER
	public String getUserId() {return userId;}
	public int getBookId() {return bookId;}
	//SETTER
	public void setUserId(String userId) {this.userId = userId;}
	public void setBookId(int bookId) {this.bookId = bookId;}
}
