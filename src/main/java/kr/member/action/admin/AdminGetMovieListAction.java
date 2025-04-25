package kr.member.action.admin;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.codehaus.jackson.map.ObjectMapper;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.controller.Action;
import kr.movie.dao.MovieDAO;
import kr.movie.vo.MovieVO;

public class AdminGetMovieListAction implements Action{

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String order = req.getParameter("order");
		
		MovieDAO movieDAO = MovieDAO.getInstance();
		
		List<MovieVO> result = new ArrayList<>();
		
		if(order.equals("all")) result = movieDAO.getEveryMovieList();
		else if(order.equals("showing")) result = movieDAO.getShowingMovieList();
		else if (order.equals("release")) result = movieDAO.getReleaseMovieList();
		
		resp.setContentType("application/json");
		resp.setCharacterEncoding("UTF-8");
		
		ObjectMapper mapper = new ObjectMapper();
		mapper.writeValue(resp.getWriter(), result);
		
		return "common/ajax_view.jsp";
	}

}
