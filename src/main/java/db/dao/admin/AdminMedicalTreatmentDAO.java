package db.dao.admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.dto.MedicalTreatmentDTO;
import db.dto.ReservationDTO;
import db.util.DBConnectionManager;

public class AdminMedicalTreatmentDAO {
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
		public List<MedicalTreatmentDTO> findAdminMedicalTreatmentList(){
			//결과가 한개인지 여러개(List)인지

			//DBConnectionManager 만들어준 connection 을 활용
			conn = DBConnectionManager.connectDB();

			String sql =  " select m.treatment_number, TO_CHAR(treatment_date, 'YYYY-MM-DD') treatment_date, TO_CHAR(treatment_time, 'HH24:MI') treatment_time, "
					+ " m.employee_number, m.patient_number, p.name patient_name, m.hospitalization_status, m.treatment_content "
					+ " from medical_treatment m, patient p "
					+ " where m.patient_number = p.patient_number "
					+ " order by treatment_number " ;

			List<MedicalTreatmentDTO> medicaltreatmentList = null;

			try {
				psmt = conn.prepareStatement(sql);
				//Connection 활용해서 sql 명령을 실행하는 객체

				rs = psmt.executeQuery(); //준비된 sql 쿼리문 실행!
				medicaltreatmentList = new ArrayList<MedicalTreatmentDTO>();

				while(rs.next()) { 	
					MedicalTreatmentDTO medicalTreatmentDTO = new MedicalTreatmentDTO(rs.getInt("treatment_number"), rs.getString("treatment_date")
							,rs.getString("treatment_time"), rs.getString("employee_number"), rs.getInt("patient_number"), rs.getString("patient_name")
							,rs.getString("hospitalization_status"), rs.getString("treatment_content") );

					medicaltreatmentList.add(medicalTreatmentDTO);
				}

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				DBConnectionManager.closeDB(conn, psmt, rs);
			}

			return medicaltreatmentList;
		}
		
	    public MedicalTreatmentDTO findAdminMedicalTreatmentById(int treatment_number) {
	    	conn = DBConnectionManager.connectDB();
	    	
            String sql = " SELECT m.Treatment_Number, TO_CHAR(Treatment_Date, 'YYYY-MM-DD') Treatment_Date, " +
                         " TO_CHAR(Treatment_time, 'HH24:MI') Treatment_time, m.Employee_Number, " +
                         " m.Patient_Number, p.name Patient_name, m.Hospitalization_Status, m.Treatment_Content " +
                         " FROM Medical_Treatment m, patient p" +
                         " WHERE m.patient_number = p.patient_number AND Treatment_Number = ?";

            MedicalTreatmentDTO medicalTreatment = null;
            
	        try {
	            psmt = conn.prepareStatement(sql);
	            
	            psmt.setInt(1, treatment_number);

	            rs = psmt.executeQuery();

	            if (rs.next()) {
	                medicalTreatment = new MedicalTreatmentDTO(
	                    rs.getInt("Treatment_Number"),
	                    rs.getString("Treatment_Date"),
	                    rs.getString("Treatment_time"),
	                    rs.getString("Employee_Number"),
	                    rs.getInt("Patient_Number"),
	                    rs.getString("Patient_name"),
	                    rs.getString("Hospitalization_Status"),
	                    rs.getString("Treatment_Content")
	                );
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        } finally {
	            DBConnectionManager.closeDB(conn, psmt, rs);
	        }

	        return medicalTreatment;
	    }
		
	    public List<MedicalTreatmentDTO> findAdminMedicalTreatmentListById(String employee_number) {
			
			conn = DBConnectionManager.connectDB();
		    
		    // sql 변수를 올바르게 선언하고 초기화
		    String sql = " select t.treatment_number, TO_CHAR(treatment_date, 'YYYY-MM-DD') treatment_date, TO_CHAR(treatment_time, 'HH24:MI') treatment_time,"
		    		+ " t.hospitalization_status, d.department_name, e.name employee_name, t.patient_number, p.name patient_name, t.treatment_content "
		    		+ " from medical_treatment t, Medical_Department d, Employee e, patient p "
		    		+ " where e.Employee_Number = t.Employee_Number AND e.Department_Number = d.Department_Number "
		    		+ " AND p.patient_number = t.Patient_Number "
		    		+ " AND t.employee_number = ? AND t.hospitalization_status = 'Y' "
		    		+ " order by treatment_number ";

		    List<MedicalTreatmentDTO> medicaltreatmentList = null;

		    try {
		        psmt = conn.prepareStatement(sql);
		        psmt.setString(1, employee_number);
		        rs = psmt.executeQuery();

		        medicaltreatmentList = new ArrayList<>();
		        
		        while (rs.next()) {
		        	MedicalTreatmentDTO medicalTreatmentDTO = new MedicalTreatmentDTO(
		                rs.getInt("treatment_number"), 
		                rs.getString("treatment_date"), 
		                rs.getString("treatment_time"), 
		                rs.getString("hospitalization_status"),
		                rs.getString("department_name"),
		                rs.getString("employee_name"),
		                rs.getInt("patient_number"),
		                rs.getString("patient_name"),
		                rs.getString("treatment_content")
		            );

		            medicaltreatmentList.add(medicalTreatmentDTO);
		        }
		    } catch (SQLException e) {
		        e.printStackTrace();
		    } finally {
		        DBConnectionManager.closeDB(conn, psmt, rs);
		    }

		    return medicaltreatmentList;
		}
	    
	    public MedicalTreatmentDTO findAdminMedicalTreatmentListById2(String patient_number) {
	        conn = DBConnectionManager.connectDB();
	        String sql =  " SELECT m.treatment_number, TO_CHAR(m.treatment_date, 'YYYY-MM-DD') treatment_date, "
	                    + " TO_CHAR(m.treatment_time, 'HH24:MI') treatment_time, "
	                    + " m.patient_number, p.name patient_name, m.treatment_content "
	                    + " FROM medical_treatment m, patient p "
	                    + " WHERE m.patient_number = p.patient_number AND m.patient_number = ? "
	                    + " ORDER BY m.treatment_number ";

	        MedicalTreatmentDTO medicalTreatment = null;

	        try {
	            psmt = conn.prepareStatement(sql);
	            psmt.setString(1, patient_number); // patient_number를 쿼리에 설정

	            rs = psmt.executeQuery();

	            if(rs.next()) { 
	                medicalTreatment = new MedicalTreatmentDTO(
	                    rs.getInt("treatment_number"), 
	                    rs.getString("treatment_date"), 
	                    rs.getString("treatment_time"), 
	                    rs.getInt("patient_number"),
	                    rs.getString("patient_name"), // 환자 이름
	                    rs.getString("treatment_content")
	                );
	            }

	        } catch (SQLException e) {
	            e.printStackTrace();
	        } finally {
	            DBConnectionManager.closeDB(conn, psmt, rs);
	        }

	        return medicalTreatment;
	    }
		
		//저장 INSERT -> save
		 public int addMedicalTreatment(String treatment_number, String patient_number, String employee_number, String treatment_date, String treatment_time, String hospitalization_status, String treatment_content) {
				//DBConnectionManager 만들어준 connection 을 활용
				conn = DBConnectionManager.connectDB();
				
				String sql = "INSERT INTO Medical_Treatment (Treatment_Number, Treatment_Date, Treatment_time, Employee_Number, Patient_Number, Hospitalization_Status, Treatment_Content) VALUES (treatment_number_seq.NEXTVAL, TO_DATE(?, 'YYYY-MM-DD'), TO_DATE(?, 'HH24:MI'), ?, ?, ?, ?)";
				
		        int result = 0;

		        try {
		            psmt = conn.prepareStatement(sql);
		            
		            psmt.setString(1, treatment_date);
		            psmt.setString(2, treatment_time);
		            psmt.setString(3, employee_number);
		            psmt.setString(4, patient_number);
		            psmt.setString(5, hospitalization_status);
		            psmt.setString(6, treatment_content);

		            result = psmt.executeUpdate();
		            
		        } catch (SQLException e) {
		            e.printStackTrace();
		        } finally {
		            DBConnectionManager.closeDB(conn, psmt, rs);
		        }

		        return result;
		 }
		 
		//수정 UPDATE -> modify
		public int modifyMedicalTreatmentInfo(MedicalTreatmentDTO medicalTreatment) { //포장박스(DTO)불러오면 그안에 있는 id name 사용가능!
			//해당 아이디에 맞는 사람의 이름을 수정!
			
			conn = DBConnectionManager.connectDB();

			 String sql = "UPDATE Medical_Treatment SET " +
	                     "Hospitalization_Status = ?, " +
	                     "Treatment_Content = ? " +
	                     "WHERE Treatment_Number = ?";


			int result = 0;

			try {
				psmt = conn.prepareStatement(sql);
				//Connection 활용해서 sql 명령을 실행하는 객체
				
				psmt.setString(1, medicalTreatment.getHospitalization_status());
	            psmt.setString(2, medicalTreatment.getTreatment_content());
	            psmt.setInt(3, medicalTreatment.getTreatment_number());
				
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
