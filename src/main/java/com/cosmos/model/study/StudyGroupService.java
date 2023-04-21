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
	public String joinStudyGroup(int memberNo, int studyNo) {
		if(!studyGroupDao.canJoinStudy(memberNo, studyNo)) {
			return "이미 가입된 스터디입니다.";
		}
		int result = studyGroupDao.joinStudyGroup(memberNo, studyNo);
		if(result<1) {
			return "스터디 가입 실패";
		}
		return "스터디에 가입되었습니다.";
	}
	
	// 스터디 생성
	public String createStudyGroup(StudyGroupVO object) {
		int result = studyGroupDao.createStudyGroup(object);
		if(result<2) {
			return "스터디 생성 실패";
		}
		return "스터디가 만들어졌습니다.";
	}

}
