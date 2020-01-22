package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public UserDAO() {
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
	
	public int login(String userID, String userPassword) {
		
		String SQL = "SELECT userPassword FROM member WHERE userID = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			//System.out.println(rs);
			if (rs.next()) {
				if(rs.getString(1).equals(userPassword)) {
					//System.out.printf("%s %s ", userID, userPassword);
					return 1; // 로그인 성공
				}
				else
					return 0; // 비밀번호 불일치
			}
			return -1; // 아이디가 없음
		} catch(Exception e) {
			e.printStackTrace();
		}
		return 2; // 데이터베이스 오류
	}
	
	public int join(User user) {
		//System.out.println("1");
		String SQL = "INSERT INTO member(userID, userPassword, userName, userGender, userEmail) VALUES (?, ?, ?, ?, ?)";
		
		
		//System.out.println(SQL);
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, user.getUserID());
			pstmt.setString(2, user.getUserPassword());
			pstmt.setString(3, user.getUserName());
			pstmt.setString(4, user.getUserGender());
			pstmt.setString(5, user.getUserEmail());
			return pstmt.executeUpdate();
			
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터베이스 오류
	}
}
