package com.cosmos.model.quiz;

import com.cosmos.vo.QuizVO;

public class QuizService {

	QuizDAO dao = new QuizDAO();

	// 문제 추가
	public String insertQuiz(int sgNo, String quizUrl, String quizTitle) {
		int result = dao.insertQuiz(sgNo, quizUrl, quizTitle);
		if (result < 1) {
			return "문제 추가 실패";
		} else {
			return "문제 추가 성공";
		}
	}

	// quiz_no로 quiz_title, quiz_url 찾기
	public QuizVO selectByQuizNo(int quiz_no) {
		return dao.selectByQuizNo(quiz_no);
	}
}
