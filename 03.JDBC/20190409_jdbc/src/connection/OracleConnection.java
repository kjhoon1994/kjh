package connection;

import java.sql.*;

public class OracleConnection {
    // JDBC driver name and database URL
    private static final String JDBC_DRIVER = "oracle.jdbc.driver.OracleDriver";
    private static final String DB_URL = "jdbc:oracle:thin:rlawogns/1111@211.238.142.52:1521:xe";
 
    private static Connection conn;
 
    // 데이테베이스 커넥션 객체 생성 메소드
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