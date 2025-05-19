package kr.ask.action;

import java.util.List;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import kr.ask.dao.AskDAO;
import kr.ask.vo.AskVO;
import kr.controller.Action;
import kr.member.vo.MemberVO;

public class AskListAction implements Action {

   @Override
   public String execute(HttpServletRequest request, HttpServletResponse response)  {
      // 로그인한 사용자 정보 가져오기
      HttpSession session = request.getSession();
      MemberVO user = (MemberVO) session.getAttribute("member");
      
      //로그인 여부
      
      if (user == null) {
            return "redirect:/member/loginForm.do";
        }
      
      int member_id = user.getMember_id();
      

        // DAO 호출해서 문의 목록 가져오기
        AskDAO dao = AskDAO.getInstance();
        List<AskVO> askList = null;
		try {
			askList = dao.getAskListByMember(member_id);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

        // JSP에 전달할 데이터 설정
        request.setAttribute("askList", askList);
      // View 경로 반환
        return "/notice/ask.jsp";
   }

}
