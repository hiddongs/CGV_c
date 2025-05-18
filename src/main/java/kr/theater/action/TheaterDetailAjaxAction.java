package kr.theater.action;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.google.gson.Gson;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.auditorium.dao.AuditoriumDAO;
import kr.controller.Action;

import kr.theater.dao.TheaterDAO;

import kr.theater.vo.TheaterVO;

public class TheaterDetailAjaxAction implements Action {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int theaterId = Integer.parseInt(request.getParameter("theaterId"));

        // DAO 인스턴스 가져오기
        TheaterDAO theaterDAO = TheaterDAO.getInstance();
        kr.auditorium.dao.AuditoriumDAO auditoriumDAO = AuditoriumDAO.getInstance();

        // 해당 극장 정보 + 상영관 리스트 조회
        TheaterVO theater = theaterDAO.getTheater(theaterId);
        List<kr.auditorium.vo.AuditoriumVO> auditoriumList = auditoriumDAO.getAuditoriumsByTheater(theaterId);

        // JSON 응답 구성
        Map<String, Object> result = new HashMap<>();
        result.put("theater", theater);
        result.put("auditoriums", auditoriumList);

        Gson gson = new Gson();
        String json = gson.toJson(result);

        // 응답 처리
        response.setContentType("application/json; charset=UTF-8");
        response.getWriter().write(json);

        return null; // forward 없음
    }
}
