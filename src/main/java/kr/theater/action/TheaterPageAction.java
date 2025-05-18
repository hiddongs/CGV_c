package kr.theater.action;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.controller.Action;
import kr.theater.dao.TheaterDAO;
import kr.theater.vo.TheaterVO;

public class TheaterPageAction implements Action {

    @Override
    public String execute(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        TheaterDAO dao = TheaterDAO.getInstance();

        try {
  
            List<TheaterVO> theaterList = dao.getTheaterList();

     
            req.setAttribute("theaterList", theaterList);

        } catch (Exception e) {
            e.printStackTrace();
        }

        // ✅ JSP 경로 반환
        return "theater/theaterPage.jsp"; // 파일명 정확히 확인
    }
}
