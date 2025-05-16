package kr.review.action;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import kr.controller.Action;
import kr.member.vo.MemberVO;
import kr.movie.dao.MovieDAO;
import kr.movie.vo.MovieVO;

public class ReviewWriteFormAction implements Action {

    @Override
    public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        MemberVO member = (MemberVO) session.getAttribute("member");

        if (member == null) {
            return "redirect:/member/loginForm.do";
        }

        try {
            int movieId = Integer.parseInt(req.getParameter("movie_id"));
            MovieDAO movieDAO = MovieDAO.getInstance();
            MovieVO movie = movieDAO.getMovie(movieId);

            req.setAttribute("member", member);
            req.setAttribute("movie", movie);

            return "/movie/writeReview.jsp";

        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("error", "리뷰 작성 페이지를 불러오는 데 실패했습니다.");
            return "/error/invalidParameter";
        }
    }
}
