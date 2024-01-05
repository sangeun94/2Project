package db.dao.admin2;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.dto.EmployeeDTO;
import db.dto.PatientDTO;
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
					+ " WHERE name = ? "
					+ " ORDER BY length(employee_number), employee_number ";

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
					+ " WHERE department_number = ? "
					+ " ORDER BY length(employee_number), employee_number ";

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
	
	public List<EmployeeDTO> findEmployeeInfoByEmployeeNumber (String Employee_number) {	

		conn = DBConnectionManager.connectDB();

		String sql = " SELECT * FROM Employee "
					+ " WHERE Employee_number = ? "
					+ " ORDER BY length(employee_number), employee_number ";

		List<EmployeeDTO> EmployeeInfoList = null; //return하기 위해 선언

		try {
			psmt = conn.prepareStatement(sql);

			psmt.setString(1, Employee_number);

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
					+ " WHERE employment_status = 'Y' "
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
	
	//저장(INSERT INTO) - DTO 객체에 담아서 저장
	//직원코드, 재직여부, 이름, 성별, 휴대전화번호, 주소, 이메일, 직급, 과번호
	public int saveEmployeeInfo(EmployeeDTO employeeDTO) { 

		conn = DBConnectionManager.connectDB();
		
		String sql = " INSERT INTO employee "
					+ " VALUES ( NVL(MAX(TO_NUMBER(REPLACE(employee_number, 'hm', ''))), 0) + 1 ), "
					+ " ?, ?, null, ? , ?, ?, ?, ?, ?) "; 
		
		int result = 0;

		try {
			psmt = conn.prepareStatement(sql);

			psmt.setInt(1, employeeDTO.getEmployee_code());
			psmt.setString(2, employeeDTO.getEmployment_status());
			psmt.setString(3, employeeDTO.getName());
			psmt.setString(4, employeeDTO.getGender());
			psmt.setString(5, employeeDTO.getPhone_number());
			psmt.setString(6, employeeDTO.getAddress());
			psmt.setString(7, employeeDTO.getEmail());
			psmt.setString(8, employeeDTO.getPosition());
			psmt.setInt(9, employeeDTO.getDepartment_number());

			result = psmt.executeUpdate(); //행의 개수

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.closeDB(conn, psmt, rs);
		}

		return result;
	}

	//수정(UPDATE)
	//patient_status_code, id, password, email, name, jumin, phone_number, address
	public int modifyPatientInfo(PatientDTO patientDTO) { 

		conn = DBConnectionManager.connectDB();

		String sql = " UPDATE patient "
					+ " SET patient_status_code = ? "
					+ " , id = ? "
					+ " , password = ? "
					+ " , email = ? "
					+ " , name = ? "
					+ " , jumin = ? "
					+ " , phone_number = ? "
					+ " , address = ? "
					+ " WHERE patient_number = ? ";
		
		int result = 0;

		try {
			psmt = conn.prepareStatement(sql);
			
			psmt.setInt(1, patientDTO.getPatient_status_code());
			psmt.setString(2, patientDTO.getId());
			psmt.setString(3, patientDTO.getPassword());
			psmt.setString(4, patientDTO.getEmail());
			psmt.setString(5, patientDTO.getName());
			psmt.setString(6, patientDTO.getJumin());
			psmt.setString(7, patientDTO.getPhone_number());
			psmt.setString(8, patientDTO.getAddress());
			psmt.setInt(9, patientDTO.getPatient_number());

			result = psmt.executeUpdate(); //행의 개수
			//SELECT 쿼리 : psmt.executeQuery(); -> 결과로 ResultSet
			//INSERT,  UPDATE, DELETE 쿼리 : psmt.executeUpdate(); 
			// 	 						 -> 적용된 행의 숫자가 리턴된다.


		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.closeDB(conn, psmt, rs);
		}

		return result;
	}
	
	
	//삭제(DELETE)
	//해당 patient_number에 맞는 사람의 정보 삭제
	public int removePatientInfoById(int patient_number) { 

		conn = DBConnectionManager.connectDB();

		String sql = " DELETE FROM patient "
					+ " WHERE patient_number = ? ";

		int result = 0;

		try {
			psmt = conn.prepareStatement(sql);
			
			psmt.setInt(1, patient_number);

			result = psmt.executeUpdate(); //행의 개수

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.closeDB(conn, psmt, rs);
		}

		return result;
	}
	
	
	
	
}
