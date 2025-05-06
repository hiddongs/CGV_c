package kr.theater.action;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.controller.Action;

public class SelectTimeAction implements Action {

    @Override
    public String execute(HttpServletRequest req, HttpServletResponse resp) {
        // 시간 선택 후 처리 로직 작성
        String movieID = req.getParameter("movieID");
        String theaterID = req.getParameter("theaterID");
        String scheduleID = req.getParameter("scheduleID");

        // 예: 예약 확인 페이지로 이동하거나, 다음 단계 페이지 반환
        req.setAttribute("movieID", movieID);
        req.setAttribute("theaterID", theaterID);
        req.setAttribute("scheduleID", scheduleID);

        return "theater/confirmReservation.jsp";
    }
}
