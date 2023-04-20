package com.cosmos.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.cosmos.model.members.FindService;
import com.cosmos.vo.MemberVO;

public class FindIdController implements CommonControllerInterface {

	@Override
	public String execute(Map<String, Object> data) throws Exception {
		String method = (String) data.get("method");
		String page = "";
		
		if (method.equals("GET")) {
			page = "find-id.jsp";
		} else {
			HttpServletRequest request = (HttpServletRequest) data.get("request");
			String email = request.getParameter("email");
			FindService service = new FindService();
			MemberVO member = service.findId(email);

			String userId;
			if (member != null) {
				userId = member.getMember_id();
				System.out.println("아이디는 " + userId);
			} else {
				userId = "none";
				System.out.println("계정등록이 되어있지 않은 이메일입니다..");
			}
			
			page = "responseBody:" + userId;
		}
		return page;
	}

}
