package kr.reservation.action;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.Auditorium.dao.AuditoriumDAO;
import kr.Auditorium.vo.AuditoriumVO;
import kr.controller.Action;
import kr.coupon.dao.CouponDAO;
import kr.member.dao.MemberDAO;
import kr.member.vo.MemberVO;
import kr.price.dao.PriceDAO;
import kr.price.vo.PriceVO;
import kr.reservation.dao.ReservationDAO;
import kr.reservation.vo.ReservationVO;
import kr.schedule.dao.ScheduleDAO;
import kr.schedule.vo.ScheduleVO;
import kr.util.PaymentUtil;

public class PaymentProcessAction implements Action {

	private ReservationDAO reservationDAO = ReservationDAO.getInstance();
    private ScheduleDAO scheduleDAO = ScheduleDAO.getInstance();
    private AuditoriumDAO auditoriumDAO = AuditoriumDAO.getInstance();
    private PriceDAO priceDAO = PriceDAO.getInstance();
    private MemberDAO memberDAO = MemberDAO.getInstance();
    private CouponDAO couponDAO = CouponDAO.getInstance();
	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int reservationID = Integer.parseInt(req.getParameter("reservationID"));
		int basePriceClient = Integer.parseInt(req.getParameter("basePrice"));
		int cpPossessId = Integer.parseInt(req.getParameter("cpPossessId"));
		int pointUsed = Integer.parseInt(req.getParameter("pointUsed"));
		int finalPriceClient = Integer.parseInt(req.getParameter("finalPrice"));
		int memberId = (int) req.getSession().getAttribute("member_id");

		try {
		ReservationVO reservation = reservationDAO.getReservationDetail(reservationID);
		ScheduleVO schedule = scheduleDAO.getSchedule(reservation.getScheduleID());
		AuditoriumVO auditorium = auditoriumDAO.getAuditorium(schedule.getAuditoriumID());
		PriceVO pricePolicy = priceDAO.getPricePolicy();
		MemberVO member = memberDAO.getMember(memberId);

		int viewers = reservation.getViewers();
		int basePriceServer = PaymentUtil.calculateTotalPrice(member, schedule, auditorium, pricePolicy, viewers);

	
		int couponDiscount = cpPossessId > 0 ? couponDAO.getDiscountAmountByPossessIdAndMemberId(cpPossessId, memberId) : 0;
		int finalExpected = basePriceServer - couponDiscount - pointUsed;
		if (finalExpected < 0) finalExpected = 0;

		if (finalExpected != finalPriceClient) {
		    throw new IllegalArgumentException("[ERROR] 결제 금액 위조 감지됨");
		}

		reservationDAO.updatePaymentInfo(reservationID, finalExpected, req.getParameter("paymentMethod"));
		memberDAO.usePoint(memberId, pointUsed);
		if (cpPossessId > 0) couponDAO.useCouponByPossessId(cpPossessId);
		req.setAttribute("message", "결제가 완료되었습니다!");
		
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return "/WEB-INF/views/reservation/paymentSuccess.jsp";
	}
    
}
