package kr.admin.schedule;

import java.io.IOException;
import java.util.List;

import org.codehaus.jackson.map.ObjectMapper;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.controller.Action;
import kr.schedule.dao.ScheduleDAO;
import kr.schedule.vo.ScheduleVO;

public class GetAvailableScheduleDateAction implements Action{

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		Long movieId = Long.parseLong(req.getParameter("movieId"));
		Long auditoriumId = Long.parseLong(req.getParameter("auditoriumId"));
		
		List<ScheduleVO> list = ScheduleDAO.getInstance().getAvailableScreeningDate(auditoriumId, movieId);
		ObjectMapper mapper = new ObjectMapper();
		
		mapper.writeValue(resp.getWriter(), list);
		
		return null;
	}

}
