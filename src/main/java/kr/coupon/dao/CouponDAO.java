package kr.coupon.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import kr.coupon.vo.CouponVO;
import kr.util.DBUtil;

public class CouponDAO {
	
	private static CouponDAO instance;
	
	private CouponDAO() {}
	
	public static CouponDAO getInstance(){
		if(instance == null) {
			instance = new CouponDAO();
		}
		return instance;
	} 	

	// 쿠폰 입력
	public int insertCoupon(CouponVO couponVO) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		int cnt = 0;
		int result = 0;
		try {
		
			conn = DBUtil.getConnection();
			sql = "INSERT INTO COUPON (COUPON_ID, COUPON_NAME, DISCOUNT_AMOUNT, EXPIRED_DATE) VALUES("
					+ "COUPON_SEQ.NEXTVAL, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(++cnt, couponVO.getCouponName());
			pstmt.setInt(++cnt, couponVO.getDiscountAmount());
			pstmt.setDate(++cnt, (Date) couponVO.getExpired_date());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.executeClose(null, pstmt, conn);
		}
		return result;
	}

	
	// 쿠폰 리스트
	public List<CouponVO> getCouponList(){
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		ResultSet rs = null;
		List<CouponVO> result = new ArrayList<>();
		try {
			conn = DBUtil.getConnection();
			sql = "SELECT * FROM COUPON";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				do {
					CouponVO couponVO = new CouponVO();
					couponVO.setCouponID(rs.getLong("coupon_id"));
					couponVO.setCouponName(rs.getString("coupon_name"));
					couponVO.setDiscountAmount(rs.getInt("discount_amount"));
					couponVO.setExpired_date(rs.getDate("expired_date"));
					result.add(couponVO);
				}while(rs.next());
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBUtil.executeClose(rs, pstmt, conn);
		}
		return result;
	}
	
	// 멤버 id에 따른 쿠폰 리스트
	public List<CouponVO> getListCouponByUser(int member_id ) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<CouponVO> list = new ArrayList<>();
		String sql = null;
		
		try {
			conn = DBUtil.getConnection();
			// sql
			sql = "SELECT cp.cp_possess_id, c.coupon_id, c.coupon_name, c.discount_amount, c.expired_date "
				    + "FROM cp_possess cp JOIN COUPON c ON cp.coupon_id = c.coupon_id "
				    + "WHERE cp.member_id = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,member_id);
			rs = pstmt.executeQuery();
			
			// 반복
			while(rs.next()) {
				CouponVO coupon = new CouponVO();
				coupon.setCpPossessId(rs.getInt("cp_possess_id")); // ← 이 컬럼을 SELECT에서 가져와야 함
				coupon.setCouponID(rs.getLong("coupon_id"));
				coupon.setCouponName(rs.getString("coupon_name"));
				coupon.setDiscountAmount(rs.getInt("discount_amount"));
				coupon.setExpired_date(rs.getDate("expired_date"));

				list.add(coupon);
				
			}
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBUtil.executeClose(rs, pstmt, conn);
		}
		
		return list;
		
		
		
	}	
	public int deleteCoupon(int couponId) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		int result = 0;
		
		try {
			conn = DBUtil.getConnection();
			sql = "DELETE COUPON WHERE COUPON_ID = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setLong(1, couponId);
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			DBUtil.executeClose(null, pstmt, conn);
		}
		
		return result;
	}
	public int getDiscountAmountByPossessIdAndMemberId(int cpPossessId, int memberId) throws Exception {
	    Connection conn = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    int discount = 0;

	    try {
	        conn = DBUtil.getConnection();
	        String sql = """
	            SELECT c.discount_amount
	            FROM cp_possess cp
	            JOIN coupon c ON cp.coupon_id = c.coupon_id
	            WHERE cp.cp_possess_id = ? AND cp.member_id = ?
	        """;
	        pstmt = conn.prepareStatement(sql);
	        pstmt.setInt(1, cpPossessId);
	        pstmt.setInt(2, memberId);
	        rs = pstmt.executeQuery();

	        if (rs.next()) {
	            discount = rs.getInt("discount_amount");
	        } else {
	            throw new IllegalArgumentException("[ERROR] 해당 쿠폰은 이 회원의 것이 아닙니다.");
	        }
	    }catch(Exception e)
	    {
	    	e.printStackTrace();
	    }finally {
	        DBUtil.executeClose(rs, pstmt, conn);
	    }

	    return discount;
	}
	
	public void usedCouponByPossessId(int cpPossessId) throws Exception {
	    Connection conn = null;
	    PreparedStatement pstmt = null;

	    try {
	        conn = DBUtil.getConnection();
	        String sql = "DELETE FROM cp_possess WHERE cp_possess_id = ?";
	        pstmt = conn.prepareStatement(sql);
	        pstmt.setInt(1, cpPossessId);
	        pstmt.executeUpdate();
	    } catch(Exception e)
	    {
	    	e.printStackTrace();
	    }
	    finally {
	    
	        DBUtil.executeClose(null, pstmt, conn);
	    }
	}
	public String getCouponNameByPossessId(int cpPossessId) throws Exception {
	    String couponName = null;

	    try (
	        Connection conn = DBUtil.getConnection();
	        PreparedStatement pstmt = conn.prepareStatement(
	            "SELECT c.coupon_name " +
	            "FROM cp_possess p JOIN coupon c ON p.coupon_id = c.coupon_id " +
	            "WHERE p.cp_possess_id = ?")
	    ) {
	        pstmt.setInt(1, cpPossessId);
	        try (ResultSet rs = pstmt.executeQuery()) {
	            if (rs.next()) {
	                couponName = rs.getString("coupon_name");
	            }
	        }
	    }

	    return couponName;
	}


	public void useCouponByPossessId(int cpPossessId) {
	    try {
	        usedCouponByPossessId(cpPossessId);
	    } catch (Exception e) {
	        e.printStackTrace();
	        throw new RuntimeException("[ERROR] 쿠폰 사용 처리 중 오류 발생");
	    }
	}

	
	
	
}
