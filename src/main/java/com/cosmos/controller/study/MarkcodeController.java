package com.cosmos.controller.study;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.cosmos.controller.CommonControllerInterface;
import com.cosmos.model.mark.MarkService;

public class MarkcodeController implements CommonControllerInterface {

	@Override
	public String execute(Map<String, Object> data) throws Exception {
		HttpServletRequest request = (HttpServletRequest)data.get("request");
		
		int memberNo = Integer.parseInt(request.getParameter("memberNo"));
		int codeNo = Integer.parseInt(request.getParameter("codeNo"));
		MarkService service = new MarkService();
		String message = service.insertMark(memberNo, codeNo);
		
		
		int markCount = service.countMark(codeNo);
		request.setAttribute("markCount", markCount);
		return "responseBody:"+message;
	}

}
