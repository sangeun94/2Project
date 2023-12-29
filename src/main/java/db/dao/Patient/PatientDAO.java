package db.dao.Patient;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import db.dto.PatientDTO;
import db.util.DBConnectionManager;

public class PatientDAO {
		//필드변수
	private Connection conn;
    private PreparedStatement psmt;
    private ResultSet rs;

    public List<PatientDTO> findPatientList() {
        conn = DBConnectionManager.connectDB();
        String sql = "SELECT * FROM patient";
        List<PatientDTO> patientList = null;

        try {
            psmt = conn.prepareStatement(sql);
            rs = psmt.executeQuery();
            patientList = new ArrayList<>();

            while (rs.next()) {
                PatientDTO patientDTO = new PatientDTO(
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

                patientList.add(patientDTO);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConnectionManager.closeDB(conn, psmt, rs);
        }

        return patientList;
    }

    public PatientDTO findPatientById(int patient_number) {
        conn = DBConnectionManager.connectDB();
        String sql = "SELECT * FROM patient WHERE patient_number = ?";
        PatientDTO patientInfo = null;

        try {
            psmt = conn.prepareStatement(sql);
            psmt.setInt(1, patient_number);
            rs = psmt.executeQuery();

            if (rs.next()) {
                patientInfo = new PatientDTO(
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
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConnectionManager.closeDB(conn, psmt, rs);
        }

        return patientInfo;
    }

    // 다양한 오버로드된 savePatientInfo 메서드 중 하나를 선택
    // (PatientDTO 객체를 인자로 받는 버전)
    public int savePatientInfo(PatientDTO patientInfo) {
    	Connection conn = null;
        PreparedStatement psmt = null;
        ResultSet rs = null;
        int result = 0;

        try {
            conn = DBConnectionManager.connectDB();

            // 이메일 형식 체크 (이 예제에서는 간단한 형식 체크를 수행합니다)
            if (!isValidEmailFormat(patientInfo.getEmail())) {
                // 이메일 형식이 올바르지 않으면 가입을 막음
                result = -2;
            } else {
                // 중복 확인 쿼리
                String checkDuplicateSql = "SELECT COUNT(*) FROM patient WHERE phone_number = ? OR jumin = ? OR email = ?";
                psmt = conn.prepareStatement(checkDuplicateSql);
                psmt.setString(1, patientInfo.getPhone_number());
                psmt.setString(2, patientInfo.getJumin());
                psmt.setString(3, patientInfo.getEmail());

                rs = psmt.executeQuery();
                rs.next();

                int duplicateCount = rs.getInt(1);

                if (duplicateCount > 0) {
                    // 중복된 값이 존재하면 가입을 막음
                    result = -1;
                } else {
                    // 중복이 없으면 회원 정보 저장 그러나 환자번호코드는 1번이 기본값 1:가입 2:미가입 3:탈퇴
                    String saveSql = "INSERT INTO patient (patient_status_code, id, password, email, name, jumin, phone_number, address) VALUES (1, ?, ?, ?, ?, ?, ?, ?)";
                    psmt = conn.prepareStatement(saveSql);

                    // PreparedStatement를 사용하여 쿼리 실행
                    psmt.setString(1, patientInfo.getId());
                    psmt.setString(2, patientInfo.getPassword());
                    psmt.setString(3, patientInfo.getEmail());
                    psmt.setString(4, patientInfo.getName());
                    psmt.setString(5, patientInfo.getJumin());
                    psmt.setString(6, patientInfo.getPhone_number());
                    psmt.setString(7, patientInfo.getAddress());

                    // 쿼리 실행 및 결과 확인
                    result = psmt.executeUpdate();
                    conn.commit();  // 커밋 추가
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConnectionManager.closeDB(conn, psmt, rs);
        }

        return result;
    }

    // 간단한 이메일 형식 체크 메서드
    private boolean isValidEmailFormat(String email) {
        // 실제로 더 정교한 체크를 위해서는 정규표현식을 사용하는 것이 좋습니다.
        return email.contains("@");
    }

    // 다른 오버로드된 savePatientInfo 메서드도 추가 가능...
    public int savePatientInfo(String id, String password, String email, String name, String jumin, String phone_number, String address) {
        Connection conn = null;
        PreparedStatement psmt = null;
        int result = 0;

        try {
            conn = DBConnectionManager.connectDB();
            String sql = "INSERT INTO patient (id, password, email, name, jumin, phone_number, address) VALUES (?, ?, ?, ?, ?, ?, ?)";
            psmt = conn.prepareStatement(sql);

            // PreparedStatement를 사용하여 쿼리 실행
            psmt.setString(1, id);
            psmt.setString(2, password);
            psmt.setString(3, email);
            psmt.setString(4, name);
            psmt.setString(5, jumin);
            psmt.setString(6, phone_number);
            psmt.setString(7, address);

            // 쿼리 실행 및 결과 확인
            result = psmt.executeUpdate();
            conn.commit();  // 커밋 추가

        } catch (SQLException e) {
            e.printStackTrace();  // 예외 출력
        } finally {
            // 리소스 해제
            DBConnectionManager.closeDB(conn, psmt, null);
        }

        return result;
    }
    
    /* ----------------------------------------------------*/
    
    public class LoginServlet extends HttpServlet {
        protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            // 사용자가 제출한 로그인 정보를 검증하고, 성공하면 세션에 사용자 정보를 저장
            String id = request.getParameter("id");
            String password = request.getParameter("password");

            // 여기에서 데이터베이스에서 사용자 정보를 확인하는 로직을 구현해야 합니다.
            // 이 예제에서는 간단히 "admin" 사용자로 로그인을 허용합니다.
            if ("admin".equals(id) && "password".equals(password)) {
                HttpSession session = request.getSession();
                session.setAttribute("id", id);
                response.sendRedirect("myInfo1.jsp");
            } else {
                // 로그인 실패 처리
                response.sendRedirect("login.jsp");
            }
        }
    }
    /*	이름을 자동으로 가져오게하는 */
    
    public PatientDTO getPatientInfoById(String patientId) {
        Connection conn = null;
        PreparedStatement psmt = null;
        ResultSet rs = null;
        PatientDTO patientDTO = null;

        try {
            conn = DBConnectionManager.connectDB();

            String sql = "SELECT * FROM patient WHERE id = ?";
            psmt = conn.prepareStatement(sql);
            psmt.setString(1, patientId);

            rs = psmt.executeQuery();

            if (rs.next()) {
                // 결과가 있다면 PatientDTO에 정보를 설정
                patientDTO = new PatientDTO();
                patientDTO.setId(rs.getString("id"));
                patientDTO.setName(rs.getString("name"));
                // 나머지 필드도 설정...

                // 필요에 따라 다른 정보를 설정
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConnectionManager.closeDB(conn, psmt, rs);
        }

        return patientDTO;
    }
    
    
    //로그인한 사람의 내정보 페이지 MyInfo
    public PatientDTO findPatientById(String id) {
        conn = DBConnectionManager.connectDB();
        String sql = "SELECT * FROM patient WHERE id = ?";
        PatientDTO patientDTO = null;

        try {
            psmt = conn.prepareStatement(sql);
            psmt.setString(1, id);  // 파라미터 바인딩

            rs = psmt.executeQuery();

            if (rs.next()) {
                patientDTO = new PatientDTO(
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
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConnectionManager.closeDB(conn, psmt, rs);
        }

        return patientDTO;
    }
 // MyInfo 페이지에서 사용자 정보 업데이트
    public boolean updatePatientInfo(PatientDTO updatedPatient) {
        conn = DBConnectionManager.connectDB();
        String sql = "UPDATE patient SET password=?, email=?, phone_number=?, address=? WHERE id=?";
        
        try {
            psmt = conn.prepareStatement(sql);
            psmt.setString(1, updatedPatient.getPassword());
            psmt.setString(2, updatedPatient.getEmail());
            psmt.setString(3, updatedPatient.getPhone_number());
            psmt.setString(4, updatedPatient.getAddress());
            psmt.setString(5, updatedPatient.getId());

            int rowsAffected = psmt.executeUpdate();

            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConnectionManager.closeDB(conn, psmt, null);
        }

        return false;
    }
    
    public boolean updatePatientInfo(String id, String password, String email, String phone_number, String address) {
        Connection conn = null;
        PreparedStatement psmt = null;

        try {
            conn = DBConnectionManager.connectDB();
            String sql = "UPDATE patient SET password=?, email=?, phone_number=?, address=? WHERE id=?";
            psmt = conn.prepareStatement(sql);

            psmt.setString(1, password);
            psmt.setString(2, email);
            psmt.setString(3, phone_number);
            psmt.setString(4, address);
            psmt.setString(5, id);

            int rowsAffected = psmt.executeUpdate();

            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConnectionManager.closeDB(conn, psmt, null);
        }

        return false;
    }
    
    /*----------------------게시판에 이름에 들어갈 값 저장하기-------------   */
 
    public String getPatientNameById(String name) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
       

        try {
            conn = DBConnectionManager.connectDB(); // 데이터베이스 연결 메서드

            String sql = "SELECT name FROM patient WHERE id = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, name);

            rs = pstmt.executeQuery();

            if (rs.next()) {
                name = rs.getString("name");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConnectionManager.closeDB(conn, pstmt, rs); // 데이터베이스 연결 해제 메서드
        }

        return name;
    }
}
