package com.cosmos.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.cosmos.model.study.StudyGroupService;

public class JoinStudyController implements CommonControllerInterface {

	@Override
	public String execute(Map<String, Object> data) throws Exception {
		HttpServletRequest request = (HttpServletRequest)data.get("request");
		System.out.println(request.getParameter("memberNo"));
		int memberNo = Integer.parseInt(request.getParameter("memberNo"));
		int studyNo = Integer.parseInt(request.getParameter("studyNo"));
		System.out.println(studyNo);
		StudyGroupService service = new StudyGroupService();
		service.joinStudyGroup(memberNo, studyNo);
		return "responseBody:가입완료";
	}

}
