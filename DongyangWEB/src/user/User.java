package user;

public class User {
	
	private String userId;
	private String userPassword;
	private String userName;
	private String userGender;
	private String userEmail;
	private int admin;
	
	//SETTER
	public void setUserId(String userId) {this.userId = userId;}
	public void setUserPassword(String userPassword) {this.userPassword = userPassword;}
	public void setUserName(String userName) {this.userName = userName;}
	public void setUserGender(String userGender) {this.userGender = userGender;}
	public void setUserEmail(String userEmail) {this.userEmail = userEmail;}
	public void setAdmin(int admin) {this.admin=admin;}
	
	//GETTER
	public String getUserId() {return userId;}
	public String getUserPassword() {return userPassword;}
	public String getUserName() {return userName;}
	public String getUserGender() {return userGender;}
	public String getUserEmail() {return userEmail;}
	public int getAdmin() {return admin;}
	
	//METHOD
	
	// 정보 출력 메소드 _ String printInfo()
	public String printInfo() {
		return "User [userID=" + userId + ", userPassword=" + userPassword + ", userName=" + userName + ", userGender="
				+ userGender + ", userEmail=" + userEmail + "]";
	}

}
