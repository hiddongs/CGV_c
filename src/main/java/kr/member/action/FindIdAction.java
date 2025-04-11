package kr.member.action;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.controller.Action;
import kr.member.dao.MemberDAO;
import java.io.IOException;

public class FindIdAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // 전송된 데이터 인코딩 처리
        request.setCharacterEncoding("utf-8");
        
        String mem_name = request.getParameter("mem_name");
        String mem_email = request.getParameter("mem_email");
        
        MemberDAO dao = MemberDAO.getInstance();
        
        try {
            String mem_id = dao.findId(mem_name, mem_email);
            
            if(mem_id != null) {
                request.setAttribute("result_title", "아이디 찾기 결과");
                request.setAttribute("result_msg", "회원님의 아이디는 " + mem_id + " 입니다.");
            } else {
                request.setAttribute("result_title", "아이디 찾기 실패");
                request.setAttribute("result_msg", "일치하는 회원정보가 없습니다.");
            }
            request.setAttribute("result_url", "member/loginForm.do");
            
            return "common/result_view.jsp";
            
        } catch(Exception e) {
            e.printStackTrace();
            throw new ServletException(e);
        }
    }
}
