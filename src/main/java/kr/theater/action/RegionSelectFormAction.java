package kr.theater.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.controller.Action;
import kr.theater.dao.TheaterDAO;
import kr.theater.vo.TheaterVO;

public class RegionSelectFormAction implements Action {

    @Override
    public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        TheaterDAO dao = TheaterDAO.getInstance();
        List<String> regionList = null;
        try {
            regionList = dao.getAllRegionList();  // String 리스트!
            req.setAttribute("movieID", req.getParameter("movieID"));

        } catch (Exception e) {
            e.printStackTrace();
        }
        req.setAttribute("regionList", regionList);
        return "theater/selectRegion.jsp";
    }
}
