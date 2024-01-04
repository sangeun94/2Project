package db.dao.admin2;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.dto.EmployeeDTO;
import db.util.DBConnectionManager;

public class AdminEmployeeInfoDAO {

	Connection conn;
	PreparedStatement psmt;
	ResultSet rs;
	
	public List<EmployeeDTO> findAllEmployeeInfoList() { 

		conn = DBConnectionManager.connectDB();

		String sql = " SELECT * FROM employee WHERE employment_status = 'Y' "
				+ " ORDER BY length(employee_number), employee_number ";
		
		List<EmployeeDTO> EmployeeInfoList = null; //return하기 위해 선언

		try {
			psmt = conn.prepareStatement(sql);
			//Connection을 활용해서 sql 명령을 실행하는 객체

			rs = psmt.executeQuery(); //준비된 sql 쿼리문 실행!
			EmployeeInfoList = new ArrayList<EmployeeDTO>();	//List 초기화

			while(rs.next()) {
				EmployeeDTO EmployeeDTO = new EmployeeDTO(
						rs.getString("employee_number"), 
						rs.getInt("employee_code"),
						rs.getString("employment_status"),
						rs.getString("password"),
						rs.getString("name"),
						rs.getString("gender"),
						rs.getString("phone_number"),
						rs.getString("address"),
						rs.getString("email"),
						rs.getString("position"),
						rs.getInt("department_number")
						);	//한줄
				EmployeeInfoList.add(EmployeeDTO);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.closeDB(conn, psmt, rs);
		}

		return EmployeeInfoList;
	}
	
	public List<EmployeeDTO> findEmployeeInfoByName (String name) {	

		conn = DBConnectionManager.connectDB();

		String sql = " SELECT * FROM employee "
					+ " WHERE name = ? "; 

		List<EmployeeDTO> EmployeeInfoList = null; //return하기 위해 선언

		try {
			psmt = conn.prepareStatement(sql);

			psmt.setString(1, name);

			rs = psmt.executeQuery();

			if(rs.next()) {
				EmployeeDTO EmployeeDTO = new EmployeeDTO(
						rs.getString("employee_number"), 
						rs.getInt("employee_code"),
						rs.getString("employment_status"),
						rs.getString("password"),
						rs.getString("name"),
						rs.getString("gender"),
						rs.getString("phone_number"),
						rs.getString("address"),
						rs.getString("email"),
						rs.getString("position"),
						rs.getInt("department_number")
						);
				EmployeeInfoList.add(EmployeeDTO);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.closeDB(conn, psmt, rs);
		}
		return EmployeeInfoList;
	}
	
	public List<EmployeeDTO> findEmployeeInfoByDepartmentNumber (int department_number) {	

		conn = DBConnectionManager.connectDB();

		String sql = " SELECT * FROM Employee "
					+ " WHERE department_number = ? "; 

		List<EmployeeDTO> EmployeeInfoList = null; //return하기 위해 선언

		try {
			psmt = conn.prepareStatement(sql);

			psmt.setInt(1, department_number);

			rs = psmt.executeQuery();

			if(rs.next()) {
				EmployeeDTO EmployeeDTO = new EmployeeDTO(
						rs.getString("employee_number"), 
						rs.getInt("employee_code"),
						rs.getString("employment_status"),
						rs.getString("password"),
						rs.getString("name"),
						rs.getString("gender"),
						rs.getString("phone_number"),
						rs.getString("address"),
						rs.getString("email"),
						rs.getString("position"),
						rs.getInt("department_number")
						);
				EmployeeInfoList.add(EmployeeDTO);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.closeDB(conn, psmt, rs);
		}
		return EmployeeInfoList;
	}
	
	public List<EmployeeDTO> findEmployeeInfoByEmployeeNumber (int Employee_number) {	

		conn = DBConnectionManager.connectDB();

		String sql = " SELECT * FROM Employee "
					+ " WHERE Employee_number = ? "; 

		List<EmployeeDTO> EmployeeInfoList = null; //return하기 위해 선언

		try {
			psmt = conn.prepareStatement(sql);

			psmt.setInt(1, Employee_number);

			rs = psmt.executeQuery();

			if(rs.next()) {
				EmployeeDTO EmployeeDTO = new EmployeeDTO(
						rs.getString("employee_number"), 
						rs.getInt("employee_code"),
						rs.getString("employment_status"),
						rs.getString("password"),
						rs.getString("name"),
						rs.getString("gender"),
						rs.getString("phone_number"),
						rs.getString("address"),
						rs.getString("email"),
						rs.getString("position"),
						rs.getInt("department_number")
						);
				EmployeeInfoList.add(EmployeeDTO);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.closeDB(conn, psmt, rs);
		}
		return EmployeeInfoList;
	}

	public List<EmployeeDTO> findEmployeeInfoList() { 

		conn = DBConnectionManager.connectDB();

		String sql = " SELECT "
					+ " employee_number, "
					+ " CASE "
					+ " WHEN Employee_Code = 1 THEN '의사' "
					+ " WHEN Employee_Code = 2 THEN '간호사' "
					+ " WHEN Employee_Code = 3 THEN '행정' "
					+ " ELSE '알 수 없음' END AS employee_category, "
					+ " position, name, phone_number, email "
					+ " FROM employee "
					+ " WHERE employment_status = 'Y' ";
				
		
		List<EmployeeDTO> EmployeeInfoList = null; //return하기 위해 선언

		try {
			psmt = conn.prepareStatement(sql);
			//Connection을 활용해서 sql 명령을 실행하는 객체

			rs = psmt.executeQuery(); //준비된 sql 쿼리문 실행!
			EmployeeInfoList = new ArrayList<EmployeeDTO>();	//List 초기화

			while(rs.next()) {
				EmployeeDTO EmployeeDTO = new EmployeeDTO(
						rs.getString("employee_number"), 
						rs.getString("employee_category"),
						rs.getString("position"),
						rs.getString("name"),
						rs.getString("phone_number"),
						rs.getString("email")
						);	//한줄
				EmployeeInfoList.add(EmployeeDTO);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.closeDB(conn, psmt, rs);
		}

		return EmployeeInfoList;
	}
	
	
}
