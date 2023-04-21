package com.cosmos.controller.study;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.cosmos.controller.CommonControllerInterface;
import com.cosmos.model.study.MyStudyService;
import com.cosmos.vo.QuizVO;

public class StudyMainController implements CommonControllerInterface {

	@Override
	public String execute(Map<String, Object> data) throws Exception {
		HttpServletRequest request = (HttpServletRequest)data.get("request");
		int studyno = Integer.parseInt(request.getParameter("studyno"));
		MyStudyService service = new MyStudyService();
		List<QuizVO> allQuiz = service.showAllQuiz(studyno);
		request.setAttribute("allQuiz", allQuiz);
		return "myStudyDetail.jsp";
	}

}
