package kr.notice.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import kr.notice.vo.NoticeVO;
import kr.util.DBUtil;

public class NoticeDAO {
	
	private static NoticeDAO instance = null;
	
	private NoticeDAO () {}
	
	public static NoticeDAO getInstance() {
		if(instance == null) instance = new NoticeDAO();
		return instance;
	}

	public List<NoticeVO> getEveryNotice() {
		
		Connection conn= null;
		String sql = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<NoticeVO> result = new ArrayList<>();
		
		try {
			conn = DBUtil.getConnection();
			sql = "SELECT * FROM NOTICE";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				do {
					NoticeVO vo = new NoticeVO();
					vo.setNoticeId(rs.getLong("NOTICE_ID"));
					vo.setContent(rs.getString("CONTENT"));
					vo.setTitle(rs.getString("TITLE"));
					vo.setReg_date(rs.getDate("REG_DATE"));
					vo.setType(rs.getString("TYPE"));
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
	
}
