package kr.movietype.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import kr.movietype.vo.MovieTypeVO;
import kr.util.DBUtil;

public class MovieTypeDAO {
	
	private MovieTypeDAO() {}
	
	private static MovieTypeDAO instance = null;
	
	public static MovieTypeDAO getInstance() {
		if(instance == null) instance = new MovieTypeDAO();
		return instance;
	}
	
	public MovieTypeVO getMovietype(Long movieId) {
		
		Connection conn = null;
		String sql= null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		MovieTypeVO result = null;
		
		try {
			conn = DBUtil.getConnection();
			sql = "SELECT * FROM MOVIE_TYPE WHERE MOVIE_ID = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setLong(1, movieId);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				do {
					result = new MovieTypeVO();
					result.setMovieId(rs.getLong("MOVIE_ID"));
					result.setImax(rs.getString("IMAX"));
					result.setScreenx(rs.getString("SCREENX"));
					result.set_4dx(rs.getString("4DX"));
					result.set_3d(rs.getString("3D"));
					result.set_2d(rs.getString("2D"));
				}while(rs.next());
			}
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		return result;
	}

	public MovieTypeVO getEveryMovieType() {
		
		Connection conn = null;
		String sql= null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		MovieTypeVO result = null;
		
		try {
			conn = DBUtil.getConnection();
			sql = "SELECT * FROM MOVIE_TYPE WHERE ROWNUM = 1";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = new MovieTypeVO();
				result.setImax(rs.getString("IMAX"));
				result.setScreenx(rs.getString("SCREENX"));
				result.set_4dx(rs.getString("4DX"));
				result.set_3d(rs.getString("3D"));
				result.set_2d(rs.getString("2D"));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
		
	}

}
