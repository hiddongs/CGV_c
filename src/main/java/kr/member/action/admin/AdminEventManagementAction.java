package kr.member.action.admin;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import kr.controller.Action;
import kr.event.dao.EventDAO;
import kr.event.vo.EventVO;
import kr.member.vo.MemberVO;
import kr.util.CodeUtil;

public class AdminEventManagementAction implements Action{

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		if(!CodeUtil.isAdmin(req)) {
			return "redirect:/main/main.do";
		}
		
		EventDAO dao = EventDAO.getInstance();
		List<EventVO> everyList = dao.getEveryEvent();
		req.setAttribute("eventList", everyList);
		return "member/admin/adminEventManagement.jsp";
	}

}
