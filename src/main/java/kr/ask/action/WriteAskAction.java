package kr.ask.action;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import kr.ask.dao.AskDAO;
import kr.ask.vo.AskVO;
import kr.controller.Action;
import kr.member.vo.MemberVO;
import kr.theater.dao.TheaterDAO;
import kr.theater.vo.TheaterVO;


public class WriteAskAction implements Action {

   @Override
   public String execute(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
      HttpSession session = request.getSession();
      MemberVO user = (MemberVO) session.getAttribute("member");
      if (user == null) {
            return "redirect:/member/loginForm.do";
        }
      
      int member_id = user.getMember_id();
      
      
      // 1. Theater 정보 조회
      TheaterDAO theaterDAO = TheaterDAO.getInstance();
      String theaterIDStr = request.getParameter("theaterID");
      if (theaterIDStr == null || theaterIDStr.trim().isEmpty()) {
          // theaterID가 없으면 폼으로 다시 보내기 (에러 메시지 포함 가능)
          request.setAttribute("errorMessage", "극장을 선택해주세요.");
          return "/notice/writeForm.jsp";  // 폼 JSP 경로
      }

         
      int theaterID = Integer.parseInt(request.getParameter("theaterID"));
      TheaterVO theater = theaterDAO.getTheater(theaterID);
      String cgv_name = theater.getName();
      
      
      // 로그인 된 경우
      AskVO ask=new AskVO();
      ask.setMember_id(member_id);
        ask.setTitle(request.getParameter("title"));
        ask.setContent(request.getParameter("content"));
        ask.setCategory(request.getParameter("category"));
        ask.setStatus("대기");
        ask.setSatisfaction(0);
        ask.setTheaterID(theaterID);
        ask.setCgv_name(cgv_name);
        
        System.out.println("writeAskAction 실행됨");
        System.out.println("theaterIDStr: " + theaterIDStr);
        System.out.println("title: " + request.getParameter("title"));
        System.out.println("category: " + request.getParameter("category"));
        
        
     // 3. DAO에 등록
        AskDAO askDAO = AskDAO.getInstance();
        try {
			askDAO.insertAsk(ask);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  // insertAsk()는 본인이 만든 메서드 이름으로 맞춰주세요

        return "redirect:/notice/ask.do";
      
      
        
    }
}
