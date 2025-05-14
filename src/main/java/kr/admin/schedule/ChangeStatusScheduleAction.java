package kr.admin.schedule;

import java.io.IOException;
import java.util.List;

import org.codehaus.jackson.map.ObjectMapper;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.controller.Action;
import kr.schedule.dao.ScheduleDAO;
import kr.schedule.vo.ScheduleDetailVO;

public class ChangeStatusScheduleAction implements Action{

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		Long scheduleId = Long.parseLong(req.getParameter("scheduleId"));
		ScheduleDAO dao = ScheduleDAO.getInstance();
		int result = dao.changeStatus(scheduleId);
		
		Long theaterId = Long.parseLong(req.getParameter("theaterId"));
		List<ScheduleDetailVO> scheduleList = null;
		if(result > 0) {
			scheduleList = dao.getDetailScheduleList(theaterId);
		}
		resp.setContentType("application/json;charset=UTF-8");
		
		ObjectMapper mapper = new ObjectMapper();
		mapper.writeValue(resp.getWriter(), scheduleList);
		
		return null;
	}

}
