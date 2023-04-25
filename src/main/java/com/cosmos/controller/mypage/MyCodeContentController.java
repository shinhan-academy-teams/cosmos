package com.cosmos.controller.mypage;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.cosmos.controller.CommonControllerInterface;
import com.cosmos.model.code.CodeService;
import com.cosmos.vo.MemberVO;
import com.cosmos.vo.code.CodeVO;

public class MyCodeContentController implements CommonControllerInterface {

	@Override
	public String execute(Map<String, Object> data) throws Exception {
		HttpServletRequest request = (HttpServletRequest)data.get("request");
		HttpSession session = request.getSession();
		MemberVO nowUser = (MemberVO) session.getAttribute("user");
		int codeNo = Integer.parseInt(request.getParameter("codeno"));
		int memberNo = nowUser.getMember_no();
		CodeService service = new CodeService();
		CodeVO code = service.showMyCodeContent(codeNo, memberNo);
		request.setAttribute("myCode", code);
		return "myCode.jsp";
	}

}
