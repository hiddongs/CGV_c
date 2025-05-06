package kr.theater.action;



import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.controller.Action;
import kr.schedule.dao.ScheduleDAO;
import kr.theater.dao.TheaterDAO;
import kr.theater.vo.TheaterVO;

public class SelectTheaterAction implements Action {

    @Override
    public String execute(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        
        int movieID = Integer.parseInt(req.getParameter("movieID"));
        ScheduleDAO scheduleDAO = ScheduleDAO.getInstance();

        TheaterDAO dao = TheaterDAO.getInstance();
        List<TheaterVO> theaterList = dao.getTheatersByMovie(movieID);

        req.setAttribute("movieID", movieID);
        req.setAttribute("theaterList", theaterList);

        return "theater/selectTheater.jsp";
    }
}
