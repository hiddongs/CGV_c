package kr.member.action;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import kr.controller.Action;
import kr.member.dao.MemberDAO;
import kr.member.vo.MemberVO;
import java.io.IOException;

public class ModifyAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        MemberVO user = (MemberVO)session.getAttribute("member");
        
        if(user == null) {
            return "redirect:/member/loginForm.do";
        }
        
        // 전송된 데이터 인코딩 처리
        request.setCharacterEncoding("utf-8");
        
        // 전송된 데이터 반환
        String mem_name = request.getParameter("mem_name");
        String mem_phone = request.getParameter("mem_phone");
        String mem_email = request.getParameter("mem_email");
        
        MemberVO member = new MemberVO();
        member.setMem_num(user.getMem_num());
        member.setMem_name(mem_name);
        member.setMem_phone(mem_phone);
        member.setMem_email(mem_email);
        
        MemberDAO dao = MemberDAO.getInstance();
        
        try {
            dao.updateMember(member);
            
            request.setAttribute("result_title", "회원정보 수정 완료");
            request.setAttribute("result_msg", "회원정보가 수정되었습니다.");
            request.setAttribute("result_url", "member/myPage.do");
            
            return "common/result_view.jsp";
            
        } catch(Exception e) {
            e.printStackTrace();
            throw new ServletException(e);
        }
    }
}
