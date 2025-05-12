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
			pstmt.setString(++cnt, couponVO.getCoupon_name());
			pstmt.setInt(++cnt, couponVO.getDiscount_amount());
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
					couponVO.setCoupon_name(rs.getString("coupon_name"));
					couponVO.setDiscount_amount(rs.getInt("discount_amount"));
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
			sql = "SELECT c.coupon_id, c.coupon_name, c.discount_amount, c.expired_date FROM CP_POSSESS cp "
					+ "JOIN COUPON c ON cp.coupon_id = c.coupon_id WHERE cp.member_id = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,member_id);
			rs = pstmt.executeQuery();
			
			// 반복
			while(rs.next()) {
				CouponVO coupon = new CouponVO();
				coupon.setCouponID(rs.getLong("coupon_id"));
				coupon.setCoupon_name(rs.getString("coupon_name"));
				coupon.setDiscount_amount(rs.getInt("discount_amount"));
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
	

	public int issueCoupon(Long couponId, int memberId) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		int result = 0;
		
		try {
			conn = DBUtil.getConnection();
			sql = "INSERT INTO CP_POSSESS (CP_POSSESS_ID , COUPON_ID, MEMBER_ID) VALUES (CP_POSSESS_SEQ.NEXTVAL, ? , ? )";
			pstmt = conn.prepareStatement(sql);
			pstmt.setLong(1, couponId);
			pstmt.setLong(2, memberId);
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.executeClose(null, pstmt, conn);
		}
		return result;
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
		
		return result;
	}
	
	
	
	
}
