package kr.movie.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
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
		List<MovieVO> list = new ArrayList<>(); 
		
		try {
			
			conn = DBUtil.getConnection();
			
		    conn.prepareStatement(sql);
		    
		    sql = "SELECT * FROM movie ORDER BY title ASC";
		    
		    rs = pstmt.executeQuery();
		    
		    while(rs.next()) {
		    	MovieVO movie = new MovieVO();
				movie.setMovie_id(rs.getInt("MOVIE_ID"));
				movie.setMv_title(rs.getString("TITLE"));
				movie.setDirector(rs.getString("DIRECTOR"));
				movie.setActor(rs.getString("ACTOR"));
				movie.setGenre(rs.getString("GENRE"));
				movie.setRuntime(rs.getInt("RUNTIME"));
				movie.setRelease_date(rs.getDate("RELEASE_DATE"));
				movie.setRating(rs.getString("AGE_LIMIT"));
				movie.setPoster_url(rs.getString("POSTER_URL"));
				movie.setDescription(rs.getString("DESCRIPTION"));
				movie.setMovie_create(rs.getDate("MOVIE_CREATE"));
				list.add(movie);
		    }
		} catch (Exception e) {
			// TODO: handle exception
			throw new Exception(e);
		} finally {
			DBUtil.executeClose(rs, pstmt, conn);
		}
    	return list;
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
    
    //상영중인 영화 리스트
    public List<MovieVO> getShowingMovieList(){
    	
    	Connection conn = null;
    	PreparedStatement pstmt = null;
    	String sql = null;
    	ResultSet rs = null;
    	List<MovieVO> movieList = new ArrayList<>();
    	
    	try {
			conn = DBUtil.getConnection();
			sql = "SELECT * FROM MOVIE WHERE RELEASE_DATE <= SYSDATE";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				do {
					MovieVO movie = new MovieVO();
					movie.setMovie_id(rs.getInt("MOVIE_ID"));
					movie.setMv_title(rs.getString("TITLE"));
					movie.setDirector(rs.getString("DIRECTOR"));
					movie.setActor(rs.getString("ACTOR"));
					movie.setGenre(rs.getString("GENRE"));
					movie.setRuntime(rs.getInt("RUNTIME"));
					movie.setRelease_date(rs.getDate("RELEASE_DATE"));
					movie.setRating(rs.getString("AGE_LIMIT"));
					movie.setPoster_url(rs.getString("POSTER_URL"));
					movie.setDescription(rs.getString("DESCRIPTION"));
					movie.setMovie_create(rs.getDate("MOVIE_CREATE"));
					movieList.add(movie);
					
				}while(rs.next());
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.executeClose(rs, pstmt, conn);
		}
    	return movieList;
    }
    
	public List<MovieVO> getReleaseMovieList(){ // 개봉예정 영화 리스트
	    	
	    	Connection conn = null;
	    	PreparedStatement pstmt = null;
	    	String sql = null;
	    	ResultSet rs = null;
	    	List<MovieVO> movieList = new ArrayList<>();
	    	
	    	try {
				conn = DBUtil.getConnection();
				sql = "SELECT * FROM MOVIE WHERE RELEASE_DATE > SYSDATE";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					do {
						MovieVO movie = new MovieVO();
						movie.setMovie_id(rs.getInt("MOVIE_ID"));
						movie.setMv_title(rs.getString("TITLE"));
						movie.setDirector(rs.getString("DIRECTOR"));
						movie.setActor(rs.getString("ACTOR"));
						movie.setGenre(rs.getString("GENRE"));
						movie.setRuntime(rs.getInt("RUNTIME"));
						movie.setRelease_date(rs.getDate("RELEASE_DATE"));
						movie.setRating(rs.getString("AGE_LIMIT"));
						movie.setPoster_url(rs.getString("POSTER_URL"));
						movie.setDescription(rs.getString("DESCRIPTION"));
						movie.setMovie_create(rs.getDate("MOVIE_CREATE"));
						movieList.add(movie);
						
					}while(rs.next());
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				DBUtil.executeClose(rs, pstmt, conn);
			}
	    	return movieList;
	    }

	//모든 영화 리스트
public List<MovieVO> getEveryMovieList(){ // 개봉예정 영화 리스트
    	
    	Connection conn = null;
    	PreparedStatement pstmt = null;
    	String sql = null;
    	ResultSet rs = null;
    	List<MovieVO> movieList = new ArrayList<>();
    	
    	try {
			conn = DBUtil.getConnection();
			sql = "SELECT * FROM MOVIE";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				do {
					MovieVO movie = new MovieVO();
					movie.setMovie_id(rs.getInt("MOVIE_ID"));
					movie.setMv_title(rs.getString("TITLE"));
					movie.setDirector(rs.getString("DIRECTOR"));
					movie.setActor(rs.getString("ACTOR"));
					movie.setGenre(rs.getString("GENRE"));
					movie.setRuntime(rs.getInt("RUNTIME"));
					movie.setRelease_date(rs.getDate("RELEASE_DATE"));
					movie.setRating(rs.getString("AGE_LIMIT"));
					movie.setPoster_url(rs.getString("POSTER_URL"));
					movie.setDescription(rs.getString("DESCRIPTION"));
					movie.setMovie_create(rs.getDate("MOVIE_CREATE"));
					movieList.add(movie);
					
				}while(rs.next());
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.executeClose(rs, pstmt, conn);
		}
    	return movieList;
    }

	public MovieVO getMovie(int movie_id) {

		Connection conn = null;
    	PreparedStatement pstmt = null;
    	String sql = null;
    	ResultSet rs = null;
    	MovieVO result = null;
    	try {
			conn = DBUtil.getConnection();
			sql = "SELECT * FROM MOVIE WHERE MOVIE_ID = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, movie_id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				do {
					result = new MovieVO();
					result.setMovie_id(rs.getInt("MOVIE_ID"));
					result.setMv_title(rs.getString("TITLE"));
					result.setDirector(rs.getString("DIRECTOR"));
					result.setActor(rs.getString("ACTOR"));
					result.setGenre(rs.getString("GENRE"));
					result.setRuntime(rs.getInt("RUNTIME"));
					result.setRelease_date(rs.getDate("RELEASE_DATE"));
					result.setRating(rs.getString("AGE_LIMIT"));
					result.setPoster_url(rs.getString("POSTER_URL"));
					result.setDescription(rs.getString("DESCRIPTION"));
					result.setMovie_create(rs.getDate("MOVIE_CREATE"));
					
				}while(rs.next());
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.executeClose(rs, pstmt, conn);
		}
		return result;
	}

	public int updateMovie(MovieVO movieVO) {

		Connection conn = null;
    	PreparedStatement pstmt = null;
    	String sql = null;
    	int cnt = 0 ;
    	int result = 0;
    	try {
    		conn = DBUtil.getConnection();
    		sql = "UPDATE MOVIE SET "
    				+ "TITLE = ? , "
    				+ "DIRECTOR = ? ,"
    				+ " ACTOR = ? "
    				+ ", GENRE = ? , "
    				+ "RUNTIME = ? "
    				+ ", RELEASE_DATE = ? "
    				+ ", AGE_LIMIT = ? "
    				+ ", POSTER_URL = ? "
    				+ ", DESCRIPTION = ?"
    				+ " WHERE MOVIE_ID = ?";
    		
    		pstmt = conn.prepareStatement(sql);
    		pstmt.setString(++cnt, movieVO.getMv_title());
    		pstmt.setString(++cnt, movieVO.getDirector());
    		pstmt.setString(++cnt, movieVO.getActor());
    		pstmt.setString(++cnt, movieVO.getGenre());
    		pstmt.setInt(++cnt, movieVO.getRuntime());
    		pstmt.setDate(++cnt, new java.sql.Date(movieVO.getRelease_date().getTime()));
    		pstmt.setString(++cnt, movieVO.getAge_limit());
    		pstmt.setString(++cnt, movieVO.getPoster_url());
    		pstmt.setString(++cnt, movieVO.getDescription());
    		pstmt.setLong(++cnt, movieVO.getMovie_id());

    		result = pstmt.executeUpdate();
    	} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBUtil.executeClose(null, pstmt, conn);
    	}
    	return result;
		
	}
}

