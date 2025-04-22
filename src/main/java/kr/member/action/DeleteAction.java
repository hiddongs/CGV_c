package kr.member.action;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import kr.controller.Action;
import kr.member.dao.MemberDAO;
import kr.member.vo.MemberVO;
import java.io.IOException;

public class DeleteAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        MemberVO user = (MemberVO)session.getAttribute("member");
        
        if(user == null) {
            return "redirect:/member/loginForm.do";
        }
        
        String mem_pw = request.getParameter("mem_pw");
        
        MemberDAO dao = MemberDAO.getInstance();
        
        try {
            // 비밀번호 체크
            MemberVO member = dao.login(user.getUser_id(), mem_pw);
            
            if(member == null) {
                request.setAttribute("result_title", "회원 탈퇴 실패");
                request.setAttribute("result_msg", "비밀번호가 일치하지 않습니다.");
                request.setAttribute("result_url", "member/deleteForm.do");
                return "common/result_view.jsp";
            }
            
            // 회원정보 삭제
            dao.deleteMember(user.getMember_id());
            
            // 로그아웃
            session.invalidate();
            
            request.setAttribute("result_title", "회원 탈퇴 완료");
            request.setAttribute("result_msg", "회원 탈퇴가 완료되었습니다.");
            request.setAttribute("result_url", request.getContextPath() + "/index.jsp");
            
            return "common/result_view.jsp";
            
        } catch(Exception e) {
            e.printStackTrace();
            throw new ServletException(e);
        }
    }
}
