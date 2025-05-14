package kr.movie.action;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import kr.controller.Action;
import kr.member.vo.MemberVO;
import kr.movie.dao.MovieDAO;
import kr.movie.vo.MovieVO;
import kr.theater.dao.TheaterDAO;
import kr.theater.vo.TheaterVO;

public class RealMVreservationAction implements Action {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		MovieDAO movieDAO = new MovieDAO();
		TheaterDAO theaterDAO = new TheaterDAO();
		try {
			HttpSession session = req.getSession();
			MemberVO member = (MemberVO) session.getAttribute("member");
			int memberID = member.getMember_id(); // 로그인된 사용자 ID
			String align = req.getParameter("align");
			if (align == null) align = "1"; // 기본 정렬: 가나다순
			List<MovieVO> movieList = movieDAO.getShowingMovieAlignList(align);
			req.setAttribute("movieList", movieList);
			List<TheaterVO> theaterList = theaterDAO.getTheaterList();
			req.setAttribute("mem_ID", memberID);
			req.setAttribute("theaterList", theaterList);
			req.setAttribute("movieID", req.getParameter("movieID"));

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
        return "movie/reservationMV.jsp";
	}

}
