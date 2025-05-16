package kr.review.action;

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
import kr.review.dao.ReviewDAO;
import kr.review.vo.ReviewVO;

public class MovieReviewPageAction implements Action{

	
	    @Override
	    public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	        HttpSession session = req.getSession();
	        MemberVO member = (MemberVO) session.getAttribute("member");

	        if (member == null) {
	            return "redirect:/member/loginForm.do";
	        }

	        try {
	            int movie_id = Integer.parseInt(req.getParameter("movie_id"));

	            
	            // 영화 정보 가져오기
	            MovieDAO movieDAO = MovieDAO.getInstance();
	            MovieVO movie = movieDAO.getMovie(movie_id); // 영화 1개

	            // 리뷰 리스트 가져오기
	            ReviewDAO reviewDAO = ReviewDAO.getInstance();
	            List<ReviewVO> reviewList = reviewDAO.getReviewListMemberName(movie_id);

	            
	        
	            req.setAttribute("movie", movie);
	            req.setAttribute("reviewList", reviewList);

	        } catch (Exception e) {
	            e.printStackTrace();
	            req.setAttribute("error", "영화 리뷰 정보를 불러오는데 실패했습니다.");
	        }

	        return "movie/movieReviewPage.jsp";
	    }
	}



