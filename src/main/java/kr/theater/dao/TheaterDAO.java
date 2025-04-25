package kr.theater.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import kr.theater.vo.TheaterVO;
import kr.util.DBUtil;

public class TheaterDAO {

	private static TheaterDAO instance = new TheaterDAO();
	
	public static TheaterDAO getInstance() {
		return instance;
	}
	
	// 극장 지역 반환 
	public List<TheaterVO> getTheaterList(){
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		ResultSet rs = null;
		List<TheaterVO> list = new ArrayList<>();
		
		try {
			conn = DBUtil.getConnection();
			sql = "SELECT * FROM theater";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				do {
					TheaterVO theater = new TheaterVO();
					theater.setTheaterId(rs.getInt("THEATER_ID"));
					theater.setRegion(rs.getString("REGION"));
					theater.setName(rs.getString("NAME"));
					theater.setDescription(rs.getString("DESCRIPTION"));
			
					list.add(theater);
				}while(rs.next());
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			DBUtil.executeClose(rs, pstmt, conn);
		}
		
		
		return list;
	}
}
