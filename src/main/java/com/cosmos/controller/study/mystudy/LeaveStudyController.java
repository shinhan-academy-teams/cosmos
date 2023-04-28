package com.cosmos.controller.study.mystudy;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.cosmos.controller.CommonControllerInterface;
import com.cosmos.model.study.MyStudyService;

public class LeaveStudyController implements CommonControllerInterface {

	@Override
	public String execute(Map<String, Object> data) throws Exception {
		HttpServletRequest request = (HttpServletRequest) data.get("request");
		int memberNo = Integer.parseInt(request.getParameter("memberNo"));
		int studyNo = Integer.parseInt(request.getParameter("studyNo"));
		MyStudyService service = new MyStudyService();
		int result = service.leaveStudy(memberNo, studyNo);
		return "responseBody:" + result;
	}

}
