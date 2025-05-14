package kr.movie.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import kr.movie.vo.MovieTypeVO;
import kr.util.DBUtil;

//MovieTypeDAO.java
public class MovieTypeDAO {
 private static MovieTypeDAO instance = new MovieTypeDAO();
 public static MovieTypeDAO getInstance() {
     return instance;
 }

 public MovieTypeVO getMovieType(int movieID) {
     MovieTypeVO vo = null;
     String sql = "SELECT * FROM movie_type WHERE movie_id = ?";

     try (Connection conn = DBUtil.getConnection();
          PreparedStatement pstmt = conn.prepareStatement(sql)) {
         pstmt.setInt(1, movieID);
         ResultSet rs = pstmt.executeQuery();

         if (rs.next()) {
             vo = new MovieTypeVO();
             vo.setMovieID(rs.getInt("movie_id"));
             vo.setImax(rs.getString("IMAX"));
             vo.setScreenx(rs.getString("SCREENX"));
             vo.setFourDx(rs.getString("4DX"));
             vo.setThreeD(rs.getString("3D"));
             vo.setTwoD(rs.getString("2D"));
         }

     } catch (Exception e) {
         e.printStackTrace();
     }

     return vo;
 }
}
