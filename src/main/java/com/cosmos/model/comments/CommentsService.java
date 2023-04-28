package com.cosmos.model.comments;

import java.util.List;
import java.util.Map;

import com.cosmos.vo.comments.CmtJoinMemVO;

public class CommentsService {

	CommentsDAO dao = new CommentsDAO();

	// 댓글 작성
	public String insertComments(int codeNo, int memberNo, String cmtContent, int sgNo, int quizNo) {
		int result = dao.insertComments(codeNo, memberNo, cmtContent, sgNo, quizNo);
		if (result < 1) {
			return "댓글 추가 안됨";
		} else {
			return "댓글 작성 완료";
		}
	}

	// 코드에 맞는 댓글select
	public Map<Integer, List<CmtJoinMemVO>> selectCmtByCode(int quizNo, int sgNo) {
		return dao.selectCmtByCode(quizNo, sgNo);
	}
}
