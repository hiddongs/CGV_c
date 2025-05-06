package kr.movie.action;

import java.util.List;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.controller.Action;
import kr.theater.dao.TheaterDAO;

public class MovieSubmitAction implements Action {
    @Override
    public String execute(HttpServletRequest req, HttpServletResponse resp) {
        int movieID = Integer.parseInt(req.getParameter("movieID"));
        
        TheaterDAO dao = TheaterDAO.getInstance();
        List<String> regionList = dao.getAllRegionList();

        req.setAttribute("movieID", movieID);
        req.setAttribute("regionList", regionList);
        return "theater/selectRegion.jsp";
    }
}

