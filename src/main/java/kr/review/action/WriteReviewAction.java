package kr.review.action;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import kr.controller.Action;
import kr.member.vo.MemberVO;
import kr.review.dao.ReviewDAO;

public class WriteReviewAction implements Action {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub

		HttpSession session = req.getSession();
		MemberVO member = (MemberVO) session.getAttribute("member");

		if (member == null) {
			return "redirect:/member/loginForm.do";
		}
		
	    int movieId = Integer.parseInt(req.getParameter("movie_id"));

	    int member_id = member.getMember_id();
	    int rating = Integer.parseInt(req.getParameter("rating"));
	    
	    ReviewDAO dao = ReviewDAO.getInstance();
	    
	    String content = req.getParameter("content");
	    dao.insertReview(member_id, movieId, rating, content);
	    
	    return "redirect:/movie/movieReviewPage.do?movie_id=" + movieId;
	}

}
