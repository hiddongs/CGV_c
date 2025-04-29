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
import kr.util.CodeUtil;
import kr.util.DBUtil;
import kr.util.FileUtil;

public class AdminInsertEventAction implements Action{

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		if(!CodeUtil.isAdmin(req)) {
			return "redirect:/main/main.do";
		}
		
		EventVO event = new EventVO();
		
		event.setTitle(req.getParameter("title"));
		event.setContent(req.getParameter("content"));
		event.setStart_date(DBUtil.toSqlDate(req.getParameter("start_date")));
		event.setEnd_date(DBUtil.toSqlDate(req.getParameter("end_date")));
		event.setType(req.getParameter("type"));
		
		String posterFileName = FileUtil.uploadFile(req, "poster_url");
		
		event.setPoster_url(posterFileName);
		EventDAO dao = EventDAO.getInstance();
		int result = dao.insertEvent(event);
		
		if(result == 1) {
			req.setAttribute("result_title", "이벤트 등록 완료");
			req.setAttribute("result_msg", "이벤트 등록이 완료되었습니다.");
			req.setAttribute("result_url", "adminMain.do");
			return "common/result_view.jsp";
		}else {
			req.setAttribute("result_title", "이벤트 등록 실패");
			req.setAttribute("result_msg", "이벤트 등록이 실패했습니다.");
			req.setAttribute("result_url", "adminMain.do");
			return "common/result_view.jsp";
		}
	}
}
