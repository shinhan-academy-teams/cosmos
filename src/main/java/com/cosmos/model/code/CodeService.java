package com.cosmos.model.code;

import java.util.List;

import com.cosmos.vo.code.MarkCodeVO;
import com.cosmos.vo.code.MyCodeVO;

public class CodeService {

	CodeDAO dao = new CodeDAO();

	public String insertCode(int quizNo, int sgNo, String codeContent, int memberNo, String lang) {
		int result = dao.insertCode(quizNo, sgNo, codeContent, memberNo, lang);
		if (result < 1) {
			return "코드 추가 실패";
		} else {
			return "코드 제출 완료";
		}
	}

	// 코드 보기
	public List<MarkCodeVO> showCode(int quizNo, int sgNo) {
		return dao.showCode(quizNo, sgNo);
	}

	// 내 코드 목록 보기
	public List<MyCodeVO> showMyCode(int memberNo) {
		return dao.showMyCode(memberNo);
	}

	// 내가 좋아요 표시한 코드 보기
	public List<MyCodeVO> showMarkedCode(int memberNo) {
		return dao.showMarkedCode(memberNo);
	}

	// 코드 제출했었는지 판단
	public String codeMemCheck(int memberNo, int sgNo, int quizNo) {
		int result = dao.codeMemCheck(memberNo, sgNo, quizNo);
		if (result < 1) {
			return "작성한 코드 없음";
		} else {
			return "작성한 코드 있음";
		}

	}
}
