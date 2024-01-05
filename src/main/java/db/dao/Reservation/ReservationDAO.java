package db.dao.Reservation;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.dto.EmployeeDTO;
import db.dto.MedicalDepartmentDTO;
import db.dto.PatientDTO;
import db.dto.ReservationDTO;
import db.util.DBConnectionManager;

public class ReservationDAO {
	
	//필드변수
	Connection conn;
	PreparedStatement psmt;
	ResultSet rs;
	
	
	//환자 정보 메소드
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
				patient = new PatientDTO(rs.getString("name"), rs.getString("phone_number"), rs.getInt("patient_number"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.closeDB(conn, psmt, rs);
		}
		
		return patient;
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
		
		String sql = " SELECT * FROM Employee e, medical_department d "
					+ " WHERE Employee_code = ? "
					+ " AND  e.department_number = d.department_number "
					+ " ORDER BY name";
				
		List<EmployeeDTO> employeeList = null;
		
		try {
			psmt = conn.prepareStatement(sql);
			
			psmt.setInt(1, 1);

			rs = psmt.executeQuery();
			employeeList = new ArrayList<EmployeeDTO>();
			
			while (rs.next()) {
				
				EmployeeDTO employeeDTO = new EmployeeDTO(rs.getString("name"), rs.getInt("department_number"), rs.getString("employee_number"), rs.getString("department_name"));
		
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
					+ " ORDER BY name";
				
		List<EmployeeDTO> employeeList = null;
		
		try {
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, department_number);

			rs = psmt.executeQuery();
			employeeList = new ArrayList<EmployeeDTO>();
			
			while (rs.next()) {
				
				EmployeeDTO employeeDTO = new EmployeeDTO(rs.getString("name"), rs.getInt("department_number"), rs.getString("employee_number"));
		
				employeeList.add(employeeDTO);
				
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.closeDB(conn, psmt, rs);
		}
		
		return employeeList;
	}
	
	// 선택한번호에 해당하는 과 출력용
		public MedicalDepartmentDTO findMedicalDepartmentByNum(String num) {
			conn = DBConnectionManager.connectDB();
			
			String sql = " SELECT * FROM Medical_Department" +	
							" WHERE department_number = ? ";
				
			MedicalDepartmentDTO medicalDepartmentInfo = null;
			
			try {
				psmt = conn.prepareStatement(sql);
				
				psmt.setString(1, num);

				rs = psmt.executeQuery();
				
				if(rs.next()) {
					medicalDepartmentInfo = new MedicalDepartmentDTO(rs.getInt("department_number"), 
																rs.getString("department_name"), rs.getString("tel"));
				}

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				DBConnectionManager.closeDB(conn, psmt, rs);
			}
			
			return medicalDepartmentInfo;

		}
		
		// 선택한 의사 정보 출력용
		public EmployeeDTO findEmployeeById(String id) {
			conn = DBConnectionManager.connectDB();
			
			String sql = " SELECT * FROM Employee e, medical_department d "
					+ " WHERE employee_number = ? "
					+ " AND  e.department_number = d.department_number ";
				
			EmployeeDTO employeeInfo = null;
			
			try {
				psmt = conn.prepareStatement(sql);
				
				psmt.setString(1, id);

				rs = psmt.executeQuery();
				
				if(rs.next()) {
					employeeInfo = new EmployeeDTO(rs.getString("name"), rs.getInt("department_number"), rs.getString("employee_number"),rs.getString("department_name"));
				}

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				DBConnectionManager.closeDB(conn, psmt, rs);
			}
			
			return employeeInfo;

		}
		
		
		// 예약정보 저장
		public int saveReservation(int patient_Number, String reservation_Status, String reservation_Date, String reservation_Time, String reservation_Content, String employee_Number, String department_Number) {
			conn = DBConnectionManager.connectDB();
			
			String sql = " INSERT INTO Reservation "
						+ " VALUES ((SELECT NVL(MAX(TO_NUMBER(reservation_number)), 0) + 1 FROM reservation), ?, ?, TO_DATE(?,'YYYY-MM-DD'), TO_DATE(?,'YYYY-MM-DD HH24:MI:SS'), ?, ?, ?) " ;
			
			int result = 0;
			

			try {
				psmt = conn.prepareStatement(sql);
				

				psmt.setInt(1, patient_Number);
				psmt.setString(2, reservation_Status);
				psmt.setString(3, reservation_Date);
				psmt.setString(4, reservation_Time);
				psmt.setString(5, reservation_Content);
				psmt.setString(6, employee_Number);
				psmt.setString(7, department_Number);
				
				
				result = psmt.executeUpdate();
				

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {

				DBConnectionManager.closeDB(conn, psmt, rs);
			}
			return result;
			}
		
		
		//예약정보 조회
		public List<ReservationDTO> reservationInfoList(String patient_Number) {
			conn = DBConnectionManager.connectDB();

			String sql = " SELECT reservation_status, TO_CHAR(reservation_date, 'YYYY-MM-DD') reservation_date, TO_CHAR(reservation_time, 'HH24:MI') reservation_time, reservation_content, name, department_name, reservation_number FROM reservation r, employee e, medical_Department m " + 
							" WHERE r.patient_number = ? " +
							" AND r.employee_number = e.employee_number " +
							" AND e.department_number = m.department_number " +
							" ORDER BY TO_NUMBER(reservation_number) desc " ;

			
			List<ReservationDTO> reservationList = null ;
			

			try {
				psmt = conn.prepareStatement(sql);
				
				psmt.setString(1, patient_Number);
				
				rs = psmt.executeQuery();
				reservationList = new ArrayList<ReservationDTO>();
				
				while (rs.next()) {
					ReservationDTO reservationDTO = new ReservationDTO( rs.getString("reservation_status"),
																		rs.getString("reservation_date"),
																		rs.getString("reservation_time"),
																		rs.getString("reservation_content"),
																		rs.getString("name"),
																		rs.getString("department_name"),
																		rs.getString("reservation_number"));
					reservationList.add(reservationDTO);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {

				DBConnectionManager.closeDB(conn, psmt, rs);
			}
			return reservationList;
			}
		
	
		//예약취소
		public int cancelReservation(String reservation_number) {
			conn = DBConnectionManager.connectDB();
			
			String sql = " UPDATE reservation "
						+ " SET reservation_status = ? " 
						+ " WHERE reservation_number = ? ";
			int result = 0;
			

			try {
				psmt = conn.prepareStatement(sql);
				

				psmt.setString(1, "N");
				psmt.setString(2, reservation_number);
				
				
				result = psmt.executeUpdate();
				

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {

				DBConnectionManager.closeDB(conn, psmt, rs);
			}
			return result;
			}
		
		
		//선택 예약 정보 조회용
		public ReservationDTO findReservationByNum(String num) {
			conn = DBConnectionManager.connectDB();
			
			String sql = " SELECT * FROM reservation "
							+ " WHERE reservation_number = ? " ;
					
			ReservationDTO reservation = null;
			
			try {
				psmt = conn.prepareStatement(sql);
				
				psmt.setString(1, num);

				rs = psmt.executeQuery(); // 준비된 sql 쿼리문 실행!
				
				if(rs.next()) {
					reservation = new ReservationDTO(rs.getString("reservation_status"),
														rs.getString("reservation_number"));
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				DBConnectionManager.closeDB(conn, psmt, rs);
			}
			
			return reservation;
		}
	
	

}