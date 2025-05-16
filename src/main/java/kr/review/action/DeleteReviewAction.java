package kr.review.action;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import kr.controller.Action;
import kr.member.vo.MemberVO;
import kr.review.dao.ReviewDAO;
import kr.review.vo.ReviewVO;

public class DeleteReviewAction implements Action {

    @Override
    public String execute(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession();
        MemberVO member = (MemberVO) session.getAttribute("member");

        if (member == null) {
            return "redirect:/member/loginForm.do";
        }

        int reviewId = Integer.parseInt(req.getParameter("review_id"));
        int movieId = Integer.parseInt(req.getParameter("movie_id"));

        ReviewDAO dao = ReviewDAO.getInstance();
        ReviewVO review = dao.getReviewById(reviewId);

        if (review != null && review.getMemberId() == member.getMember_id()) {
            dao.deleteReview(reviewId);
        } else {
            // 권한 없음 또는 존재하지 않는 리뷰
            req.setAttribute("error", "리뷰 삭제 권한이 없거나 존재하지 않는 리뷰입니다.");
            return "error/invalidParameter.jsp";
        }

        dao.deleteMemberReview(member.getMember_id());

        // 삭제 후 해당 영화 리뷰 목록 페이지로 이동
        return "redirect:/movie/movieReviewPage.do?movie_id=" + movieId;
    }
}
