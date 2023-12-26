package db.dao.Patient;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


import db.dto.PatientDTO;
import db.util.DBConnectionManager;

public class LoginDAO {
	//필드변수
			Connection conn;
			PreparedStatement psmt;
			ResultSet rs;
			public PatientDTO findLoginById(String id) { //ex) employee_number에 10이 들어왔다
				
				conn = DBConnectionManager.connectDB();

				String sql =  " select id, password from patient where id = ? "; //WHERE employee_number = 10

				PatientDTO loginInfo= null;

				try {
					psmt = conn.prepareStatement(sql);
					//Connection 활용해서 sql 명령을 실행하는 객체
					
					psmt.setString(1, id);
					

					rs = psmt.executeQuery(); //준비된 sql 쿼리문 실행!

					if(rs.next()) { 
						loginInfo = new PatientDTO(rs.getString("id"), rs.getString("password")); //한줄
					}

				} catch (SQLException e) {
					e.printStackTrace();
				} finally {
					DBConnectionManager.closeDB(conn, psmt, rs);
				}

				return loginInfo;
			}
	}
