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
		// TODO Auto-generated method stub
	
	        	String region = req.getParameter("region");
	        	TheaterDAO dao = TheaterDAO.getInstance();
	            List<TheaterVO> theaterList = null;
				try {
					theaterList = dao.selectTheaterList(region);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
	            
	            req.setAttribute("theaterList",theaterList);
	        
		return "theater/selectTheater.jsp";
	}

}
