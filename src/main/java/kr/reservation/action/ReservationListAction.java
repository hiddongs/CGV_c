package kr.reservation.action;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import kr.controller.Action;
import kr.member.vo.MemberVO;
import kr.reservation.dao.ReservationDAO;
import kr.reservation.vo.ReservationVO;

public class ReservationListAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// reservationList.do
		// 회원제 시스템이기 때문에 로그인 여부 체크
		HttpSession session = request.getSession();
		MemberVO user = (MemberVO)session.getAttribute("member");
		
		if(user == null) {
			return "redirect:/member/loginForm.do";
		}
		try {
			ReservationDAO reservationDAO = ReservationDAO.getInstance();
			List<ReservationVO> reservationList = reservationDAO.getListReservationByUser(user.getMember_id());
			System.out.println("reservationList =" + reservationList.size());
			
			request.setAttribute("reservationList", reservationList);
			return "reservation/reservationList.jsp"; //예매목록 jsp
		
		}catch(Exception e) {
			e.printStackTrace();
			throw new ServletException(e);
		}
	}
}
