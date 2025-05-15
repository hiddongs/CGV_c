package kr.reservation.action;

import java.util.List;

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
            HttpSession session = req.getSession();
            MemberVO member = (MemberVO) session.getAttribute("member");

            if (member == null) {
                return "redirect:/member/loginForm.do";
            }

            int memberID = member.getMember_id();
            req.setAttribute("mem_ID", memberID);

            int scheduleID = Integer.parseInt(req.getParameter("scheduleID"));
            String[] selectedSeats = req.getParameter("selectedSeats").split(",");

            int adultCount = Integer.parseInt(req.getParameter("adultCount"));
            int childCount = Integer.parseInt(req.getParameter("childCount"));
            int totalViewers = adultCount + childCount;

            if (selectedSeats.length != totalViewers) {
                throw new IllegalArgumentException("[ERROR] 선택된 좌석 수와 인원 수가 일치하지 않습니다.");
            }

            ReservationDAO dao = ReservationDAO.getInstance();

            // 중복 좌석 체크
            List<String> alreadyReserved = dao.getReservedSeatNames(scheduleID);
            for (String seatName : selectedSeats) {
                if (alreadyReserved.contains(seatName)) {
                    throw new IllegalStateException("[ERROR] 이미 예약된 좌석이 포함되어 있습니다: " + seatName);
                }
            }

            // 예약 생성
            int reservationID = dao.insertReservation(memberID, scheduleID, totalViewers);

            // 좌석 저장
            for (String seatName : selectedSeats) {
                int seatID = dao.getSeatIDByName(scheduleID, seatName);
                dao.insertReservation(reservationID, seatID, scheduleID);
            }

            // 예약 상세 및 좌석 이름 가져오기
            ReservationVO detail = dao.getReservationDetail(reservationID);
            List<String> seatNames = dao.getSeatNamesByReservation(reservationID);
            detail.setSeatName(String.join(", ", seatNames));

            req.setAttribute("reservation", detail);
            req.setAttribute("adultCount", adultCount);
            req.setAttribute("childCount", childCount);
            req.setAttribute("msg", "예매 준비가 완료되었습니다.");

            return "/theater/confirmReservation.jsp";

        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("errorMsg", "예매 준비 처리 중 오류가 발생했습니다.");
            return "/error/invalidParameter.jsp";
        }
    }
}
