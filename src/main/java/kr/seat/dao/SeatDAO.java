package kr.seat.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import kr.movie.vo.MovieVO;
import kr.seat.vo.SeatVO;
import kr.util.DBUtil;

public class SeatDAO {

    private static SeatDAO instance = new SeatDAO();
    
    private SeatDAO() {
        // 생성자는 외부에서 호출못하게 private 으로 지정해야 한다.
    }

    public static SeatDAO getInstance() {
        return instance;
    }
    
	public List<SeatVO> getAvailableSeats(int scheduleID) throws Exception{
		
	 	Connection conn = null;
    	PreparedStatement pstmt = null;
    	String sql = null;
    	ResultSet rs = null;
    	List<SeatVO> seatList = new ArrayList<>();
    	
    	
    	try {
    		conn = DBUtil.getConnection();
    		
    		sql = """
    	            SELECT s.*
    	            FROM seat s
    	            JOIN schedule sch ON s.theater_id = sch.theater_id
    	            LEFT JOIN reservation r ON s.seat_name = r.seat_number AND r.schedule_id = sch.schedule_id
    	            WHERE sch.schedule_id = ?
    	              AND r.seat_number IS NULL
    	            ORDER BY s.row, s.column
    	        """;
    		
    		pstmt = conn.prepareStatement(sql);
    		pstmt.setInt(1,scheduleID);
    		
    		rs = pstmt.executeQuery();
    		
    		 
    		 while (rs.next()) {
    	            SeatVO seat = new SeatVO();
    	            seat.setSeatID(rs.getInt("seat_id"));
    	            seat.setTheaterID(rs.getInt("theater_id"));
    	            seat.setRow(rs.getString("seat_row"));
    	            seat.setColumn(rs.getString("seat_column"));
    	            seat.setSeatName(rs.getString("seat_name"));
    	            seatList.add(seat);
    	        }
		} catch (Exception e) {
			// TODO: handle exception
			throw new Exception(e);
		} finally {
			DBUtil.executeClose(rs, pstmt, conn);
		}
		return seatList;
		
	}
}
