package db.dao.admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import db.dto.PatientDTO;
import db.util.DBConnectionManager;

public class AdminPatientInfoDAO {
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

	public PatientDTO findPatientByNum(int patient_number) { //ex) patient_number에 10이 들어왔다
		
		conn = DBConnectionManager.connectDB();

		String sql =  " select * from patient where patient_number = ? ";

		PatientDTO patientInfo = null;

		try {
			psmt = conn.prepareStatement(sql);
			//Connection 활용해서 sql 명령을 실행하는 객체
			
			psmt.setInt(1, patient_number);

			rs = psmt.executeQuery(); //준비된 sql 쿼리문 실행!

			if(rs.next()) { 
				patientInfo = new PatientDTO(rs.getInt("patient_number"), rs.getInt("patient_status_code")
						, rs.getString("id"), rs.getString("password"), rs.getString("email")
						, rs.getString("name"), rs.getString("jumin"), rs.getString("phone_number"), rs.getString("address")); //한줄
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.closeDB(conn, psmt, rs);
		}

		return patientInfo;
	}
	
	
	
}
