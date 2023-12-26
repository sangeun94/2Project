package db.dao.admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.dto.EmployeeDTO;
import db.dto.ReservationDTO;
import db.util.DBConnectionManager;

public class AdminReservationDAO {
	//필드변수
	Connection conn;
	PreparedStatement psmt;
	ResultSet rs;
	
	/*
	 select -> find
	 insert -> save
	 update -> modify
	 delete -> remove
	 */

	//select...  find...  read...
	public List<ReservationDTO> findAdminReservationList(){
		//결과가 한개인지 여러개(List)인지

		//DBConnectionManager 만들어준 connection 을 활용
		conn = DBConnectionManager.connectDB();

		String sql =  " select TO_CHAR(reservation_date, 'YYYY-MM-DD') reservation_Date, TO_CHAR(reservation_time, 'HH24:MI') reservation_time, Reservation_Number, reservation_status, patient_Number, Reservation_Content, Employee_Number, Department_Number from Reservation order by Reservation_Date, Reservation_time " ;

		List<ReservationDTO> reservationList = null;

		try {
			psmt = conn.prepareStatement(sql);
			//Connection 활용해서 sql 명령을 실행하는 객체

			rs = psmt.executeQuery(); //준비된 sql 쿼리문 실행!
			reservationList = new ArrayList<ReservationDTO>();

			while(rs.next()) { 	
				ReservationDTO reservationDTO = new ReservationDTO(rs.getString("reservation_date"), rs.getString("reservation_time")
						,rs.getString("reservation_number") , rs.getString("reservation_status"), rs.getInt("patient_number")
						,rs.getString("reservation_content"), rs.getString("employee_number"), rs.getString("department_number") );

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
		
		String sql = "SELECT TO_CHAR(reservation_date, 'YYYY-MM-DD') reservation_Date, " +
                "TO_CHAR(reservation_time, 'HH24:MI') reservation_time, " +
                "Reservation_Number, reservation_status, patient_Number, " +
                "Reservation_Content, Employee_Number, Department_Number " +
                "FROM Reservation " +
                "WHERE employee_number = ? " +
                "ORDER BY Reservation_Date, Reservation_time";
		
		List<ReservationDTO> reservationList = null;

	    try {
	        psmt = conn.prepareStatement(sql);
	        psmt.setString(1, employee_number);
	        rs = psmt.executeQuery();

	        reservationList = new ArrayList<>();
	        
	        while (rs.next()) {
	            ReservationDTO reservation = new ReservationDTO(
	                rs.getString("reservation_date"), 
	                rs.getString("reservation_time"), 
	                rs.getString("reservation_number"), 
	                rs.getString("reservation_status"), 
	                rs.getInt("patient_number"),
	                rs.getString("reservation_content"), 
	                rs.getString("employee_number"), 
	                rs.getString("department_number")
	            );

	            reservationList.add(reservation);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        DBConnectionManager.closeDB(conn, psmt, rs);
	    }

	    return reservationList;
	}
	
	public ReservationDTO findAdminMyReservationById2(String reservation_number) { //ex) employee_number에 10이 들어왔다
		
		conn = DBConnectionManager.connectDB();

		String sql =  " select TO_CHAR(reservation_date, 'YYYY-MM-DD') reservation_Date, TO_CHAR(reservation_time, 'HH24:MI') reservation_time, Reservation_Number, reservation_status, patient_Number, Reservation_Content, Employee_Number, Department_Number from Reservation "
				+ " where reservation_number = ? "
				+ " order by Reservation_Date, Reservation_time " ; //WHERE employee_number = 10

		ReservationDTO MyreservationInfo = null;

		try {
			psmt = conn.prepareStatement(sql);
			//Connection 활용해서 sql 명령을 실행하는 객체
			
			psmt.setString(1, reservation_number);

			rs = psmt.executeQuery(); //준비된 sql 쿼리문 실행!

			if(rs.next()) { 
				MyreservationInfo = new ReservationDTO(rs.getString("reservation_date"), rs.getString("reservation_time")
						,rs.getString("reservation_number") , rs.getString("reservation_status"), rs.getInt("patient_number")
						,rs.getString("reservation_content"), rs.getString("employee_number"), rs.getString("department_number") );
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
	    String sql = " SELECT TO_CHAR(reservation_date, 'YYYY-MM-DD') reservation_Date, " +
	                 " TO_CHAR(reservation_time, 'HH24:MI') reservation_time, " +
	                 " Reservation_Number, reservation_status, patient_Number, " +
	                 " Reservation_Content, Employee_Number, Department_Number " +
	                 " FROM Reservation " +
	                 " WHERE employee_number = ? AND reservation_status = 'Y' " +
	                 " ORDER BY Reservation_Date, Reservation_time ";

	    List<ReservationDTO> reservationInfoList = null;

	    try {
	        psmt = conn.prepareStatement(sql);
	        psmt.setString(1, employee_number);
	        rs = psmt.executeQuery();

	        reservationInfoList = new ArrayList<>();
	        
	        while (rs.next()) {
	            ReservationDTO reservationDTO = new ReservationDTO(
	                rs.getString("reservation_date"), 
	                rs.getString("reservation_time"), 
	                rs.getString("reservation_number"), 
	                rs.getString("reservation_status"), 
	                rs.getInt("patient_number"),
	                rs.getString("reservation_content"), 
	                rs.getString("employee_number"), 
	                rs.getString("department_number")
	            );

	            reservationInfoList.add(reservationDTO);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        DBConnectionManager.closeDB(conn, psmt, rs);
	    }

	    return reservationInfoList;
	}

	public ReservationDTO findAdminReservationById(String employee_number) { //ex) employee_number에 hm3이 들어왔다
		
		conn = DBConnectionManager.connectDB();

		String sql =  "select TO_CHAR(reservation_date, 'YYYY-MM-DD') reservation_date, TO_CHAR(reservation_time, 'HH24:MI') reservation_time, patient_number, employee_number "
				+ " from reservation "
				+ "where employee_number = ? AND reservation_status = 'Y' " ; //WHERE employee_number = 'hm3'

		ReservationDTO reservationInfo = null;

		try {
			psmt = conn.prepareStatement(sql);
			//Connection 활용해서 sql 명령을 실행하는 객체
			
			psmt.setString(1, employee_number);

			rs = psmt.executeQuery(); //준비된 sql 쿼리문 실행!

			if(rs.next()) { 
				reservationInfo = new ReservationDTO(rs.getString("reservation_date"), rs.getString("reservation_time")
						,rs.getInt("patient_number"), rs.getString("employee_number") );
			}
			
			

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.closeDB(conn, psmt, rs);
		}

		return reservationInfo;
	}
	
}
