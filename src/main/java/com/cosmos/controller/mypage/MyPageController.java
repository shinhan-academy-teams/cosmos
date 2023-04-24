package com.cosmos.controller.mypage;

import java.util.Map;

import com.cosmos.controller.CommonControllerInterface;

public class MyPageController implements CommonControllerInterface {

	@Override
	public String execute(Map<String, Object> data) throws Exception {
		String method = (String) data.get("method");
		String page = "";
		
		if (method.equals("GET")) {
			page = "myPage.jsp";
		} else {
			
		}
		
		return page;
	}
}