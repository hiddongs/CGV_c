package kr.movie.action;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import kr.controller.Action;
import kr.member.vo.MemberVO;
import kr.reservation.dao.ReservationDAO;
import kr.reservation.vo.ReservationVO;

public class MyMovieListAction implements Action{

   @Override
   public String execute(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException{
      // 영화 제목 별로 하나씩 보여주기
      HttpSession session = request.getSession();
      MemberVO user =(MemberVO)session.getAttribute("member");
      
      if(user == null) {
         return "redirect:/member/loginForm.do";
      }
      
      try {
         // 회원 ID로 내가 본 영화 리스트 조회
         int memberId = user.getMember_id();
         
         // 내가 본 영화 리스트 조회
         ReservationDAO dao = new ReservationDAO();
         List<ReservationVO> movieList = dao.getReservationByMemberID(memberId);
         
         // request에 저장해서 JSP로 전달
         request.setAttribute("movieList", movieList);
         
      }catch(Exception e) {
         e.printStackTrace();
         throw new ServletException(e); // 예외 전송(또는 여러 페이지로 리다이렉트 가능
      }
      
      return "movie/myMovielist.jsp";
   }

}
