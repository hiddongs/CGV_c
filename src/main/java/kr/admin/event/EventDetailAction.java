package kr.admin.event;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.controller.Action;
import kr.event.dao.EventDAO;
import kr.event.vo.EventVO;
import kr.util.CodeUtil;

public class EventDetailAction implements Action {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		if(!CodeUtil.isAdmin(req)) {
			return "redirect:/main/main.do";
		}
		
		Long event_id = Long.parseLong(req.getParameter("event_id"));
		EventVO event = EventDAO.getInstance().getEvent(event_id);
		req.setAttribute("event", event);
		return "admin/event/eventDetail.jsp";
	}
}
