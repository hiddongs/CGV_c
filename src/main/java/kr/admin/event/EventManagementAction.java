package kr.admin.event;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.controller.Action;
import kr.event.dao.EventDAO;
import kr.event.vo.EventVO;
import kr.util.CodeUtil;

public class EventManagementAction implements Action {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		if(!CodeUtil.isAdmin(req)) {
			return "redirect:/main/main.do";
		}
		
		EventDAO dao = EventDAO.getInstance();
		List<EventVO> events = dao.getEveryEvent();
		
		req.setAttribute("events", events);
		return "admin/event/eventManagement.jsp";
	}

}
