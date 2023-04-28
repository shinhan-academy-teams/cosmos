/*
 * 스터디 그룹 만들기
 */
package com.cosmos.controller.study.common;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.cosmos.controller.CommonControllerInterface;
import com.cosmos.model.study.StudyGroupService;
import com.cosmos.vo.StudyGroupVO;

public class CreateGroupController implements CommonControllerInterface {

	@Override
	public String execute(Map<String, Object> data) throws Exception {
		HttpServletRequest request = (HttpServletRequest) data.get("request");
		String method = (String) data.get("method");
		if (method.equals("GET")) {
			return "createStudy.jsp";
		}

		// 새로운 스터디 그룹 객체 생성
		StudyGroupVO newGroup = new StudyGroupVO();
		StudyGroupService service = new StudyGroupService();
		newGroup.setSg_name(request.getParameter("studyName"));
		newGroup.setSg_manager(Integer.parseInt(request.getParameter("memberNo")));
		newGroup.setSg_max(Integer.parseInt(request.getParameter("maxPeople")));
		newGroup.setSg_lang(request.getParameter("lang"));
		newGroup.setSg_info(request.getParameter("info"));
		String message = service.createStudyGroup(newGroup);
		return "responseBody:" + message;
	}

}
