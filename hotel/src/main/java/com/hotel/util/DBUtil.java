package com.hotel.util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class DBUtil {

	private static String dbms;
//	private static DataSource oracleDs;
//	private static DataSource mysqlDs;
//	
//	static{
//		try {
//			한번만 선언했을 때의 문제점
//			xception in thread "ContainerBackgroundProcessor[StandardEngine[Catalina]]" java.lang.OutOfMemoryError: PermGen space
//			connection 정리를 안해서 나타나는 현상이다. 결국 context를 new 해야 하는 군 쩝~~!
//			Context init = new InitialContext();
//			oracleDs = (DataSource)init.lookup("java:comp/env/jdbc/OracleDB");
//			System.out.println("Oracle DataSource 생성 성공");
//			mysqlDs = (DataSource)init.lookup("java:comp/env/jdbc/MysqlDB");
//			System.out.println("Mysql DataSource 생성 성공");
//		} catch (NamingException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//	}
	
	public static Connection getConnection()
			throws SQLException {
		System.out.println("DBUtil.getConnection().dbms:"+dbms);
		Context init=null;
		try {
			init = new InitialContext();
			if(dbms.equals("oracle"))
				return ((DataSource)init.lookup("java:comp/env/jdbc/OracleDB")).getConnection();
			else if(dbms.equals("mysql"))
				return ((DataSource)init.lookup("java:comp/env/jdbc/MysqlDB")).getConnection();
			else {
				throw new SQLException("DBMS 자원이 존재하지 않습니다.");
			}
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw new SQLException("Context를 초기화할 수 없습니다.");
		}
	}

	public static void setDbms(String str){
		dbms=str;
	}
	
	public static void increase(Connection con, String table,
			String colum, int no) 
	throws SQLException{
		// TODO Auto-generated method stub
		// 1. 확인 2.연결 - service
		// 3.sql
		String sql = "update "+table+" set "+colum+"="+colum+"+1 "
				+ " where no=?";
		// 4. 상태 & 데이터
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, no);
		// 5. 실행
		pstmt.executeUpdate();
		// 6. 표시
		// 7. 닫기
		if(pstmt != null) pstmt.close();
	}

	// JDBC 관련 객체 닫기
	public static void close(ResultSet rs){
		try {
			if(rs!=null) rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public static void close(PreparedStatement pstmt){
		try {
			if(pstmt!=null) pstmt.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public static void close(Connection con){
		try {
			if(con!=null) con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	// DB Connection 결과 처리 적용 처리
	public static void commit(Connection con){
		if(con!=null){
			try {
				con.commit();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	// DB Connection 결과 처리 취소 처리
	public static void rollback(Connection con){
		if(con!=null){
			try {
				con.rollback();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

}
