package bbs;

public class Bbs {
	private int bbsID;
	private String bbsTitle;
	private String userID;
	private String bbsDate;
	private String bbsContent;
	private int bbsAvailable;//삭제되었는지 여부 /1:존재함 // 0: 삭제됨
	private int bbsPublicCheck;//여행기 공개/비공개 
	private String bbsStartDate;//여행 시작 날짜
	private String bbsEndDate;//여행 마지막 날짜
	private int myLike;//좋아요 수
	
	public int getBbsID() {
		return bbsID;
	}
	public void setBbsID(int bbsID) {
		this.bbsID = bbsID;
	}
	
	public String getBbsTitle() {
		return bbsTitle;
	}
	public void setBbsTitle(String bbsTitle) {
		this.bbsTitle = bbsTitle;
	}
	
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	
	public String getBbsDate() {
		return bbsDate;
	}
	public void setBbsDate(String bbsDate) {
		this.bbsDate = bbsDate;
	}
	
	public String getBbsContent() {
		return bbsContent;
	}
	public void setBbsContent(String bbsContent) {
		this.bbsContent = bbsContent;
	}
	
	public int getBbsAvailable() {
		return bbsAvailable;
	}
	public void setBbsAvailable(int bbsAvailable) {
		this.bbsAvailable = bbsAvailable;
	}
	
	public int getBbsPublicCheck() {
		return bbsPublicCheck;
	}
	public void setBbsPublicCheck(int bbsPublicCheck) {
		this.bbsPublicCheck = bbsPublicCheck;
	}
	
	public String getBbsStartDate() {
		return bbsStartDate;
	}
	public void setBbsStartDate(String bbsStartDate) {
		this.bbsStartDate = bbsStartDate;
	}
	
	public String getBbsEndDate() {
		return bbsEndDate;
	}
	public void setBbsEndDate(String bbsEndDate) {
		this.bbsEndDate = bbsEndDate;
	}
	public int getMyLike() {
		return myLike;
	}
	public void setMyLike(int myLike) {
		this.myLike = myLike;
	}
	
	
	

}
