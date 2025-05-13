package kr.slot.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Time;
import java.util.ArrayList;
import java.util.List;

import kr.slot.vo.SlotVO;
import kr.util.DBUtil;

public class SlotDAO {
	
	private SlotDAO() {}
	
	private static SlotDAO instance = null;
	
	public static SlotDAO getInstance() {
		if(instance == null) instance = new SlotDAO();
		return instance;
	}
	
	public List<SlotVO> getSlotList (){
		
		Connection conn = null;
		String sql = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<SlotVO> result = new ArrayList<>();
		try {
			conn = DBUtil.getConnection();
			sql = "SELECT * FROM SLOT ORDER BY START_TIME";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				do {
					SlotVO vo = new SlotVO();
					vo.setSlotId(rs.getLong("slot_id"));
					vo.setStartTime(new Time(rs.getDate("start_time").getTime()));
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
