package com.cosmos.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.cosmos.model.members.FindService;
import com.cosmos.vo.MemberVO;

public class FindPwdController implements CommonControllerInterface {

	@Override
	public String execute(Map<String, Object> data) throws Exception {
		String method = (String) data.get("method");
		String page = "";
		if (method.equals("GET")) {
			page = "find-pw.jsp";
		} else {
			HttpServletRequest request = (HttpServletRequest) data.get("request");
			HttpSession session = request.getSession();
			String id = request.getParameter("id"); // 아이디 가져옴
			FindService service = new FindService();
			MemberVO vo = service.findById(id);// 아이디로 해당 데이터 찾기
			service.updateRndPwd(vo); // 해당 데이터를 업데이트하기
			
			
			session.setAttribute("message", "from FindPwdController");
			page = "redirect:"+ request.getContextPath() +"/signin.do";
		}
		return page;
	}

}
