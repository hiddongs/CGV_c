package kr.admin.movie;

import java.io.IOException;
import java.util.List;

import org.codehaus.jackson.map.ObjectMapper;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.controller.Action;
import kr.movie.dao.MovieDAO;
import kr.movie.vo.MovieVO;
import kr.util.CodeUtil;

public class MovieManagementAction implements Action {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		if(!CodeUtil.isAdmin(req)) {
			return "redirect:/main/main.do";
		}
		
		MovieDAO movieDAO = MovieDAO.getInstance();
		
		List<MovieVO> everyMovieList = movieDAO.getEveryMovieList();
		List<MovieVO> showingMovieList = movieDAO.getShowingMovieList();
		List<MovieVO> releaseMovieList = movieDAO.getReleaseMovieList();
		String json = null;
		ObjectMapper mapper = new ObjectMapper();
		json = mapper.writeValueAsString(everyMovieList);
		req.setAttribute("everyMovieList", json);
		json = mapper.writeValueAsString(showingMovieList);
		req.setAttribute("showingMovieList", json);
		json = mapper.writeValueAsString(releaseMovieList);
		req.setAttribute("releaseMovieList", json);
		
		return "admin/movie/movieManagement.jsp";
	}

}
