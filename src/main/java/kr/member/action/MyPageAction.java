package kr.member.action;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import kr.controller.Action;
import kr.coupon.dao.CouponDAO;
import kr.coupon.vo.CouponVO;
import kr.member.dao.MemberDAO;
import kr.member.vo.MemberVO;
import kr.reservation.dao.ReservationDAO;
import kr.reservation.vo.ReservationVO;

import java.io.IOException;
import java.util.List;

public class MyPageAction implements Action {
    @Override
    // 회원정보
    public String execute(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        MemberVO user = (MemberVO)session.getAttribute("member");
        
        if(user == null) { // 로그인 되지 않은 경우
            return "redirect:/member/loginForm.do";
        }
        try {
        	
            MemberDAO dao = MemberDAO.getInstance();
            MemberVO member = dao.getMember(user.getMember_id());
            
            // 예매내역
            ReservationDAO reservationDAO = ReservationDAO.getInstance();
            List<ReservationVO> reservationList = reservationDAO.getListReservationByUser(user.getMember_id());
            // 할인쿠폰 관리
            CouponDAO couponDAO = CouponDAO.getInstance(); 
            List<CouponVO> couponList = couponDAO.getListCouponByUser(user.getMember_id());
            
            request.setAttribute("member", member);
            request.setAttribute("reservationList", reservationList);
            request.setAttribute("couponList", couponList);
            
            return "member/myPage.jsp";
            
        } catch(Exception e) {
            e.printStackTrace();
            throw new ServletException(e);
        }
        
        // 문의내역
        // 나의 포인트
        
    }
}
