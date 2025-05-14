package kr.reservation.action;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import kr.auditorium.vo.AuditoriumVO;
import kr.controller.Action;
import kr.coupon.dao.CouponDAO;
import kr.coupon.vo.CouponVO;
import kr.member.dao.MemberDAO;
import kr.member.vo.MemberVO;
import kr.price.dao.PriceDAO;
import kr.price.vo.PriceVO;
import kr.reservation.dao.ReservationDAO;
import kr.reservation.vo.ReservationVO;
import kr.schedule.dao.ScheduleDAO;
import kr.schedule.vo.ScheduleVO;
import kr.util.PaymentUtil;
import kr.auditorium.dao.AuditoriumDAO;

public class PaymentFormAction implements Action {

    @Override
    public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        MemberVO member = (MemberVO) session.getAttribute("member");

        if (member == null) {
            return "redirect:/member/loginForm.do";
        }

        int memberID = member.getMember_id();
        int reservationID = Integer.parseInt(req.getParameter("reservationID"));

        try {
            ReservationDAO reservationDAO = ReservationDAO.getInstance();
            ScheduleDAO scheduleDAO = ScheduleDAO.getInstance();
            MemberDAO memberDAO = MemberDAO.getInstance();
            PriceDAO priceDAO = PriceDAO.getInstance();
            CouponDAO couponDAO = CouponDAO.getInstance();
            AuditoriumDAO auditoriumDAO = AuditoriumDAO.getInstance();

            // 예매 상세 정보 조회
            ReservationVO reservation = reservationDAO.getReservationDetail(reservationID);
            if (reservation == null) {
                throw new IllegalArgumentException("[ERROR] 예매 정보를 찾을 수 없습니다.");
            }

            // 스케줄 조회 (reservation에서 scheduleID를 꺼내기 전에 반드시 reservation이 null이 아님을 확인해야 함)
            ScheduleVO schedule = scheduleDAO.getSchedule(reservation.getScheduleID());
            if (schedule == null) {
                throw new IllegalArgumentException("[ERROR] 스케줄 정보를 찾을 수 없습니다.");
            }

            // 상영관 정보 조회
            AuditoriumVO auditorium = auditoriumDAO.getAuditorium(schedule.getAuditoriumId());

            // 회원 전체 정보 (포인트 등)
            MemberVO fullMember = memberDAO.getMember(memberID);

            // 가격 정책
            PriceVO price = priceDAO.getPrice();

            // 최종 가격 계산
            int viewers = reservation.getViewers();
            int calculatedPrice = PaymentUtil.calculateTotalPrice(fullMember, schedule, auditorium, price, viewers);



            // 보유 쿠폰 목록
            List<CouponVO> couponList = couponDAO.getListCouponByUser(memberID);

            // JSP 전달
            req.setAttribute("reservation", reservation);
            req.setAttribute("couponList", couponList);
            req.setAttribute("calculatedPrice", calculatedPrice);
            req.setAttribute("member", fullMember);

        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("errorMsg", "결제 페이지 로딩 중 오류 발생");
        }

        return "theater/moviePay.jsp";
    }
}
