package kr.reservation.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

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
/**
	public void reservationMV(ReservationVO reservation) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		int cnt = 0;
		
		try {
			conn = DBUtil.getConnection();
			sql = "INSERT INTO reservation(reservation_id,mem_id,schedule_id,"
					+ "seat_number,payment_status, payment_date) VALUES ("
					+ "reservation.seq.nextval,?,?,?,?,?)";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setLong(++cnt, reservation.getReservationID());
			pstmt.setInt(++cnt, reservation.getMemberID());
			pstmt.setInt(++cnt, reservation.getScheduleID());
			pstmt.setInt(++cnt,reservation.getSeatID());
			pstmt.setString(++cnt,reservation.getPaymentDate());
			pstmt.setDate(++cnt, reservation.getPaymentDate());
			
			pstmt.executeUpdate();
			
			
		} catch (Exception e) {
			// TODO: handle exception
			
			throw new Exception(e);
		} finally {
			DBUtil.executeClose(null, pstmt, conn);
		}

	}
**/
	
	  // 나의 예매내역 가져오기
    // ReservationVO -> member_id
    public List<ReservationVO> getListReservationByUser(int member_id) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<ReservationVO> list = new ArrayList<>();
		String sql = null;
		
		try {
			// 커넥션 풀로부터 커넥션 할당
			conn = DBUtil.getConnection();
			// sql
			sql = "SELECT * FROM reservation WHERE member_id=?";
			// 데이터 할당
			pstmt = conn.prepareStatement(sql);
			//데이터 바인딩
			pstmt.setInt(1, member_id);
			// SQL문 실행
			rs = pstmt.executeQuery();
			// 반복
			while(rs.next()) {
				ReservationVO vo = new ReservationVO();
				vo.setMvTitle(rs.getString("mv_title")); // 영화제목
				vo.setName(rs.getString("name")); // 극장이름
				vo.setScreeningDate(rs.getDate("screening_date")); //관람일시
				vo.setViewers(rs.getInt("viewers")); // 관람인원
				vo.setPMovie(rs.getInt("p_movie")); //영화가격
				
				list.add(vo); //리스트에 추가
			}
		}catch(Exception e) {
			throw new Exception(e);
		}finally {
			DBUtil.executeClose(rs, pstmt, conn);
		}

    	return list;
    	
    }

/*
	// 예매 내역 조회
	public ReservationVO getListReservationByUser(ReservationVO reservation) throws Exception{
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
	*/
    
    
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
	// 특정 스케줄에서 이미 예약된 좌석 이름 리스트 반환
	public List<String> getReservedSeatNames(int scheduleID) throws Exception {
	    List<String> reservedSeats = new ArrayList<>();
	    String sql = """
	        SELECT st.seat_name
	        FROM reservation r
	        JOIN seat st ON r.seat_id = st.seat_id
	        WHERE r.schedule_id = ?
	    """;

	    try (Connection conn = DBUtil.getConnection();
	         PreparedStatement pstmt = conn.prepareStatement(sql)) {

	        pstmt.setInt(1, scheduleID);
	        ResultSet rs = pstmt.executeQuery();

	        while (rs.next()) {
	            reservedSeats.add(rs.getString("seat_name"));
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return reservedSeats;
	}


    
    
    
}

