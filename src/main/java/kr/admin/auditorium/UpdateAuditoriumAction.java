package kr.admin.auditorium;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.auditorium.dao.AuditoriumDAO;
import kr.auditorium.vo.AuditoriumVO;
import kr.controller.Action;

public class UpdateAuditoriumAction implements Action{

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		AuditoriumVO vo = new AuditoriumVO();
		vo.setAuditoriumId(Long.parseLong(req.getParameter("auditoriumId")));
		vo.setTheaterId(Long.parseLong(req.getParameter("theaterId")));
		vo.setName(req.getParameter("name"));
		vo.setType(req.getParameter("type"));
		
		int result = AuditoriumDAO.getInstance().updateAuditorium(vo);
		
		if(result == 1) {
			req.setAttribute("result_title", "상영관 수정 성공");
			req.setAttribute("result_message", "상영관 수정이 성공했습니다.");
			req.setAttribute("result_url", "main.do");
		}else {
			req.setAttribute("result_title", "상영관 수정 실패");
			req.setAttribute("result_message", "상영관 수정이 실패했습니다.");
			req.setAttribute("result_url", "main.do");
		}
		return "common/result_view.jsp";
	}

}
