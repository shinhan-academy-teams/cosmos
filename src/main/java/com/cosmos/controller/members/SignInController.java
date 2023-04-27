package com.cosmos.controller.members;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.cosmos.controller.CommonControllerInterface;
import com.cosmos.model.members.SignInService;
import com.cosmos.vo.MemberVO;

public class SignInController implements CommonControllerInterface {

	@Override
	public String execute(Map<String, Object> data) throws Exception {
		HttpServletRequest request = (HttpServletRequest) data.get("request");
		String method = (String) data.get("method");
		String page = "";

		if (method.equals("GET")) {
			page = "signIn.jsp";
		} else {
			HttpSession session = request.getSession();
			String id = request.getParameter("id");
			String pw = request.getParameter("pw");

			//입력한 비밀번호 암호화
			Encrypt en = new Encrypt();
			String en_pwd = en.getEncrypt(pw);
			
			SignInService service = new SignInService();
			MemberVO member = service.signInCheck(id, en_pwd);

			int result_idPwd = service.idPwdCheck(id, en_pwd);
			if (result_idPwd > 0) { // 계정있음
				// System.out.println(member == null ? "로그인 실패" : member);
				session.setAttribute("user", member);

				page = "redirect:" + request.getContextPath() + "/mystudy.do";
			} else { // 계정없음
				// System.out.println("아이디 및 비밀번호 틀렸습니다.");
				session.setAttribute("message", "id or password is WRONG from SignInController");

				page = "redirect:" + request.getContextPath() + "/signin.do";
			}
		}
		
		return page;
	}
}
