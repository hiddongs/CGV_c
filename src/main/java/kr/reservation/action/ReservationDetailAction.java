package kr.reservation.action;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import kr.controller.Action;
import kr.member.vo.MemberVO;
import kr.movie.dao.MovieDAO;
import kr.movie.vo.MovieVO;
import kr.reservation.dao.ReservationDAO;
import kr.reservation.vo.ReservationVO;

public class ReservationDetailAction implements Action {

   @Override
   public String execute(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException{
      // 예매 상세 정보를 가져온 후, 해당 영화의 상세 정보를 추가로 가져와야 함
      // MovieDAO 호출하고 그 결과를 request에 담아 JSP페이지로 전달
      
      HttpSession session = request.getSession();
      MemberVO user = (MemberVO) session.getAttribute("member");      
      
      if(user == null) {
         return "redirect:/member/loginForm.do";
      }
      try {
         //reservationID 호출
         int reservationID = Integer.parseInt(request.getParameter("reservationID"));
         System.out.println("reservationId = "+ reservationID);
         
         // 예매정보 조회
         ReservationDAO reservationDAO = ReservationDAO.getInstance();
         ReservationVO reservation = reservationDAO.getReservationDetail(reservationID);
         
         //영화 포스터 사용
         MovieDAO movieDAO = MovieDAO.getInstance();
         MovieVO movie = movieDAO.getMovie(reservation.getMovie_id());
         String poster = movie.getPoster_url(); // 영화 포스터 url
         String description = movie.getDescription(); // 영화 설명 가져옴
         String direction = movie.getDirector(); // 감독
         String actor = movie.getGenre(); // 장르
         String ageLimit = movie.getAge_limit(); // 관람 연령
               
         // 데이터 전달
         request.setAttribute("reservation", reservation);
         request.setAttribute("poster", poster);
         request.setAttribute("movie", movie); //영화 객체를 JSP로 전달 (추가 정보도 함께 전달)
         
         // 상세 페이지로 이동
         return "reservation/reservationDetail.jsp";
      
      
      }catch(Exception e) {
         e.printStackTrace();
         throw new ServletException("ReservationDetailAction 내부 오류", e);  // 예외 원인 전달
      }
   }
}
