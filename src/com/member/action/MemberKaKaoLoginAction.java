package com.member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.member.db.MemberDAO;

public class MemberKaKaoLoginAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String userEmail = request.getParameter("userEmail");

		// DAO객체 생성 -> idCheck(id,pass)
			MemberDAO mdao = new MemberDAO();
			
			String check = mdao.kakaoIdCheck(userEmail);
	
			// 결과에 따른 페이지 이동
			// 컨트롤러 X - 비밀번호,아이디없음 오류(javascript)
			// => 컨트롤러에는 가지만 페이지이동 X
			
			if (check.equals("")) { // 이메일 없음, 회원가입 권유
				response.setContentType("text/html; charset=utf-8");
				PrintWriter out = response.getWriter();
	
				out.print("<script>");
				out.print("var con_test = confirm('회원가입 하시겠습니까.'); ");
				out.print(" history.back(); ");
				out.print("if(con_test == true){");
				out.print("alert('확인을 누르셨군요');");
				out.print("}");
				out.print("else if(con_test == false){");
				out.print(" history.back(); ");
				out.print("}");

				out.print("</script>");
	
				
				out.close();
				return null;
			}
			
			// 컨트롤러 O - 로그인성공
			// check == 0 
			// => 메인페이지로 이동
			
			// 아이디 정보를 session객체에 저장
			HttpSession session = request.getSession();
		    session.setAttribute("userId", check);	
			
		    // 페이지 이동 (./Main.me)
			ActionForward forward = new ActionForward();
			forward.setPath("./Main.me");
			forward.setRedirect(true);
			return forward;
		
		
			}

	
	
}
