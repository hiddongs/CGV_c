package kr.member.action;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import kr.controller.Action;

public class MypageDetailReservationAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// memberid, reservationid, 
		// getReservationDetailById
		
		// 로그인 여부 확인
		HttpSession session = request.getSession();
		
		
		
		
		return "member/mypageDetailReservation.jsp";
	}


}
