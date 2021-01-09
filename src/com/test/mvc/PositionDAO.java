/*============================================
  #12. PositionDAO.java      
  → 데이터베이스 액션처리 클래스
    지역 데이터 입출력 및 수정 삭제
    Connection 객체에 대한 의존성 주입 준비.
    (인터페이스 자료형 / setter 구성)
==============================================*/
package com.test.mvc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;

public class PositionDAO implements IPositionDAO
{
   private DataSource dataSource;

   public void setDataSource(DataSource dataSource)
   {
      this.dataSource = dataSource;
   }

   @Override
   public ArrayList<Position> list() throws SQLException
   {
      ArrayList<Position> result = new ArrayList<Position>();
      Connection conn = dataSource.getConnection();
      String sql = "SELECT POSITIONID, POSITIONNAME, MINBASICPAY, DELCHECK"
            + " FROM POSITIONVIEW"
            + " ORDER BY POSITIONID";
      PreparedStatement pstmt = conn.prepareStatement(sql);
      ResultSet rs = pstmt.executeQuery();
      while(rs.next())
      {
         Position position = new Position();
         position.setPositionId(rs.getString("POSITIONID"));
         position.setPositionName(rs.getString("POSITIONNAME"));
         position.setMinBasicPay(rs.getInt("MINBASICPAY"));
         position.setDelCheck(rs.getInt("DELCHECK"));
         
         result.add(position);	
      }
      rs.close();
      pstmt.close();
      conn.close();
      
      return result;
   }

   @Override
   public int add(Position position) throws SQLException
   {
      int result = 0;
      Connection conn = dataSource.getConnection();
      String sql = "INSERT INTO POSITION(POSITIONID,POSITIONNAME,MINBASICPAY)"
            + " VALUES(POSITIONSEQ.NEXTVAL,?,?)";
      PreparedStatement pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, position.getPositionName());
      pstmt.setInt(2, position.getMinBasicPay());
      result = pstmt.executeUpdate();
      
      pstmt.close();
      conn.close();
      return result;
   }

   @Override
   public int remove(String postionId) throws SQLException
   {
      int result=0;
      Connection conn = dataSource.getConnection();
      String sql = "DELETE"
            + " FROM POSITION"
            + " WHERE POSITIONID=?";
      PreparedStatement pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, Integer.parseInt(postionId));
      result = pstmt.executeUpdate();
      
      pstmt.close();
      conn.close();
      return result;
   }

   @Override
   public int modify(Position position) throws SQLException
   {
      int result = 0;
      Connection conn = dataSource.getConnection();
      String sql = "UPDATE POSITION"
            + " SET POSITIONNAME=?,"
            + " MINBASICPAY=?"
            + " WHERE POSITIONID=?";
      PreparedStatement pstmt = conn.prepareStatement(sql);
      pstmt.setString(1,position.getPositionName());
      pstmt.setInt(2, position.getMinBasicPay());
      pstmt.setInt(3, Integer.parseInt(position.getPositionId()));
      result = pstmt.executeUpdate();
      
      pstmt.close();
      conn.close();
      return result;
   }
   
   
   
}