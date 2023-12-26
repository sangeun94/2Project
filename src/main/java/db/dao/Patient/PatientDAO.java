package db.dao;

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
            // 사용자가 입력한 아이디와 비밀번호 가져오기
            String id = request.getParameter("id");
            String password = request.getParameter("password");

            // 아이디와 비밀번호를 검증하는 코드 (예시)
            boolean loginSuccessful = yourAuthenticationLogic(id, password);

            if (loginSuccessful) {
                // 로그인 성공 시 사용자 정보를 세션에 저장
                HttpSession session = request.getSession();
                PatientDTO loggedInUser = getPatientInfo(id);  // 예시: 아이디에 해당하는 사용자 정보를 가져오는 메서드
                session.setAttribute("loggedInUser", loggedInUser);

                // 로그인 성공 후 리다이렉트 또는 다른 동작 수행
                response.sendRedirect("/home");  // 예시: 로그인 성공 후 이동할 페이지
            } else {
                // 로그인 실패 처리 (예시: 다시 로그인 페이지로 이동)
                response.sendRedirect("/login.jsp?error=1");
            }
        }

        // 아이디에 해당하는 사용자 정보를 가져오는 메서드 (예시)
        private PatientDTO getPatientInfo(String id) {
            // 실제로는 데이터베이스에서 아이디에 해당하는 정보를 조회하여 반환하는 로직을 작성
            // 예시로 사용자의 정보를 담은 가상의 PatientDTO를 반환
            return new PatientDTO(/* 정보 설정 */);
        }

        // 실제로는 아이디와 비밀번호를 검증하는 로직을 작성
        private boolean yourAuthenticationLogic(String id, String password) {
            // 예시: 간단한 로그인 검증 (실제로는 데이터베이스 등을 이용하여 안전하게 구현해야 함)
            return "example_id".equals(id) && "example_password".equals(password);
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

            String sql = "SELECT * FROM patient_table WHERE id = ?";
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
}
