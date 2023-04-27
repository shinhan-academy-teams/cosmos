/*
 * 문제 만들기
 */
package com.cosmos.controller.study.mystudy;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.cosmos.controller.CommonControllerInterface;
import com.cosmos.model.quiz.QuizService;

public class CreateQuizController implements CommonControllerInterface {

	@Override
	public String execute(Map<String, Object> data) throws Exception {
		HttpServletRequest request = (HttpServletRequest)data.get("request");
		request.setCharacterEncoding("utf-8");
		String method = (String)data.get("method");
		
		//int sgNo, String quizUrl, String quizTitle
		
		if(method.equals("GET")) {
			return "createQuizModal.jsp";
		}
		
		//파라미터로 sgNO를 받아와야함..! 아직 구현 안됨
		int studyNo = Integer.parseInt(request.getParameter("studyno"));
		String quizUrl = request.getParameter("quizUrl");
		String quizTitle = request.getParameter("quizTitle");
	
		QuizService service = new QuizService();
		service.insertQuiz(studyNo, quizUrl, quizTitle);
		return "redirect:" + request.getContextPath() + "/studymain.do?studyno=" + studyNo;
	}

}
