package com.cosmos.controller.study;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.cosmos.controller.CommonControllerInterface;
import com.cosmos.model.study.MyStudyService;
import com.cosmos.vo.MemberVO;
import com.cosmos.vo.StudyGroupVO;

public class MyStudyController implements CommonControllerInterface {

	@Override
	public String execute(Map<String, Object> data) throws Exception {
		HttpServletRequest request = (HttpServletRequest)data.get("request");
		HttpSession session = request.getSession();
		MemberVO nowUser = (MemberVO) session.getAttribute("user");
		MyStudyService service = new MyStudyService();
		List<StudyGroupVO> myGroup = service.selectMyStudy(nowUser.getMember_no());
		request.setAttribute("myGroup", myGroup);
		return "myStudyList.jsp";
	}

}
