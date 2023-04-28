package com.cosmos.model.mark;

import java.util.List;

public class MarkService {
	MarkDAO dao = new MarkDAO();

	public String insertMark(int memberNo, int codeNo) {
		int result = dao.insertMark(memberNo, codeNo);
		if (result < 1) {
			return "좋아요 표시 안됨..";
		} else {
			return "좋아요! 마이페이지>좋아요 표시한 코드에서 확인 가능합니다.";
		}
	}

	public int countMark(int codeNo) {
		return dao.countMark(codeNo);
	}

	// 이미 좋아요 했는지
	public boolean isAlreadyMarked(int memberNo, int codeNo) {
		return dao.isAlreadyMarked(memberNo, codeNo);
	}

	// 특정 사용자가 좋아요한 코드 select
	public List<Integer> selectMarkByMember(int memberNo) {
		return dao.selectMarkByMember(memberNo);
	}
}
