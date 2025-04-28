package kr.theater.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import kr.controller.Action;
import kr.movie.dao.MovieDAO;
import kr.theater.dao.TheaterDAO;
import kr.theater.vo.TheaterVO;
import kr.util.StringUtil;

public class SelectRegionListAction implements Action{

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) {
		// TODO Auto-generated method stub
		
	
		
			TheaterDAO theaterDAO = new TheaterDAO();
		
			try {
			List<TheaterVO> regionList = theaterDAO.getAllRegionList();
		   
			req.setAttribute("regionList", regionList);
			} catch(Exception e){
				e.printStackTrace();
			}
		
		return "theater/selectRegion.jsp";
	}

}
