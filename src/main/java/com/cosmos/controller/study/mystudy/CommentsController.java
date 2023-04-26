/*
 * 댓글 작성, 보기
 */
package com.cosmos.controller.study.mystudy;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.cosmos.controller.CommonControllerInterface;
import com.cosmos.model.comments.CommentsService;

public class CommentsController implements CommonControllerInterface {

	@Override
	public String execute(Map<String, Object> data) throws Exception {
		HttpServletRequest request = (HttpServletRequest)data.get("request");
		request.setCharacterEncoding("utf-8");
		
		//댓글 작성
		int codeNo = Integer.parseInt(request.getParameter("codeNo"));
		int memberNo = Integer.parseInt(request.getParameter("memberNo"));
		String cmtContent = request.getParameter("cmtContent");
		int sgNo = Integer.parseInt(request.getParameter("sgNo"));
		int quizNo = Integer.parseInt(request.getParameter("quizNo"));
		
		CommentsService service = new CommentsService();
		String message = service.insertComments(codeNo, memberNo, cmtContent, sgNo, quizNo);
		return "responseBody:"+message;
		
	}

}
