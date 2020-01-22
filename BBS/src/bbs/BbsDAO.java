package bbs;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class BbsDAO {
	private Connection conn;
	
	private ResultSet rs;
	
	public BbsDAO() {
		try {
			String dbURL = "jdbc:sqlserver://localhost:1433;databaseName=BBS";
			String dbID = "surable2";
			String dbPassword = "1";
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
			if (conn != null) {
				//System.out.printf("%s %s %s ", dbURL, dbID, dbPassword);
			}
		} catch(Exception e) {
			
		}
	}
	
	public String getDate() {
		String SQL = "SELECT GETDATE()";
		//String SQL = "SELECT NOW()";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getString(1);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ""; // 데이터베이스 오류
	}
	
	public int getNext() {
		String SQL = "SELECT bbsID FROM BBS ORDER BY bbsID DESC";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getInt(1) + 1;
			}
			return 1; // 첫 번째 게시물인 경우
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터베이스 오류
	}
	
	public int write(String bbsTitle, String userID, String bbsContent) {
		String SQL = "INSERT INTO BBS(bbsID, bbsTitle, userID, bbsDate, bbsContent, bbsAvailable) VALUES (?, ?, ?, ?, ?, ?)";
		//System.out.println(SQL);
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, bbsTitle);
			pstmt.setString(3, userID);
			pstmt.setString(4, getDate());
			pstmt.setString(5, bbsContent);
			pstmt.setInt(6,  1);
			//rs = pstmt.executeQuery();
			return pstmt.executeUpdate();			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터베이스 오류
	}
	
	public ArrayList<Bbs> getList(int pageNumber) {
		//String SQL = "SELECT * FROM BBS WHERE bbsID < ? AND bbsAvailable = 1 ORDER BY bbsID DESC LIMIT 10";
		 String SQL = "SELECT * FROM  dbo.[BBS] WHERE 1=1 AND bbsID < ? AND bbsAvailable = 1 ORDER BY bbsID DESC OFFSET  0 ROWS FETCH NEXT 10 ROWS ONLY";
		 //System.out.println(SQL);
		ArrayList<Bbs> list = new ArrayList<Bbs>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1,  getNext() - (pageNumber -1) * 10);
			rs = pstmt.executeQuery();
			while (rs.next()) {
                Bbs bbs = new Bbs();
                bbs.setBbsID(rs.getInt(1));
                bbs.setBbsTitle(rs.getString(2));
                bbs.setUserID(rs.getString(3));
                bbs.setBbsDate(rs.getString(4));
                bbs.setBbsContent(rs.getString(5));
                bbs.setBbsAvailable(rs.getInt(6));
                list.add(bbs);				
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public boolean nextPage(int pageNumber) {
		//String SQL = "SELECT * FROM BBS WHERE bbsID < ? AND bbsAvailable = 1";
		String SQL = "SELECT * FROM  dbo.[BBS] WHERE 1=1 AND bbsID < ? AND bbsAvailable = 1 ORDER BY bbsID DESC OFFSET  0 ROWS FETCH NEXT 10 ROWS ONLY";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1,  getNext() - (pageNumber -1) * 10);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return true;
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return false;
	}
}
