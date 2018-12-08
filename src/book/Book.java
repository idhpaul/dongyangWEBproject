package book;

public class Book {
	private int bookID;
	private String bookImg;
	private String bookTitle;
	private String bookAuthor;
	private String bookData;
	private int bookRental;

	public Book(){
		
	}

	public Book(int bookID, String bookImg, String bookTitle, String bookAuthor, String bookData, int bookRental) {
		super();
		this.bookID = bookID;
		this.bookImg = bookImg;
		this.bookTitle = bookTitle;
		this.bookAuthor = bookAuthor;
		this.bookData = bookData;
		this.bookRental = bookRental;
	}

	//SETTER
	public void setBookID(int bookID) {this.bookID = bookID;}
	public void setBookImg(String bookImg) {this.bookImg = bookImg;}
	public void setBookTitle(String bookTitle) {this.bookTitle = bookTitle;}
	public void setBookAuthor(String bookAuthor) {this.bookAuthor = bookAuthor;}
	public void setBookData(String bookData) {this.bookData = bookData;}
	public void setBookRental(int bookRental) {this.bookRental = bookRental;}
	//GETTER
	public int getBookID() {return bookID;}
	public String getBookImg() {return bookImg;}
	public String getBookTitle() {return bookTitle;}
	public String getBookAuthor() {return bookAuthor;}
	public String getBookData() {return bookData;}
	public int getBookRental() {return bookRental;}

}
