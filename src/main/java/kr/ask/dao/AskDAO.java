package kr.ask.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import kr.ask.vo.AskVO;
import kr.util.DBUtil;

public class AskDAO {

   // 싱글톤 패턴
    private static AskDAO instance = new AskDAO();
    
    public static AskDAO getInstance() {
        return instance;
    }
    private AskDAO() {}
    
    // 문의 글 작성하기 insert()
    public void insertAsk(AskVO ask) throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        String sql = null;
        int cnt = 0;

        try {
            conn = DBUtil.getConnection();

            sql = "INSERT INTO ask (ask_id, member_id, title, content, status, category, satisfaction, theater_id) "
                   + "VALUES (ask_seq.NEXTVAL, ?, ?, ?, ?, ?, ?, ?)";
            pstmt = conn.prepareStatement(sql);

            pstmt = conn.prepareStatement(sql);
            cnt = 0;
            pstmt.setInt(++cnt, ask.getMember_id());
            pstmt.setString(++cnt, ask.getTitle());
            pstmt.setString(++cnt, ask.getContent());
            pstmt.setString(++cnt, ask.getStatus());
            pstmt.setString(++cnt, ask.getCategory());
            pstmt.setInt(++cnt, ask.getSatisfaction());
            pstmt.setInt(++cnt, ask.getTheaterID());

            pstmt.executeUpdate();

        } catch (Exception e) {
            throw new Exception("문의글 등록 중 오류 발생: " + e.getMessage(), e);
        } finally {
            DBUtil.executeClose(null, pstmt, conn);
        }
    }
    
    
    
    
    // 문의 글 조회하기
    public List<AskVO> getAskListByMember(int member_id) throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<AskVO> list = new ArrayList<>();

        String sql = "SELECT a.ask_id, a.title, a.category, a.reg_date, a.status, "
                   + "NVL(a.satisfaction, 0) AS satisfaction, t.name "
                   + "FROM ask a "
                   + "JOIN theater t ON a.theater_id = t.theater_id "
                   + "WHERE a.member_id = ? "
                   + "ORDER BY a.reg_date DESC";

        try {
            conn = DBUtil.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, member_id);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                AskVO ask = new AskVO();
                ask.setAsk_id(rs.getInt("ask_id"));
                ask.setTitle(rs.getString("title"));
                ask.setCategory(rs.getString("category"));
                ask.setReg_date(rs.getDate("reg_date"));
                ask.setStatus(rs.getString("status"));
                ask.setSatisfaction(rs.getInt("satisfaction"));
                ask.setCgv_name(rs.getString("cgv_name"));

                list.add(ask);
            }
        } finally {
            DBUtil.executeClose(rs, pstmt, conn);
        }

        return list;
    }   
}      
    
    
    // 문의 수정하기
    




    // 문의 상세내역 보기
    
    // 문의 삭제하기 
    
    // 문의 검색하기
    
