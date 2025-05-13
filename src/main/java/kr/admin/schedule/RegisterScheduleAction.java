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

public class RegisterScheduleAction implements Action {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 관리자 체크
		if(!CodeUtil.isAdmin(req)) {
			return "redirect:/main/main.do";
		}
		
		// 파라미터 가져오기
		Long theaterId = null;
		Long auditoriumId = null;
		Long movieId = null;
		Long slotId = null;
		Date screeningDate = null;
		boolean isAvailable = true; // 기본값은 true
		
		try {
			theaterId = Long.parseLong(req.getParameter("theaterId"));
			auditoriumId = Long.parseLong(req.getParameter("auditoriumId"));
			movieId = Long.parseLong(req.getParameter("movieId"));
			slotId = Long.parseLong(req.getParameter("slotId"));
			
			// 날짜 형식 변환
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			screeningDate = sdf.parse(req.getParameter("screeningDate"));
			
			// 유효 여부 파라미터가 있는 경우에만 설정
			if(req.getParameter("isAvailable") != null) {
				isAvailable = Boolean.parseBoolean(req.getParameter("isAvailable"));
			}
		} catch (NumberFormatException | ParseException e) {
			e.printStackTrace();
			req.setAttribute("result_message", "입력 데이터를 확인해주세요.");
			req.setAttribute("result_url", "registerScheduleForm.do");
			return "/common/result_view.jsp";
		}
		
		// ScheduleVO 객체 생성 및 설정
		ScheduleVO schedule = new ScheduleVO();
		schedule.setTheaterId(theaterId);
		schedule.setAuditoriumId(auditoriumId);
		schedule.setMovieId(movieId);
		schedule.setSlotId(slotId);
		schedule.setScreeningDate(screeningDate);
		schedule.setAvailable(isAvailable);
		
		// 스케줄 등록
		int result = ScheduleDAO.getInstance().insertSchedule(schedule);
		
		if(result > 0) {
			// 등록 성공
			req.setAttribute("result_message", "스케줄이 성공적으로 등록되었습니다.");
			req.setAttribute("result_url", "scheduleManagement.do?theaterId=" + theaterId);
		} else {
			// 등록 실패
			req.setAttribute("result_message", "스케줄 등록에 실패했습니다.");
			req.setAttribute("result_url", "registerScheduleForm.do");
		}
		
		return "/common/result_view.jsp";
	}
}
