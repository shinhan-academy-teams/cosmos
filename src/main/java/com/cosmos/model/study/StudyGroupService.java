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
	
	// 스터디명 또는 스터디장명으로 찾기
	public List<StudyGroupVO> searchGroupByKeyword(String keyword) {
		return studyGroupDao.searchGroupByKeyword(keyword);
	}
	
	// 스터디 아이디로 스터디 그룹 정보 가져오기
	public StudyGroupVO getGroupInfo(int studyNo) {
		return studyGroupDao.getGroupInfo(studyNo);
	}
	
	// 스터디 가입
	public int joinStudyGroup(int memberNo, int studyNo) {
		return studyGroupDao.joinStudyGroup(memberNo, studyNo);
	}

}
