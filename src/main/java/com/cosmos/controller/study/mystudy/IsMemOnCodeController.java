package com.cosmos.controller.study.mystudy;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.cosmos.controller.CommonControllerInterface;
import com.cosmos.model.code.CodeService;

public class IsMemOnCodeController implements CommonControllerInterface {

	@Override
	public String execute(Map<String, Object> data) throws Exception {

		HttpServletRequest request = (HttpServletRequest) data.get("request");

		int memberNo = Integer.parseInt(request.getParameter("memberNo"));
		int sgNo = Integer.parseInt(request.getParameter("sgNo"));
		int quizNo = Integer.parseInt(request.getParameter("quizNo"));

		CodeService service = new CodeService();
		String message = service.codeMemCheck(memberNo, sgNo, quizNo);

		return "responseBody:" + message;
	}

}
