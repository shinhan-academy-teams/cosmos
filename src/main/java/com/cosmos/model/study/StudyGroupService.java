package com.cosmos.model.study;

import java.util.List;

import com.cosmos.vo.StudyGroupVO;

public class StudyGroupService {
	StudyGroupDAO studyGroupDao = new StudyGroupDAO();
	
	public List<StudyGroupVO> selectAllGroup() {
		return studyGroupDao.selectAllGroup();
	}

}
