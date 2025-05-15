package kr.reservation.action;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.controller.Action;
import kr.coupon.dao.CouponDAO;
import kr.member.dao.MemberDAO;
import kr.member.vo.MemberVO;
import kr.pointLog.dao.PointLogDAO;
import kr.reservation.dao.ReservationDAO;
import kr.reservation.vo.ReservationVO;

public class PaymentProcessAction implements Action {

    @Override
    public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        ReservationDAO reservationDAO = ReservationDAO.getInstance();
        MemberDAO memberDAO = MemberDAO.getInstance();
        CouponDAO couponDAO = CouponDAO.getInstance();
        PointLogDAO pointLogDAO = PointLogDAO.getInstance();

        int reservationID = Integer.parseInt(req.getParameter("reservationID"));
        int totalPrice = Integer.parseInt(req.getParameter("finalPrice"));
        int pointUsed = Integer.parseInt(req.getParameter("pointUsed"));
        int cpPossessId = Integer.parseInt(req.getParameter("cpPossessId"));
        int memberId = ((MemberVO) req.getSession().getAttribute("member")).getMember_id();

        int earnedPoint = (int)(totalPrice * 0.05);

        // 1. 결제 상태 업데이트
        try {
			reservationDAO.updatePaymentInfo(reservationID, totalPrice);
		

        // 2. 포인트 사용
        if (pointUsed > 0) {
            memberDAO.usePoint(memberId, pointUsed);
            pointLogDAO.insertLog(memberId, -pointUsed, "영화 결제 시 사용");
        }

        // 3. 포인트 적립
        if (earnedPoint > 0) {
            memberDAO.addPoint(memberId, earnedPoint);
            pointLogDAO.insertLog(memberId, earnedPoint, "영화 결제 시 적립");
        }

        // 4. 쿠폰 사용 처리
        String couponName = null;
        if (cpPossessId > 0) {
            couponDAO.useCouponByPossessId(cpPossessId);
            couponName = couponDAO.getCouponNameByPossessId(cpPossessId);
        }

        // 5. 결제 후 전달할 정보
        ReservationVO reservation = reservationDAO.getReservationDetail(reservationID);
        MemberVO member = memberDAO.getMember(memberId);
       
        List<String> seatNames = reservationDAO.getSeatNamesByReservation(reservationID);
        reservation.setSeatName(String.join(", ", seatNames));

        req.setAttribute("reservation", reservation);
        req.setAttribute("member", member);
        req.setAttribute("usedCouponName", couponName);
        req.setAttribute("pointUsed", pointUsed);
        req.setAttribute("earnedPoint", earnedPoint);
        } catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        return "reservation/paymentSuccess.jsp";
    }
}
