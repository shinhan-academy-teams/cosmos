package com.cosmos.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public class SignOutController implements CommonControllerInterface {

	@Override
	public String execute(Map<String, Object> data) throws Exception {
		HttpServletRequest request = (HttpServletRequest)data.get("request");
		request.getSession(false).invalidate();
		//invalidate() : 서버쪽 세션이 지워짐, Browser 접속을 해제하기
		return "index.jsp";
	}

}
