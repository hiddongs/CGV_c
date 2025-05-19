package kr.reservation.action;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.controller.Action;
import kr.reservation.dao.ReservationDAO;

public class DeleteReservationAction implements Action {

   @Override
   public String execute(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
      System.out.println("🔵 [DeleteReservationAction] 실행됨");
      
      String param = request.getParameter("reservationID");
       System.out.println("🔵 받은 reservationID = " + param);
      int reservationID = Integer.parseInt(request.getParameter("reservationID"));
      
      ReservationDAO dao = new ReservationDAO();
      // 삭제가 성공했는지 실패했는지 알기 위해 boolean사용
      boolean result = dao.deleteReservation(reservationID);
      
      System.out.println("🔵 삭제 결과 = " + result);

      response.setContentType("text/plain; charset=utf-8");
      response.getWriter().write(result ? "success":"fail");
      
      // AJAX 응답이므로 페이지 이동 없음
      return null;
   }

}
