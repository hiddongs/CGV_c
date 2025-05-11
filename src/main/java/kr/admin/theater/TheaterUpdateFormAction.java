package kr.admin.theater;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.controller.Action;
import kr.theater.dao.TheaterDAO;
import kr.theater.vo.TheaterVO;

public class TheaterUpdateFormAction implements Action{

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		Long theater_id = Long.parseLong(req.getParameter("theater_id"));
		TheaterVO vo = TheaterDAO.getInstance().getTheater(theater_id);
		
		req.setAttribute("theater", vo);
		
		return "admin/theater/updateTheater.jsp";
	}

}
