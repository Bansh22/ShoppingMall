package com.usedate.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.usedate.db.UsedateDAO;

public class completeUseAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
        String userId = (String) session.getAttribute("userId");
        
        ActionForward forward = new ActionForward();
        if(userId == null){
        	forward.setPath("./MemberLogin.me");
        	forward.setRedirect(true);
        	return forward;
        }
        
        int openNum = Integer.parseInt(request.getParameter("openNum"));
        
        UsedateDAO udao = new UsedateDAO();
        udao.completeuse(openNum);
        
    	forward.setPath("/Usedate.ud");
		forward.setRedirect(false);
		return forward;
	}

	
}