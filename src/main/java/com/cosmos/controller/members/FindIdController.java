package com.cosmos.controller.members;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.cosmos.controller.CommonControllerInterface;
import com.cosmos.model.members.FindService;
import com.cosmos.vo.MemberVO;

public class FindIdController implements CommonControllerInterface {

	@Override
	public String execute(Map<String, Object> data) throws Exception {
		String method = (String) data.get("method");
		String page = "";

		if (method.equals("GET")) {
			page = "findId.jsp";
		} else {
			HttpServletRequest request = (HttpServletRequest) data.get("request");
			String email = request.getParameter("email");
			FindService service = new FindService();
			MemberVO member = service.findId(email);

			String userId;
			if (member != null) {
				userId = member.getMember_id();
			} else {
				userId = "none";
			}

			page = "responseBody:" + userId;
		}
		return page;
	}

}
