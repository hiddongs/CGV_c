package kr.admin.schedule;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.controller.Action;
import kr.schedule.dao.ScheduleDAO;
import kr.schedule.vo.ScheduleDetailVO;
import kr.util.CodeUtil;

public class UpdateScheduleFormAction implements Action {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 관리자 체크
		if(!CodeUtil.isAdmin(req)) {
			return "/common/notice.jsp";
		}
		
		// 스케줄 ID 파라미터 가져오기
		Long scheduleId = null;
		try {
			scheduleId = Long.parseLong(req.getParameter("scheduleId"));
		} catch (NumberFormatException e) {
			req.setAttribute("message", "잘못된 스케줄 ID입니다.");
			req.setAttribute("url", "scheduleManagement.do");
			return "/common/alert_singlebutton.jsp";
		}
		
		// 스케줄 상세 정보 조회
		ScheduleDetailVO schedule = ScheduleDAO.getInstance().getScheduleDetail(scheduleId);
		
		if (schedule == null) {
			req.setAttribute("message", "존재하지 않는 스케줄입니다.");
			req.setAttribute("url", "scheduleManagement.do");
			return "/common/alert_singlebutton.jsp";
		}
		
		// 요청 속성에 스케줄 정보 설정
		req.setAttribute("schedule", schedule);
		
		return "/admin/schedule/updateScheduleForm.jsp";
	}
}
