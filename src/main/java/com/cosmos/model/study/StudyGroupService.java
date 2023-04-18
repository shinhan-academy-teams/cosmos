package com.cosmos.model.study;

import java.util.List;

import com.cosmos.vo.StudyGroupVO;

public class StudyGroupService {
	StudyGroupDAO studyGroupDao = new StudyGroupDAO();
	
	// 전체 스터디 그룹 조회
	public List<StudyGroupVO> selectAllGroup() {
		return studyGroupDao.selectAllGroup();
	}
	
	// 스터디명으로 찾기
	public List<StudyGroupVO> searchGroupByName(String keyword) {
		return studyGroupDao.searchGroupByName(keyword);
	}
	
	// 스터디장명으로 찾기
	public List<StudyGroupVO> searchGroupByManager(String keyword) {
		return studyGroupDao.searchGroupByManager(keyword);
	}

}
