package com.cosmos.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public class SignUpController implements CommonControllerInterface {

	@Override
	public String execute(Map<String, Object> data) throws Exception {
		HttpServletRequest request = (HttpServletRequest)data.get("request");
		
		
		return null;
	}

}
