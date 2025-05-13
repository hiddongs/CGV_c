package kr.auditorium.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import kr.auditorium.vo.AuditoriumVO;
import kr.util.DBUtil;

public class AuditoriumDAO {

	private AuditoriumDAO() {}
	
	private static AuditoriumDAO instance = null;
	
	public static AuditoriumDAO getInstance() {
		if(instance == null) instance = new AuditoriumDAO();
		return instance;
	}
	
	public List<AuditoriumVO> getAuditoriumList(Long theaterId) {
		
		Connection conn = null;
		String sql = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<AuditoriumVO> result = new ArrayList<>();
		
		try {
			conn = DBUtil.getConnection();
			sql = "SELECT * FROM AUDITORIUM WHERE THEATER_ID = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setLong(1, theaterId);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				do {
					AuditoriumVO vo = new AuditoriumVO();
					vo.setAuditoriumId(rs.getLong("AUDITORIUM_ID"));
		            vo.setTheaterId(rs.getLong("THEATER_ID"));
		            vo.setName(rs.getString("NAME"));
		            vo.setType(rs.getString("TYPE"));

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
	
}
