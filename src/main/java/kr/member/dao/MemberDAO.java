package kr.member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import kr.member.vo.MemberVO;
import kr.util.DBUtil;

public class MemberDAO {
    // 싱글톤 패턴
    private static MemberDAO instance = new MemberDAO();
    
    public static MemberDAO getInstance() {
        return instance;
    }
    
    private MemberDAO() {}
    
    // 회원가입
    public void insertMember(MemberVO member) throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        String sql = null;
        
        try {
            conn = DBUtil.getConnection();
            sql = "INSERT INTO member (mem_num,mem_id,mem_pw,mem_name,mem_phone,mem_email,reg_date) "
                + "VALUES (member_seq.nextval,?,?,?,?,?,SYSDATE)";
            
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, member.getMem_id());
            pstmt.setString(2, member.getMem_pw());
            pstmt.setString(3, member.getMem_name());
            pstmt.setString(4, member.getMem_phone());
            pstmt.setString(5, member.getMem_email());
            
            pstmt.executeUpdate();
            
        } finally {
            DBUtil.executeClose(null, pstmt, conn);
        }
    }
    
    // 로그인 체크
    public MemberVO checkMember(String mem_id, String mem_pw) throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        MemberVO member = null;
        String sql = null;
        
        try {
            conn = DBUtil.getConnection();
            sql = "SELECT * FROM member WHERE mem_id=? AND mem_pw=?";
            
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, mem_id);
            pstmt.setString(2, mem_pw);
            
            rs = pstmt.executeQuery();
            if(rs.next()) {
                member = new MemberVO();
                member.setMem_num(rs.getInt("mem_num"));
                member.setMem_id(rs.getString("mem_id"));
                member.setMem_name(rs.getString("mem_name"));
                member.setMem_phone(rs.getString("mem_phone"));
                member.setMem_email(rs.getString("mem_email"));
                member.setReg_date(rs.getDate("reg_date"));
            }
            
        } finally {
            DBUtil.executeClose(rs, pstmt, conn);
        }
        
        return member;
    }
    
    // 아이디 중복 체크
    public boolean checkDuplicateId(String mem_id) throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql = null;
        boolean result = false;
        
        try {
            conn = DBUtil.getConnection();
            sql = "SELECT COUNT(*) FROM member WHERE mem_id=?";
            
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, mem_id);
            
            rs = pstmt.executeQuery();
            if(rs.next()) {
                if(rs.getInt(1) > 0) result = true;
            }
            
        } finally {
            DBUtil.executeClose(rs, pstmt, conn);
        }
        
        return result;
    }
    
    // 회원정보 가져오기
    public MemberVO getMember(String mem_id) throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        MemberVO member = null;
        String sql = null;
        
        try {
            conn = DBUtil.getConnection();
            sql = "SELECT * FROM member WHERE mem_id=?";
            
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, mem_id);
            
            rs = pstmt.executeQuery();
            if(rs.next()) {
                member = new MemberVO();
                member.setMem_num(rs.getInt("mem_num"));
                member.setMem_id(rs.getString("mem_id"));
                member.setMem_name(rs.getString("mem_name"));
                member.setMem_phone(rs.getString("mem_phone"));
                member.setMem_email(rs.getString("mem_email"));
                member.setReg_date(rs.getDate("reg_date"));
            }
            
        } finally {
            DBUtil.executeClose(rs, pstmt, conn);
        }
        
        return member;
    }
    public MemberVO getMember(int mem_num) throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        MemberVO member = null;
        String sql = null;
        
        try {
            conn = DBUtil.getConnection();
            sql = "SELECT * FROM member WHERE mem_num=?";
            
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, mem_num);
            
            rs = pstmt.executeQuery();
            if(rs.next()) {
                member = new MemberVO();
                member.setMem_num(rs.getInt("mem_num"));
                member.setMem_id(rs.getString("mem_id"));
                member.setMem_name(rs.getString("mem_name"));
                member.setMem_phone(rs.getString("mem_phone"));
                member.setMem_email(rs.getString("mem_email"));
                member.setReg_date(rs.getDate("reg_date"));
            }
            
        } finally {
            DBUtil.executeClose(rs, pstmt, conn);
        }
        
        return member;
    }
    
    // 회원정보 수정
    public void updateMember(MemberVO member) throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        String sql = null;
        
        try {
            conn = DBUtil.getConnection();
            sql = "UPDATE member SET mem_name=?,mem_phone=?,mem_email=? WHERE mem_num=?";
            
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, member.getMem_name());
            pstmt.setString(2, member.getMem_phone());
            pstmt.setString(3, member.getMem_email());
            pstmt.setInt(4, member.getMem_num());
            
            pstmt.executeUpdate();
            
        } finally {
            DBUtil.executeClose(null, pstmt, conn);
        }
    }
    
    // 비밀번호 수정
    public void updatePassword(int mem_num, String mem_pw) throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        String sql = null;
        
        try {
            conn = DBUtil.getConnection();
            sql = "UPDATE member SET mem_pw=? WHERE mem_num=?";
            
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, mem_pw);
            pstmt.setInt(2, mem_num);
            
            pstmt.executeUpdate();
            
        } finally {
            DBUtil.executeClose(null, pstmt, conn);
        }
    }
    
    // 회원 탈퇴
    public void deleteMember(int mem_num) throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        String sql = null;
        
        try {
            conn = DBUtil.getConnection();
            sql = "DELETE FROM member WHERE mem_num=?";
            
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, mem_num);
            
            pstmt.executeUpdate();
            
        } finally {
            DBUtil.executeClose(null, pstmt, conn);
        }
    }
    
    // 아이디 찾기
    public String findId(String mem_name, String mem_email) throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql = null;
        String mem_id = null;
        
        try {
            conn = DBUtil.getConnection();
            sql = "SELECT mem_id FROM member WHERE mem_name=? AND mem_email=?";
            
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, mem_name);
            pstmt.setString(2, mem_email);
            
            rs = pstmt.executeQuery();
            if(rs.next()) {
                mem_id = rs.getString(1);
            }
            
        } finally {
            DBUtil.executeClose(rs, pstmt, conn);
        }
        
        return mem_id;
    }
    
    // 비밀번호 찾기를 위한 회원 확인
    public boolean checkMemberForPw(String mem_id, String mem_email) throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql = null;
        boolean result = false;
        
        try {
            conn = DBUtil.getConnection();
            sql = "SELECT COUNT(*) FROM member WHERE mem_id=? AND mem_email=?";
            
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, mem_id);
            pstmt.setString(2, mem_email);
            
            rs = pstmt.executeQuery();
            if(rs.next()) {
                if(rs.getInt(1) > 0) result = true;
            }
            
        } finally {
            DBUtil.executeClose(rs, pstmt, conn);
        }
        
        return result;
    }
}
