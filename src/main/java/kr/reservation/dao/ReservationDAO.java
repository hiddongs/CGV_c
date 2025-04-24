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
			
			pstmt.setLong(++cnt, reservation.getReservation_id());
			pstmt.setInt(++cnt, reservation.getMem_id());
			pstmt.setInt(++cnt, reservation.getSchedulle_id());
			pstmt.setString(++cnt,reservation.getSeat_num());
			pstmt.setString(++cnt,reservation.getPayment_staus());
			pstmt.setDate(++cnt, reservation.getPayment_date());
			
			pstmt.executeUpdate();
			
			
		} catch (Exception e) {
			// TODO: handle exception
			
			throw new Exception(e);
		} finally {
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
			
			sql = "SELECT * FROM reservation WHERE reservation_id =? AND mem_id=?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setLong(++cnt, reservation.getReservation_id());
			pstmt.setLong(++cnt, reservation.getMem_id());
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				reservationList = new ReservationVO();
				
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			throw new Exception(e);
		} finally {
			DBUtil.executeClose(rs, pstmt, conn);
		} 
		
		return reservation;
		
	}
	// 예매 상세 조회
	// 예매 상세 조회
	// 해당 상영 시간의 좌석 확인 (중복 방지용)
	// 예매 가능 여부 확인 (좌석 중복 체크)
}
