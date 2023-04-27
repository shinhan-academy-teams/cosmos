package com.cosmos.controller.study.mystudy;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.cosmos.controller.CommonControllerInterface;
import com.cosmos.model.study.MyStudyService;
import com.cosmos.vo.StudyMemberVO;

public class ManageStudyController implements CommonControllerInterface {

	@Override
	public String execute(Map<String, Object> data) throws Exception {
		HttpServletRequest request = (HttpServletRequest)data.get("request");
		int studyNo = Integer.parseInt(request.getParameter("studyno"));
		MyStudyService service = new MyStudyService();
		List<StudyMemberVO> studyMembers = service.manageStudy(studyNo);
		request.setAttribute("studyMembers", studyMembers);
		request.setAttribute("studyNo", studyNo);
		return "myStudyManage.jsp";
	}

}
