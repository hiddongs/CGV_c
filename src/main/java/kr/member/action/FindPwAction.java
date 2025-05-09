package kr.member.action;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.controller.Action;
import kr.member.dao.MemberDAO;
import java.io.IOException;
import java.util.Random;

public class FindPwAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // 전송된 데이터 인코딩 처리
        request.setCharacterEncoding("utf-8");
        
        String user_id = request.getParameter("mem_id");
        String mem_email = request.getParameter("mem_email");
        
        MemberDAO dao = MemberDAO.getInstance();
        
        try {
            if(dao.checkMemberForPw(user_id, mem_email)) {
                // 임시 비밀번호 생성
                String temp_pw = generateTempPassword();
                
                // 임시 비밀번호로 변경
                dao.updatePassword(dao.getMember(user_id).getMember_id(), temp_pw);
                
                // TODO: 이메일 발송 로직 추가
                
                request.setAttribute("result_title", "임시 비밀번호 발급");
                request.setAttribute("result_msg", "임시 비밀번호는 "+ temp_pw + " 입니다");
            } else {
                request.setAttribute("result_title", "비밀번호 찾기 실패");
                request.setAttribute("result_msg", "일치하는 회원정보가 없습니다.");
            }
            request.setAttribute("result_url", "loginForm.do");
            
            return "common/result_view.jsp";
            
        } catch(Exception e) {
            e.printStackTrace();
            throw new ServletException(e);
        }
    }
    
    // 임시 비밀번호 생성 메서드
    private String generateTempPassword() {
        String chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
        StringBuilder sb = new StringBuilder();
        Random random = new Random();
        
        for(int i = 0; i < 8; i++) {
            sb.append(chars.charAt(random.nextInt(chars.length())));
        }
        
        return sb.toString();
    }
}
