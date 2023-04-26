/*
 * 스터디 가입
 */
package com.cosmos.controller.study.common;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.cosmos.controller.CommonControllerInterface;
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
