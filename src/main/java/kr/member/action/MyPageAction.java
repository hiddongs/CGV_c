package kr.member.action;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import kr.controller.Action;
import kr.member.dao.MemberDAO;
import kr.member.vo.MemberVO;
import java.io.IOException;

public class MyPageAction implements Action {
    @Override
    // 회원정보
    public String execute(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        MemberVO user = (MemberVO)session.getAttribute("member");
        
        if(user == null) { // 로그인 되지 않은 경우
            return "redirect:/member/loginForm.do";
        }
        try {
        	
            MemberDAO dao = MemberDAO.getInstance();
            MemberVO member = dao.getMember(user.getMember_id());
            
            request.setAttribute("member", member);
            
            return "member/myPage.jsp";
            
        } catch(Exception e) {
            e.printStackTrace();
            throw new ServletException(e);
        }
        
        // 예매내역
        
        
        
        // 관람권/할인쿠폰 관리
        // 문의내역
        // 나의 포인트
        
    }
}
