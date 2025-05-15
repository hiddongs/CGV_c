package kr.admin.schedule;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.controller.Action;
import kr.schedule.dao.ScheduleDAO;
import kr.util.CodeUtil;

public class DeleteScheduleAction implements Action {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 관리자 체크
		if(!CodeUtil.isAdmin(req)) {
			resp.sendError(HttpServletResponse.SC_FORBIDDEN);
			return null;
		}
		
		// AJAX 요청 처리
		resp.setContentType("text/plain; charset=UTF-8");
		
		// 스케줄 ID 파라미터 가져오기
		Long scheduleId = null;
		try {
			scheduleId = Long.parseLong(req.getParameter("scheduleId"));
		} catch (NumberFormatException e) {
			resp.getWriter().write("실패: 잘못된 스케줄 ID입니다.");
			return null;
		}
		
		// 스케줄 삭제 처리
		int result = ScheduleDAO.getInstance().deleteSchedule(scheduleId);
		
		if(result > 0) {
			// 삭제 성공
			resp.getWriter().write("성공: 스케줄이 삭제되었습니다.");
		} else {
			// 삭제 실패
			resp.getWriter().write("실패: 스케줄 삭제에 실패했습니다.");
		}
		
		return null; // AJAX 응답이므로 뷰 반환 없음
	}
}
