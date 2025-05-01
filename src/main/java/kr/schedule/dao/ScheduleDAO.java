package kr.schedule.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import kr.schedule.vo.ScheduleVO;
import kr.seat.vo.SeatVO;
import kr.util.DBUtil;

public class ScheduleDAO {

    private static ScheduleDAO instance = new ScheduleDAO();
	
	public static ScheduleDAO getInstance() {
		return instance;
	}
	

	public List<ScheduleVO> getScheduleList(int movieID, int theaterID) {
	    Connection conn = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    List<ScheduleVO> list = new ArrayList<>();

	    try {
	        conn = DBUtil.getConnection();
	        String sql = "SELECT * FROM SCHEDULE " +
	                     "WHERE MOVIE_ID = ? AND THEATER_ID = ? " +
	                     "AND IS_AVAILABLE = 1 " +
	                     "ORDER BY SCREENING_TIME ASC";

	        pstmt = conn.prepareStatement(sql);
	        pstmt.setInt(1, movieID);
	        pstmt.setInt(2, theaterID);

	        rs = pstmt.executeQuery();

	        while (rs.next()) {
	            ScheduleVO vo = new ScheduleVO();
	            vo.setScheduleID(rs.getInt("SCHEDULE_ID"));
	            vo.setMovieID(rs.getInt("MOVIE_ID"));
	            vo.setTheaterID(rs.getInt("THEATER_ID"));
	            vo.setScreeningTime(rs.getString("SCREENING_TIME")); // 문자열로 바꾼 경우
	            list.add(vo);
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        DBUtil.executeClose(rs, pstmt, conn);
	    }

	    return list;
	}

	
}
