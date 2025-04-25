package kr.movie.action;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.controller.Action;
import kr.movie.dao.MovieDAO;
import kr.movie.vo.MovieVO;
import kr.theater.dao.TheaterDAO;
import kr.theater.vo.TheaterVO;

public class RealMVreservationAction implements Action {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		MovieDAO movieDAO = new MovieDAO();
		TheaterDAO theaterDAO = new TheaterDAO();
		try {
			List<MovieVO> movieList = movieDAO.getShowingMovieList();
			req.setAttribute("movieList", movieList);
			List<TheaterVO> theaterList = theaterDAO.getTheaterList();
			req.setAttribute("theaterList", theaterList);

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
        return "movie/realMVreservation.jsp";
	}

}
