package kr.member.action;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.controller.Action;
import kr.member.dao.MemberDAO;
import kr.member.vo.MemberVO;
import java.io.IOException;

public class RegisterAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // 전송된 데이터 인코딩 처리
        request.setCharacterEncoding("utf-8");
        
        // 전송된 데이터 반환
        String mem_id = request.getParameter("mem_id");
        String mem_pw = request.getParameter("mem_pw");
        String mem_name = request.getParameter("mem_name");
        String mem_phone = request.getParameter("mem_phone");
        String mem_email = request.getParameter("mem_email");
        String mem_gender = request.getParameter("mem_gender");
        
        MemberVO member = new MemberVO();
        member.setUser_id(mem_id);
        member.setPassword(mem_pw);
        member.setName(mem_name);
        member.setPhone(mem_phone);
        member.setEmail(mem_email);
        member.setGender(mem_gender);
        
        MemberDAO dao = MemberDAO.getInstance();
        
        try {
            // 아이디 중복 체크
            if(dao.checkDuplicateId(mem_id)) {
                request.setAttribute("result_title", "회원가입 실패");
                request.setAttribute("result_msg", "이미 사용중인 아이디입니다.");
                request.setAttribute("result_url", "member/registerForm.do");
                return "common/result_view.jsp";
            }
            
            // 회원가입 처리
            dao.insertMember(member);
            
            request.setAttribute("result_title", "회원가입 완료");
            request.setAttribute("result_msg", "회원가입이 완료되었습니다.");
            request.setAttribute("result_url", request.getContextPath() + "/index.jsp");
            
            return "common/result_view.jsp";
            
        } catch(Exception e) {
            e.printStackTrace();
            throw new ServletException(e);
        }
    }
}
