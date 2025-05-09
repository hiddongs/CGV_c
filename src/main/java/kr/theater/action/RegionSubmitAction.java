package kr.theater.action;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import kr.controller.Action;
import kr.member.vo.MemberVO;
import kr.theater.dao.TheaterDAO;
import kr.theater.vo.TheaterVO;

public class RegionSubmitAction implements Action {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	    String region = req.getParameter("region");
	    int movieID = Integer.parseInt(req.getParameter("movieID")); // int로 변환
	    HttpSession session = req.getSession();
		MemberVO member = (MemberVO) session.getAttribute("member");
		int memberID = member.getMember_id(); // 로그인된 사용자 ID
	    TheaterDAO dao = TheaterDAO.getInstance();
	    List<TheaterVO> theaterList = dao.getTheatersByMovieAndRegion(movieID, region);

	    
	    System.out.println("movieID: " + movieID);
	    System.out.println("선택된 지역: " + region);
	    System.out.println("조회된 극장 수: " + theaterList.size());

	    req.setAttribute("mem_ID", memberID);
	    req.setAttribute("movieID", movieID);
	    req.setAttribute("region", region);
	    req.setAttribute("theaterList", theaterList);

	    return "theater/selectTheater.jsp";
	}


}
