package kr.member.action;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import kr.controller.Action;
import kr.member.vo.MemberVO;
import java.io.IOException;

public class DeleteFormAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        MemberVO user = (MemberVO)session.getAttribute("member");
        
        if(user == null) {
            return "redirect:/member/loginForm.do";
        }
        
        return "member/deleteForm.jsp";
    }
}
