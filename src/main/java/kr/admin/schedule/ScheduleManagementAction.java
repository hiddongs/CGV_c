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

public class ScheduleManagementAction implements Action{

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		Long theaterId = Long.parseLong(req.getParameter("theaterId"));
		
		List<ScheduleDetailVO> scheduleList = ScheduleDAO.getInstance().getDetailScheduleList(theaterId);
		
		ObjectMapper mapper = new ObjectMapper();
		String jsonScheduleList = mapper.writeValueAsString(scheduleList);
		req.setAttribute("scheduleList", jsonScheduleList);
		
		return "admin/schedule/scheduleManagement.jsp";
	}

}
