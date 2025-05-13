package kr.reservation.action;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import kr.controller.Action;
import kr.member.vo.MemberVO;

public class ReservationAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse resppnse) throws ServletException, IOException {
		// 세션에서 사용자 정보 얻기
		HttpSession session = request.getSession();
		MemberVO user = (MemberVO) session.getAttribute("member");
		
		// 요청 파라미터로 예매 ID받기
		
		
		return null;
	}
	
}
