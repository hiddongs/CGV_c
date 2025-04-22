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
    
    //영화등록
    public int insertMovie(MovieVO movieVO) {
    	Connection conn = null;
    	PreparedStatement pstmt = null;
    	String sql = null;
    	int cnt = 0 ;
    	int result = 0;
    	try {
    		conn = DBUtil.getConnection();
    		sql = "INSERT INTO MOVIE (MOVIE_ID, TITLE, DIRECTOR, ACTOR, GENRE, RUNTIME, RELEASE_DATE, POSTER_URL, MOVIE_CREATE, DESCRIPTION) VALUES("
    				+ "MOVIE_SEQ.NEXTVAL, ?,?,?,?,?,?,?,SYSDATE,?)";
    		pstmt = conn.prepareStatement(sql);
    		pstmt.setString(++cnt, movieVO.getMv_title());
    		pstmt.setString(++cnt, movieVO.getDirector());
    		pstmt.setString(++cnt, movieVO.getActor());
    		pstmt.setString(++cnt, movieVO.getGenre());
    		pstmt.setInt(++cnt, movieVO.getRuntime());
    		pstmt.setDate(++cnt, new java.sql.Date(movieVO.getRelease_date().getTime()));
    		pstmt.setString(++cnt, movieVO.getPoster_url());
    		pstmt.setString(++cnt, movieVO.getDescription());

    		result = pstmt.executeUpdate();
    	} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBUtil.executeClose(null, pstmt, conn);
    	}
    	return result;
    }
}
