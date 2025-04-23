package kr.main.action;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.controller.Action;
import kr.movie.dao.MovieDAO;
import kr.movie.vo.MovieVO;

public class MainAction implements Action{

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		MovieVO movieVO = new MovieVO();
		MovieDAO movieDAO = MovieDAO.getInstance();
		List<MovieVO> list = movieDAO.getShowingMovieList();
		List<MovieVO> releaseList = movieDAO.getReleaseMovieList();
		
		req.setAttribute("list", list);
		req.setAttribute("releaseList", releaseList);
		
		return "main/main.jsp";
	}

}
