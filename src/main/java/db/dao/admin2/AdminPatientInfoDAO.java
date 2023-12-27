package db.dao.admin2;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.dto.PatientDTO;
import db.util.DBConnectionManager;

public class AdminPatientInfoDAO {

	Connection conn;
	PreparedStatement psmt;
	ResultSet rs;
	
	public List<PatientDTO> findPatientInfoList() { 

		conn = DBConnectionManager.connectDB();

		String sql = " SELECT * FROM patient ";
		
		List<PatientDTO> PatientInfoList = null; //return하기 위해 선언

		try {
			psmt = conn.prepareStatement(sql);
			//Connection을 활용해서 sql 명령을 실행하는 객체

			rs = psmt.executeQuery(); //준비된 sql 쿼리문 실행!
			PatientInfoList = new ArrayList<PatientDTO>();	//List 초기화

			while(rs.next()) {
				PatientDTO PatientDTO = new PatientDTO(
						rs.getInt("patient_number"), 
						rs.getInt("patient_status_code"),
						rs.getString("id"),
						rs.getString("password"),
						rs.getString("email"),
						rs.getString("name"),
						rs.getString("jumin"),
						rs.getString("phone_number"),
						rs.getString("address")
						);	//한줄
				PatientInfoList.add(PatientDTO);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.closeDB(conn, psmt, rs);
		}

		return PatientInfoList;
	}
	
	public List<PatientDTO> findPatientInfoByName (String name) {	

		conn = DBConnectionManager.connectDB();

		String sql = " SELECT * FROM patient "
					+ " WHERE name = ? "; 

		List<PatientDTO> PatientInfoList = null; //return하기 위해 선언

		try {
			psmt = conn.prepareStatement(sql);

			psmt.setString(1, name);

			rs = psmt.executeQuery();

			if(rs.next()) {
				PatientDTO PatientDTO = new PatientDTO(
						rs.getInt("patient_number"), 
						rs.getInt("patient_status_code"),
						rs.getString("id"),
						rs.getString("password"),
						rs.getString("email"),
						rs.getString("name"),
						rs.getString("jumin"),
						rs.getString("phone_number"),
						rs.getString("address")
						);
				PatientInfoList.add(PatientDTO);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.closeDB(conn, psmt, rs);
		}
		return PatientInfoList;
	}
	
	public List<PatientDTO> findPatientInfoById (String id) {	

		conn = DBConnectionManager.connectDB();

		String sql = " SELECT * FROM patient "
					+ " WHERE id = ? "; 

		List<PatientDTO> PatientInfoList = null; //return하기 위해 선언

		try {
			psmt = conn.prepareStatement(sql);

			psmt.setString(1, id);

			rs = psmt.executeQuery();

			if(rs.next()) {
				PatientDTO PatientDTO = new PatientDTO(
						rs.getInt("patient_number"), 
						rs.getInt("patient_status_code"),
						rs.getString("id"),
						rs.getString("password"),
						rs.getString("email"),
						rs.getString("name"),
						rs.getString("jumin"),
						rs.getString("phone_number"),
						rs.getString("address")
						);
				PatientInfoList.add(PatientDTO);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.closeDB(conn, psmt, rs);
		}
		return PatientInfoList;
	}
	
	public List<PatientDTO> findPatientInfoByPatientNumber (int patient_number) {	

		conn = DBConnectionManager.connectDB();

		String sql = " SELECT * FROM patient "
					+ " WHERE patient_number = ? "; 

		List<PatientDTO> PatientInfoList = null; //return하기 위해 선언

		try {
			psmt = conn.prepareStatement(sql);

			psmt.setInt(1, patient_number);

			rs = psmt.executeQuery();

			if(rs.next()) {
				PatientDTO PatientDTO = new PatientDTO(
						rs.getInt("patient_number"), 
						rs.getInt("patient_status_code"),
						rs.getString("id"),
						rs.getString("password"),
						rs.getString("email"),
						rs.getString("name"),
						rs.getString("jumin"),
						rs.getString("phone_number"),
						rs.getString("address")
						);
				PatientInfoList.add(PatientDTO);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.closeDB(conn, psmt, rs);
		}
		return PatientInfoList;
	}

	public List<PatientDTO> findWebsiteUserList() {	

		conn = DBConnectionManager.connectDB();

		String sql = " SELECT * FROM patient "
				+ " WHERE id is not null ";
		
		List<PatientDTO> PatientInfoList = null; //return하기 위해 선언

		try {
			psmt = conn.prepareStatement(sql);
			//Connection을 활용해서 sql 명령을 실행하는 객체

			rs = psmt.executeQuery(); //준비된 sql 쿼리문 실행!
			PatientInfoList = new ArrayList<PatientDTO>();	//List 초기화

			while(rs.next()) {
				PatientDTO PatientDTO = new PatientDTO(
						rs.getInt("patient_number"), 
						rs.getInt("patient_status_code"),
						rs.getString("id"),
						rs.getString("password"),
						rs.getString("email"),
						rs.getString("name"),
						rs.getString("jumin"),
						rs.getString("phone_number"),
						rs.getString("address")
						);	//한줄
				PatientInfoList.add(PatientDTO);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.closeDB(conn, psmt, rs);
		}

		return PatientInfoList;
	}
}
