package com.cosmos.controller.study;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.cosmos.controller.CommonControllerInterface;
import com.cosmos.model.study.StudyGroupService;
import com.cosmos.vo.StudyGroupVO;

public class StudyIntroduceController implements CommonControllerInterface {

	@Override
	public String execute(Map<String, Object> data) throws Exception {
		HttpServletRequest request = (HttpServletRequest)data.get("request");
		int studyno = Integer.parseInt(request.getParameter("studyno"));
		StudyGroupService service = new StudyGroupService();
		StudyGroupVO groupInfo = service.getGroupInfo(studyno);
		request.setAttribute("groupInfo", groupInfo);
		return "studyIntro.jsp";
	}
}
