package db.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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
	public List<ReservationDTO> AdminReservationList(){
		//결과가 한개인지 여러개(List)인지

		//DBConnectionManager 만들어준 connection 을 활용
		conn = DBConnectionManager.connectDB();

		String sql =  " select TO_CHAR(Reservation_Date, 'YYYY-MM-DD'), TO_CHAR(Reservation_time, 'HH:00'), Reservation_Number, patient_Number,"
				+ "Reservation_Content, Employee_Number, Department_Number from Reservation order by Reservation_Date, Reservation_time " ;

		List<ReservationDTO> reservationList = null;

		try {
			psmt = conn.prepareStatement(sql);
			//Connection 활용해서 sql 명령을 실행하는 객체

			rs = psmt.executeQuery(); //준비된 sql 쿼리문 실행!
			reservationList = new ArrayList<ReservationDTO>();

			while(rs.next()) { 	
				ReservationDTO reservationDTO = new ReservationDTO(rs.getString("reservation_number")
						,rs.getString("reservation_date"), rs.getString("reservation_time")
						,rs.getString("reservation_content"), rs.getInt("employee_number"), rs.getString("department_number") );

				reservationList.add(reservationDTO);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.closeDB(conn, psmt, rs);
		}

		return reservationList;
	}
	
}
