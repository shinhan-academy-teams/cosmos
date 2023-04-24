package com.cosmos.controller.study;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.cosmos.controller.CommonControllerInterface;
import com.cosmos.model.code.CodeService;
import com.cosmos.vo.CodeVO;

public class ShowCodeController implements CommonControllerInterface {

	@Override
	public String execute(Map<String, Object> data) throws Exception {
		HttpServletRequest request = (HttpServletRequest)data.get("request");
		CodeService service = new CodeService();
		int quizNo = Integer.parseInt(request.getParameter("quizno"));
		int sgNo = Integer.parseInt(request.getParameter("studyno"));
		List<CodeVO> allCode = service.showCode(quizNo, sgNo);
		request.setAttribute("allCode", allCode);
		return "codeReview.jsp";
	}

}
