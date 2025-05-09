package kr.reservation.action;

import java.text.SimpleDateFormat;
import java.util.Date;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import kr.controller.Action;
import kr.member.vo.MemberVO;
import kr.reservation.dao.ReservationDAO;
import kr.reservation.vo.ReservationVO;

public class ReserveAction implements Action {

    @Override
    public String execute(HttpServletRequest req, HttpServletResponse resp) {
        try {
        	// TODO Auto-generated method stub
    		HttpSession session = req.getSession();
    		MemberVO member = (MemberVO) session.getAttribute("member");

    		if (member == null) {
    		    return "redirect:/member/loginForm.do"; // 로그인 안 되어 있음
    		}

    		int memberID = member.getMember_id(); // 로그인된 사용자 ID

    		req.setAttribute("mem_ID", memberID);
            // 1. 파라미터 수신
            
            int scheduleID = Integer.parseInt(req.getParameter("scheduleID"));
            String[] selectedSeats = req.getParameter("selectedSeats").split(",");

            // 2. DAO 호출
            ReservationDAO dao = ReservationDAO.getInstance();
            int viewers = selectedSeats.length;

            for (String seatName : selectedSeats) {
                int seatID = dao.getSeatIDByName(scheduleID, seatName); // 이름 → ID 변환

                ReservationVO vo = new ReservationVO();
                vo.setMemberID(memberID);
                vo.setScheduleID(scheduleID);
                vo.setSeatID(seatID);
                vo.setPaymentStatus("대기");
                vo.setPaymentDate(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
                vo.setViewers(viewers);

                // TODO: 가격 및 영화/상영관 정보 추후 연동
                dao.insertReservation(vo);
            }

            req.setAttribute("msg", "예매 준비가 완료되었습니다.");
            return "/theater/moviePay.jsp";

        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("errorMsg", "예매 준비 처리 중 오류가 발생했습니다.");
            return "/error/invalidParameter.jsp";
        }
    }
}
