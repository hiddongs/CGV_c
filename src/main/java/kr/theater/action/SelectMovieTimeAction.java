package kr.theater.action;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.controller.Action;
import kr.movie.dao.MovieDAO;
import kr.movie.vo.MovieVO;
import kr.schedule.dao.ScheduleDAO;
import kr.schedule.vo.ScheduleVO;
import kr.theater.dao.TheaterDAO;
import kr.theater.vo.TheaterVO;

public class SelectMovieTimeAction implements Action{

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		int theaterID = Integer.parseInt(req.getParameter("theaterID"));
		int movieID = Integer.parseInt(req.getParameter("movieID"));
	
		ScheduleDAO scheduleDAO = ScheduleDAO.getInstance();
	
		

		
		
		

    	TheaterDAO dao = TheaterDAO.getInstance();
        List<ScheduleVO> scheduleList = null;
		try {
			scheduleList = dao.getScheduleList(theaterID, movieID);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		MovieDAO movieDAO = MovieDAO.getInstance();
		
		MovieVO selectedMovie = movieDAO.getMovie(movieID);
        TheaterVO selectedTheater = dao.getTheater(theaterID);
        
        req.setAttribute("movieID", movieID);
        req.setAttribute("theaterID", theaterID);

       
        req.setAttribute("selectedMovie", selectedMovie);
        req.setAttribute("selectedTheater", selectedTheater);
        req.setAttribute("scheduleList", scheduleList);
        return "theater/selectTime.jsp";
		
	}

}
