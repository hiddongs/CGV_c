package kr.reservation.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import kr.reservation.vo.ReservationVO;
import kr.util.DBUtil;

public class ReservationDAO {
	private static ReservationDAO instance = new ReservationDAO();
	
	public static ReservationDAO getInstance() {
		return instance;
	}
	
	// 예매 등록
	public void insertReservation(ReservationVO vo) throws Exception {
	    Connection conn = null;
	    PreparedStatement pstmt = null;
	    
	    try {
	    	String sql ="""
	    			INSERT INTO reservation (
	    			reservation_id, member_id, schedule_id, seat_id,
	    			payment_status, payment_date, viewers, screening_date,
	    			p_movie, name, mv_title, movie_type, theater_id
	    			) VALUES (
	    			reservation_seq.NEXTVAL, ?, ?, ?, 'N', SYSDATE, ?,
	    			(SELECT screening_date FROM schedule WHERE schedule_id = ?),
	    			(SELECT movie_id FROM schedule WHERE schedule_id = ?),
	    			(SELECT name FROM member WHERE member_id = ?),
	    			(SELECT title FROM movie WHERE movie_id = (SELECT movie_id FROM schedule WHERE schedule_id = ?)),
	    			(SELECT type FROM auditorium WHERE auditorium_id = (SELECT auditorium_id FROM schedule WHERE schedule_id = ?)),
	    			(SELECT theater_id FROM schedule WHERE schedule_id = ?)
	    			)
	    			""";

	   
	        conn = DBUtil.getConnection();
	        pstmt = conn.prepareStatement(sql);
	        int i = 1;

	        pstmt.setInt(i++, vo.getMemberID());
	        pstmt.setInt(i++, vo.getScheduleID());
	        pstmt.setInt(i++, vo.getSeatID());
	        pstmt.setInt(i++, vo.getViewers());
	        pstmt.setInt(i++, vo.getScheduleID()); // for screening_date
	        pstmt.setInt(i++, vo.getScheduleID()); // for p_movie
	        pstmt.setInt(i++, vo.getMemberID());       // for name
	        pstmt.setInt(i++, vo.getScheduleID()); // for mv_title
	        pstmt.setInt(i++, vo.getScheduleID()); // for movie_type
            pstmt.setInt(i++, vo.getScheduleID());
	        
	        pstmt.executeUpdate();
	    } catch(Exception e){
	        e.printStackTrace();
	    }finally {
	    	
	    
	        DBUtil.executeClose(null, pstmt, conn);
	    }
	}

	// 예매 내역 조회
	public ReservationVO getReservation(ReservationVO reservation) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ReservationVO reservationList = null;
		String sql = "";
		int cnt = 0;
		
		try {
			
			conn = DBUtil.getConnection();
			
			sql = "SELECT * FROM reservation WHERE reservation_id =? AND member_id=?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setLong(++cnt, reservation.getReservationID());
			pstmt.setLong(++cnt, reservation.getMemberID());
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				reservationList = new ReservationVO();
				
			}
			
		} catch (Exception e) {
			// TODO: handle exception
		    e.printStackTrace();
		} finally {
			DBUtil.executeClose(rs, pstmt, conn);
		} 
		
		return reservationList;
		
	}
	// 예매 상세 조회
	public ReservationVO getReservationDetail(int reservationID) {
	    Connection conn = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    ReservationVO reservation = null;

	    String sql = """
	        SELECT
	          r.reservation_id,
	          m.name AS member_name,
	          mv.title AS mv_title,
	          a.name AS auditorium_name,
	          s.screening_date,
	          st.seat_name AS seat_name
	        FROM reservation r
	        JOIN member m ON r.member_id = m.member_id
	        JOIN schedule s ON r.schedule_id = s.schedule_id
	        JOIN movie mv ON s.movie_id = mv.movie_id
	        JOIN seat st ON r.seat_id = st.seat_id
	        JOIN auditorium a ON s.auditorium_id = a.auditorium_id
	        WHERE r.reservation_id = ?
	    """;

	    try {
	        conn = DBUtil.getConnection();
	        pstmt = conn.prepareStatement(sql);
	        pstmt.setInt(1, reservationID);
	        rs = pstmt.executeQuery();

	        if (rs.next()) {
	            reservation = new ReservationVO();
	            reservation.setReservationID(rs.getInt("reservation_id"));
	            reservation.setMem_Name(rs.getString("member_name"));
	            reservation.setMovieType(rs.getString("mv_title"));
	            reservation.setAuditoriumName(rs.getString("auditorium_name"));
	            reservation.setScreeningDate(rs.getDate("screening_date"));
	            reservation.setSeatName(rs.getString("seat_name"));
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        DBUtil.executeClose(rs, pstmt, conn);
	    }

	    return reservation;
	}

	// 예매 상세 조회
	// 해당 상영 시간의 좌석 확인 (중복 방지용)
	// 예매 가능 여부 확인 (좌석 중복 체크)

	public int getSeatIDByName(int scheduleID, String seatName) throws Exception {
	    int seatID = -1;
	    String sql = """
	            SELECT s.seat_id
	            FROM seat s
	            JOIN schedule sch ON s.theater_id = sch.theater_id
	            WHERE sch.schedule_id = ?
	              AND s.seat_name = ?
	            """;

	    try (Connection conn = DBUtil.getConnection();
	         PreparedStatement pstmt = conn.prepareStatement(sql)) {

	        pstmt.setInt(1, scheduleID);
	        pstmt.setString(2, seatName);
	        ResultSet rs = pstmt.executeQuery();

	        if (rs.next()) {
	            seatID = rs.getInt("seat_id");
	        }
	    }

	    return seatID;
	}

	public int getReservationID(int memberID) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "";
		int reservationID = 0;
		
		try {
			
			conn = DBUtil.getConnection();
			
			sql = "SELECT reservation_id FROM reservation WHERE member_id=?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setLong(1,memberID);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				reservationID = rs.getInt("reservation_id");
				
			}
			
		} catch (Exception e) {
			// TODO: handle exception
		    e.printStackTrace();
		} finally {
			DBUtil.executeClose(rs, pstmt, conn);
		} 
		
		return reservationID;
	}

}
