package db.dao.admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.dto.EmployeeDTO;
import db.dto.ReservationDTO;
import db.util.DBConnectionManager;

public class AdminLoginDAO {
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

   public EmployeeDTO findEmployeeById(String employee_number) { //ex) employee_number에 10이 들어왔다
      
      conn = DBConnectionManager.connectDB();

      String sql =  " select employee_number, password from employee where employee_number = ? "; //WHERE employee_number = 10

      EmployeeDTO employeeInfo = null;

      try {
         psmt = conn.prepareStatement(sql);
         //Connection 활용해서 sql 명령을 실행하는 객체
         
         psmt.setString(1, employee_number);

         rs = psmt.executeQuery(); //준비된 sql 쿼리문 실행!

         if(rs.next()) { 
            employeeInfo = new EmployeeDTO(rs.getString("employee_number"), rs.getString("password")); //한줄
         }

      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         DBConnectionManager.closeDB(conn, psmt, rs);
      }

      return employeeInfo;
   }
}