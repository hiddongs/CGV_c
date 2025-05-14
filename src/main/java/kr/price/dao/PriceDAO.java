package kr.price.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import kr.price.vo.PriceVO;
import kr.util.DBUtil;

public class PriceDAO {

	private static PriceDAO instance = null;
	
	private PriceDAO() {}
	
	public static PriceDAO getInstance() {
		if(instance == null) instance = new PriceDAO();
		return instance;
	}
	
	/**
	 * 가격 정보 업데이트 메서드
	 * @param price 업데이트할 가격 정보
	 * @return 업데이트 성공 여부
	 */
	public boolean updatePrice(PriceVO price) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			conn = DBUtil.getConnection();
			sql = "UPDATE PRICE SET P_MOVIE=?, WEEKEND=?, KIDS=?, AFTERNOON=?, MIDNIGHT=?, P_IMAX=?, P_SCREENX=?, P_4DX=?, P_3D=? WHERE PRICE_ID = 1";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, price.getPrice());
			pstmt.setInt(2, price.getWeekend());
			pstmt.setInt(3, price.getKids());
			pstmt.setInt(4, price.getAfternoon());
			pstmt.setInt(5, price.getMidnight());
			pstmt.setInt(6, price.getImax());
			pstmt.setInt(7, price.getScreenX());
			pstmt.setInt(8, price.getP_4DX());
			pstmt.setInt(9, price.getP_3D());
			
			return pstmt.executeUpdate() > 0;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		} finally {
			DBUtil.executeClose(null, pstmt, conn);
		}
	}
	
	public PriceVO getPrice() {
		
		Connection conn = null;
		String sql = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		PriceVO result = null;
		
		try {
			conn = DBUtil.getConnection();
			sql = "SELECT * FROM PRICE";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = new PriceVO();
				result.setPrice(rs.getInt("P_MOVIE"));          // 기본 가격 (2D)
				result.setWeekend(rs.getInt("WEEKEND"));      // 주말 가중치 가격
				result.setKids(rs.getInt("KIDS"));            // 어린이 가격 가중치
				result.setAfternoon(rs.getInt("AFTERNOON"));  // 오후 가격 가중치
				result.setMidnight(rs.getInt("MIDNIGHT"));    // 자정 가격 가중치
				result.setImax(rs.getInt("P_IMAX"));          // IMAX 가격 가중치
				result.setScreenX(rs.getInt("P_SCREENX"));    // ScreenX 가격 가중치
				result.setP_4DX(rs.getInt("P_4DX"));           // 4DX 가격 가중치
				result.setP_3D(rs.getInt("P_3D"));             // 3D 가격 가중치
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public PriceVO getPricePolicy() {
	    return getPrice();
	}

	
}
