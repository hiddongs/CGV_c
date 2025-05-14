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
	    public AuditoriumVO getAuditorium(Long auditoriumId) throws Exception {
	        AuditoriumVO vo = null;
	        Connection conn = null;
	        PreparedStatement pstmt = null;
	        ResultSet rs = null;
	        
	        String sql = "SELECT * FROM auditorium WHERE auditorium_id = ?"; // SQL 먼저 정의

	        try {
	            conn = DBUtil.getConnection();
	            pstmt = conn.prepareStatement(sql); // 여기에서 SQL이 null이면 안 됨
	            pstmt.setLong(1, auditoriumId);
	            rs = pstmt.executeQuery();

	            if (rs.next()) {
	                vo = new AuditoriumVO();
	                vo.setAuditoriumId(rs.getLong("auditorium_id"));
	                vo.setTheaterId(rs.getLong("theater_id"));
	                vo.setName(rs.getString("name"));
	                vo.setType(rs.getString("type"));
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        } finally {
	            DBUtil.executeClose(rs, pstmt, conn);
	        }

	        return vo;
	    }

	 
	  // 특정 극장의 전체 상영관 목록
	    public List<AuditoriumVO> getAuditoriumsByTheater(int theaterID) {
	        List<AuditoriumVO> list = new ArrayList<>();
	        String sql = "SELECT * FROM auditorium WHERE theater_id = ?";

	        try (Connection conn = DBUtil.getConnection();
	             PreparedStatement pstmt = conn.prepareStatement(sql)) {

	            pstmt.setInt(1, theaterID);
	            ResultSet rs = pstmt.executeQuery();

	            while (rs.next()) {
	                AuditoriumVO vo = new AuditoriumVO();
	                vo.setAuditoriumId(rs.getLong("auditorium_id"));
	                vo.setTheaterId(rs.getLong("theater_id"));

	                vo.setName(rs.getString("name"));
	                vo.setType(rs.getString("type"));
	                list.add(vo);
	            }

	        } catch (Exception e) {
	            e.printStackTrace();
	        }

	        return list;
	    }
}
