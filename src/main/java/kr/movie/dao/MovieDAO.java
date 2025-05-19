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
    
    public List<MovieVO> getAvailableMovies() {
        List<MovieVO> list = new ArrayList<>();
        String sql = "SELECT * FROM movie WHERE release_date <= SYSDATE";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                MovieVO vo = new MovieVO();
                vo.setMovie_id(rs.getLong("movie_id"));
                vo.setMv_title(rs.getString("mv_title"));
                vo.setPoster_url(rs.getString("poster_url"));
                list.add(vo);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
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
		    	movie.setMovie_id(rs.getLong("MOVIE_ID"));
				movie.setMv_title(rs.getString("TITLE"));
				movie.setDirector(rs.getString("DIRECTOR"));
				movie.setActor(rs.getString("ACTOR"));
				movie.setGenre(rs.getString("GENRE"));
				movie.setRuntime(rs.getInt("RUNTIME"));
				movie.setRelease_date(rs.getDate("RELEASE_DATE"));
				movie.setAge_limit(rs.getString("AGE_LIMIT"));
//				movie.setRating(rs.getString("RATING"));
				movie.setPoster_url(rs.getString("POSTER_URL"));
				movie.setDescription(rs.getString("DESCRIPTION"));
				movie.setMovie_create(rs.getDate("MOVIE_CREATE"));
				movie.setBookingRate(rs.getDouble("booking_rate"));
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
    		sql = "INSERT INTO MOVIE (MOVIE_ID, TITLE, DIRECTOR, ACTOR, GENRE, RUNTIME, RELEASE_DATE, POSTER_URL, MOVIE_CREATE, DESCRIPTION, AGE_LIMIT) VALUES("
    				+ "MOVIE_SEQ.NEXTVAL, ?,?,?,?,?,?,?,SYSDATE,?,?)";
    		pstmt = conn.prepareStatement(sql);
    		pstmt.setString(++cnt, movieVO.getMv_title());
    		pstmt.setString(++cnt, movieVO.getDirector());
    		pstmt.setString(++cnt, movieVO.getActor());
    		pstmt.setString(++cnt, movieVO.getGenre());
    		pstmt.setInt(++cnt, movieVO.getRuntime());
    		pstmt.setDate(++cnt, new java.sql.Date(movieVO.getRelease_date().getTime()));
    		pstmt.setString(++cnt, movieVO.getPoster_url());
    		pstmt.setString(++cnt, movieVO.getDescription());
    		pstmt.setString(++cnt, movieVO.getAge_limit());

    		result = pstmt.executeUpdate();
    	} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBUtil.executeClose(null, pstmt, conn);
    	}
    	return result;
    }
    
    //상영중인 영화 리스트
/*
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
					movie.setMovie_id(rs.getLong("MOVIE_ID"));
					movie.setMv_title(rs.getString("TITLE"));
					movie.setDirector(rs.getString("DIRECTOR"));
					movie.setActor(rs.getString("ACTOR"));
					movie.setGenre(rs.getString("GENRE"));
					movie.setRuntime(rs.getInt("RUNTIME"));
					movie.setRelease_date(rs.getDate("RELEASE_DATE"));
					movie.setAge_limit(rs.getString("AGE_LIMIT"));
//					movie.setRating(rs.getString("RATING"));
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
    	*/
    public List<MovieVO> getShowingMovieList() {
        Connection conn = null;
        PreparedStatement pstmt = null;
        String sql = null;
        ResultSet rs = null;
        List<MovieVO> movieList = new ArrayList<>();

        try {
            conn = DBUtil.getConnection();
            sql = "SELECT * FROM MOVIE WHERE RELEASE_DATE <= TRUNC(SYSDATE)";
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                MovieVO movie = new MovieVO();
                movie.setMovie_id(rs.getLong("MOVIE_ID"));
                movie.setMv_title(rs.getString("TITLE"));
                movie.setDirector(rs.getString("DIRECTOR"));
                movie.setActor(rs.getString("ACTOR"));
                movie.setGenre(rs.getString("GENRE"));
                movie.setRuntime(rs.getInt("RUNTIME"));
                movie.setRelease_date(rs.getDate("RELEASE_DATE"));
                movie.setAge_limit(rs.getString("AGE_LIMIT"));
                movie.setPoster_url(rs.getString("POSTER_URL"));
                movie.setDescription(rs.getString("DESCRIPTION"));
                movie.setMovie_create(rs.getDate("MOVIE_CREATE"));
                movie.setBookingRate(rs.getDouble("booking_rate"));
                movieList.add(movie);
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
				
			
				while (rs.next()) {
						MovieVO movie = new MovieVO();
						movie.setMovie_id(rs.getLong("MOVIE_ID"));
						movie.setMv_title(rs.getString("TITLE"));
						movie.setDirector(rs.getString("DIRECTOR"));
						movie.setActor(rs.getString("ACTOR"));
						movie.setGenre(rs.getString("GENRE"));
						movie.setRuntime(rs.getInt("RUNTIME"));
						movie.setRelease_date(rs.getDate("RELEASE_DATE"));
						movie.setAge_limit(rs.getString("AGE_LIMIT"));
						movie.setBookingRate(rs.getDouble("booking_rate"));
						movie.setPoster_url(rs.getString("POSTER_URL"));
						movie.setDescription(rs.getString("DESCRIPTION"));
						movie.setMovie_create(rs.getDate("MOVIE_CREATE"));
						movieList.add(movie);
			
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
					movie.setMovie_id(rs.getLong("MOVIE_ID"));
					movie.setMv_title(rs.getString("TITLE"));
					movie.setDirector(rs.getString("DIRECTOR"));
					movie.setActor(rs.getString("ACTOR"));
					movie.setGenre(rs.getString("GENRE"));
					movie.setRuntime(rs.getInt("RUNTIME"));
					movie.setRelease_date(rs.getDate("RELEASE_DATE"));
					movie.setAge_limit(rs.getString("AGE_LIMIT"));
					movie.setBookingRate(rs.getDouble("booking_rate"));
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
					result.setMovie_id(rs.getLong("MOVIE_ID"));
					result.setMv_title(rs.getString("TITLE"));
					result.setDirector(rs.getString("DIRECTOR"));
					result.setActor(rs.getString("ACTOR"));
					result.setGenre(rs.getString("GENRE"));
					result.setRuntime(rs.getInt("RUNTIME"));
					result.setRelease_date(rs.getDate("RELEASE_DATE"));
					result.setBookingRate(rs.getDouble("booking_rate"));
					result.setPoster_url(rs.getString("POSTER_URL"));
					result.setDescription(rs.getString("DESCRIPTION"));
					result.setMovie_create(rs.getDate("MOVIE_CREATE"));
					result.setAge_limit(rs.getString("AGE_LIMIT"));
					
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

	
	// 현재 상영중인 특정 영화
	public MovieVO getShowingMovie(int movie_id) {
	    Connection conn = null;
	    PreparedStatement pstmt = null;
	    String sql = null;
	    ResultSet rs = null;
	    MovieVO movie = null;
	    try {
	        conn = DBUtil.getConnection();
	        sql = "SELECT * FROM MOVIE WHERE RELEASE_DATE <= SYSDATE AND MOVIE_ID = ?";
	        pstmt = conn.prepareStatement(sql);
	        pstmt.setInt(1, movie_id);
	        rs = pstmt.executeQuery();

	        if (rs.next()) {
	            movie = new MovieVO();
	            movie.setMovie_id(rs.getLong("MOVIE_ID"));
	            movie.setMv_title(rs.getString("TITLE"));
	            movie.setDirector(rs.getString("DIRECTOR"));
	            movie.setActor(rs.getString("ACTOR"));
	            movie.setGenre(rs.getString("GENRE"));
	            movie.setRuntime(rs.getInt("RUNTIME"));
	            movie.setRelease_date(rs.getDate("RELEASE_DATE"));
	            movie.setBookingRate(rs.getDouble("booking_rate"));
	            movie.setPoster_url(rs.getString("POSTER_URL"));
	            movie.setDescription(rs.getString("DESCRIPTION"));
	            movie.setMovie_create(rs.getDate("MOVIE_CREATE"));
	            movie.setAge_limit(rs.getString("AGE_LIMIT"));
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        DBUtil.executeClose(rs, pstmt, conn);
	    }
	    return movie;
	}


	//영화 삭제 메서드
	public int deleteMovie(int movie_id) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		int result = 0;
		
		try {
			conn = DBUtil.getConnection();
			sql = "DELETE FROM MOVIE WHERE MOVIE_ID = ?"; // ON CASCADE 설정돼있음
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, movie_id);
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBUtil.executeClose(null, pstmt, conn);
		}
		return result;
	}

	//영화 상영타입 업데이트
	public int updateMovieType(int movie_id, String movieType) {
		Connection conn = null;
    	PreparedStatement pstmt = null;
    	String sql = null;
    	int cnt = 0 ;
    	int result = 0;
    	try {
    		conn = DBUtil.getConnection();
    		sql = "UPDATE MOVIE_TYPE SET "
    				+ "\"2D\" = ? ,"
    				+ "\"3D\" = ? ,"
    				+ "\"4DX\" = ? ,"
    				+ "SCREENX = ?, "
    				+ "IMAX = ? "
    				+ "WHERE MOVIE_ID = ?";
    		pstmt = conn.prepareStatement(sql);
    		pstmt.setString(++cnt, movieType.contains("2d")?"Y" :"N");
    		pstmt.setString(++cnt, movieType.contains("3d")?"Y" :"N");
    		pstmt.setString(++cnt, movieType.contains("4dx")?"Y" :"N");
    		pstmt.setString(++cnt, movieType.contains("screenx")?"Y" :"N");
    		pstmt.setString(++cnt, movieType.contains("imax")?"Y" :"N");
    		pstmt.setInt(++cnt, movie_id);
    		result = pstmt.executeUpdate();
    		
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.executeClose(null, pstmt, conn);
		}
		
		return result;
	}


	public List<MovieVO> getShowingMovieAlignList(String align) {
		Connection conn = null;
    	PreparedStatement pstmt = null;
    	
    	String sql = null;
    	
    	ResultSet rs = null;
    	List<MovieVO> movieList = new ArrayList<>();
    	
    	try {
			conn = DBUtil.getConnection();
			
			if("2".equals(align)) {
			    sql = "SELECT * FROM MOVIE WHERE RELEASE_DATE <= SYSDATE ORDER BY title DESC";
			}
			else{
				sql = "SELECT * FROM movie WHERE RELEASE_DATE <= SYSDATE ORDER BY title ASC";
			}
			System.out.println("정렬 기준: " + align);
			System.out.println("SQL: " + sql);

			
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
	
	
			if(rs.next()) {
				do {
					MovieVO movie = new MovieVO();
					movie.setMovie_id(rs.getLong("MOVIE_ID"));
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
		            movie.setBookingRate(rs.getDouble("booking_rate"));
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


}

