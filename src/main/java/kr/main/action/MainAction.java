package kr.main.action;

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

public class MainAction implements Action{

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		MovieDAO movieDAO = MovieDAO.getInstance();
		EventDAO eventDAO = EventDAO.getInstance();
		
		List<MovieVO> list = movieDAO.getShowingMovieList();
		List<MovieVO> releaseList = movieDAO.getReleaseMovieList();
		List<EventVO> ongoingEventList = eventDAO.getOngoingEvent();
		

		System.out.println("파일경로 : " + req.getServletContext());
		System.out.println("상영중 영화 수: " + list.size());
		System.out.println("개봉예정 영화 수: " + releaseList.size());

		req.setAttribute("list", list);
		req.setAttribute("releaseList", releaseList);
		req.setAttribute("ongoingEventList", ongoingEventList);
		
		return "main/main.jsp";
	}

}
