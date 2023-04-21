package com.cosmos.model.study;

import java.util.List;

import com.cosmos.vo.QuizVO;
import com.cosmos.vo.StudyGroupVO;

public class MyStudyService {
	MyStudyDAO myStudyDao = new MyStudyDAO();
	
	public List<StudyGroupVO> selectMyStudy(int memberNo){
		return myStudyDao.selectMyStudy(memberNo);
	}
	
	// 내 스터디 문제 목록 보여주기
	public List<QuizVO> showAllQuiz(int studyNO){
		return myStudyDao.showAllQuiz(studyNO);
	}

}
