package kr.theater.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import kr.schedule.vo.ScheduleVO;
import kr.theater.vo.TheaterVO;
import kr.util.DBUtil;

public class TheaterDAO {

    private static TheaterDAO instance = new TheaterDAO();

    public static TheaterDAO getInstance() {
        return instance;
    }

    // 전체 극장 목록 조회
    public List<TheaterVO> getTheaterList() throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<TheaterVO> list = new ArrayList<>();

        try {
            conn = DBUtil.getConnection();
            String sql = "SELECT * FROM theater";
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                TheaterVO theater = new TheaterVO();
                theater.setTheaterId(rs.getInt("THEATER_ID"));
                theater.setRegion(rs.getString("REGION"));
                theater.setName(rs.getString("NAME"));
                theater.setDescription(rs.getString("DESCRIPTION"));
                list.add(theater);
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBUtil.executeClose(rs, pstmt, conn);
        }

        return list;
    }

    // 모든 지역 목록 조회 (중복 제거)
    public List<String> getAllRegionList() {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<String> allRegionList = new ArrayList<>();

        try {
            conn = DBUtil.getConnection();
            String sql = "SELECT DISTINCT region FROM theater";
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                allRegionList.add(rs.getString("region"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBUtil.executeClose(rs, pstmt, conn);
        }

        return allRegionList;
    }

    // 특정 극장 ID로 해당 지역 정보 조회
    public String getRegionByTheaterId(int theaterId) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String region = null;

        try {
            conn = DBUtil.getConnection();
            String sql = "SELECT region FROM theater WHERE theater_id = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, theaterId);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                region = rs.getString("region");
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBUtil.executeClose(rs, pstmt, conn);
        }

        return region;
    }

    // 지역명을 기준으로 해당 지역의 극장 리스트 반환
    public List<TheaterVO> selectTheaterList(String region) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<TheaterVO> theaterList = new ArrayList<>();

        try {
            conn = DBUtil.getConnection();
            String sql = "SELECT theater_id, name FROM theater WHERE region = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, region);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                TheaterVO theater = new TheaterVO();
                theater.setTheaterId(rs.getInt("theater_id"));
                theater.setName(rs.getString("name"));
                theaterList.add(theater);
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBUtil.executeClose(rs, pstmt, conn);
        }

        return theaterList;
    }


    // theater_id 기준 단일 극장 정보 조회
    public TheaterVO getTheater(int theaterID) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        TheaterVO theater = null;

        try {
            conn = DBUtil.getConnection();
            String sql = "SELECT * FROM theater WHERE theater_id = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, theaterID);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                theater = new TheaterVO();
                theater.setTheaterId(rs.getInt("theater_id"));
                theater.setName(rs.getString("name"));
                theater.setRegion(rs.getString("region"));
                theater.setDescription(rs.getString("description"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBUtil.executeClose(rs, pstmt, conn);
        }

        return theater;
    }
    public List<TheaterVO> getTheatersByMovie(int movieID) {
        List<TheaterVO> list = new ArrayList<>();
        String sql = "SELECT DISTINCT t.* FROM theater t " +
                     "JOIN schedule s ON t.theater_id = s.theater_id " +
                     "WHERE s.movie_id = ? AND s.is_available = 1";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, movieID);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                TheaterVO vo = new TheaterVO();
                vo.setTheaterId(rs.getInt("theater_id"));
                vo.setName(rs.getString("name"));
                vo.setRegion(rs.getString("region"));
                list.add(vo);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
  
   



}
