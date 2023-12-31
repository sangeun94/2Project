package db.dao.admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.dto.HospitalizationDTO;
import db.dto.InpatientRoomDTO;
import db.dto.MedicalTreatmentDTO;
import db.util.DBConnectionManager;

public class AdminHospitalizationDAO {
	
	Connection conn;
	PreparedStatement psmt;
	ResultSet rs;
	
	//입원실번호, 현재인원수
	public List<InpatientRoomDTO> findInpatientRoomList() {
		
		conn = DBConnectionManager.connectDB();
		
        String sql = " SELECT Inpatient_Room_Number, COUNT(Patient_Number) patient_count "
        		+ " FROM Hospitalization "
        		+ " GROUP BY Inpatient_Room_Number "
        		+ " ORDER BY Inpatient_Room_Number ";

        List<InpatientRoomDTO> inpatientRoomList = null;
        
        try {
            
        	psmt = conn.prepareStatement(sql);
			//Connection 활용해서 sql 명령을 실행하는 객체

			rs = psmt.executeQuery(); //준비된 sql 쿼리문 실행!
			
			inpatientRoomList = new ArrayList<InpatientRoomDTO>();
			
            while(rs.next()) {
            	InpatientRoomDTO medicalTreatmentDTO = new InpatientRoomDTO(
		                rs.getInt("inpatient_room_number"), 
		                rs.getInt("patient_count")
		            );

            		inpatientRoomList.add(medicalTreatmentDTO);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // 자원 정리
        }

        return inpatientRoomList;
    }
	
	//입원 내역
	public List<HospitalizationDTO> findAdminHospitalizationList(){
		//결과가 한개인지 여러개(List)인지

		//DBConnectionManager 만들어준 connection 을 활용
		conn = DBConnectionManager.connectDB();

		String sql =  " select h.hospitalization_number, TO_CHAR(hospitalization_date, 'YYYY-MM-DD') hospitalization_date, TO_CHAR(discharge_date, 'YYYY-MM-DD') discharge_date, h.inpatient_room_number, h.patient_number, p.name "
				+ " from Hospitalization h, patient p "
				+ " where h.patient_number = p.patient_number "
				+ " order by hospitalization_number " ;

		List<HospitalizationDTO> hospitalizationList = null;

		try {
			psmt = conn.prepareStatement(sql);
			//Connection 활용해서 sql 명령을 실행하는 객체

			rs = psmt.executeQuery(); //준비된 sql 쿼리문 실행!
			hospitalizationList = new ArrayList<HospitalizationDTO>();

			while(rs.next()) { 	
				HospitalizationDTO hospitalizationDTO = new HospitalizationDTO(rs.getInt("hospitalization_number"), rs.getString("hospitalization_date")
						,rs.getString("discharge_date"), rs.getString("inpatient_room_number"), rs.getInt("patient_number")
						,rs.getString("name") );

				hospitalizationList.add(hospitalizationDTO);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.closeDB(conn, psmt, rs);
		}

		return hospitalizationList;
	}
	
	//입원내역 수정하기전에 보여질 정보(입원번호 환자번호 환자이름) 
	
	
	//입원 번호로 정보가져오기 -> 수정하기 화면에서 자동으로 적용되는 기본정보?
	 public HospitalizationDTO findAdminHospitalizationById(int hospitalization_number) {
	    conn = DBConnectionManager.connectDB();
	    	
        String sql = " select h.hospitalization_number, TO_CHAR(hospitalization_date, 'YYYY-MM-DD') hospitalization_date, TO_CHAR(discharge_date, 'YYYY-MM-DD') discharge_date, "
        		+ " h.inpatient_room_number, h.patient_number, p.name "
        		+ " from Hospitalization h, patient p "
        		+ " where h.patient_number = p.patient_number AND hospitalization_number = ? ";

        HospitalizationDTO hospitalization = null;
         
	        try {
	            psmt = conn.prepareStatement(sql);
	            
	            psmt.setInt(1, hospitalization_number);

	            rs = psmt.executeQuery();

	            if (rs.next()) {
	            	hospitalization = new HospitalizationDTO(
	                    rs.getInt("hospitalization_number"),
	                    rs.getString("hospitalization_date"),
	                    rs.getString("discharge_date"),
	                    rs.getString("inpatient_room_number"),
	                    rs.getInt("Patient_Number"),
	                    rs.getString("name")
	                );
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        } finally {
	            DBConnectionManager.closeDB(conn, psmt, rs);
	        }

	        return hospitalization;
	    }
	
	//저장 INSERT -> save
	 public int addHospitalization(String hospitalization_date, String discharge_date, String inpatient_room_number, int patient_number) {
			//DBConnectionManager 만들어준 connection 을 활용
		 conn = DBConnectionManager.connectDB();
			
		String sql = " INSERT INTO Hospitalization (hospitalization_number, hospitalization_date, discharge_date, inpatient_room_number, patient_number) "
				+ " VALUES (hospitalization_number_seq.NEXTVAL, TO_DATE(?, 'YYYY-MM-DD'), TO_DATE(?, 'YYYY-MM-DD'), ?, ?) ";			
        int result = 0;

        try {
            psmt = conn.prepareStatement(sql);
            
            psmt.setString(1, hospitalization_date);
            psmt.setString(2, discharge_date);
            psmt.setString(3, inpatient_room_number);
            psmt.setInt(4, patient_number);

            result = psmt.executeUpdate();
            
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConnectionManager.closeDB(conn, psmt, rs);
        }

        return result;
	 }
	
	 
	//수정 UPDATE -> modify
	public int modifyHospitalizationInfo(HospitalizationDTO hospitalization) { //포장박스(DTO)불러오면 그안에 있는 id name 사용가능!
		//해당 아이디에 맞는 사람의 이름을 수정!
		
		conn = DBConnectionManager.connectDB();

		 String sql = "UPDATE Hospitalization "
		 		+ " SET Hospitalization_Date = TO_DATE(?, 'YYYY-MM-DD'), "
		 		+ " Discharge_Date = TO_DATE(?, 'YYYY-MM-DD'), "
		 		+ " Inpatient_Room_Number = ? "
		 		+ " WHERE Hospitalization_Number = ? ";


		int result = 0;

		try {
			psmt = conn.prepareStatement(sql);
			//Connection 활용해서 sql 명령을 실행하는 객체
			
			psmt.setString(1, hospitalization.getHospitalization_date());
            psmt.setString(2, hospitalization.getDischarge_date());
            psmt.setString(3, hospitalization.getInpatient_room_number());
            psmt.setInt(4, hospitalization.getHospitalization_number());
			
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
	/*
	 * String sql = "UPDATE Reservation SET " + "Reservation_Date = ?, " +
	 * "Reservation_Time = ?, " + "Reservation_Status = ?, " +
	 * "Department_Number = (SELECT Department_Number FROM Medical_Department WHERE Department_Name = ?), "
	 * +
	 * "Employee_Number = (SELECT Employee_Number FROM Employee WHERE Name = ? AND Department_Number = "
	 * +
	 * "(SELECT Department_Number FROM Medical_Department WHERE Department_Name = ?)) "
	 * + "WHERE Reservation_Number = ?";
	 * 
	 * PreparedStatement ps = connection.prepareStatement(sql);
	 * 
	 * //각 ?에 해당하는 값을 설정합니다. ps.setString(1, newReservationDate); ps.setString(2,
	 * newReservationTime); ps.setString(3, newReservationStatus); ps.setString(4,
	 * newDepartmentName); ps.setString(5, newDoctorName); ps.setString(6,
	 * newDepartmentName); // 진료과 이름이 두 번 필요합니다. ps.setString(7,
	 * targetReservationNumber);
	 * 
	 * int result = ps.executeUpdate();
	 */
	
}
