package com.cosmos.model.study;

import java.util.List;

import com.cosmos.vo.StudyGroupVO;

public class MyStudyService {
	MyStudyDAO myStudyDao = new MyStudyDAO();
	
	public List<StudyGroupVO> selectMyStudy(int memberNo){
		return myStudyDao.selectMyStudy(memberNo);
	}

}
