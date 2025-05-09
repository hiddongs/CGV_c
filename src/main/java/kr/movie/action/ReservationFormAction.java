package kr.movie.action;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import kr.controller.Action;
import kr.member.vo.MemberVO;

public class ReservationFormAction implements Action{

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = req.getSession();
		MemberVO member = (MemberVO) session.getAttribute("member");
		
		if (member == null) {
		    return "redirect:/member/loginForm.do"; // 로그인 안 되어 있음
		}

		int memberID = member.getMember_id(); // 로그인된 사용자 ID

		req.setAttribute("mem_ID", memberID);
		return "movie/reservationForm.jsp";
	}

}
