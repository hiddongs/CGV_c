package kr.theater.action;


import java.util.List;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.controller.Action;
import kr.schedule.dao.ScheduleDAO;
import kr.theater.dao.TheaterDAO;
import kr.theater.vo.TheaterVO;

public class TheaterListAction implements Action {
    public String execute(HttpServletRequest req, HttpServletResponse resp) {
        int movieID = Integer.parseInt(req.getParameter("movieID"));
      
        TheaterDAO dao = TheaterDAO.getInstance();
        

        List<TheaterVO> list = dao.getTheatersByMovie(movieID);
        req.setAttribute("movieID", movieID);
        req.setAttribute("theaterList", list);
        return "theater/theaterList.jsp";
    }
}