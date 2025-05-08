package kr.seat.action;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.controller.Action;
import kr.seat.dao.SeatDAO;
import kr.seat.vo.SeatVO;

public class SelectSeatAction implements Action{

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		SeatDAO seatDAO = SeatDAO.getInstance();
		int theaterID = Integer.parseInt(req.getParameter("theaterID"));
		List<SeatVO> seatList = seatDAO.getSeatsByTheater(theaterID);
		req.setAttribute("seatList", seatList);

		return "theater/selectSeat.jsp";
	}

}
