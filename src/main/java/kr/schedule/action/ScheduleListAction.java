package kr.schedule.action;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.controller.Action;
import kr.schedule.dao.ScheduleDAO;
import kr.schedule.vo.ScheduleVO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.controller.Action;
import kr.schedule.dao.ScheduleDAO;
import kr.schedule.vo.ScheduleVO;
import java.util.List;

public class ScheduleListAction implements Action {
    public String execute(HttpServletRequest req, HttpServletResponse resp) {
        int movieID = Integer.parseInt(req.getParameter("movieID"));
        int theaterID = Integer.parseInt(req.getParameter("theaterID"));
        ScheduleDAO dao = ScheduleDAO.getInstance();
        List<ScheduleVO> list = dao.getSchedules(movieID, theaterID);
        req.setAttribute("movieID", movieID);
        req.setAttribute("theaterID", theaterID);
        req.setAttribute("scheduleList", list);
        return "schedule/scheduleList.jsp";
    }
}
