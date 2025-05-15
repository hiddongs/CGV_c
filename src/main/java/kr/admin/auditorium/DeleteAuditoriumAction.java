package kr.admin.auditorium;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.auditorium.dao.AuditoriumDAO;
import kr.controller.Action;

public class DeleteAuditoriumAction implements Action{

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		Long auditoriumId = Long.parseLong(req.getParameter("auditoriumId"));
		
		int result = AuditoriumDAO.getInstance().deleteAuditorium(auditoriumId);
		
		if(result == 1) {
			req.setAttribute("result_title", "상영관 삭제 성공");
			req.setAttribute("result_message", "상영관 삭제가 성공했습니다.");
			req.setAttribute("result_url", "theaterManagement.do");
		}else {
			req.setAttribute("result_title", "상영관 삭제 실패");
			req.setAttribute("result_message", "상영관 삭제가 실패했습니다.");
			req.setAttribute("result_url", "theaterManagement.do");
		}
		return "common/result_view.jsp";
	}

}
