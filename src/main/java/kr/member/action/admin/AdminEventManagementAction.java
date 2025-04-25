package kr.member.action.admin;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.controller.Action;
import kr.event.dao.EventDAO;
import kr.event.vo.EventVO;

public class AdminEventManagementAction implements Action{

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		EventDAO dao = EventDAO.getInstance();
		List<EventVO> everyList = dao.getEveryEvent();
		req.setAttribute("eventList", everyList);
		return "member/adminEventManagement.jsp";
	}

}
