package kr.schedule.action;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.controller.Action;
import kr.schedule.dao.ScheduleDAO;
import kr.schedule.vo.ScheduleVO;

public class ScheduleListAction implements Action{

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ScheduleDAO scheduleDAO = ScheduleDAO.getInstance();
		int movieID = Integer.parseInt(req.getParameter("movieID"));
		int theaterID=Integer.parseInt(req.getParameter("theaterID"));
		
		List<ScheduleVO> scheduleList = scheduleDAO.getScheduleList(movieID,theaterID);
		
		req.setAttribute("scheduleList", scheduleList);
		req.setAttribute("movieID", movieID);
		req.setAttribute("theaterID", theaterID);
		return "theater/selectTime.jsp";  // redirect 말고 forward

	}

}
