package com.cosmos.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.cosmos.model.members.SignInService;
import com.cosmos.vo.MemberVO;

public class SignInController implements CommonControllerInterface {

	@Override
	public String execute(Map<String, Object> data) throws Exception {
		HttpServletRequest request = (HttpServletRequest) data.get("request");
		String method = (String) data.get("method");
		String page = "";
		if (method.equals("GET")) {
			page = "sign-in.jsp";
		} else {
			String id = request.getParameter("id");
			String pw = request.getParameter("pw");
			SignInService service = new SignInService();
			MemberVO member = service.signInCheck(id, pw);

			int result_idPwd = service.idPwdCheck(id, pw);
			if (result_idPwd > 0) {
				// 계정있음
				System.out.println(member == null ? "로그인 실패" : member);

				HttpSession session = request.getSession();
				session.setAttribute("user", member);
			} else {
				// 계정없음
				System.out.println("아이디 및 비밀번호 틀렸습니다.");
			}
			page = "redirect:" + request.getContextPath();

		}
		return page;
	}
}
