package kr.admin.theater;

import java.io.IOException;
import java.util.List;

import org.codehaus.jackson.map.ObjectMapper;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.controller.Action;
import kr.theater.dao.TheaterDAO;
import kr.theater.vo.TheaterVO;

public class TheaterGetListAction implements Action{

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		List<TheaterVO> theaterList = TheaterDAO.getInstance().getTheaterList();
		
		ObjectMapper om = new ObjectMapper();
		return null;
	}

}
