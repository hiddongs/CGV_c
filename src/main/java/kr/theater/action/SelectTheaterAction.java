package kr.theater.action;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import kr.auditorium.dao.AuditoriumDAO;
import kr.auditorium.vo.AuditoriumVO;
import kr.controller.Action;
import kr.member.vo.MemberVO;
import kr.movietype.dao.MovieTypeDAO;
import kr.movietype.vo.MovieTypeVO;

public class SelectTheaterAction implements Action {
    @Override
    public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            Long movieID = Long.parseLong(req.getParameter("movieID"));
            int theaterID = Integer.parseInt(req.getParameter("theaterID"));
            String screenDate = req.getParameter("screenDate");
            HttpSession session = req.getSession();
    		MemberVO member = (MemberVO) session.getAttribute("member");
    		int memberID = member.getMember_id(); // 로그인된 사용자 ID
            if (screenDate == null || screenDate.isEmpty()) {
                screenDate = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
            }

            // 영화가 지원하는 타입 가져오기
            MovieTypeDAO typeDAO = MovieTypeDAO.getInstance();
            MovieTypeVO typeVO = typeDAO.getMovietype(movieID);

            // 극장의 상영관 전체 조회
            AuditoriumDAO audDAO = AuditoriumDAO.getInstance();
            List<AuditoriumVO> allAuditoriums = audDAO.getAuditoriumsByTheater(theaterID);

            // 필터링
            List<AuditoriumVO> filtered = new ArrayList<>();
            for (AuditoriumVO aud : allAuditoriums) {
                String type = aud.getType(); // 4DX, IMAX 등
                if (
                    (type.equals("IMAX") && "Y".equals(typeVO.getImax())) ||
                    (type.equals("SCREENX") && "Y".equals(typeVO.getScreenx())) ||
                    (type.equals("4DX") && "Y".equals(typeVO.get_4dx())) ||
                    (type.equals("3D") && "Y".equals(typeVO.get_3d())) ||
                    (type.equals("2D") && "Y".equals(typeVO.get_2d()))
                ) {
                    filtered.add(aud);
                }
            }
            req.setAttribute("mem_ID", memberID);
            req.setAttribute("movieID", movieID);
            req.setAttribute("theaterID", theaterID);
            req.setAttribute("screenDate", screenDate);
            req.setAttribute("auditoriumList", filtered);

            return "theater/selectTime.jsp";
        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("errorMsg", "상영관 조회 중 오류가 발생했습니다.");
            return "error/invalidParameter.jsp";
        }
    }
}
