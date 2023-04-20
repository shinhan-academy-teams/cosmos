package com.cosmos.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import com.cosmos.model.study.StudyGroupService;

public class JoinStudyController implements CommonControllerInterface {

	@Override
	public String execute(Map<String, Object> data) throws Exception {
		HttpServletRequest request = (HttpServletRequest)data.get("request");
		int memberNo = Integer.parseInt(request.getParameter("memberNo"));
		int studyNo = Integer.parseInt(request.getParameter("studyNo"));
		StudyGroupService service = new StudyGroupService();
		String message = service.joinStudyGroup(memberNo, studyNo);
		return "responseBody:" + message;
	}

}
