package com.cosmos.model.code;

import java.util.List;

import com.cosmos.vo.CodeVO;

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
	public List<CodeVO> showCode(int quizNo, int sgNo) {
		return dao.showCode(quizNo, sgNo);
	}
}
