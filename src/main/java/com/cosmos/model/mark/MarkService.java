package com.cosmos.model.mark;

public class MarkService {
	MarkDAO dao = new MarkDAO();
	
	public String insertMark(int memberNo, int codeNo) {
		int result = dao.insertMark(memberNo, codeNo);
		if(result<1) {
			return "좋아요 표시 안됨..";
		}else {
			return "좋아요! 마이페이지>좋아요 표시한 코드에서 확인 가능합니다.";
		}
	}
	
	public int countMark(int codeNo) {
		return dao.countMark(codeNo);
	}
}
