package kr.admin.event;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.controller.Action;
import kr.event.dao.EventDAO;
import kr.event.vo.EventVO;
import kr.util.CodeUtil;
import kr.util.FileUtil;

public class EventDeleteAction implements Action {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		if(!CodeUtil.isAdmin(req)) {
			return "redirect:/main/main.do";
		}
		
		long event_id = Long.parseLong(req.getParameter("event_id"));
		
		EventDAO dao = EventDAO.getInstance();
		EventVO event = dao.getEvent(event_id);
		
		if(event == null) {
			req.setAttribute("result_title", "이벤트 삭제 실패");
			req.setAttribute("result_message", "이벤트 삭제가 실패했습니다.");
			req.setAttribute("result_url", "eventManagement.do");
			return "common/result_view.jsp";
		}
		
		String poster_url = event.getPoster_url();
		
		int result = dao.deleteEvent(event_id);
		
		if(result == 1) {
			if(poster_url != null && !poster_url.isEmpty()) {
				FileUtil.removeFile(req, poster_url);
			}
			req.setAttribute("result_title", "이벤트 삭제 성공");
			req.setAttribute("result_message", "이벤트 삭제가 성공했습니다.");
			req.setAttribute("result_url", "eventManagement.do");
		} else {
			req.setAttribute("result_title", "이벤트 삭제 실패");
			req.setAttribute("result_message", "이벤트 삭제가 실패했습니다.");
			req.setAttribute("result_url", "eventManagement.do");
		}
		
		return "common/result_view.jsp";
	}

}
