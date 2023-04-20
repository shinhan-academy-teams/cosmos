package com.cosmos.controller.study;

import java.util.Map;

import com.cosmos.controller.CommonControllerInterface;

public class MyStudyController implements CommonControllerInterface {

	@Override
	public String execute(Map<String, Object> data) throws Exception {
		return "myStudyList.jsp";
	}

}
