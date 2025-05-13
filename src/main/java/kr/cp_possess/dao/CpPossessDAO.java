package kr.cp_possess.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import kr.coupon.vo.CouponVO;
import kr.cp_possess.vo.CpPossessVO;
import kr.util.DBUtil;

public class CpPossessDAO {
	
	private static CpPossessDAO instance;
	
	private CpPossessDAO() {}
	
	public static CpPossessDAO getInstance() {
		if(instance == null) instance = new CpPossessDAO();
		return instance;
	}
	
	public int issueCoupon(CpPossessVO vo) {
			
			Connection conn = null;
			PreparedStatement pstmt = null;
			String sql = null;
			int result = 0;
			
			try {
				conn = DBUtil.getConnection();
				sql = "INSERT INTO CP_POSSESS (CP_POSSESS_ID , COUPON_ID, MEMBER_ID) VALUES (CP_POSSESS_SEQ.NEXTVAL, ? , ? )";
				pstmt = conn.prepareStatement(sql);
				pstmt.setLong(1, vo.getCoupon_id());
				pstmt.setLong(2, vo.getMember_id());
				result = pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				DBUtil.executeClose(null, pstmt, conn);
			}
			return result;
	}
	
	
	public List<CpPossessVO> getCpPossessList(){
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		ResultSet rs = null;
		List<CpPossessVO> result = new ArrayList<>();
		
		try {
			conn = DBUtil.getConnection();
			sql = "SELECT * FROM CP_POSSESS ORDER BY COUPON_ID";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				do {
					CpPossessVO VO = new CpPossessVO();
					VO.setCp_possess_id(rs.getLong("cp_possess_id"));
					VO.setCoupon_id(rs.getLong("coupon_id"));
					VO.setMember_id(rs.getLong("member_id"));
					result.add(VO);
				}while(rs.next());
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.executeClose(rs, pstmt, conn);
		}
		return result;
	}

	public int deleteCpPossess(int cp_possess_id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		int result = 0;
		
		try {
			conn = DBUtil.getConnection();
			sql = "DELETE FROM CP_POSSESS WHERE CP_POSSESS_ID = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cp_possess_id);
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.executeClose(null, pstmt, conn);
		}
		return result;
	}

}
