package bbs;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import org.apache.catalina.connector.Request;

public class BbsDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public BbsDAO() {
		try {
			String dbURL="jdbc:mysql://localhost:3306/bbs?characterEncoding=UTF-8&serverTimezone=UTC";
			String dbID="root";
			String dbPassword="mysql";
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			conn=DriverManager.getConnection(dbURL, dbID, dbPassword);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	
	public String getDate() {
		String SQL="select now()";
		try {
			PreparedStatement pstmt=conn.prepareStatement(SQL);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
			
		}
		return "";//데이터베이스 오류
		
	}
	
	public int getNext() {
		String SQL="select bbsID from bbs order by bbsID desc";
		try {
			PreparedStatement pstmt=conn.prepareStatement(SQL);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1)+1;
			}
			return 1; //첫번째 게시물인 경우
		}catch(Exception e) {
			e.printStackTrace();
			
		}
		return -1;//데이터베이스 오류
		
	}
	

	
	public int write(Bbs bbs, String bbsTitle, String userID, String bbsContent, int bbsPublicCheck, String bbsStartDate, String bbsEndDate) {
		String SQL="insert into bbs(bbsID, bbsTitle, userID, bbsDate, bbsContent, bbsAvailable, bbsPublicCheck, bbsStartDate, bbsEndDate) values(?, ?, ?, ?, ?, ?, ?, ?, ?)";
		
		try {
			PreparedStatement pstmt=conn.prepareStatement(SQL);
			
			pstmt.setInt(1, getNext());
			pstmt.setString(2, bbsTitle);
			pstmt.setString(3, userID);
			pstmt.setString(4, getDate());
			pstmt.setString(5, bbsContent);
			pstmt.setInt(6, 1);			
			pstmt.setInt(7,bbsPublicCheck);
			pstmt.setString(8, bbsStartDate);
			pstmt.setString(9, bbsEndDate);
			return pstmt.executeUpdate();//오류가 발생하지 않았을 때 0이상의 값을 반환.
			
			
		}catch(Exception e){
			e.printStackTrace();
			
		}
		return -1;//데이터베이스 오류
	}
	
	// 여행기 10개씩 보이기
	public ArrayList<Bbs> getList(int pageNumber){
		String SQL="select *from bbs where bbsID<? and bbsAvailable=1 order by bbsID desc limit 10";
		ArrayList<Bbs> list=new ArrayList<Bbs>();
		
		try {
			PreparedStatement pstmt=conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext()-(pageNumber-1)*10);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				Bbs bbs=new Bbs();
				bbs.setBbsID(rs.getInt(1));
				bbs.setBbsTitle(rs.getString(2));
				bbs.setUserID(rs.getString(3));
				bbs.setBbsDate(rs.getString(4));
				bbs.setBbsContent(rs.getString(5));
				bbs.setBbsAvailable(rs.getInt(6));
				list.add(bbs);
			
			}
			
		}catch(Exception e) {
			e.printStackTrace();
			
		}
		return list;
	}
	
	//다음페이지 보이기
	public boolean nextPage(int pageNumber) {
		String SQL="select *from bbs where bbsID<? and bbsAvailable=1";
		
		try {
			PreparedStatement pstmt=conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext()-(pageNumber-1)*10);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				return true;
			
			}
			
		}catch(Exception e) {
			e.printStackTrace();
			
		}
		return false;
		
	}
	
	//여행기 불러오기
	public Bbs getBbs(int bbsID) {
		String SQL="select * from bbs where bbsID=? ";

		try {
			PreparedStatement pstmt=conn.prepareStatement(SQL);
			pstmt.setInt(1, bbsID);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				Bbs bbs=new Bbs();
				bbs.setBbsID(rs.getInt(1));
				bbs.setBbsTitle(rs.getString(2));
				bbs.setUserID(rs.getString(3));
				bbs.setBbsDate(rs.getString(4));
				bbs.setBbsContent(rs.getString(5));
				bbs.setBbsAvailable(rs.getInt(6));
				bbs.setBbsPublicCheck(rs.getInt(7));
				bbs.setBbsStartDate(rs.getString(8));
				bbs.setBbsEndDate(rs.getString(9));
				return bbs;
			
			}
			
		}catch(Exception e) {
			e.printStackTrace();
			
		}
		return null;
		
	}
	
	//여행기 수정하기
	public int update(int bbsID, String bbsTitle, String bbsContent) {
		String SQL="update bbs set bbsTitle=?, bbsContent=? where bbsID=?";
		try {
			PreparedStatement pstmt=conn.prepareStatement(SQL);
			pstmt.setString(1, bbsTitle);
			pstmt.setString(2, bbsContent);
			pstmt.setInt(3, bbsID);
			return pstmt.executeUpdate();//0이상의 값 반환
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;//데이터베이스 오류
	}
	
	//여행기 삭제하기
	public int delete(int bbsID) {
		String SQL="update bbs set bbsAvailable=0 where bbsID=?";
		try {
			PreparedStatement pstmt=conn.prepareStatement(SQL);
			pstmt.setInt(1, bbsID);
		
			return pstmt.executeUpdate();//0이상의 값 반환
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;//데이터베이스 오류
	
	}
	
}
