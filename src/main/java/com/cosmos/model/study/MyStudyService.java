package com.cosmos.model.study;

import java.util.List;

import com.cosmos.vo.QuizVO;
import com.cosmos.vo.StudyGroupVO;
import com.cosmos.vo.StudyMemberVO;

public class MyStudyService {
	MyStudyDAO myStudyDao = new MyStudyDAO();

	public List<StudyGroupVO> selectMyStudy(int memberNo) {
		return myStudyDao.selectMyStudy(memberNo);
	}

	// 내 스터디 문제 목록 보여주기
	public List<QuizVO> showAllQuiz(int studyNO) {
		return myStudyDao.showAllQuiz(studyNO);
	}

	// 스터디 탈퇴하기
	public int leaveStudy(int memberNo, int studyNo) {
		return myStudyDao.leaveStudy(memberNo, studyNo);
	}

	// 스터디 관리하기
	public List<StudyMemberVO> manageStudy(int studyNo) {
		return myStudyDao.manageStudy(studyNo);
	}
}
