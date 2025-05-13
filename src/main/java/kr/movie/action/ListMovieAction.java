package kr.movie.action;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.controller.Action;
import kr.event.dao.EventDAO;
import kr.movie.dao.MovieDAO;
import kr.movie.vo.MovieVO;

public class ListMovieAction implements Action{

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		MovieDAO movieDAO = MovieDAO.getInstance();
		List<MovieVO> releaseList = movieDAO.getReleaseMovieList();
		String align = req.getParameter("align");
		if (align == null) align = "1"; // 기본 정렬: 가나다순
		List<MovieVO> list = movieDAO.getShowingMovieAlignList(align);
		
		
		
        System.out.println("파일경로 : " + req.getServletContext());
        req.setAttribute("movieList", list);  // 추가
		
		req.setAttribute("releaseList", releaseList);
		return "movie/reservationMV.jsp";
	}

}
