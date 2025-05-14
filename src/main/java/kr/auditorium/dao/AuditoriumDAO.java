package kr.Auditorium.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import kr.Auditorium.vo.AuditoriumVO;
import kr.util.DBUtil;

public class AuditoriumDAO {

	 private static AuditoriumDAO instance = new AuditoriumDAO();
	    public static AuditoriumDAO getInstance() {
	        return instance;
	   }
	    
	    public AuditoriumVO getAuditorium(int auditoriumID) throws Exception {
	        AuditoriumVO vo = null;
	        Connection conn = null;
	        PreparedStatement pstmt = null;
	        ResultSet rs = null;
	        
	        String sql = "SELECT * FROM auditorium WHERE auditorium_id = ?"; // SQL 먼저 정의

	        try {
	            conn = DBUtil.getConnection();
	            pstmt = conn.prepareStatement(sql); // 여기에서 SQL이 null이면 안 됨
	            pstmt.setInt(1, auditoriumID);
	            rs = pstmt.executeQuery();

	            if (rs.next()) {
	                vo = new AuditoriumVO();
	                vo.setAuditoriumID(rs.getInt("auditorium_id"));
	                vo.setTheaterID(rs.getInt("theater_id"));
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
	                vo.setAuditoriumID(rs.getInt("auditorium_id"));
	                vo.setTheaterID(rs.getInt("theater_id"));
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
