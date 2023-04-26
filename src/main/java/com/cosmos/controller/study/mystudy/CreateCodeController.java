/*
 * 코드 제출
 */
package com.cosmos.controller.study.mystudy;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.cosmos.controller.CommonControllerInterface;
import com.cosmos.model.code.CodeService;

public class CreateCodeController implements CommonControllerInterface {

	@Override
	public String execute(Map<String, Object> data) throws Exception {
		HttpServletRequest request = (HttpServletRequest)data.get("request");
		request.setCharacterEncoding("utf-8");
		
		int quizNo = Integer.parseInt(request.getParameter("quizNo"));
		int memberNo = Integer.parseInt(request.getParameter("memberNo"));
		int studyNo = Integer.parseInt(request.getParameter("sgNo"));
		String lang = request.getParameter("lang");
		String codeContent = request.getParameter("codeContent");
		
		CodeService service = new CodeService();
		String message = service.insertCode(quizNo, studyNo, codeContent, memberNo, lang);
		
		return "responseBody:"+message;
		}

}

