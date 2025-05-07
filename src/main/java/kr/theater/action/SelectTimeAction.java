package kr.theater.action;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.controller.Action;
import kr.schedule.dao.ScheduleDAO;
import kr.schedule.vo.ScheduleVO;

public class SelectTimeAction implements Action {

	public String execute(HttpServletRequest req, HttpServletResponse resp) {
	    try {
	        String movieIDStr = req.getParameter("movieID");
	        String theaterIDStr = req.getParameter("theaterID");
	        String auditoriumIDStr = req.getParameter("auditoriumID");
	        String screenDate = req.getParameter("screenDate");
	        System.out.println("[DEBUG] 파라미터 체크 전 로그 출력");
	        System.out.println("movieIDStr = " + movieIDStr);
	        System.out.println("theaterIDStr = " + theaterIDStr);
	        System.out.println("auditoriumIDStr = " + auditoriumIDStr);
	        System.out.println("screenDate = " + screenDate);
	        // 필수 파라미터 체크
	        if (movieIDStr == null || theaterIDStr == null || auditoriumIDStr == null ||
	            movieIDStr.isEmpty() || theaterIDStr.isEmpty() || auditoriumIDStr.isEmpty()) {
	            req.setAttribute("errorMsg", "영화, 극장, 상영관 정보가 누락되었습니다.");
	            return "error/invalidParameter.jsp";
	        }

	        int movieID = Integer.parseInt(movieIDStr);
	        int theaterID = Integer.parseInt(theaterIDStr);
	        int auditoriumID = Integer.parseInt(auditoriumIDStr);

	        if (screenDate == null || screenDate.isEmpty()) {
	            screenDate = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
	        }

	        ScheduleDAO dao = ScheduleDAO.getInstance();
	        List<ScheduleVO> scheduleList = dao.getScheduleListByDate(movieID, theaterID, auditoriumID, screenDate);

	        // 로그 확인
	        System.out.println("영화 ID: " + movieID);
	        System.out.println("극장 ID: " + theaterID);
	        System.out.println("상영관 ID: " + auditoriumID);
	        System.out.println("선택 날짜: " + screenDate);
	        System.out.println("조회된 스케줄 수: " + scheduleList.size());

	        req.setAttribute("movieID", movieID);
	        req.setAttribute("theaterID", theaterID);
	        req.setAttribute("auditoriumID", auditoriumID);
	        req.setAttribute("screenDate", screenDate);
	        req.setAttribute("scheduleList", scheduleList);

	        return "theater/selectTime.jsp";

	    } catch (Exception e) {
	        e.printStackTrace();
	        req.setAttribute("errorMsg", "시스템 오류가 발생했습니다.");
	        return "error/invalidParameter.jsp";
	    }
	}
}
