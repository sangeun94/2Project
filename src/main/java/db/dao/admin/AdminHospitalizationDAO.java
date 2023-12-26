package db.dao.admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.dto.InpatientRoomDTO;
import db.util.DBConnectionManager;

public class AdminHospitalizationDAO {
	
	Connection conn;
	PreparedStatement psmt;
	ResultSet rs;
	
	//입원실번호, 현재인원수
	public List<InpatientRoomDTO> findInpatientRoomList() {
		
		conn = DBConnectionManager.connectDB();
		
        String sql = "SELECT Inpatient_Room_Number, COUNT(Patient_Number) patient_count FROM Hospitalization GROUP BY Inpatient_Room_Number";

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
}
