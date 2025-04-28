package kr.member.action.admin;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.controller.Action;
import kr.event.dao.EventDAO;
import kr.event.vo.EventVO;

public class AdminEventDetailAction implements Action{

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int event_id = Integer.parseInt(req.getParameter("event_id"));
		EventVO event = EventDAO.getInstance().getEvent(event_id);
		req.setAttribute("event", event);
		return "member/adminEventDetail.jsp";
	}

}
