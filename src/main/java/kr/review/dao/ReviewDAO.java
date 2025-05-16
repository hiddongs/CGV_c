package kr.review.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import kr.movie.vo.MovieVO;
import kr.review.vo.ReviewVO;
import kr.util.DBUtil;

public class ReviewDAO {

	// 싱글톤 패턴
	private static ReviewDAO instance = new ReviewDAO();
	
	public static ReviewDAO getInstance() {
		return instance;
	}
	
	// 특정 영화에 대한 리뷰 가져오기 
	public List<ReviewVO> getAllReviewByMovieID(int movie_id) throws Exception {

	    Connection conn = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    String sql = "SELECT * FROM review WHERE movie_id =? ORDER BY reg_date DESC";

	    List<ReviewVO> list = new ArrayList<>();

	    try {
	        conn = DBUtil.getConnection();
	        pstmt = conn.prepareStatement(sql);
	        pstmt.setInt(1, movie_id);
	        rs = pstmt.executeQuery();

	        while (rs.next()) {
	            ReviewVO vo = new ReviewVO();
	            vo.setReviewId(rs.getInt("REVIEW_ID")); 
	            vo.setMemberId(rs.getInt("MEMBER_ID"));
	            vo.setMovieId(rs.getInt("MOVIE_ID"));
	            vo.setRating(rs.getInt("RATING"));
	            vo.setContent(rs.getString("CONTENT"));
	            vo.setRegDate(rs.getDate("REG_DATE"));

	            list.add(vo); // 리스트에 추가 안 했던 부분
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        DBUtil.executeClose(rs, pstmt, conn);
	    }

	    return list;
	}
	
	// 사용자 이름에 따라 리뷰 가져오기
	public List<ReviewVO> getReviewByUserID(int member_Id) {
		Connection conn = null;
    	PreparedStatement pstmt = null;
    	String sql = null;
    	ResultSet rs = null;
    	List<ReviewVO> reviews = new ArrayList<>();
    	
    	try {
			
    		conn = DBUtil.getConnection();
			sql = "SELECT * FROM review WHERE member_id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, member_Id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				
				do {
					ReviewVO review = new ReviewVO();
					review = new ReviewVO();
					review.setReviewId(rs.getInt("REVIEW_ID"));
					review.setMemberId(rs.getInt("MEMBER_ID"));
					review.setMovieId(rs.getInt("MOVIE_ID"));
					review.setRating(rs.getInt("RATING"));
					review.setContent(rs.getString("CONTENT"));
					review.setRegDate(rs.getDate("REG_DATE"));
					
					reviews.add(review);
					
				}while(rs.next());
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			DBUtil.executeClose(rs, pstmt, conn);
		}
		return reviews;
		
	}
	
	public List<ReviewVO> getReviewListMemberName(int movieId) {
	    List<ReviewVO> list = new ArrayList<>();
	    Connection conn = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;

	    String sql = "SELECT r.*, m.name AS member_name " +
	                 "FROM review r JOIN member m ON r.member_id = m.member_id " +
	                 "WHERE r.movie_id = ? " +
	                 "ORDER BY r.reg_date DESC";

	    try {
	        conn = DBUtil.getConnection();
	        pstmt = conn.prepareStatement(sql);
	        pstmt.setInt(1, movieId);
	        rs = pstmt.executeQuery();

	        while (rs.next()) {
	            ReviewVO review = new ReviewVO();
	            review.setReviewId(rs.getInt("review_id"));
	            review.setMemberId(rs.getInt("member_id"));
	            review.setMovieId(rs.getInt("movie_id"));
	            review.setRating(rs.getInt("rating"));
	            review.setContent(rs.getString("content"));
	            review.setRegDate(rs.getDate("reg_date"));
	            review.setMemberName(rs.getString("member_name")); // 사용자 이름 추가

	            list.add(review);
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        DBUtil.executeClose(rs, pstmt, conn);
	    }

	    return list;
	}


	
	// 리뷰 작성
	public int insertReview(int memberID, int movieID, int rating, String content) {
	
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "";
		ResultSet rs = null;
		int reviewID = -1;
		
		try {
			
			conn = DBUtil.getConnection();
			sql = "INSERT INTO review (review_id, member_id, movie_id, rating, content, reg_date) "
					+ "VALUES (review_seq.NEXTVAL, ?, ?, ?, ?, SYSDATE)";

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memberID);
			pstmt.setInt(2, movieID);
			pstmt.setInt(3, rating);
			pstmt.setString(4, content);
			pstmt.executeUpdate();
			pstmt.close();

			sql = "SELECT review_seq.CURRVAL FROM dual";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				reviewID = rs.getInt(1);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			DBUtil.executeClose(rs, pstmt, conn);
		}
		return reviewID;
		
	}
	// 리뷰 수정
	public int updateReview(ReviewVO vo) {
	    Connection conn = null;
	    PreparedStatement pstmt = null;
	    String sql = "";
	    int result = 0;

	    try {
	        conn = DBUtil.getConnection();
	        sql = "UPDATE review SET rating = ?, content = ?, reg_date = ? WHERE review_id = ?";
	        
	        pstmt = conn.prepareStatement(sql);
	        pstmt.setInt(1, vo.getRating());
	        pstmt.setString(2, vo.getContent());
	        pstmt.setDate(3, new java.sql.Date(vo.getRegDate().getTime()));
	        pstmt.setInt(4, vo.getReviewId());

	        result = pstmt.executeUpdate();
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        DBUtil.executeClose(null, pstmt, conn);
	    }
	    return result;
	}

	// 리뷰 삭제
	public int deleteReview(int review_id) {
		 Connection conn = null;
		    PreparedStatement pstmt = null;
		    String sql = "";
		    int result = 0;
			
			
			try {
				conn = DBUtil.getConnection();
				sql = "DELETE FROM review WHERE review_id = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, review_id);
				result = pstmt.executeUpdate();
				
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			} finally{
				DBUtil.executeClose(null, pstmt, conn);
			}
			
			return result;
	}
	public int deleteMemberReview(int member_id) {
		 Connection conn = null;
		    PreparedStatement pstmt = null;
		    String sql = "";
		    int result = 0;
			
			
			try {
				conn = DBUtil.getConnection();
				sql = "DELETE FROM review WHERE member_id = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, member_id);
				result = pstmt.executeUpdate();
				
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			} finally{
				DBUtil.executeClose(null, pstmt, conn);
			}
			
			return result;
	}

	public ReviewVO getReviewById(int reviewId) {
		
		Connection conn = null;
    	PreparedStatement pstmt = null;
    	String sql = null;
    	ResultSet rs = null;
    	ReviewVO review = null;
    	
    	try {
			
    		conn = DBUtil.getConnection();
			sql = "SELECT * FROM review WHERE review_id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, reviewId);
			rs = pstmt.executeQuery();
			if(rs.next()) {
		
					review = new ReviewVO();
					review.setReviewId(rs.getInt("REVIEW_ID"));
					review.setMemberId(rs.getInt("MEMBER_ID"));
					review.setMovieId(rs.getInt("MOVIE_ID"));
					review.setRating(rs.getInt("RATING"));
					review.setContent(rs.getString("CONTENT"));
					review.setRegDate(rs.getDate("REG_DATE"));

			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			DBUtil.executeClose(rs, pstmt, conn);
		}
		return review;
		
	}
	
}
