package db.dao.Patient;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import db.dto.PatientDTO;
import db.util.DBConnectionManager;

public class LoginDAO {
			//필드변수
			Connection conn;
			PreparedStatement psmt;
			ResultSet rs;
			
			 // 로그인 정보 조회 메서드
		    public PatientDTO findLoginById(String id) {
		        // 아이디에 해당하는 사용자 정보를 조회하는 SQL 쿼리
		        String sql = "SELECT * FROM patient WHERE id = ?";

		        // 사용자 정보를 담을 DTO 객체
		        PatientDTO loginInfo = null;

		        try {
		        	conn = DBConnectionManager.connectDB(); // 데이터베이스 연결
		            psmt = conn.prepareStatement(sql);
		            psmt.setString(1, id);

		            rs = psmt.executeQuery();

		            // 조회된 정보가 있을 경우 DTO에 저장
		            if (rs.next()) {
		                loginInfo = new PatientDTO(
		                    rs.getString("id"),
		                    rs.getString("password"),
		                    rs.getString("name")
		                    // ... 다른 필드들 ...
		                );
		            }
		        } catch (SQLException e) {
		            e.printStackTrace();
		        } finally {
		            // 리소스 해제
		            closeDB();
		        }

		        return loginInfo;
		    }

		    // 데이터베이스 리소스 해제 메서드 (생략)
		    private void closeDB() {
		        // 리소스 해제 코드 구현 (생략)
		    }
			
		    public class LoginServlet extends HttpServlet {
		        protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		            // 사용자가 입력한 아이디를 가져오기
		            String id = request.getParameter("id");

		            // 세션에 사용자 아이디 저장
		            HttpSession session = request.getSession();
		            session.setAttribute("id", id);

		            // 로그인 후 리다이렉트 또는 다른 작업 수행
		            response.sendRedirect("/dashboard");
		        }
		    }
			
	}
