package kr.event.action;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.controller.Action;

public class EventListAction implements Action {
    @Override
    public String execute(HttpServletRequest req, HttpServletResponse resp) {
        // 여기에 로직 작성
        req.setAttribute("msg", "이벤트 예약 액션입니다.");
        return "/event/eventList.jsp";
    }
}
