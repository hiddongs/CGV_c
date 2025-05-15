package kr.pointLog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import kr.coupon.dao.CouponDAO;
import kr.util.DBUtil;

public class PointLogDAO {
    private static PointLogDAO instance;
	
	private PointLogDAO() {}
	
	public static PointLogDAO getInstance(){
		if(instance == null) {
			instance = new PointLogDAO();
		}
		return instance;
	} 	
	public void insertLog(int memberId, int amount, String reason) throws Exception {
	    Connection conn = DBUtil.getConnection();
	    String sql = "INSERT INTO point_log (log_id, member_id, amount, reason, log_date) VALUES (point_log_seq.NEXTVAL, ?, ?, ?, SYSDATE)";
	    PreparedStatement pstmt = conn.prepareStatement(sql);
	    pstmt.setInt(1, memberId);
	    pstmt.setInt(2, amount);
	    pstmt.setString(3, reason);
	    pstmt.executeUpdate();
	    
	    pstmt.close();
	    conn.close();
	}

}
