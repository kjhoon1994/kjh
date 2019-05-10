package com.connection;
 
import java.sql.*;
 
//데이터베이스 연결 정보 저장용 클래스
public class MySQLConnection80 {
 
    // JDBC driver name and database URL
    static final String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";
    static final String DB_URL = "jdbc:mysql://211.238.142.56:3306/wogns"
            + "?user=wogns&password=Kwogns5067!&useSSL=false&serverTimezone=UTC";
 
    private static Connection conn;
 
    // 데이터베이스 커넥션 객체 생성 메소드
    public static Connection connect() throws ClassNotFoundException, SQLException {
 
        // STEP 2: Register JDBC driver
        Class.forName(JDBC_DRIVER);
        // STEP 3: Open a connection
        conn = DriverManager.getConnection(DB_URL);
 
        return conn;
    }
 
    // 데이테베이스 커넥션 객체 소멸 메소드
    public static void close() throws SQLException {
        if (conn != null) {
            conn.close();
        }
    }
 
}