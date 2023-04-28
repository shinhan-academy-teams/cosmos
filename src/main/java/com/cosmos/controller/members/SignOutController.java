package com.cosmos.controller.members;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.cosmos.controller.CommonControllerInterface;

public class SignOutController implements CommonControllerInterface {

	@Override
	public String execute(Map<String, Object> data) throws Exception {
		HttpServletRequest request = (HttpServletRequest) data.get("request");
		request.getSession(false).invalidate(); // invalidate() : 서버쪽 세션이 지워짐, Browser 접속을 해제하기

		return "redirect:" + request.getContextPath();
	}

}
