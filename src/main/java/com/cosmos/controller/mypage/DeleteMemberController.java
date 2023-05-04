package com.cosmos.controller.mypage;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.cosmos.controller.CommonControllerInterface;
import com.cosmos.controller.members.Encrypt;
import com.cosmos.model.members.MemberService;
import com.cosmos.model.members.SignInService;

public class DeleteMemberController implements CommonControllerInterface {

	@Override
	public String execute(Map<String, Object> data) throws Exception {
		HttpServletRequest request = (HttpServletRequest) data.get("request");
		// 탈퇴할 회원번호
		int memberNo = Integer.parseInt(request.getParameter("memberNo"));

		// 결과 -2: 비밀번호 불일치 -1: 스터디그룹 존재 0: 실패 1: 탈퇴 성공
		int result = 0;

		// 비밀번호 확인 절차
		String memberId = request.getParameter("memberId");
		String memberPwd = request.getParameter("memberPwd");
		Encrypt en = new Encrypt();
		String en_pwd = en.getEncrypt(memberPwd);
		SignInService checkService = new SignInService();
		if (checkService.idPwdCheck(memberId, en_pwd) > 0) {
			MemberService service = new MemberService();
			result = service.deleteMember(memberNo);
		} else {
			result = -2;
		}

		// 정상적으로 회원 탈퇴 성공시 세션 종료
		if (result == 1) {
			request.getSession(false).invalidate();
		}

		return "responseBody:" + result;
	}

}
