package com.cosmos.model.code;

import java.util.List;

import com.cosmos.vo.code.CodeVO;
import com.cosmos.vo.code.MarkCodeVO;
import com.cosmos.vo.code.MyCodeVO;

public class CodeService {

	CodeDAO dao = new CodeDAO();
	public String insertCode(int quizNo, int sgNo, String codeContent, int memberNo, String lang) {
		int result = dao.insertCode(quizNo, sgNo, codeContent, memberNo, lang);
		if(result<1) {
			return "코드 추가 실패";
		}else {
			return "코드 제출 완료";
		}
	}
	
	//코드 보기
	public List<MarkCodeVO> showCode(int quizNo, int sgNo) {
		return dao.showCode(quizNo, sgNo);
	}
	
	// 내 코드 목록 보기
	public List<MyCodeVO> showMyCode(int memberNo) {
		return dao.showMyCode(memberNo);
	}
	
	// 내 코드 상세 보기
	public CodeVO showMyCodeContent(int codeNo, int memberNo) {
		return dao.showMyCodeContent(codeNo, memberNo);
	}
}
