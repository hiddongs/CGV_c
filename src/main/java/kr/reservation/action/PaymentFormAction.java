package kr.reservation.action;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import kr.auditorium.dao.AuditoriumDAO;

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
        int adultCount = Integer.parseInt(req.getParameter("adultCount"));
        int childCount = Integer.parseInt(req.getParameter("childCount"));

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

            // 스케줄 조회
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

            // 누락 필드 채우기
            reservation.setAdultCount(adultCount);
            reservation.setChildCount(childCount);
            reservation.setMvTitle(schedule.getMovieTitle());
            reservation.setName(schedule.getTheaterName());
            reservation.setMovieType(auditorium.getType());
            reservation.setPaymentDate(reservation.getPaymentDate());
            reservation.setPaymentStatus(reservation.getPaymentStatus());
            reservation.setTheaterName(schedule.getTheaterName()); 
            
            // = 상영관(극장) 이름을 가져와서 reservation에 설정
            String theaterName = reservationDAO.getTheaterNameBySchedule(schedule.getScheduleId().intValue());

            reservation.setTheaterName(theaterName);

            
            // reservation.setSeatName(...)은 DAO에서 set되어 있어야 함

            // 쿠폰 목록
            List<CouponVO> couponList = couponDAO.getListCouponByUser(memberID);

            // JSP로 전달
            req.setAttribute("adultCount", adultCount);
            req.setAttribute("childCount", childCount);
            req.setAttribute("reservation", reservation);
            req.setAttribute("couponList", couponList);
            req.setAttribute("calculatedPrice", calculatedPrice);
            req.setAttribute("member", fullMember);
            req.setAttribute("paymentMethod", req.getParameter("paymentMethod"));

        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("errorMsg", "결제 페이지 로딩 중 오류 발생");
        }

        return "theater/moviePay.jsp";
    }
}
