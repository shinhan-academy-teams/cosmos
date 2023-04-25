package com.cosmos.model.comments;

public class CommentsService {

	CommentsDAO dao = new CommentsDAO();
	public String insertComments(int codeNo, int memberNo, String cmtContent) {
		int result = dao.insertComments(codeNo, memberNo, cmtContent);
		if(result <1) {
			return "댓글 추가 안됨";
		}else {
			return "댓글 작성 완료";
		}
	}
}
