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

    // 예약 생성
    public int insertReservation(int memberID, int scheduleID, int viewers) throws Exception {
        int reservationID = 0;
        String sql = """
            INSERT INTO reservation (
                reservation_id, member_id, schedule_id, viewers,
                payment_status, payment_date, screening_date, p_movie,
                name, mv_title, movie_type, theater_id, price_id
            ) VALUES (
                reservation_seq.NEXTVAL, ?, ?, ?, 'N', SYSDATE,
                (SELECT screening_date FROM schedule WHERE schedule_id = ?),
                (SELECT movie_id FROM schedule WHERE schedule_id = ?),
                (SELECT name FROM member WHERE member_id = ?),
                (SELECT title FROM movie WHERE movie_id = (SELECT movie_id FROM schedule WHERE schedule_id = ?)),
                (SELECT type FROM auditorium WHERE auditorium_id = (SELECT auditorium_id FROM schedule WHERE schedule_id = ?)),
                (SELECT theater_id FROM schedule WHERE schedule_id = ?),
                1
            )
        """;

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql, new String[]{"reservation_id"})) {
            int i = 0;
            pstmt.setInt(++i, memberID);
            pstmt.setInt(++i, scheduleID);
            pstmt.setInt(++i, viewers);
            pstmt.setInt(++i, scheduleID);
            pstmt.setInt(++i, scheduleID);
            pstmt.setInt(++i, memberID);
            pstmt.setInt(++i, scheduleID);
            pstmt.setInt(++i, scheduleID);
            pstmt.setInt(++i, scheduleID);

            pstmt.executeUpdate();
            ResultSet rs = pstmt.getGeneratedKeys();
            if (rs.next()) {
                reservationID = rs.getInt(1);
            }
        }

        return reservationID;
    }

    // 예약 상세 조회
    public ReservationVO getReservationDetail(int reservationID) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        ReservationVO reservation = null;

        String sql = """
            SELECT
                r.reservation_id,
                r.schedule_id,
                r.viewers,
                r.payment_status,
                r.payment_date,
                r.screening_date,
                r.p_movie,
                r.name AS theater_name,
                r.mv_title,
                r.movie_type,
                m.name AS member_name,
                s.theater_id,
                s.auditorium_id
            FROM reservation r
            JOIN member m ON r.member_id = m.member_id
            JOIN schedule s ON r.schedule_id = s.schedule_id
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
                reservation.setScheduleID(rs.getInt("schedule_id"));
                reservation.setViewers(rs.getInt("viewers"));
                reservation.setPaymentStatus(rs.getString("payment_status"));
                reservation.setPaymentDate(rs.getString("payment_date"));
                reservation.setScreeningDate(rs.getDate("screening_date"));
                reservation.setpMovie(rs.getInt("p_movie"));
                reservation.setName(rs.getString("theater_name"));
                reservation.setMvTitle(rs.getString("mv_title"));
                reservation.setMovieType(rs.getString("movie_type"));
                reservation.setMem_Name(rs.getString("member_name"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBUtil.executeClose(rs, pstmt, conn);
        }

        return reservation;
    }

    // 좌석 이름으로 seat_id 구하기
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

    // 예약 좌석 저장
    public void insertReservationSeat(int reservationID, int seatID, int scheduleID) throws Exception {
        if (isSeatAlreadyReserved(scheduleID, seatID)) {
            throw new IllegalStateException("이미 예약된 좌석입니다.");
        }

        String sql = "INSERT INTO reservation_seat(id, reservation_id, seat_id) VALUES (reservation_seat_seq.NEXTVAL, ?, ?)";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, reservationID);
            pstmt.setInt(2, seatID);
            pstmt.executeUpdate();
        }
    }

    // 이미 예약된 좌석인지 확인
    public boolean isSeatAlreadyReserved(int scheduleID, int seatID) throws Exception {
        String sql = """
            SELECT COUNT(*) 
            FROM reservation r
            JOIN reservation_seat rs ON r.reservation_id = rs.reservation_id
            WHERE r.schedule_id = ? AND rs.seat_id = ?
        """;

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, scheduleID);
            pstmt.setInt(2, seatID);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                return rs.getInt(1) > 0;
            }
        }

        return false;
    }

    // 해당 스케줄에서 예약된 좌석 이름 목록 조회
    public List<String> getReservedSeatNames(int scheduleID) throws Exception {
        List<String> reservedSeats = new ArrayList<>();
        String sql = """
            SELECT st.seat_name
            FROM reservation r
            JOIN reservation_seat rs ON r.reservation_id = rs.reservation_id
            JOIN seat st ON rs.seat_id = st.seat_id
            WHERE r.schedule_id = ?
        """;

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, scheduleID);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                reservedSeats.add(rs.getString("seat_name"));
            }
        }

        return reservedSeats;
    }

    // 예약ID 기준으로 좌석 이름 목록 가져오기
    public List<String> getSeatNamesByReservation(int reservationID) throws Exception {
        List<String> seatNames = new ArrayList<>();

        String sql = """
            SELECT s.seat_name
            FROM reservation_seat rs
            JOIN seat s ON rs.seat_id = s.seat_id
            WHERE rs.reservation_id = ?
        """;

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, reservationID);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                seatNames.add(rs.getString("seat_name"));
            }
        }

        return seatNames;
    }

    // 결제 정보 업데이트
    
    public void updatePaymentInfo(int reservationId, int totalPrice) throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            conn = DBUtil.getConnection();
            String sql = """
                UPDATE reservation
                SET payment_status = 'Y',
                    payment_date = SYSDATE,
                    p_movie = ?
                WHERE reservation_id = ?
            """;
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, totalPrice);       // 결제 금액
            pstmt.setInt(2, reservationId);    // 예매 ID
            pstmt.executeUpdate();
        } finally {
            DBUtil.executeClose(null, pstmt, conn);
        }
    }

 // 특정 회원의 예약 목록 조회
    public List<ReservationVO> getListReservationByUser(int memberId) throws Exception {
        List<ReservationVO> list = new ArrayList<>();

        String sql = """
            SELECT 
                r.reservation_id,
                r.schedule_id,
                r.viewers,
                r.payment_status,
                r.payment_date,
                m.name AS member_name,
                mv.title AS mv_title,
                a.name AS auditorium_name,
                s.screening_date
            FROM reservation r
            JOIN member m ON r.member_id = m.member_id
            JOIN schedule s ON r.schedule_id = s.schedule_id
            JOIN movie mv ON s.movie_id = mv.movie_id
            JOIN auditorium a ON s.auditorium_id = a.auditorium_id
            WHERE r.member_id = ?
            ORDER BY r.payment_date DESC
        """;

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, memberId);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                ReservationVO vo = new ReservationVO();
                vo.setReservationID(rs.getInt("reservation_id"));
                vo.setScheduleID(rs.getInt("schedule_id"));
                vo.setViewers(rs.getInt("viewers"));
                vo.setPaymentStatus(rs.getString("payment_status"));
                vo.setPaymentDate(rs.getString("payment_date"));
                vo.setMem_Name(rs.getString("member_name"));
                vo.setMvTitle(rs.getString("mv_title"));
                vo.setAuditoriumName(rs.getString("auditorium_name"));
                vo.setScreeningDate(rs.getDate("screening_date"));
                list.add(vo);
            }
        }

        return list;
    }

}