package kr.schedule.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Time;
import java.util.ArrayList;
import java.util.List;

import kr.movie.vo.MovieVO;
import kr.schedule.vo.ScheduleDetailVO;
import kr.schedule.vo.ScheduleVO;
import kr.slot.vo.SlotVO;
import kr.util.DBUtil;

public class ScheduleDAO {

	private static ScheduleDAO instance = null;

	private ScheduleDAO() {}

	public static ScheduleDAO getInstance() {

		if(instance == null) instance = new ScheduleDAO();

		return instance;
	}
	
	// 스케줄 상세 정보 조회
	public ScheduleDetailVO getScheduleDetail(Long scheduleId) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		ScheduleDetailVO vo = null;
		
		try {
			conn = DBUtil.getConnection();
			sql = "SELECT * FROM VIEW_SCHEDULE_DETAIL WHERE SCHEDULE_ID = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setLong(1, scheduleId);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				vo = new ScheduleDetailVO();
				
				vo.setScheduleId(rs.getLong("SCHEDULE_ID"));
				vo.setScreeningDate(rs.getDate("SCREENING_DATE"));
				vo.setAvailable(rs.getBoolean("IS_AVAILABLE"));

				vo.setTheaterId(rs.getLong("THEATER_ID"));
				vo.setTheaterName(rs.getString("THEATER_NAME"));
				vo.setTheaterRegion(rs.getString("THEATER_REGION"));

				vo.setAuditoriumId(rs.getLong("AUDITORIUM_ID"));
				vo.setAuditoriumName(rs.getString("AUDITORIUM_NAME"));
				vo.setAuditoriumType(rs.getString("AUDITORIUM_TYPE"));

				vo.setMovieId(rs.getLong("MOVIE_ID"));
				vo.setMovieTitle(rs.getString("MOVIE_TITLE"));
				vo.setDirector(rs.getString("DIRECTOR"));
				vo.setActor(rs.getString("ACTOR"));
				vo.setGenre(rs.getString("GENRE"));
				vo.setRuntime(rs.getInt("RUNTIME"));
				vo.setReleaseDate(rs.getDate("RELEASE_DATE"));
				vo.setAgeLimit(rs.getString("AGE_LIMIT"));
				vo.setPosterUrl(rs.getString("POSTER_URL"));
				vo.setMovieCreate(rs.getDate("MOVIE_CREATE"));
				vo.setDescription(rs.getString("DESCRIPTION"));
				vo.setBookingRate(rs.getDouble("BOOKING_RATE"));

				vo.setSlotId(rs.getLong("SLOT_ID"));
				vo.setStartTime(rs.getTime("START_TIME"));
				vo.setEndTime(rs.getTime("END_TIME"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.executeClose(rs, pstmt, conn);
		}
		
		return vo;
	}


	public List<ScheduleDetailVO> getDetailScheduleList(Long theaterId){

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		List<ScheduleDetailVO> result = new ArrayList<>();

		try {
			conn = DBUtil.getConnection();
			sql = "SELECT * FROM VIEW_SCHEDULE_DETAIL WHERE THEATER_ID = ?"; // 조인개많던거 뷰로 묶어서 사용
			pstmt = conn.prepareStatement(sql);
			pstmt.setLong(1, theaterId);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				ScheduleDetailVO vo = new ScheduleDetailVO();

				vo.setScheduleId(rs.getLong("SCHEDULE_ID"));
				vo.setScreeningDate(rs.getDate("SCREENING_DATE"));
				vo.setAvailable(rs.getBoolean("IS_AVAILABLE"));

				vo.setTheaterId(rs.getLong("THEATER_ID"));
				vo.setTheaterName(rs.getString("THEATER_NAME"));
				vo.setTheaterRegion(rs.getString("THEATER_REGION"));

				vo.setAuditoriumId(rs.getLong("AUDITORIUM_ID"));
				vo.setAuditoriumName(rs.getString("AUDITORIUM_NAME"));
				vo.setAuditoriumType(rs.getString("AUDITORIUM_TYPE"));

				vo.setMovieId(rs.getLong("MOVIE_ID"));
				vo.setMovieTitle(rs.getString("MOVIE_TITLE"));
				vo.setDirector(rs.getString("DIRECTOR"));
				vo.setActor(rs.getString("ACTOR"));
				vo.setGenre(rs.getString("GENRE"));
				vo.setRuntime(rs.getInt("RUNTIME"));
				vo.setReleaseDate(rs.getDate("RELEASE_DATE"));
				vo.setAgeLimit(rs.getString("AGE_LIMIT"));
				vo.setPosterUrl(rs.getString("POSTER_URL"));
				vo.setMovieCreate(rs.getDate("MOVIE_CREATE"));
				vo.setDescription(rs.getString("DESCRIPTION"));
				vo.setBookingRate(rs.getDouble("BOOKING_RATE"));

				vo.setSlotId(rs.getLong("SLOT_ID"));
				vo.setStartTime(rs.getTime("START_TIME"));
				vo.setEndTime(rs.getTime("END_TIME"));

				result.add(vo);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.executeClose(rs, pstmt, conn);
		}

		return result;
	}

	public int dateExtension() { // 기간이 지난 스케쥴을 7일씩 연장
		
		Connection conn = null;
		String sql = null;
		PreparedStatement pstmt = null;
		int result = 0;

		try {

			conn = DBUtil.getConnection();
			sql = "UPDATE SCHEDULE SET SCREENING_DATE = SCREENING_DATE + 7 WHERE SCREENING_DATE < SYSDATE";
			pstmt = conn.prepareStatement(sql);
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.executeClose(null, pstmt, conn);
		}
		return result;
	}
	
	// 스케줄 등록
	public int insertSchedule(ScheduleVO schedule) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		int result = 0;
		
		try {
			conn = DBUtil.getConnection();
			sql = "INSERT INTO SCHEDULE (SCHEDULE_ID, THEATER_ID, AUDITORIUM_ID, MOVIE_ID, SLOT_ID, SCREENING_DATE, IS_AVAILABLE) "
				+ "VALUES (SCHEDULE_SEQ.NEXTVAL, ?, ?, ?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setLong(1, schedule.getTheaterId());
			pstmt.setLong(2, schedule.getAuditoriumId());
			pstmt.setLong(3, schedule.getMovieId());
			pstmt.setLong(4, schedule.getSlotId());
			pstmt.setDate(5, new java.sql.Date(schedule.getScreeningDate().getTime()));
			pstmt.setBoolean(6, schedule.isAvailable());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.executeClose(null, pstmt, conn);
		}
		
		return result;
	}
	
	// 스케줄 수정
	public int updateSchedule(ScheduleVO schedule) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		int result = 0;
		
		try {
			conn = DBUtil.getConnection();
			sql = "UPDATE SCHEDULE SET THEATER_ID=?, AUDITORIUM_ID=?, MOVIE_ID=?, SLOT_ID=?, "
				+ "SCREENING_DATE=?, IS_AVAILABLE=? WHERE SCHEDULE_ID=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setLong(1, schedule.getTheaterId());
			pstmt.setLong(2, schedule.getAuditoriumId());
			pstmt.setLong(3, schedule.getMovieId());
			pstmt.setLong(4, schedule.getSlotId());
			pstmt.setDate(5, new java.sql.Date(schedule.getScreeningDate().getTime()));
			pstmt.setBoolean(6, schedule.isAvailable());
			pstmt.setLong(7, schedule.getScheduleId());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.executeClose(null, pstmt, conn);
		}
		
		return result;
	}
	
	// 스케줄 삭제
	public int deleteSchedule(Long scheduleId) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		int result = 0;
		
		try {
			conn = DBUtil.getConnection();
			sql = "DELETE FROM SCHEDULE WHERE SCHEDULE_ID=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setLong(1, scheduleId);
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.executeClose(null, pstmt, conn);
		}
		
		return result;
	}

	public List<SlotVO> getScreeningTime(Long theaterId, Long auditoriumId, Date date) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		List<SlotVO> result = new ArrayList<>();
		
		try {
			conn = DBUtil.getConnection();
			sql = "SELECT AUDITORIUM_ID, SLOT_ID FROM SCHEDULE SC WHERE SCREENING_DATE = ? AND AUDITORIUM_ID = ? JOIN SLOT SL ON SC.SLOT_ID = SL.SLOT_ID ORDER BY SL.START_TIME";
			pstmt = conn.prepareStatement(sql);
			pstmt.setLong(1, theaterId);
			pstmt.setLong(2, auditoriumId);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				do {
					SlotVO vo = new SlotVO();
					vo.setSlotId(rs.getLong("SL.SLOT_ID"));
					vo.setStartTime(new Time(rs.getDate("SL.START_TIME").getTime()));
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

		public List<MovieVO> getAvailableMovieList(Long auditoriumId) {
		
		Connection conn = null;
		String sql = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<MovieVO> result = new ArrayList<>();
		
		try {
			conn = DBUtil.getConnection();
			sql = "SELECT DISTINCT M.MOVIE_ID, M.TITLE, M.RUNTIME FROM SCHEDULE S JOIN MOVIE M ON M.MOVIE_ID = S.MOVIE_ID WHERE AUDITORIUM_ID = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setLong(1, auditoriumId);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				do {
					MovieVO vo = new MovieVO();
					vo.setMovie_id(rs.getLong("movie_id"));
					vo.setMv_title(rs.getString("title"));
					vo.setRuntime(rs.getInt("runtime"));
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

		public List<ScheduleVO> getAvailableScreeningDate(Long auditoriumId, Long movieId) {
			
			Connection conn = null;
			String sql = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			List<ScheduleVO> result = new ArrayList<>();
			
			try {
				conn = DBUtil.getConnection();
				sql = "SELECT SCREENING_DATE FROM SCHEDULE WHERE AUDITORIUM_ID = ? AND MOVIE_ID = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setLong(1, auditoriumId);
				pstmt.setLong(2, movieId);
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					do {
						ScheduleVO vo = new ScheduleVO();
						vo.setScreeningDate(rs.getDate("SCREENING_DATE"));
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
		
		 public List<SlotVO> getAvailableSlots(int auditoriumId, int movieId, String screeningDate) throws Exception {
		        Connection conn = null;
		        PreparedStatement pstmt = null;
		        ResultSet rs = null;
		        List<SlotVO> slotList = new ArrayList<>();
		        String sql = null;
		        
		        try {
		            conn = DBUtil.getConnection();
		            // 해당 상영관, 영화, 날짜에 대해 이미 예약된 시간대를 제외한 사용 가능한 시간대 조회
		            sql = "SELECT t.slot_id, t.start_time, t.end_time " +
		                  "FROM slot t " +
		                  "WHERE t.slot_id NOT IN ( " +
		                  "    SELECT s.slot_id " +
		                  "    FROM schedule s " +
		                  "    WHERE s.auditorium_id = ? " +
		                  "    AND s.screening_date = ? " +
		                  ") " +
		                  "ORDER BY t.start_time";
		            
		            pstmt = conn.prepareStatement(sql);
		            pstmt.setInt(1, auditoriumId);
		            pstmt.setString(2, screeningDate);
		            
		            rs = pstmt.executeQuery();
		            
		            while(rs.next()) {
		            	SlotVO slot = new SlotVO();
		                slot.setSlotId(rs.getLong("slot_id"));
		                slot.setStartTime(new Time(rs.getDate("start_time").getTime()));
		                slotList.add(slot);
		            }
		            
		        } catch(Exception e) {
		            throw new Exception(e);
		        } finally {
		            DBUtil.executeClose(rs, pstmt, conn);
		        }
		        
		        return slotList;
		    }

		public int changeStatus(Long scheduleId) {
			
			Connection conn = null;
			PreparedStatement pstmt = null;
			String sql = null;
			int result = 0;
			
			try {
				conn = DBUtil.getConnection();
				sql = "UPDATE SCHEDULE SET IS_AVAILABLE = CASE WHEN IS_AVAILABLE = 1 THEN 0 ELSE 1 END  WHERE SCHEDULE_ID = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setLong(1, scheduleId);
				result = pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				DBUtil.executeClose(null, pstmt, conn);
			}
			return result;
		}

}
