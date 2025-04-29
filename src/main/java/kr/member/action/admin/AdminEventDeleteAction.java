package kr.member.action.admin;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import kr.controller.Action;
import kr.event.dao.EventDAO;
import kr.member.vo.MemberVO;
import kr.util.CodeUtil;
import kr.util.FileUtil;

public class AdminEventDeleteAction implements Action{

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		if(!CodeUtil.isAdmin(req)) {
			return "redirect:/main/main.do";
		}
		
		Long event_id = Long.parseLong(req.getParameter("event_id"));
		String poster_url = req.getParameter("poster_url");
		FileUtil.removeFile(req, poster_url);
		
		int result = EventDAO.getInstance().deleteEvent(event_id);
		
		if(result == 1) {
			req.setAttribute("result_title", "이벤트 삭제 완료");
			req.setAttribute("result_msg", "이벤트 삭제가 완료되었습니다.");
			req.setAttribute("result_url", "adminMain.do");
			return "common/result_view.jsp";
		}else {
			req.setAttribute("result_title", "이벤트 삭제 실패");
			req.setAttribute("result_msg", "이벤트 삭제가 실패했습니다.");
			req.setAttribute("result_url", "adminMain.do");
			return "common/result_view.jsp";
		}
	}
}
