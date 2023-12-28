package db.dao.Patient;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.dto.EmployeeDTO;
import db.dto.MedicalDepartmentDTO;
import db.dto.PatientDTO;
import db.util.DBConnectionManager;

public class ReservationDAO {
	
	//필드변수
	Connection conn;
	PreparedStatement psmt;
	ResultSet rs;
	
	
	//임시로 생성한 patient 관련 메소드 추후 이동 필요
	public PatientDTO findPatientInfoById(String id) {
		conn = DBConnectionManager.connectDB();
		
		String sql = " SELECT * FROM Patient "
						+ " WHERE id = ? " ;
				
		PatientDTO patient = null;
		
		try {
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, id);

			rs = psmt.executeQuery(); // 준비된 sql 쿼리문 실행!
			
			if(rs.next()) {
				patient = new PatientDTO(rs.getString("name"), rs.getString("phone_number"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.closeDB(conn, psmt, rs);
		}
		
		return patient;
	}
	
	// 예약정보 저장
	public int savePatientInfo(String Reservation_Number, int patient_Number, String reservation_status, String Reservation_Date, String Reservation_time, String Reservation_Content, String Employee_Number, String Department_Number) {
		conn = DBConnectionManager.connectDB();
		
		String sql = " INSERT INTO Reservation "
								+ " VALUES (?, ?, ?, ?, ?, ?, ?, ?) " ;
		
		int result = 0;
		

		try {
			psmt = conn.prepareStatement(sql);
			

			psmt.setString(1,  Reservation_Number);
			psmt.setInt(2,  patient_Number);
			psmt.setString(3, Reservation_Date);
			psmt.setString(4, Reservation_time);
			psmt.setString(5, Reservation_Content);
			psmt.setString(6, Employee_Number);
			psmt.setString(7, Department_Number);
			
			result = psmt.executeUpdate();
			

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {

			DBConnectionManager.closeDB(conn, psmt, rs);
		}

		
		return result;
			
		}
		
	

	// 진료과 정보 가져오는 메소드
	public List<MedicalDepartmentDTO> findMedicalDepartmentList() {
		conn = DBConnectionManager.connectDB();
		
		String sql = " SELECT * FROM Medical_Department ORDER BY Department_Number ";
				
		List<MedicalDepartmentDTO> medicalDepartmentList = null;
		
		try {
			psmt = conn.prepareStatement(sql);

			rs = psmt.executeQuery();
			medicalDepartmentList = new ArrayList<MedicalDepartmentDTO>();
			
			while (rs.next()) {
				
				MedicalDepartmentDTO MedicalDepartmentDTO = new MedicalDepartmentDTO(rs.getInt("department_number"), 
																rs.getString("department_name"), rs.getString("tel"));
		
				medicalDepartmentList.add(MedicalDepartmentDTO);
				

			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.closeDB(conn, psmt, rs);
		}
		
		return medicalDepartmentList;

	}
	
	// 의료진 정보 가져오는 메소드
	public List<EmployeeDTO> findEmployeetList() {
		conn = DBConnectionManager.connectDB();
		
		String sql = " SELECT * FROM Employee "
					+ " WHERE Employee_code = ? "
					+ " ORDER BY  Department_Number, Name";
				
		List<EmployeeDTO> employeeList = null;
		
		try {
			psmt = conn.prepareStatement(sql);
			
			psmt.setInt(1, 1);

			rs = psmt.executeQuery();
			employeeList = new ArrayList<EmployeeDTO>();
			
			while (rs.next()) {
				
				EmployeeDTO employeeDTO = new EmployeeDTO(rs.getString("name"), rs.getInt("department_number"));
		
				employeeList.add(employeeDTO);
				
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.closeDB(conn, psmt, rs);
		}
		
		return employeeList;

	}
	
	
	
	
	// 선택한 과 의료진 정보 가져오는 메소드
	public List<EmployeeDTO> findDepartmentEmployeetList(String department_number) {
		conn = DBConnectionManager.connectDB();
		
		String sql = " SELECT * FROM Employee "
					+ " WHERE department_number = ? "
					+ " ORDER BY Name";
				
		List<EmployeeDTO> employeeList = null;
		
		try {
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, department_number);

			rs = psmt.executeQuery();
			employeeList = new ArrayList<EmployeeDTO>();
			
			while (rs.next()) {
				
				EmployeeDTO employeeDTO = new EmployeeDTO(rs.getString("name"), rs.getInt("department_number"));
		
				employeeList.add(employeeDTO);
				
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.closeDB(conn, psmt, rs);
		}
		
		return employeeList;

	}
	
	
	

}