package kr.theater.action;

import java.text.SimpleDateFormat;
import java.util.*;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import kr.controller.Action;
import kr.schedule.dao.ScheduleDAO;
import kr.schedule.vo.ScheduleVO;

public class SelectMovieTimeAction implements Action {
    @Override
    public String execute(HttpServletRequest req, HttpServletResponse resp) {
        int movieID = Integer.parseInt(req.getParameter("movieID"));
        int theaterID = Integer.parseInt(req.getParameter("theaterID"));
        int auditoriumID = Integer.parseInt(req.getParameter("auditoriumID"));
        String screenDate = req.getParameter("screenDate");

        if (screenDate == null || screenDate.isEmpty()) {
            screenDate = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
        }

        ScheduleDAO dao = ScheduleDAO.getInstance();
        List<ScheduleVO> scheduleList = dao.getScheduleListByDate(movieID, theaterID,auditoriumID, screenDate);

        System.out.println("받은 날짜: " + screenDate);
        System.out.println("조회된 스케줄 수: " + scheduleList.size());

        req.setAttribute("movieID", movieID);
        req.setAttribute("theaterID", theaterID);
        req.setAttribute("screenDate", screenDate);
        req.setAttribute("scheduleList", scheduleList);

        return "theater/selectTime.jsp";
    }
}
