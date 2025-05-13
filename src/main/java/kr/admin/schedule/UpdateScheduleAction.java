package kr.admin.schedule;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.controller.Action;
import kr.schedule.dao.ScheduleDAO;
import kr.schedule.vo.ScheduleVO;
import kr.util.CodeUtil;

public class UpdateScheduleAction implements Action {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		if (!CodeUtil.isAdmin(req)) {
			return "/common/notice.jsp";
		}
		
		if (!req.getMethod().equalsIgnoreCase("POST")) {
			req.setAttribute("message", "잘못된 접근입니다.");
			req.setAttribute("url", "scheduleManagement.do");
			return "/common/alert_singlebutton.jsp";
		}
		
		Long scheduleId = null;
		Long theaterId = null;
		Long auditoriumId = null;
		Long movieId = null;
		Long slotId = null;
		Date screeningDate = null;
		boolean isAvailable = false;
		
		try {
			scheduleId = Long.parseLong(req.getParameter("scheduleId"));
			theaterId = Long.parseLong(req.getParameter("theaterId"));
			auditoriumId = Long.parseLong(req.getParameter("auditoriumId"));
			movieId = Long.parseLong(req.getParameter("movieId"));
			slotId = Long.parseLong(req.getParameter("slotId"));
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			screeningDate = sdf.parse(req.getParameter("screeningDate"));
			
			isAvailable = Boolean.parseBoolean(req.getParameter("isAvailable"));
		} catch (NumberFormatException | ParseException e) {
			e.printStackTrace();
			req.setAttribute("message", "입력 데이터를 확인해주세요.");
			req.setAttribute("url", "updateScheduleForm.do?scheduleId=" + scheduleId);
			return "/common/alert_singlebutton.jsp";
		}
		
		// ScheduleVO 객체 생성 및 설정
		ScheduleVO schedule = new ScheduleVO();
		schedule.setScheduleId(scheduleId);
		schedule.setTheaterId(theaterId);
		schedule.setAuditoriumId(auditoriumId);
		schedule.setMovieId(movieId);
		schedule.setSlotId(slotId);
		schedule.setScreeningDate(screeningDate);
		schedule.setAvailable(isAvailable);
		
		// 스케줄 업데이트
		int result = ScheduleDAO.getInstance().updateSchedule(schedule);
		
		if (result > 0) {
			// 업데이트 성공
			req.setAttribute("message", "스케줄이 성공적으로 수정되었습니다.");
			req.setAttribute("url", "scheduleManagement.do?theaterId=" + theaterId);
		} else {
			// 업데이트 실패
			req.setAttribute("message", "스케줄 수정에 실패했습니다.");
			req.setAttribute("url", "updateScheduleForm.do?scheduleId=" + scheduleId);
		}
		
		return "/common/alert_singlebutton.jsp";
	}
}
