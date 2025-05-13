package kr.schedule.dao;

import java.sql.*;
import java.util.*;
import kr.schedule.vo.ScheduleVO;
import kr.util.DBUtil;

public class ScheduleDAO {
    private static ScheduleDAO instance = new ScheduleDAO();

    public static ScheduleDAO getInstance() {
        return instance;
    }

    // 영화 + 극장으로 전체 스케줄 조회
    public List<ScheduleVO> getSchedules(int movieID, int theaterID) {
        List<ScheduleVO> list = new ArrayList<>();
        String sql = "SELECT * FROM schedule WHERE movie_id = ? AND theater_id = ? AND is_available = 1 ORDER BY screening_date";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, movieID);
            pstmt.setInt(2, theaterID);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                list.add(mapSchedule(rs));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    // 날짜 기준 상영 스케줄 조회
    public List<ScheduleVO> getScheduleListByDate(int movieID, int theaterID, int auditoriumID, String date) {
        List<ScheduleVO> list = new ArrayList<>();
        StringBuilder sql = new StringBuilder("SELECT * FROM schedule ");
        sql.append("WHERE movie_id = ? AND theater_id = ? AND is_available = 1 ");
        sql.append("AND TRUNC(screening_date) = TO_DATE(?, 'YYYY-MM-DD') ");

        if (auditoriumID != -1) {
            sql.append("AND auditorium_id = ? ");
        }

        sql.append("ORDER BY screening_date");

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql.toString())) {

            pstmt.setInt(1, movieID);
            pstmt.setInt(2, theaterID);
            pstmt.setString(3, date);

            if (auditoriumID != -1) {
                pstmt.setInt(4, auditoriumID);
            }

            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                ScheduleVO vo = new ScheduleVO();
                vo.setScheduleID(rs.getInt("schedule_id"));
                vo.setTheaterID(rs.getInt("theater_id"));
                vo.setMovieID(rs.getInt("movie_id"));
                vo.setScreeningDate(rs.getDate("screening_date"));
                vo.setAvailable(rs.getInt("is_available") == 1);
                vo.setAuditoriumID(rs.getInt("auditorium_id"));
                list.add(vo);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }


    // 스케줄 매핑 함수
    private ScheduleVO mapSchedule(ResultSet rs) throws SQLException {
        ScheduleVO vo = new ScheduleVO();
        vo.setScheduleID(rs.getInt("schedule_id"));
        vo.setTheaterID(rs.getInt("theater_id"));
        vo.setMovieID(rs.getInt("movie_id"));
        vo.setScreeningDate(rs.getDate("screening_date")); 
        vo.setAvailable(rs.getInt("is_available") == 1);
        vo.setAuditoriumID(rs.getInt("auditorium_id"));
        vo.setStartTime(rs.getTimestamp("start_time")); // ✅ 이게 누락되었을 가능성 큼
        return vo;
    }
 // 영화 + 극장 + 날짜 기준으로 상영관 정보 + 시간대 정보 포함 조회
    public List<ScheduleVO> getScheduleWithAuditorium(int movieID, int theaterID, String date) {
        List<ScheduleVO> list = new ArrayList<>();
        String sql = "SELECT s.*, a.name AS auditorium_name, a.type AS auditorium_type, "
                   + "sl.start_time, sl.end_time "
                   + "FROM schedule s "
                   + "JOIN auditorium a ON s.auditorium_id = a.auditorium_id "
                   + "JOIN slot sl ON s.slot_id = sl.slot_id "
                   + "WHERE s.movie_id = ? "
                   + "AND s.theater_id = ? "
                   + "AND s.is_available = 1 "
                   + "AND TRUNC(s.screening_date) = TO_DATE(?, 'YYYY-MM-DD') "
                   + "ORDER BY sl.start_time";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, movieID);
            pstmt.setInt(2, theaterID);
            pstmt.setString(3, date);

            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                ScheduleVO vo = new ScheduleVO();
                vo.setScheduleID(rs.getInt("schedule_id"));
                vo.setTheaterID(rs.getInt("theater_id"));
                vo.setMovieID(rs.getInt("movie_id"));
                vo.setAuditoriumID(rs.getInt("auditorium_id"));
                vo.setScreeningDate(rs.getDate("screening_date"));
                vo.setAvailable(rs.getInt("is_available") == 1);
                vo.setSlotID(rs.getInt("slot_id"));

                // 추가 필드
                vo.setAuditoriumName(rs.getString("auditorium_name"));
                vo.setAuditoriumType(rs.getString("auditorium_type"));
                vo.setStartTime(rs.getTimestamp("start_time"));
                vo.setEndTime(rs.getTimestamp("end_time"));

                list.add(vo);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
    /*
    public List<ScheduleVO> getFilteredScheduleList(int movieID, int theaterID, String screenDate) {
        List<ScheduleVO> list = new ArrayList<>();
        String sql = """
            SELECT s.*, a.name AS auditorium_name, a.type AS auditorium_type, sl.start_time, sl.end_time
            FROM schedule s
            JOIN auditorium a ON s.auditorium_id = a.auditorium_id
            JOIN slot sl ON s.slot_id = sl.slot_id
            JOIN movie_type mt ON s.movie_id = mt.movie_id
            WHERE s.movie_id = ?
              AND s.theater_id = ?
              AND s.is_available = 1
              AND TRUNC(s.screening_date) = TO_DATE(?, 'YYYY-MM-DD')
              AND (
                (a.type = 'IMAX' AND mt.imax = 'Y') OR
                (a.type = '4DX' AND mt."4DX" = 'Y') OR
                (a.type = 'SCREENX' AND mt.screenx = 'Y') OR
                (a.type IS NULL OR a.type = '' OR (mt.imax = 'N' AND mt."4DX" = 'N' AND mt.screenx = 'N'))
              )
            ORDER BY sl.start_time
        """;

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, movieID);
            pstmt.setInt(2, theaterID);
            pstmt.setString(3, screenDate);

            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                ScheduleVO vo = new ScheduleVO();
                vo.setScheduleID(rs.getInt("schedule_id"));
                vo.setTheaterID(rs.getInt("theater_id"));
                vo.setMovieID(rs.getInt("movie_id"));
                vo.setAuditoriumID(rs.getInt("auditorium_id"));
                vo.setScreeningDate(rs.getDate("screening_date"));
                vo.setAvailable(rs.getInt("is_available") == 1);
                vo.setAuditoriumName(rs.getString("auditorium_name"));
                vo.setAuditoriumType(rs.getString("auditorium_type"));
                vo.setStartTime(rs.getTimestamp("start_time"));
                vo.setEndTime(rs.getTimestamp("end_time"));
                list.add(vo);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
    */

    public ScheduleVO getSchedule(int scheduleID) {
        ScheduleVO vo = null;

        String sql = """
            SELECT s.*, sl.start_time, sl.end_time
            FROM schedule s
            JOIN slot sl ON s.slot_id = sl.slot_id
            WHERE s.schedule_id = ?
        """;

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, scheduleID);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                vo = new ScheduleVO();
                vo.setScheduleID(rs.getInt("schedule_id"));
                vo.setTheaterID(rs.getInt("theater_id"));
                vo.setMovieID(rs.getInt("movie_id"));
                vo.setAuditoriumID(rs.getInt("auditorium_id"));
                vo.setScreeningDate(rs.getDate("screening_date"));
                vo.setSlotID(rs.getInt("slot_id"));
                vo.setAvailable(rs.getInt("is_available") == 1);

                // ✅ 오류 발생 지점
                vo.setStartTime(rs.getTimestamp("start_time"));
                vo.setEndTime(rs.getTimestamp("end_time"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return vo;
    }


}
