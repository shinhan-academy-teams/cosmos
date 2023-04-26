/*
 * 다른 코드 보기
 */
package com.cosmos.controller.study.mystudy;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.cosmos.controller.CommonControllerInterface;
import com.cosmos.model.code.CodeService;
import com.cosmos.model.comments.CommentsService;
import com.cosmos.model.mark.MarkService;
import com.cosmos.vo.MemberVO;
import com.cosmos.vo.code.MarkCodeVO;

public class ShowCodeController implements CommonControllerInterface {

	@Override
	public String execute(Map<String, Object> data) throws Exception {
		HttpServletRequest request = (HttpServletRequest)data.get("request");
		
		//코드
		CodeService codeService = new CodeService();
		int quizNo = Integer.parseInt(request.getParameter("quizno"));
		int sgNo = Integer.parseInt(request.getParameter("studyno"));
		List<MarkCodeVO> allCode = codeService.showCode(quizNo, sgNo);
		request.setAttribute("allCode", allCode);
		
		//좋아요
		HttpSession session = request.getSession();
		MemberVO nowUser = (MemberVO) session.getAttribute("user");
		MarkService markService = new MarkService();
		request.setAttribute("markList", markService.selectMarkByMember(nowUser.getMember_no()));
		
		//댓글
		CommentsService cmtService = new CommentsService();
		request.setAttribute("cmtMap", cmtService.selectCmtByCode(quizNo,sgNo));
		
		return "codeReview.jsp";
	}

}
