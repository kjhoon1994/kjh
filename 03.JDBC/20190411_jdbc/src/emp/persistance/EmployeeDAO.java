package emp.persistance;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import connection.OracleConnection;
import emp.domain.Employee;

public class EmployeeDAO {
	// 출력 메소드 (정렬)
	public List<Employee> empList(String key, String value) {
		List<Employee> result = new ArrayList<Employee>();
		
		Connection conn = null;
		PreparedStatement stmt = null;
		try {

			conn = OracleConnection.connect();
		/*
		 CREATE OR REPLACE VIEW empView AS SELECT empId, name_, ssn, hiredate, phone
		 ,e.regId, reg_name, e.deptId, dept_name, e.jobId, job_title ,basicpay,
		 extrapay, (basicpay+extrapay) pay FROM employees e, regions r, departments d,
		 jobs j WHERE e.regId = r.regId AND e.deptId = d.deptId AND e. jobId =
		 j.jobId;
		 */
		String sql = "SELECT empId, name_, ssn, TO_CHAR(hiredate, 'YYYY-MM-DD') hiredate, phone\r\n"
				+ "    ,regId, reg_name, deptId, dept_name, jobId, job_title\r\n"
				+ "    ,basicpay, extrapay, (basicpay+extrapay) pay\r\n" + "    FROM empView\r\n ";
				
		// 정렬 (컬럼명) 컬럼명은 바인딩 불가 따라서 스트링포맷을 이용 value 는 정렬 기준
		if (key.equals("empId")) {
			sql+= "WHERE empId = ? ORDER BY empid";
			
		}		
		
		if (key.equals("name_")) {
			sql+= "WHERE INSTR(name_, ?)> 0 ORDER BY empid";
		}
		
		if (key.equals("reg_name")) {
			sql+= "WHERE INSTR(reg_name, ?)> 0 ORDER BY empid";
		}
		if (key.equals("dept_name")) {
			sql+= "WHERE INSTR(dept_name, ?)> 0 ORDER BY empid";
		}
		if (key.equals("job_title")) {
			sql+= "WHERE INSTR(job_title, ?)> 0 ORDER BY empid";
		}
		if(key.equals("sort")) {
			sql+= String.format("    ORDER BY %s",value);
			
		}
		stmt = conn.prepareStatement(sql);
		if(!key.equals("sort")) {
			
			stmt.setString(1,value);
		
		}
		
		ResultSet rs = stmt.executeQuery();
			
			while(rs.next()) {
				String empId = rs.getString("empId");
				String name_ = rs.getString("name_");
				String ssn = rs.getString("ssn");
				String hiredate = rs.getString("hiredate");
				String phone = rs.getString("phone");
				String regId = rs.getString("regId");
				String reg_name = rs.getString("reg_name");
				String deptId = rs.getString("deptId");
				String dept_name = rs.getString("dept_name");
				String jobId = rs.getString("jobId");
				String job_title = rs.getString("job_title");
				int basicpay = rs.getInt("basicpay");
				int extrapay = rs.getInt("extrapay");
				int pay = rs.getInt("pay");
				result.add(new Employee(empId,name_,ssn ,hiredate,phone ,
						regId, reg_name, deptId, dept_name, jobId, job_title,
						basicpay, extrapay, pay));
			}
			rs.close();				
				
		
		
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (stmt != null)
					stmt.close();
			} catch (SQLException se2) {
			}
			try {
				OracleConnection.close();
			} catch (SQLException se) {
				se.printStackTrace();
			}
		}

		return result;
	}

	// 입력 메소드
	public int empAdd(Employee e) {
		int result = 0; 
		Connection conn = null;
		PreparedStatement stmt = null;
		try {

			conn = OracleConnection.connect();
		
		String sql = "INSERT INTO employees  (empId, name_, ssn, hiredate, phone\r\n" + 
				"    , regId, deptId, jobId, basicpay, extrapay)\r\n" + 
				"    VALUES ((SELECT CONCAT('EMP', LPAD(NVL(SUBSTR(MAX(empId), 4), 0) + 1, 3, 0)) \r\n" + 
				"        AS newId FROM employees), ?, ?, ?\r\n" + 
				"        , ?, ?, ?, ?,?, ?)";
		stmt = conn.prepareStatement(sql);
		stmt.setString(1,e.getName_());
		stmt.setString(2,e.getSsn());
		stmt.setString(3,e.getHiredate());
		stmt.setString(4,e.getPhone());
		stmt.setString(5,e.getRegId());
		stmt.setString(6,e.getDeptId());
		stmt.setString(7,e.getJobId());
		stmt.setInt(8,e.getBasicpay());
		stmt.setInt(9,e.getExtrapay());
		
		result = stmt.executeUpdate();
		stmt.close();
			
		} catch (ClassNotFoundException | SQLException ee) {
			ee.printStackTrace();
		} finally {
			try {
				if (stmt != null)
					stmt.close();
			} catch (SQLException se2) {
			}
			try {
				OracleConnection.close();
			} catch (SQLException se) {
				se.printStackTrace();
			}
		}
		
		return result;
	}
	
	// 삭제 메소드
	public int empRemove(String empId) {
		int result = 0; 
		Connection conn = null;
		PreparedStatement stmt = null;
		try {

			conn = OracleConnection.connect();
			String sql = "DELETE FROM employees WHERE empId = ?";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, empId);
			
			result = stmt.executeUpdate();
			stmt.close();
		} catch (ClassNotFoundException | SQLException ee) {
			ee.printStackTrace();
		} finally {
			try {
				if (stmt != null)
					stmt.close();
			} catch (SQLException se2) {
			}
			try {
				OracleConnection.close();
			} catch (SQLException se) {
				se.printStackTrace();
			}
		}	
		return result;
	}
}
