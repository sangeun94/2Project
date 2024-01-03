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
	
	//조회
	public List<PatientDTO> findPatientInfoList() { 

		conn = DBConnectionManager.connectDB();

		String sql = " SELECT patient_number, patient_status_code, id, password, email, name, jumin, phone_number, address, "
					+ " CASE "
					+ " WHEN SUBSTR(jumin, 8, 1) IN ('1', '3') THEN '남성' "
					+ " WHEN SUBSTR(jumin, 8, 1) IN ('2', '4') THEN '여성' "
					+ " ELSE '알 수 없음' "
					+ " END AS gender "
					+ " FROM patient ";
		
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
						rs.getString("address"),
						rs.getString("gender")
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
	
	public PatientDTO findPatientInfoByPatientNumber (int patient_number) {	

		conn = DBConnectionManager.connectDB();

		String sql = " SELECT patient_number, patient_status_code, id, password, email, name, jumin, phone_number, address, "
					+ " CASE "
					+ " WHEN SUBSTR(jumin, 8, 1) IN ('1', '3') THEN '남성' "
					+ " WHEN SUBSTR(jumin, 8, 1) IN ('2', '4') THEN '여성' "
					+ " ELSE '알 수 없음' "
					+ " END AS gender "
					+ " FROM patient "
					+ " WHERE patient_number = ? "; 

		PatientDTO patientInfo = null; //return하기 위해 선언

		try {
			psmt = conn.prepareStatement(sql);

			psmt.setInt(1, patient_number);

			rs = psmt.executeQuery();

			if(rs.next()) {
				patientInfo = new PatientDTO(
						rs.getInt("patient_number"), 
						rs.getInt("patient_status_code"),
						rs.getString("id"),
						rs.getString("password"),
						rs.getString("email"),
						rs.getString("name"),
						rs.getString("jumin"),
						rs.getString("phone_number"),
						rs.getString("address"),
						rs.getString("gender")
						);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.closeDB(conn, psmt, rs);
		}
		return patientInfo;
	}

	//웹사이트 가입 회원 조회
	public List<PatientDTO> findWebsiteUserList() {	

		conn = DBConnectionManager.connectDB();

		String sql = " SELECT * FROM patient "
				+ " WHERE id is not null "
				+ " AND patient_status_code = 1 ";
		
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
		
	
	//저장(INSERT INTO) - 오프라인 접수 환자
	//patient_number는 자동부여 patient_status_code는 3(웹 미가입)
	//아이디, 비밀번호, 이메일 null
	public int savePatientInfo(String name, String jumin, String phone_number, String address) { 

		conn = DBConnectionManager.connectDB();

		String sql = " INSERT INTO patient "
					+ " VALUES ( (SELECT NVL(MAX(patient_number),0)+1 FROM patient ), 3, null, null, null , ?, ?, ?, ?) "; 

		int result = 0;

		try {
			psmt = conn.prepareStatement(sql);

			psmt.setString(1, name);
			psmt.setString(2, jumin);
			psmt.setString(3, phone_number);
			psmt.setString(4, address);
			
			//rs = psmt.executeQuery(); //준비된 sql 쿼리문 실행

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
	
	//저장(INSERT INTO) - DTO 객체에 담아서 저장
	public int savePatientInfo(PatientDTO patientDTO) { 

		conn = DBConnectionManager.connectDB();

		String sql = " INSERT INTO patient "
				+ " VALUES ( (SELECT NVL(MAX(patient_number),0)+1 FROM patient ), 3, null, null, null , ?, ?, ?, ?) "; 
		
		int result = 0;

		try {
			psmt = conn.prepareStatement(sql);

			psmt.setString(1, patientDTO.getName());
			psmt.setString(2, patientDTO.getJumin());
			psmt.setString(3, patientDTO.getPhone_number());
			psmt.setString(4, patientDTO.getAddress());

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
