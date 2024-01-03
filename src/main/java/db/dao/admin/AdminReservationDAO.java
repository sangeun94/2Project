package db.dao.admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.dto.EmployeeDTO;
import db.dto.MedicalTreatmentDTO;
import db.dto.ReservationDTO;
import db.util.DBConnectionManager;

public class AdminReservationDAO {
	// 필드변수
	Connection conn;
	PreparedStatement psmt;
	ResultSet rs;

	/*
	 * select -> find insert -> save update -> modify delete -> remove
	 */

	// select... find... read...
	public List<ReservationDTO> findAdminReservationList() {
		// 결과가 한개인지 여러개(List)인지

		// DBConnectionManager 만들어준 connection 을 활용
		conn = DBConnectionManager.connectDB();

		String sql = " SELECT "
				+ "    r.Reservation_Number, "
				+ "    r.Patient_Number, "
				+ "    TO_CHAR(r.Reservation_Date, 'YYYY-MM-DD') AS Reservation_Date, "
				+ "    TO_CHAR(r.Reservation_Time, 'HH24:MI') AS Reservation_Time, "
				+ "    r.Reservation_Status, "
				+ "    m.Department_Name, "
				+ "    e.Name AS Employee_Name, "
				+ "    p.Name AS Patient_Name, "
				+ "    r.Reservation_Content "
				+ " FROM "
				+ "    Reservation r, "
				+ "    Medical_Department m, "
				+ "    Employee e, "
				+ "    Patient p "
				+ " WHERE "
				+ "    r.Department_Number = m.Department_Number(+) "
				+ "    AND r.Employee_Number = e.Employee_Number(+) "
				+ "    AND e.Department_Number = m.Department_Number(+) "
				+ "    AND r.Patient_Number = p.Patient_Number(+) "
				+ " ORDER BY "
				+ "    r.Reservation_Number ";

		List<ReservationDTO> reservationList = null;

		try {
			psmt = conn.prepareStatement(sql);
			// Connection 활용해서 sql 명령을 실행하는 객체

			rs = psmt.executeQuery(); // 준비된 sql 쿼리문 실행!
			reservationList = new ArrayList<ReservationDTO>();

			while (rs.next()) {
				ReservationDTO reservationDTO = new ReservationDTO(
						rs.getString("reservation_number"),
						rs.getInt("patient_number"), 
						rs.getString("reservation_date"), 
						rs.getString("reservation_time"),
						rs.getString("reservation_status"),
	                    rs.getString("department_name") != null ? rs.getString("department_name") : "정보 없음",
                        rs.getString("employee_name") != null ? rs.getString("employee_name") : "정보 없음",
						rs.getString("patient_name"),
						rs.getString("reservation_content")
				);

				reservationList.add(reservationDTO);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.closeDB(conn, psmt, rs);
		}

		return reservationList;
	}

	public List<ReservationDTO> findAdminMyReservationById(String employee_number) {

		conn = DBConnectionManager.connectDB();

		String sql = " select r.Reservation_Number, r.patient_Number, TO_CHAR(reservation_date, 'YYYY-MM-DD') reservation_Date, TO_CHAR(reservation_time, 'HH24:MI') reservation_time, "
				+ " r.reservation_status, m.department_name, e.name employee_name, p.name patient_name, r.Reservation_Content "
				+ " from Reservation r, Medical_Department m, Employee e, patient p "
				+ " where r.department_number = m.department_number AND m.department_number = e.department_number "
				+ " AND e.Employee_Number = r.Employee_Number AND p.patient_number = r.patient_number "
				+ " AND r.employee_number = ? " + " order by Reservation_number ";

		List<ReservationDTO> reservationList = null;

		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, employee_number);
			rs = psmt.executeQuery();

			reservationList = new ArrayList<>();

			while (rs.next()) {
				ReservationDTO reservation = new ReservationDTO(rs.getString("reservation_number"),
						rs.getInt("patient_number"), rs.getString("reservation_date"), rs.getString("reservation_time"),
						rs.getString("reservation_status"), rs.getString("department_name"),
						rs.getString("employee_name"), rs.getString("patient_name"),
						rs.getString("reservation_content"));

				reservationList.add(reservation);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.closeDB(conn, psmt, rs);
		}

		return reservationList;
	}

	public ReservationDTO findAdminMyReservationById2(String reservation_number) { // ex) employee_number에 10이 들어왔다

		conn = DBConnectionManager.connectDB();

		String sql = " select r.Reservation_Number, r.patient_Number, TO_CHAR(reservation_date, 'YYYY-MM-DD') reservation_Date, TO_CHAR(reservation_time, 'HH24:MI') reservation_time, "
				+ " r.reservation_status, r.employee_number, m.department_name, e.name employee_name, p.name patient_name, r.Reservation_Content "
				+ " from Reservation r, Medical_Department m, Employee e, patient p "
				+ " where r.department_number = m.department_number AND m.department_number = e.department_number "
				+ " AND e.Employee_Number = r.Employee_Number AND p.patient_number = r.patient_number "
				+ " AND r.reservation_number = ? " + " order by Reservation_number ";

		ReservationDTO MyreservationInfo = null;

		try {
			psmt = conn.prepareStatement(sql);
			// Connection 활용해서 sql 명령을 실행하는 객체

			psmt.setString(1, reservation_number);

			rs = psmt.executeQuery(); // 준비된 sql 쿼리문 실행!

			if (rs.next()) {
				MyreservationInfo = new ReservationDTO (
						rs.getString("reservation_number"), 
						rs.getInt("patient_number"),
						rs.getString("reservation_date"), 
						rs.getString("reservation_time"),
						rs.getString("reservation_status"), 
						rs.getString("employee_number"),
						rs.getString("department_name"), 
						rs.getString("employee_name"), 
						rs.getString("patient_name"),
						rs.getString("reservation_content")
				);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.closeDB(conn, psmt, rs);
		}

		return MyreservationInfo;
	}

	public List<ReservationDTO> findAdminMyReservationTreatmentById(String employee_number) {

		conn = DBConnectionManager.connectDB();

		// sql 변수를 올바르게 선언하고 초기화
		String sql = " select r.Reservation_Number, r.patient_Number, TO_CHAR(reservation_date, 'YYYY-MM-DD') reservation_Date, TO_CHAR(reservation_time, 'HH24:MI') reservation_time, "
				+ " r.reservation_status, m.department_name, e.name employee_name, p.name patient_name, r.Reservation_Content "
				+ " from Reservation r, Medical_Department m, Employee e, patient p "
				+ " where r.department_number = m.department_number AND m.department_number = e.department_number "
				+ " AND e.Employee_Number = r.Employee_Number AND p.patient_number = r.patient_number "
				+ " AND r.employee_number = ? AND r.reservation_status = 'Y' " + " order by Reservation_number ";

		List<ReservationDTO> reservationInfoList = null;

		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, employee_number);
			rs = psmt.executeQuery();

			reservationInfoList = new ArrayList<>();

			while (rs.next()) {
				ReservationDTO reservationDTO = new ReservationDTO(rs.getString("reservation_number"),
						rs.getInt("patient_number"), rs.getString("reservation_date"), rs.getString("reservation_time"),
						rs.getString("reservation_status"), rs.getString("department_name"),
						rs.getString("employee_name"), rs.getString("patient_name"),
						rs.getString("reservation_content"));

				reservationInfoList.add(reservationDTO);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.closeDB(conn, psmt, rs);
		}

		return reservationInfoList;
	}

	public ReservationDTO findAdminReservationById(String employee_number) { // ex) employee_number에 hm3이 들어왔다

		conn = DBConnectionManager.connectDB();

		String sql = "select TO_CHAR(reservation_date, 'YYYY-MM-DD') reservation_date, TO_CHAR(reservation_time, 'HH24:MI') reservation_time, patient_number, employee_number "
				+ " from reservation " + "where employee_number = ? AND reservation_status = 'Y' "; // WHERE
																									// employee_number =
																									// 'hm3'

		ReservationDTO reservationInfo = null;

		try {
			psmt = conn.prepareStatement(sql);
			// Connection 활용해서 sql 명령을 실행하는 객체

			psmt.setString(1, employee_number);

			rs = psmt.executeQuery(); // 준비된 sql 쿼리문 실행!

			if (rs.next()) {
				reservationInfo = new ReservationDTO(rs.getString("reservation_date"), rs.getString("reservation_time"),
						rs.getInt("patient_number"), rs.getString("employee_number"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.closeDB(conn, psmt, rs);
		}

		return reservationInfo;
	}

	// 수정 UPDATE -> modify
	
	public int modifyReservationInfo(ReservationDTO reservation) {
		//해당 아이디에 맞는 사람의 이름을 수정!
		
		conn = DBConnectionManager.connectDB();

		 String sql = "UPDATE Reservation "
		 		+ " SET "
		 		+ "    Reservation_Date = TO_DATE(?, 'YYYY-MM-DD'), "
		 		+ "    Reservation_Time = TO_DATE(?, 'HH24:MI'), "
		 		+ "    Reservation_Status = ?, "
		 		+ "    Department_Number = (SELECT Department_Number "
		 		+ "                         FROM Medical_Department "
		 		+ "                         WHERE Department_Name = ?), "
		 		+ "    Employee_Number = (SELECT Employee_Number "
		 		+ "                       FROM Employee "
		 		+ "                       WHERE Name = ? AND "
		 		+ "                       Department_Number = (SELECT Department_Number FROM Medical_Department WHERE Department_Name = ?)),"
		 		+ "    Reservation_Content = ? "
		 		+ " WHERE "
		 		+ "    Reservation_Number = ? ";


		int result = 0;

		try {
			psmt = conn.prepareStatement(sql);
			//Connection 활용해서 sql 명령을 실행하는 객체
			
			psmt.setString(1, reservation.getReservation_date());
            psmt.setString(2, reservation.getReservation_time());
            psmt.setString(3, reservation.getReservation_status());
            psmt.setString(4, reservation.getDepartment_name());
            psmt.setString(5, reservation.getEmployee_name());
            psmt.setString(6, reservation.getDepartment_name());
            psmt.setString(7, reservation.getReservation_content());
            psmt.setString(8, reservation.getReservation_number());

			
			result = psmt.executeUpdate(); // 1, 0
			//rs = psmt.executeQuery(); //준비된 sql 쿼리문 실행! -> SELECT문일때!
			/*
			SELECT 쿼리 : psmt.excuteQuery(); -> 결과로 ResultSet
			INSERT, UPDATE, DELETE 쿼리 : psmt.excuteUpdate();
										-> 결과 : 적용된 행의 숫자
			 */

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.closeDB(conn, psmt, rs);
		}
		
		return result;
	}

}
