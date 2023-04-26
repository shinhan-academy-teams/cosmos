/*
 * 스터디 검색
 */
package com.cosmos.controller.study.common;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.cosmos.controller.CommonControllerInterface;
import com.cosmos.model.study.StudyGroupService;
import com.cosmos.vo.StudyGroupVO;

public class GroupSearchController implements CommonControllerInterface {

	@Override
	public String execute(Map<String, Object> data) throws Exception {
		// Get요청 처리
		HttpServletRequest request = (HttpServletRequest)data.get("request");
		String searchOption = request.getParameter("searchOption");
		String keyword = request.getParameter("search");
		List<StudyGroupVO> studyGroup = new ArrayList<>();
		StudyGroupService sv = new StudyGroupService();
		
		if(searchOption.equals("study_all")) {
			studyGroup = sv.searchGroupByKeyword(keyword);
		}
		if(searchOption.equals("study_name")) {
			studyGroup = sv.searchGroupByName(keyword);
		}
		if(searchOption.equals("study_manager")) {
			studyGroup = sv.searchGroupByManager(keyword);
		}
		request.setAttribute("studyGroup", studyGroup);
		return "studyList.jsp";
	}

}
