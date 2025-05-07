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

    // ✅ 영화 + 극장으로 전체 스케줄 조회
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

    // ✅ 날짜 기준 상영 스케줄 조회
    public List<ScheduleVO> getScheduleListByDate(int movieID, int theaterID, int auditoriumID, String date) {
        List<ScheduleVO> list = new ArrayList<>();
        String sql = "SELECT * FROM schedule " +
                     "WHERE movie_id = ? " +
                     "AND theater_id = ? " +
                     "AND auditorium_id = ? " +
                     "AND is_available = 1 " +
                     "AND TRUNC(screening_date) = TO_DATE(?, 'YYYY-MM-DD') " +
                     "ORDER BY screening_date"; // 날짜 순 정렬

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, movieID);
            pstmt.setInt(2, theaterID);
            pstmt.setInt(3, auditoriumID);
            pstmt.setString(4, date);

            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                ScheduleVO vo = new ScheduleVO();
                vo.setScheduleID(rs.getInt("schedule_id"));
                vo.setTheaterID(rs.getInt("theater_id"));
                vo.setMovieID(rs.getInt("movie_id"));
                vo.setScreeningDate(rs.getDate("screening_date")); // ✅ 수정됨
                vo.setAvailable(rs.getInt("is_available") == 1);
                vo.setAuditoriumID(rs.getInt("auditorium_id"));
                list.add(vo);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    // ✅ 스케줄 매핑 함수
    private ScheduleVO mapSchedule(ResultSet rs) throws SQLException {
        ScheduleVO vo = new ScheduleVO();
        vo.setScheduleID(rs.getInt("schedule_id"));
        vo.setTheaterID(rs.getInt("theater_id"));
        vo.setMovieID(rs.getInt("movie_id"));
        vo.setScreeningDate(rs.getDate("screening_date")); // ✅ 수정됨
        vo.setAvailable(rs.getInt("is_available") == 1);
        vo.setAuditoriumID(rs.getInt("auditorium_id"));
        return vo;
    }
}
