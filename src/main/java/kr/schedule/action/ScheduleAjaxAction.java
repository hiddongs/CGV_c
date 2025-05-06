package kr.schedule.action;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.controller.Action;
import kr.schedule.dao.ScheduleDAO;
import kr.schedule.vo.ScheduleVO;
import com.google.gson.Gson;

import java.io.PrintWriter;
import java.util.List;
import java.io.IOException; // ← 이걸 꼭 import하세요!

public class ScheduleAjaxAction implements Action {
    @Override
    public String execute(HttpServletRequest req, HttpServletResponse resp) {
        try {
            int movieID = Integer.parseInt(req.getParameter("movieID"));
            int theaterID = Integer.parseInt(req.getParameter("theaterID"));
            String date = req.getParameter("screenDate");

            ScheduleDAO dao = ScheduleDAO.getInstance();
            List<ScheduleVO> list = dao.getScheduleListByDate(movieID, theaterID, date);

            resp.setContentType("application/json;charset=UTF-8");
            PrintWriter out = resp.getWriter();
            Gson gson = new Gson();
            out.print(gson.toJson(list));
            out.close();
        } catch (Exception e) {
            e.printStackTrace();  // 개발 중에는 로깅 필수
        }

        return null; // AJAX 응답이므로 뷰 이동 안 함
    }
}
