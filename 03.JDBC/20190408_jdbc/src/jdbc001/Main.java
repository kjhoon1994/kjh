package jdbc001;
//1 단계 : Import required packages	
import java.sql.*;

public class Main {

	public static void main(String[] args) {
	/*	
	  
	Common JDBC Components
		The JDBC API provides the following interfaces and classes −
		DriverManager: This class manages a list of database drivers. Matches connection requests from the java application with the proper database driver using communication sub protocol. The first driver that recognizes a certain subprotocol under JDBC will be used to establish a database Connection.
		Driver: This interface handles the communications with the database server. You will interact directly with Driver objects very rarely. Instead, you use DriverManager objects, which manages objects of this type. It also abstracts the details associated with working with Driver objects.
		Connection: This interface with all methods for contacting a database. The connection object represents communication context, i.e., all communication with database is through connection object only.
		Statement: You use objects created from this interface to submit the SQL statements to the database. Some derived interfaces accept parameters in addition to executing stored procedures.
		ResultSet: These objects hold data retrieved from a database after you execute an SQL query using Statement objects. It acts as an iterator to allow you to move through its data.
		SQLException: This class handles any errors that occur in a database application.
	
	Creating JDBC Application
		There are following six steps involved in building a JDBC application −
		Import the packages: Requires that you include the packages containing the JDBC classes needed for database programming. Most often, using import java.sql.* will suffice.
		Register the JDBC driver: Requires that you initialize a driver so you can open a communication channel with the database.
		Open a connection: Requires using the DriverManager.getConnection() method to create a Connection object, which represents a physical connection with the database.
		Execute a query: Requires using an object of type Statement for building and submitting an SQL statement to the database.
		Extract data from result set: Requires that you use the appropriate ResultSet.getXXX() method to retrieve the data from the result set.
		Clean up the environment: Requires explicitly closing all database resources versus relying on the JVM's garbage collection.
	*/	
	

		
	try{	
		// 2 단계 : Register JDBC driver
		Class.forName("oracle.jdbc.driver.OracleDriver");
		
		// 3 단계 : 
		DriverManager.getConnection("jdbc:oracle:thin:@211.238.142.52:1521:xe", "rlawogns", "1111");
		
		System.out.println("오라클 연결 테스트 성공!");
	} catch(ClassNotFoundException | SQLException e) {
			e.printStackTrace();
	}
	
	
		
		
	}

}
