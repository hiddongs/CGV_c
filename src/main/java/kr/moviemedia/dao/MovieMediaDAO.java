package kr.moviemedia.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import kr.moviemedia.vo.MovieMediaVO;
import kr.util.DBUtil;

public class MovieMediaDAO {
	
	private MovieMediaDAO() {}
	
	private static MovieMediaDAO instance = null;
	
	public static MovieMediaDAO getInstance() {
		if(instance == null) instance = new MovieMediaDAO();
		return instance;
	}
	
	public List<MovieMediaVO> getTargetMovieMediaList(int movie_id) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql =  null;
		ResultSet rs = null;
		List<MovieMediaVO> result = null;
		
		try {
			conn = DBUtil.getConnection();
			sql = "SELECT * FROM MOVIE_MEDIA WHERE MOVIE_ID = ? ORDER BY MOVIE_ID";
			pstmt = conn.prepareStatement(sql);
			pstmt.setLong(1, movie_id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = new ArrayList<>();
				do {
					MovieMediaVO vo = new MovieMediaVO();
					vo.setMedia_id((int) rs.getLong("MEDIA_ID"));
					vo.setMovie_id((int) rs.getLong("MOVIE_ID"));
					vo.setMedia_type(rs.getString("MEDIA_TYPE"));
					vo.setMedia_url(rs.getString("MEDIA_URL"));
					vo.setMedia_status(rs.getString("MEDIA_STATUS"));
					result.add(vo);
				}while(rs.next());
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.executeClose(rs, pstmt, conn);
		}
		return result;
	}

	public int insertMedia(MovieMediaVO vo) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql =  null;
		int cnt = 0;
		int result = 0;
		try {
			
			conn = DBUtil.getConnection();
			sql = "INSERT INTO MOVIE_MEDIA (MEDIA_ID, MOVIE_ID, MEDIA_TYPE, MEDIA_URL, MEDIA_STATUS) "
					+ "VALUES (MOVIE_MEDIA_SEQ.NEXTVAL, ? , ? , ? , ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setLong(++cnt, vo.getMovie_id());
			pstmt.setString(++cnt, vo.getMedia_type());
			pstmt.setString(++cnt, vo.getMedia_url());
			pstmt.setString(++cnt, vo.getMedia_status());
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.executeClose(null, pstmt, conn);
		}
		return result;
	}

}
