package db.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.dto.BoardDTO;
import db.util.DBConnectionManager;

public class BoardDAO {
	private Connection conn;
	
    private PreparedStatement psmt;
    private ResultSet rs;
    
   private String db_url = "jdbc:oracle:thin:@localhost:1521:orcl";
   private String db_id = "scott";
   private String db_pw = "tiger";

  
    /*----
     * ---------------------------*/
  
  
   


	    public boolean savePost(BoardDTO boardDTO) {
	        try {
	            Class.forName("oracle.jdbc.driver.OracleDriver");

	            try (Connection conn = DriverManager.getConnection(db_url, db_id, db_pw)) {
	                String sql = "INSERT INTO Board (title, content, name) VALUES (?, ?, ?)";
	            	//String sql = "INSERT INTO Board (board_number, title, name) VALUES (board_number_seq.NEXTVAL, ?, ?)";
	                try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
	                	//pstmt.setInt(1,boardDTO.getBoard_number());
	                	pstmt.setString(1, boardDTO.getTitle());
	                    pstmt.setString(2, boardDTO.getContent());
	                    pstmt.setString(3, boardDTO.getName());

	                    int result = pstmt.executeUpdate();

	                    return result > 0;
	                }
	            }
	        } catch (ClassNotFoundException | SQLException e) {
	            e.printStackTrace();
	            return false;
	        }
	    }

	    public List<BoardDTO> getAllPosts() {
	        List<BoardDTO> boardList = new ArrayList<>();

	        try {
	            // JDBC 드라이버 로딩
	            Class.forName("oracle.jdbc.driver.OracleDriver");

	            // 데이터베이스 연결
	            try (Connection conn = DriverManager.getConnection(db_url, db_id, db_pw)) {
	                // SQL 쿼리 작성 (테이블과 필드 이름은 실제 데이터베이스에 맞게 수정)
	                String sql = "SELECT * FROM Board";

	                try (PreparedStatement pstmt = conn.prepareStatement(sql);
	                     ResultSet rs = pstmt.executeQuery()) {

	                    // 결과 처리
	                    while (rs.next()) {
	                        BoardDTO boardDTO = new BoardDTO();
	                        boardDTO.setTitle(rs.getString("title"));
	                        boardDTO.setContent(rs.getString("content"));
	                        boardDTO.setName(rs.getString("name"));

	                        boardList.add(boardDTO);
	                    }
	                }
	            }
	        } catch (ClassNotFoundException | SQLException e) {
	            e.printStackTrace();
	        }

	        return boardList;
	    }
	

    /*---------------게시판 작성할때 이름 자동으로 부여----------------*/
	    public List<BoardDTO> getAllPosts(String loggedInUserName) {
	        List<BoardDTO> boardList = new ArrayList<>();

	        try {
	            // JDBC 드라이버 로딩
	            Class.forName("oracle.jdbc.driver.OracleDriver");

	            // 데이터베이스 연결
	            try (Connection conn = DriverManager.getConnection(db_url, db_id, db_pw)) {
	                // SQL 쿼리 작성 (테이블과 필드 이름은 실제 데이터베이스에 맞게 수정)
	                String sql = "SELECT * FROM Board";

	                try (PreparedStatement pstmt = conn.prepareStatement(sql);
	                     ResultSet rs = pstmt.executeQuery()) {

	                    // 결과 처리
	                    while (rs.next()) {
	                        // BoardDTO 객체를 생성하여 결과에서 가져온 값을 저장
	                        BoardDTO boardDTO = new BoardDTO();
	                        boardDTO.setTitle(rs.getString("title"));
	                        boardDTO.setContent(rs.getString("content"));

	                        // 로그인한 사용자의 이름과 게시물의 작성자 이름이 일치하면 자동으로 입력
	                        String name = rs.getString("name");
	                        boardDTO.setName(loggedInUserName.equals(name) ? loggedInUserName : name);

	                        // 리스트에 추가
	                        boardList.add(boardDTO);
	                    }
	                }
	            }
	        } catch (ClassNotFoundException | SQLException e) {
	            e.printStackTrace();
	        }

	        return boardList;
	    }
	    /*게시판 번호 자동부여*/
	    public int insertBoard(BoardDTO boardDTO) {
	        Connection conn = null;
	        PreparedStatement pstmt = null;
	        ResultSet rs = null;
	        int generatedKey = -1;

	        try {
	            conn = DBConnectionManager.connectDB();

	            // 시퀀스로부터 다음 값을 가져옴
	            String seqSql = "SELECT board_number_seq.NEXTVAL FROM DUAL";
	            pstmt = conn.prepareStatement(seqSql);
	            rs = pstmt.executeQuery();

	            if (rs.next()) {
	                // 다음 시퀀스 값을 가져와서 boardDTO에 설정
	                boardDTO.setBoard_number(rs.getInt(1));
	            }

	            // 게시물 등록 SQL
	            String sql = "INSERT INTO board (board_number, title, content, name) VALUES (?, ?, ?, ?)";
	            pstmt = conn.prepareStatement(sql);
	            pstmt.setInt(1, boardDTO.getBoard_number());
	            pstmt.setString(2, boardDTO.getTitle());
	            pstmt.setString(3, boardDTO.getContent());
	            pstmt.setString(4, boardDTO.getName());

	            // 게시물 등록 실행
	            pstmt.executeUpdate();

	            // 등록한 게시물 번호를 반환
	            generatedKey = boardDTO.getBoard_number();

	        } catch (SQLException e) {
	            e.printStackTrace();
	        } finally {
	            DBConnectionManager.closeDB(conn, pstmt, rs);
	        }

	        return generatedKey;
	    }
	}
	   