package kr.theater.action;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.controller.Action;
import kr.theater.dao.TheaterDAO;
import kr.theater.vo.TheaterVO;

public class RegionSubmitAction implements Action {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	    String region = req.getParameter("region");
	    int movieID = Integer.parseInt(req.getParameter("movieID")); // int로 변환

	    TheaterDAO dao = TheaterDAO.getInstance();
	    List<TheaterVO> theaterList = dao.getTheatersByMovieAndRegion(movieID, region);

	    
	    System.out.println("movieID: " + movieID);
	    System.out.println("선택된 지역: " + region);
	    System.out.println("조회된 극장 수: " + theaterList.size());

	    req.setAttribute("movieID", movieID);
	    req.setAttribute("region", region);
	    req.setAttribute("theaterList", theaterList);

	    return "theater/selectTheater.jsp";
	}


}
