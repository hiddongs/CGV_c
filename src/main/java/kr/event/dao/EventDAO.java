package kr.event.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import kr.event.vo.EventVO;
import kr.util.DBUtil;

public class EventDAO {
	
	private static EventDAO instance = null;
	
	//Singleton Pattern
	public static EventDAO getInstance() {
		if(instance == null) {
			instance = new EventDAO();
		}
		return instance;
	}
	
	//이벤트 모두 가져오는거
	public List<EventVO> getEveryEvent() {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		List<EventVO> result = new ArrayList<EventVO>();
		
		try {
			conn = DBUtil.getConnection();
			sql = "SELECT * FROM EVENT ORDER BY END_DATE DESC";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				do {
					EventVO event = new EventVO();
					event.setEvent_id(rs.getLong("EVENT_ID"));
					event.setTitle(rs.getString("TITLE"));
					event.setContent(rs.getString("CONTENT"));
					event.setStart_date(rs.getDate("START_DATE"));
					event.setEnd_date(rs.getDate("END_DATE"));
					event.setType(rs.getString("TYPE"));	
					event.setPoster_url(rs.getString("POSTER_URL"));
					result.add(event);
				}while(rs.next());
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.executeClose(rs, pstmt, conn);
		}
		return result;
	}
	
		public List<EventVO> getOngoingEvent() {
		
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = null;
			List<EventVO> result = new ArrayList<EventVO>();
			
			try {
				conn = DBUtil.getConnection();
				sql = "SELECT * FROM EVENT WHERE END_DATE >= SYSDATE ORDER BY END_DATE DESC";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					do {
						EventVO event = new EventVO();
						event.setEvent_id(rs.getLong("EVENT_ID"));
						event.setTitle(rs.getString("TITLE"));
						event.setContent(rs.getString("CONTENT"));
						event.setStart_date(rs.getDate("START_DATE"));
						event.setEnd_date(rs.getDate("END_DATE"));
						event.setType(rs.getString("TYPE"));
						event.setPoster_url(rs.getString("POSTER_URL"));
						result.add(event);
					}while(rs.next());
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				DBUtil.executeClose(rs, pstmt, conn);
			}
			return result;
		}
	
	// 이벤트 생성 (어드민)
	public int insertEvent(EventVO event) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		int cnt = 0 ;
		int result = 0;
		try {
			conn = DBUtil.getConnection();
			sql = "INSERT INTO EVENT VALUES(EVENT_SEQ.NEXTVAL, ?, ?, ?, ?, ? , ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(++cnt, event.getTitle());
			pstmt.setString(++cnt, event.getContent());
			pstmt.setDate(++cnt, (Date) event.getStart_date());
			pstmt.setDate(++cnt, (Date) event.getEnd_date());
			pstmt.setString(++cnt, event.getType());
			pstmt.setString(++cnt, event.getPoster_url());
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.executeClose(null, pstmt, conn);
		}
		return result;
	}
}
