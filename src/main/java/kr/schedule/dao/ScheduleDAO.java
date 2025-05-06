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
        String sql = "SELECT * FROM schedule WHERE movie_id = ? AND theater_id = ? AND is_available = 1 ORDER BY screening_time";

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
    public List<ScheduleVO> getScheduleListByDate(int movieID, int theaterID, String date) {
        List<ScheduleVO> list = new ArrayList<>();
        String sql = "SELECT * FROM schedule WHERE movie_id = ? AND theater_id = ? " +
                     "AND is_available = 1 AND TRUNC(screening_time) = TO_DATE(?, 'YYYY-MM-DD') " +
                     "ORDER BY screening_time";

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
                vo.setScreeningTime(rs.getTimestamp("screening_time"));
                vo.setMorning(rs.getInt("is_morning") == 1);
                vo.setNight(rs.getInt("is_night") == 1);
                vo.setAvailable(rs.getInt("is_available") == 1);
                vo.setAuditoriumType(rs.getString("auditorium_type")); // ✅ 추가
                list.add(vo);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }


    private ScheduleVO mapSchedule(ResultSet rs) throws SQLException {
        ScheduleVO vo = new ScheduleVO();
        vo.setScheduleID(rs.getInt("schedule_id"));
        vo.setTheaterID(rs.getInt("theater_id"));
        vo.setMovieID(rs.getInt("movie_id"));
        vo.setScreeningTime(rs.getTimestamp("screening_time"));
        vo.setMorning(rs.getInt("is_morning") == 1);
        vo.setNight(rs.getInt("is_night") == 1);
        vo.setAvailable(rs.getInt("is_available") == 1);
        vo.setAuditoriumType(rs.getString("auditorium_type"));  // ✅ 추가
        vo.setAuditoriumID(rs.getInt("auditorium_id"));         // ✅ 추가
        return vo;
    }

}
