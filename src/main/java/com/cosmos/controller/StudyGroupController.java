package com.cosmos.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.cosmos.model.study.StudyGroupService;
import com.cosmos.vo.StudyGroupVO;

public class StudyGroupController implements CommonControllerInterface {

	@Override
	public String execute(Map<String, Object> data) throws Exception {
		// Get요청 처리
		HttpServletRequest request = (HttpServletRequest)data.get("request");
		StudyGroupService sv = new StudyGroupService();
		List<StudyGroupVO> studyGroup = sv.selectAllGroup();
		request.setAttribute("studyGroup", studyGroup);
		return "studyList.jsp";
	}

}
