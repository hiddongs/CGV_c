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

	// public void insertReservation(ReservationVO vo) throws Exception {
	public int insertReservation(ReservationVO reservation) throws Exception {

		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		int result = 0;

		try {

			conn = DBUtil.getConnection();
			sql = """
					    INSERT INTO reservation (
					        reservation_id, member_id, schedule_id, seat_id,
					        payment_status, payment_date, viewers, screening_date,
					        p_movie, name, mv_title, movie_type, theater_id, price_id
					    ) VALUES (
					        reservation_seq.NEXTVAL, ?, ?, ?, 'N', SYSDATE, ?,
					        (SELECT screening_date FROM schedule WHERE schedule_id = ?),
					        (SELECT movie_id FROM schedule WHERE schedule_id = ?),
					        (SELECT name FROM member WHERE member_id = ?),
					        (SELECT title FROM movie WHERE movie_id = (SELECT movie_id FROM schedule WHERE schedule_id = ?)),
					        (SELECT type FROM auditorium WHERE auditorium_id = (SELECT auditorium_id FROM schedule WHERE schedule_id = ?)),
					        (SELECT theater_id FROM schedule WHERE schedule_id = ?),
					        1 -- PRICE_ID는 현재 시스템에서 고정값
					    )
					""";

			pstmt = conn.prepareStatement(sql);
			int idx = 0;
			pstmt.setInt(++idx, reservation.getMemberID());
			pstmt.setInt(++idx, reservation.getScheduleID());
			pstmt.setInt(++idx, reservation.getSeatID());
			pstmt.setInt(++idx, reservation.getViewers());
			pstmt.setInt(++idx, reservation.getScheduleID());
			pstmt.setInt(++idx, reservation.getScheduleID());
			pstmt.setInt(++idx, reservation.getMemberID());
			pstmt.setInt(++idx, reservation.getScheduleID());
			pstmt.setInt(++idx, reservation.getScheduleID());
			pstmt.setInt(++idx, reservation.getScheduleID());

			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception("[ERROR] 예약 등록 중 오류 발생");
		} finally {
			DBUtil.executeClose(null, pstmt, conn);
		}

		return result;
	}

	/**
	 * public void reservationMV(ReservationVO reservation) throws Exception{
	 * Connection conn = null; PreparedStatement pstmt = null; String sql = null;
	 * int cnt = 0;
	 * 
	 * try { conn = DBUtil.getConnection(); sql = "INSERT INTO
	 * reservation(reservation_id,mem_id,schedule_id," +
	 * "seat_number,payment_status, payment_date) VALUES (" +
	 * "reservation.seq.nextval,?,?,?,?,?)";
	 * 
	 * pstmt = conn.prepareStatement(sql);
	 * 
	 * pstmt.setLong(++cnt, reservation.getReservationID()); pstmt.setInt(++cnt,
	 * reservation.getMemberID()); pstmt.setInt(++cnt, reservation.getScheduleID());
	 * pstmt.setInt(++cnt,reservation.getSeatID());
	 * pstmt.setString(++cnt,reservation.getPaymentDate()); pstmt.setDate(++cnt,
	 * reservation.getPaymentDate());
	 * 
	 * pstmt.executeUpdate();
	 * 
	 * 
	 * } catch (Exception e) { // TODO: handle exception
	 * 
	 * throw new Exception(e); } finally { DBUtil.executeClose(null, pstmt, conn); }
	 * 
	 * }
	 **/

	// 나의 예매내역 가져오기
	// ReservationVO -> member_id
	public List<ReservationVO> getListReservationByUser(int member_id) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<ReservationVO> list = new ArrayList<>();
		String sql = null;

		try {
			// 커넥션 풀로부터 커넥션 할당
			conn = DBUtil.getConnection();
			// sql
			sql = """
					select
					   mv.title AS mvTitle,
					    a.name AS name,
					    s.screening_date AS screeningDate,
					    r.viewers,
					    p.p_movie AS pMovie
					FROM reservation r
					JOIN schedule s ON r.schedule_id = s.schedule_id
					JOIN movie mv ON s.movie_id = mv.movie_id
					JOIN auditorium a ON s.auditorium_id = a.auditorium_id
					JOIN price p ON r.price_id = p.price_id
					WHERE r.member_id = ?
					ORDER BY s.screening_date DESC
				""";

			// 데이터 할당
			pstmt = conn.prepareStatement(sql);
			// 데이터 바인딩
			pstmt.setInt(1, member_id);
			// SQL문 실행
			rs = pstmt.executeQuery();
			// 반복
			while (rs.next()) {
				ReservationVO vo = new ReservationVO();
				vo.setMvTitle(rs.getString("mvTitle")); // 영화제목
				vo.setName(rs.getString("name")); // 극장이름
				vo.setScreeningDate(rs.getDate("screeningDate")); // 관람일시
				vo.setViewers(rs.getInt("viewers")); // 관람인원
				vo.setPMovie(rs.getInt("pMovie")); // 영화가격

				list.add(vo); // 리스트에 추가
			}
		} catch (Exception e) {
			throw new Exception(e);
		} finally {
			DBUtil.executeClose(rs, pstmt, conn);
		}

		return list;

	}


	// 예매 상세 조회
	public ReservationVO getReservationDetail(int reservationID) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ReservationVO reservation = null;

		String sql =  """
		        SELECT
	            r.reservation_id AS reservationID,
	            r.schedule_id AS scheduleID,
	            r.viewers,
	            m.name AS mem_Name,
	            mv.title AS mvTitle,
	            a.name AS auditorium_name,
	            s.screening_date,
	            st.seat_name
	        FROM reservation r
	        JOIN member m ON r.member_id = m.member_id
	        JOIN schedule s ON r.schedule_id = s.schedule_id
	        JOIN movie mv ON s.movie_id = mv.movie_id
	        JOIN price p ON r.price_id = p.price_id
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
	            reservation.setReservationID(rs.getInt("reservationID"));
	            reservation.setScheduleID(rs.getInt("scheduleID"));
	            reservation.setViewers(rs.getInt("viewers"));
	            reservation.setMem_Name(rs.getString("mem_Name"));
	            reservation.setMvTitle(rs.getString("mvTitle"));  // ✔️ 함수 이름도 mvTitle에 맞게
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
	// 좌석 정보
	public int getSeatIDByName(int scheduleID, String seatName) throws Exception {
		int seatID = -1;
		String sql = """
				SELECT s.seat_id
				FROM seat s
				JOIN schedule sch ON s.theater_id = sch.theater_id
				WHERE sch.schedule_id = ?
				  AND s.seat_name = ?
				""";

		try (Connection conn = DBUtil.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {

			pstmt.setInt(1, scheduleID);
			pstmt.setString(2, seatName);
			ResultSet rs = pstmt.executeQuery();

			if (rs.next()) {
				seatID = rs.getInt("seat_id");
			}
		}

		return seatID;
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

		try (Connection conn = DBUtil.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {

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

	public void updatePaymentInfo(int reservationID, int paidAmount, String method) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DBUtil.getConnection();
			String sql = """
					    UPDATE reservation
					    SET payment_status = 'Y',
					        payment_date = SYSDATE,
					        p_movie = ?,         -- 결제 금액 저장
					        payment_method = ?
					    WHERE reservation_id = ?
					""";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, paidAmount);
			pstmt.setString(2, method);
			pstmt.setInt(3, reservationID);
			pstmt.executeUpdate();
		} finally {
			DBUtil.executeClose(null, pstmt, conn);
		}
	}
}

