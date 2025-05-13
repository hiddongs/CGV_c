package kr.admin.movie;

import java.io.IOException;
import java.util.List;

import org.codehaus.jackson.map.ObjectMapper;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.controller.Action;
import kr.movie.vo.MovieVO;
import kr.schedule.dao.ScheduleDAO;

public class GetAvailableTypeMovieListAction implements Action{
	// 상영관과 극장ID에 맞는 영화목록 받아오는 함수

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		Long auditoriumId = Long.parseLong(req.getParameter("auditoriumId"));
		List<MovieVO> availableMovieList = ScheduleDAO.getInstance().getAvailableMovieList(auditoriumId);
		
		ObjectMapper mapper = new ObjectMapper();
		mapper.writeValue(resp.getWriter(), availableMovieList);
		
		return null;
	}

}
