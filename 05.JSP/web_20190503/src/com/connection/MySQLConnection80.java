package com.connection;
 
import java.sql.*;
 
//�����ͺ��̽� ���� ���� ����� Ŭ����
public class MySQLConnection80 {
 
    // JDBC driver name and database URL
    static final String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";
    static final String DB_URL = "jdbc:mysql://211.238.142.56:3306/wogns"
            + "?user=wogns&password=Kwogns5067!&useSSL=false&serverTimezone=UTC";
 
    private static Connection conn;
 
    // �����ͺ��̽� Ŀ�ؼ� ��ü ���� �޼ҵ�
    public static Connection connect() throws ClassNotFoundException, SQLException {
 
        // STEP 2: Register JDBC driver
        Class.forName(JDBC_DRIVER);
        // STEP 3: Open a connection
        conn = DriverManager.getConnection(DB_URL);
 
        return conn;
    }
 
    // �����׺��̽� Ŀ�ؼ� ��ü �Ҹ� �޼ҵ�
    public static void close() throws SQLException {
        if (conn != null) {
            conn.close();
        }
    }
 
}