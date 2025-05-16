package kr.movie.action;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.controller.Action;
import kr.event.dao.EventDAO;
import kr.event.vo.EventVO;
import kr.movie.dao.MovieDAO;
import kr.movie.vo.MovieVO;

public class MoviePageAction implements Action {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		MovieDAO movieDAO = MovieDAO.getInstance();
		EventDAO eventDAO = EventDAO.getInstance();		
		List<MovieVO> list = movieDAO.getShowingMovieList();
		System.out.println("파일경로 : " + req.getServletContext());
		System.out.println("상영중 영화 수: " + list.size());
		
		req.setAttribute("list", list);
		for (MovieVO m : list) {
		    System.out.println("영화 설명: " + m.getDescription());
		}

		return "movie/moviePage.jsp";
	}

	
}
