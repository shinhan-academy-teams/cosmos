package com.cosmos.controller.study;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.cosmos.controller.CommonControllerInterface;
import com.cosmos.model.comments.CommentsService;

public class CreateCommentsController implements CommonControllerInterface {

	@Override
	public String execute(Map<String, Object> data) throws Exception {
		HttpServletRequest request = (HttpServletRequest)data.get("request");
		request.setCharacterEncoding("utf-8");
		
		int codeNo = Integer.parseInt(request.getParameter("codeNo"));
		int memberNo = Integer.parseInt(request.getParameter("memberNo"));
		String cmtContent = request.getParameter("cmtContent");
		
		CommentsService service = new CommentsService();
		String message = service.insertComments(codeNo, memberNo, cmtContent);
		return "responseBody:"+message;
	}

}
