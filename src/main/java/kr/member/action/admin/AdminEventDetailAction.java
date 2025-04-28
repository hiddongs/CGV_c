package kr.member.action.admin;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import kr.controller.Action;
import kr.event.dao.EventDAO;
import kr.event.vo.EventVO;
import kr.member.vo.MemberVO;

public class AdminEventDetailAction implements Action{

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		HttpSession session = req.getSession();
		MemberVO member = (MemberVO)session.getAttribute("member");
		if(member.getMember_id() != 1)	return "redirect:/main/main.do";
		
		int event_id = Integer.parseInt(req.getParameter("event_id"));
		EventVO event = EventDAO.getInstance().getEvent(event_id);
		req.setAttribute("event", event);
		return "member/adminEventDetail.jsp";
	}

}
