package kr.member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kr.member.vo.MemberVO;
import kr.reservation.vo.ReservationVO;
import kr.util.DBUtil;

public class MemberDAO {
    // 싱글톤 패턴
    private static MemberDAO instance = new MemberDAO();
    
    public static MemberDAO getInstance() {
        return instance;
    }
    private MemberDAO() {}
    
    // 회원가입
    public void insertMember(MemberVO member) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        String sql = null;
        
        try {
            conn = DBUtil.getConnection();
            sql = "INSERT INTO member (MEMBER_ID, USER_ID, PASSWORD, NAME, REG_DATE, PHONE, EMAIL, GENDER, ADDRESS, ADDRESS_DETAIL) "
                + "VALUES (member_seq.nextval,?,?,?,SYSDATE,?,?,?,?,?)";
            
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, member.getUser_id());
            pstmt.setString(2, member.getPassword());
            pstmt.setString(3, member.getName());
            pstmt.setString(4, member.getPhone());
            pstmt.setString(5, member.getEmail());
            pstmt.setString(6, member.getGender());
            pstmt.setString(7, member.getAddress());
            pstmt.setString(8, member.getAddressDetail());
            
            pstmt.executeUpdate();
            
        } catch (Exception e) {
			e.printStackTrace();
		} finally {
            DBUtil.executeClose(null, pstmt, conn);
        }
    }
    
    // 로그인 체크
    public MemberVO login(String mem_id, String mem_pw){
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        MemberVO member = null;
        String sql = null;
        
        try {
            conn = DBUtil.getConnection();
            sql = "SELECT * FROM member WHERE USER_ID=? AND PASSWORD=?";
            
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, mem_id);
            pstmt.setString(2, mem_pw);
            
            rs = pstmt.executeQuery();
            if(rs.next()) {
                member = new MemberVO();
                member.setMember_id(rs.getInt("MEMBER_ID"));
                member.setUser_id(rs.getString("USER_ID"));
                member.setPassword(rs.getString("PASSWORD"));
                member.setPoint(rs.getInt("POINT"));
                member.setName(rs.getString("NAME"));
                member.setPhone(rs.getString("PHONE"));
                member.setEmail(rs.getString("EMAIL"));
                member.setReg_date(rs.getDate("REG_DATE"));
                member.setGender(rs.getString("GENDER"));
                member.setGrade(rs.getString("GRADE"));
                member.setAddress(rs.getString("ADDRESS"));
                member.setAddressDetail(rs.getString("ADDRESS_DETAIL"));
                
            }
            
        } catch (Exception e) {
			e.printStackTrace();
		} finally {
            DBUtil.executeClose(rs, pstmt, conn);
        }
        
        return member;
    }
    
    // 아이디 중복 체크
    public boolean checkDuplicateId(String mem_id){
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql = null;
        boolean result = false;
        
        try {
            conn = DBUtil.getConnection();
            sql = "SELECT COUNT(*) FROM member WHERE USER_ID=?";
            
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, mem_id);
            
            rs = pstmt.executeQuery();
            if(rs.next()) {
                if(rs.getInt(1) > 0) result = true;
            }
 
        } catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
            DBUtil.executeClose(rs, pstmt, conn);
        }
        
        return result;
    }
    
    public List<MemberVO> getMemberList(){
    	 Connection conn = null;
         PreparedStatement pstmt = null;
         ResultSet rs = null;
         MemberVO member = null;
         String sql = null;
         List<MemberVO> result = new ArrayList<>();
         
         try {
        	 
        	conn = DBUtil.getConnection();
        	sql = "SELECT * FROM MEMBER";
        	pstmt = conn.prepareStatement(sql);
        	rs = pstmt.executeQuery();
        	
        	if(rs.next()) {
        		do {
        			 member = new MemberVO();
                     member.setMember_id(rs.getInt("MEMBER_ID"));
                     member.setUser_id(rs.getString("USER_ID"));
                     member.setPassword(rs.getString("PASSWORD"));
                     member.setPoint(rs.getInt("POINT"));
                     member.setName(rs.getString("NAME"));
                     member.setPhone(rs.getString("PHONE"));
                     member.setEmail(rs.getString("EMAIL"));
                     member.setReg_date(rs.getDate("REG_DATE"));
                     member.setGender(rs.getString("GENDER"));
                     member.setGrade(rs.getString("GRADE"));
                     member.setAddress(rs.getString("ADDRESS"));
                     member.setAddressDetail(rs.getString("ADDRESS_DETAIL"));
                     result.add(member);
        		}while(rs.next());
        	}
        	 
         }catch (Exception e) {
        	 e.printStackTrace();
         }finally {
			DBUtil.executeClose(rs, pstmt, conn);
		}
         return result;
    }
    
    // 회원정보 가져오기
    public MemberVO getMember(String user_id){
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        MemberVO member = null;
        String sql = null;
        
        try {
            conn = DBUtil.getConnection();
            sql = "SELECT * FROM member WHERE USER_ID=?";
            
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, user_id);
            
            rs = pstmt.executeQuery();
            if(rs.next()) {
            	member = new MemberVO();
            	 member.setMember_id(rs.getInt("MEMBER_ID"));
                 member.setUser_id(rs.getString("USER_ID"));
                 member.setPassword(rs.getString("PASSWORD"));
                 member.setPoint(rs.getInt("POINT"));
                 member.setName(rs.getString("NAME"));
                 member.setPhone(rs.getString("PHONE"));
                 member.setEmail(rs.getString("EMAIL"));
                 member.setReg_date(rs.getDate("REG_DATE"));
                 member.setGender(rs.getString("GENDER"));
                 member.setGrade(rs.getString("GRADE"));
                 member.setAddress(rs.getString("ADDRESS"));
                 member.setAddressDetail(rs.getString("ADDRESS_DETAIL"));
            }
            
        } catch (Exception e) {
			e.printStackTrace();
		} finally {
            DBUtil.executeClose(rs, pstmt, conn);
        }
        
        return member;
    }
    public MemberVO getMember(int mem_num){
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        MemberVO member = null;
        String sql = null;
        
        try {
            conn = DBUtil.getConnection();
            sql = "SELECT * FROM member WHERE MEMBER_ID=?";
            
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, mem_num);
            
            rs = pstmt.executeQuery();
            if(rs.next()) {
            	member = new MemberVO();
            	 member.setMember_id(rs.getInt("MEMBER_ID"));
                 member.setUser_id(rs.getString("USER_ID"));
                 member.setPassword(rs.getString("PASSWORD"));
                 member.setPoint(rs.getInt("POINT"));
                 member.setName(rs.getString("NAME"));
                 member.setPhone(rs.getString("PHONE"));
                 member.setEmail(rs.getString("EMAIL"));
                 member.setReg_date(rs.getDate("REG_DATE"));
                 member.setGender(rs.getString("GENDER"));
                 member.setGrade(rs.getString("GRADE"));
                 member.setAddress(rs.getString("ADDRESS"));
                 member.setAddressDetail(rs.getString("ADDRESS_DETAIL"));
            }
            
        } catch (Exception e) {
			e.printStackTrace();
		} finally {
            DBUtil.executeClose(rs, pstmt, conn);
        }
        
        return member;
    }
    
    // 회원정보 수정
    public void updateMember(MemberVO member){
        Connection conn = null;
        PreparedStatement pstmt = null;
        String sql = null;
        
        try {
            conn = DBUtil.getConnection();
            sql = "UPDATE member SET name=?,phone=?,email=? WHERE MEMBER_ID=?";
            
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, member.getName());
            pstmt.setString(2, member.getPhone());
            pstmt.setString(3, member.getEmail());
            pstmt.setInt(4, member.getMember_id());
            
            pstmt.executeUpdate();
            
        } catch (Exception e) {
			e.printStackTrace();
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
            sql = "UPDATE MEMBER SET PASSWORD=? WHERE MEMBER_ID=?";
            
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, mem_pw);
            pstmt.setInt(2, mem_num);
            
            pstmt.executeUpdate();
            
        } finally {
            DBUtil.executeClose(null, pstmt, conn);
        }
    }
    
    // 회원 탈퇴
    public void deleteMember(int mem_num){
        Connection conn = null;
        PreparedStatement pstmt = null;
        String sql = null;
        
        try {
            conn = DBUtil.getConnection();
            sql = "DELETE FROM member WHERE MEMBER_ID=?";
            
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, mem_num);
            
            pstmt.executeUpdate();
            
        } catch (Exception e) {
			e.printStackTrace();
		} finally {
            DBUtil.executeClose(null, pstmt, conn);
        }
    }
    
    // 아이디 찾기
    public String findId(String mem_name, String mem_email){
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql = null;
        String mem_id = null;
        
        try {
            conn = DBUtil.getConnection();
            sql = "SELECT USER_ID FROM MEMBER WHERE name=? AND email=?";
            
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, mem_name);
            pstmt.setString(2, mem_email);
            
            rs = pstmt.executeQuery();
            if(rs.next()) {
                mem_id = rs.getString(1);
            }
            
        } catch (Exception e) {
			e.printStackTrace();
		} finally {
            DBUtil.executeClose(rs, pstmt, conn);
        }
        
        return mem_id;
    }
    
    // 비밀번호 찾기를 위한 회원 확인
    public boolean checkMemberForPw(String mem_id, String mem_email){
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql = null;
        boolean result = false;
        
        try {
            conn = DBUtil.getConnection();
            sql = "SELECT COUNT(*) FROM member WHERE USER_ID=? AND EMAIL=?";
            
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, mem_id);
            pstmt.setString(2, mem_email);
            
            rs = pstmt.executeQuery();
            if(rs.next()) {
                if(rs.getInt(1) > 0) result = true;
            }
            
        } catch (Exception e) {
			e.printStackTrace();
		} finally {
            DBUtil.executeClose(rs, pstmt, conn);
        }
        
        return result;
    }

    
    // 쿠폰 가져오기
	public List<MemberVO> getMemberCPPossessList() {
		
		 Connection conn = null;
         PreparedStatement pstmt = null;
         ResultSet rs = null;
         MemberVO member = null;
         String sql = null;
         List<MemberVO> result = new ArrayList<>();
         
         try {
			
        	 conn = DBUtil.getConnection();
        	 sql = "";
        	 pstmt = conn.prepareStatement(sql);
        	 
        	 
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.executeClose(rs, pstmt, conn);
		}
		
		return null;
	}
	
	// 포인트 사용
	public void usePoint(int memberId, int usedPoint) throws Exception {
	    Connection conn = null;
	    PreparedStatement pstmt = null;
	    try {
	        conn = DBUtil.getConnection();
	        String sql = "UPDATE MEMBER SET POINT = POINT - ? WHERE MEMBER_ID = ?";
	        pstmt = conn.prepareStatement(sql);
	        pstmt.setInt(1, usedPoint);
	        pstmt.setInt(2, memberId);
	        pstmt.executeUpdate();
	    } finally {
	        DBUtil.executeClose(null, pstmt, conn);
	    }
	}

	// 포인트 적립
	
	public void addPoint(int memberId, int earnedPoint) throws Exception {
	    Connection conn = DBUtil.getConnection();
	    String sql = "UPDATE member SET point = point + ? WHERE member_id = ?";
	    PreparedStatement pstmt = conn.prepareStatement(sql);
	    pstmt.setInt(1, earnedPoint);
	    pstmt.setInt(2, memberId);
	    pstmt.executeUpdate();
	    
	    pstmt.close();
	    conn.close();
	}
	

	public void changeStatus(Long memberId) {
		
		 Connection conn = null;
	    PreparedStatement pstmt = null;
	    try {
	        conn = DBUtil.getConnection();
	        String sql = "UPDATE MEMBER SET GRADE = "
	        		+ "	CASE"
	        		+ "	WHEN GRADE = '정지' THEN '안정지'"
	        		+ " ELSE '정지'"
	        		+ " END"
	        		+ " WHERE MEMBER_ID = ?";
	        pstmt = conn.prepareStatement(sql);
	        pstmt.setLong(1, memberId);
	        pstmt.executeUpdate();
	    } catch (Exception e) {
			e.printStackTrace();
		} finally {
	        DBUtil.executeClose(null, pstmt, conn);
	    }
		
	}


}


