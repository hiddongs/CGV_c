package kr.admin.schedule;

import java.io.IOException;

import org.codehaus.jackson.map.ObjectMapper;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.controller.Action;
import kr.schedule.dao.ScheduleDAO;

public class ScheduleExtensionAction implements Action{

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int result = ScheduleDAO.getInstance().dateExtension();
		ObjectMapper mapper = new ObjectMapper();
		
		if(result <= 0 ) {
			mapper.writeValue(resp.getWriter(), "failed");
		}else {
			mapper.writeValue(resp.getWriter(), "success");
		}
		return null;
	}

}
