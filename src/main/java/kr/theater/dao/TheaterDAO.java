package kr.theater.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import kr.schedule.vo.ScheduleVO;
import kr.theater.vo.TheaterVO;
import kr.util.DBUtil;

public class TheaterDAO {

	private static TheaterDAO instance = new TheaterDAO();
	
	public static TheaterDAO getInstance() {
		return instance;
	}
	
	
	// 극장 정보 반환 
	public List<TheaterVO> getTheaterList() throws Exception{
		
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
	public List<String> getAllRegionList() {
	    Connection conn = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    List<String> allRegionList = new ArrayList<>();

	    try {
	        conn = DBUtil.getConnection();
	        String sql = "SELECT DISTINCT region FROM theater"; // region 중복 없이!
	        pstmt = conn.prepareStatement(sql);
	        rs = pstmt.executeQuery();

	        while (rs.next()) {
	            allRegionList.add(rs.getString("region"));
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        DBUtil.executeClose(rs, pstmt, conn);
	    }
	    return allRegionList;
	}


	// 특정 지역만 보여주기
    public List<TheaterVO> getRegionList(int num) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		ResultSet rs = null;
		List<TheaterVO> list = new ArrayList<>();
		
		try {
			conn = DBUtil.getConnection();
			sql = "SELECT region FROM theater WHERE theater_id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setLong(1, num);
			rs = pstmt.executeQuery();
			
			
			if(rs.next()) {
				do {
					TheaterVO theater = new TheaterVO();	
					theater.setRegion(rs.getString("REGION"));
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
    
    // 지역에 따라 영화관 보여주기
    public List<TheaterVO> selectTheaterList(String region) {
    	
    	Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		ResultSet rs = null;
		List<TheaterVO> theaterList = new ArrayList<>();
		
		try {
			
			conn = DBUtil.getConnection();

			sql="SELECT theater_id, name FROM theater WHERE region = ?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, region);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				TheaterVO theater = new TheaterVO();
				theater.setTheaterId(rs.getInt("theater_id"));
				theater.setName(rs.getString("name"));
				theaterList.add(theater);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			DBUtil.executeClose(rs, pstmt, conn);
		}
    	
		return theaterList;
    	
    }
    
 // 상영 가능 시간표 가져오기
 	public List<ScheduleVO> getScheduleList(int movieID, int theaterID) {
 		
 		
 		Connection conn = null;
     	PreparedStatement pstmt = null;
     	String sql = null;
     	ResultSet rs = null;
     	List<ScheduleVO> scheduleList = new ArrayList<>();
     	
     	try {
     		conn = DBUtil.getConnection();
     		sql =  "SELECT * FROM SCHEDULE " +
                    "WHERE MOVIE_ID = ? AND THEATER_ID = ? " +
                    "AND IS_AVAILABLE = 1 " +
                    "ORDER BY SCREENING_TIME ASC";
     		pstmt = conn.prepareStatement(sql);
     		
     		pstmt.setInt(1, movieID);
     		pstmt.setInt(2, theaterID);
     		
     		rs = pstmt.executeQuery();
     		
     		while(rs.next()) {
     			ScheduleVO schedule = new ScheduleVO();
     			schedule.setScheduleID(rs.getInt("SCHEDULE_ID"));
     			schedule.setMovieID(rs.getInt("MOVIE_ID"));
     			schedule.setTheaterID(rs.getInt("THEATER_ID"));
     			schedule.setScreeningTime(rs.getString("SCREEN_TIME"));
     			
     			schedule.setMorning(rs.getInt("IS_MORNING") == 1);
     			schedule.setNight(rs.getInt("IS_NIGHT") == 1);
     			schedule.setAvailable(rs.getInt("IS_AVAILABLE") == 1);

     			
     			scheduleList.add(schedule);
     		}
     		
     	} catch (Exception e) {
 			// TODO: handle exception
     		e.printStackTrace();
 		} finally {
 			DBUtil.executeClose(rs, pstmt, conn);
 		}
     	
 		
 		return scheduleList;
 	}


	public TheaterVO getTheater(int theaterID) {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		ResultSet rs = null;
		TheaterVO theater = new TheaterVO();
		try {
			conn = DBUtil.getConnection();
			sql ="SELECT * FROM theater WHERE theater_id = ?";
			
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, theaterID);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				theater.setTheaterId(rs.getInt("theater_id"));
				theater.setName(rs.getString("name"));
				theater.setRegion(rs.getString("region"));
				theater.setDescription(rs.getString("description"));
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			DBUtil.executeClose(rs, pstmt, conn);
		}
	

		return theater;
	}
}
