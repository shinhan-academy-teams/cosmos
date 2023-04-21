package com.cosmos.controller.study;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.cosmos.controller.CommonControllerInterface;

public class StudyMainController implements CommonControllerInterface {

	@Override
	public String execute(Map<String, Object> data) throws Exception {
		HttpServletRequest request = (HttpServletRequest)data.get("request");
		int studyno = Integer.parseInt(request.getParameter("studyno"));
		return "myStudyDetail.jsp";
	}

}
