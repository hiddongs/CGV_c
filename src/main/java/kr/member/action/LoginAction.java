package kr.member.action;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import kr.controller.Action;
import kr.member.dao.MemberDAO;
import kr.member.vo.MemberVO;
import java.io.IOException;

public class LoginAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String mem_id = request.getParameter("mem_id");
        String mem_pw = request.getParameter("mem_pw");
        
        MemberDAO dao = MemberDAO.getInstance();
        
        try {
            MemberVO member = dao.checkMember(mem_id, mem_pw);
            
            if(member != null) { // 인증 성공
                HttpSession session = request.getSession();
                session.setAttribute("member", member);
                
                return "redirect:/main/main.do";
            }
            
            // 인증 실패
            request.setAttribute("result_title", "로그인 실패");
            request.setAttribute("result_msg", "아이디 또는 비밀번호가 일치하지 않습니다.");
            request.setAttribute("result_url", "member/loginForm.do");
            
            return "common/result_view.jsp";
            
        } catch(Exception e) {
            e.printStackTrace();
            throw new ServletException(e);
        }
    }
}
