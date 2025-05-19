package kr.ask.action;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.controller.Action;
import kr.theater.dao.TheaterDAO;
import kr.theater.vo.TheaterVO;

public class WriteFormAction implements Action {

   @Override
   public String execute(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
      // 극장 가져옴
      TheaterDAO theaterDAO = TheaterDAO.getInstance();
        List<TheaterVO> theaterList = null;
		try {
			theaterList = theaterDAO.getAllTheaters();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} // DAO 호출
        
        request.setAttribute("theaterList", theaterList); // JSP에 전달
        
        return "/notice/writeForm.jsp"; // 1:1 문의 작성 폼으로 이동
   }

}
