package com.cosmos.controller.study;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.cosmos.controller.CommonControllerInterface;
import com.cosmos.model.code.CodeService;
import com.cosmos.model.mark.MarkService;
import com.cosmos.vo.CodeVO;
import com.cosmos.vo.MemberVO;

public class ShowCodeController implements CommonControllerInterface {

	@Override
	public String execute(Map<String, Object> data) throws Exception {
		HttpServletRequest request = (HttpServletRequest)data.get("request");
		CodeService codeService = new CodeService();
		int quizNo = Integer.parseInt(request.getParameter("quizno"));
		int sgNo = Integer.parseInt(request.getParameter("studyno"));
		List<CodeVO> allCode = codeService.showCode(quizNo, sgNo);
		request.setAttribute("allCode", allCode);
		
		HttpSession session = request.getSession();
		MemberVO nowUser = (MemberVO) session.getAttribute("user");
		MarkService markService = new MarkService();
		request.setAttribute("markList", markService.selectMarkByMember(nowUser.getMember_no()));
		
		return "codeReview.jsp";
	}

}
