package kr.movie.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;

import kr.movie.vo.MovieVO;
import kr.util.DBUtil;

public class MovieDAO {
	// 싱글톤 패턴
    private static MovieDAO instance = new MovieDAO();
    
    public static MovieDAO getInstance() {
        return instance;
    }
    
    public List<MovieVO> getMovieList() throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		ResultSet rs = null;
		
		try {
			
			conn = DBUtil.getConnection();
			
		    conn.prepareStatement(sql);
		    
		    sql = "SELECT * FROM movie ORDER BY booking_rate DESC";
		} catch (Exception e) {
			// TODO: handle exception
			throw new Exception(e);
		} finally {
			DBUtil.executeClose(rs, pstmt, conn);
		}
    	return null;
    }
}
