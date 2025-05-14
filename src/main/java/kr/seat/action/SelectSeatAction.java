package kr.seat.action;

import java.util.List;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import kr.controller.Action;
import kr.member.vo.MemberVO;
import kr.reservation.dao.ReservationDAO;
import kr.schedule.dao.ScheduleDAO;
import kr.schedule.vo.ScheduleVO;
import kr.seat.dao.SeatDAO;
import kr.seat.vo.SeatVO;

public class SelectSeatAction implements Action {

    @Override
    public String execute(HttpServletRequest req, HttpServletResponse resp) {
        try {
            // 파라미터 수신
            int movieID = Integer.parseInt(req.getParameter("movieID"));
            int theaterID = Integer.parseInt(req.getParameter("theaterID"));
            int scheduleID = Integer.parseInt(req.getParameter("scheduleID"));
            List<String> reservedList = ReservationDAO.getInstance().getReservedSeatNames(scheduleID);
            HttpSession session = req.getSession();
    		MemberVO member = (MemberVO) session.getAttribute("member");
    		int memberID = member.getMember_id(); // 로그인된 사용자 ID
            // 사용 가능한 좌석 조회
            SeatDAO dao = SeatDAO.getInstance();
            List<SeatVO> seatList = dao.getAvailableSeats(scheduleID);

            // JSP로 데이터 전달
            req.setAttribute("mem_ID", memberID);
            req.setAttribute("movieID", movieID);
            req.setAttribute("theaterID", theaterID);
            req.setAttribute("scheduleID", scheduleID);
            req.setAttribute("seatList", seatList);
            ScheduleVO schedule = ScheduleDAO.getInstance().getSchedule(scheduleID);
            req.setAttribute("movieTitle", schedule.getMovieTitle());
            req.setAttribute("theaterName", schedule.getTheaterName());
            req.setAttribute("screeningDate", schedule.getScreeningDate());
            req.setAttribute("userName", member.getName());

            req.setAttribute("reservedSeatList", reservedList);
            return "/theater/selectSeat.jsp";

        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("errorMsg", "좌석 조회 중 오류가 발생했습니다.");
            return "/error/invalidParameter.jsp";
        }
    }
}
