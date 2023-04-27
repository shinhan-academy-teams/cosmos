package com.cosmos.controller.members;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.cosmos.controller.CommonControllerInterface;
import com.cosmos.model.members.SignUpService;
import com.cosmos.vo.MemberVO;

public class SignUpController implements CommonControllerInterface {
	SignUpService service = new SignUpService();

	@Override
	public String execute(Map<String, Object> data) throws Exception {
		HttpServletRequest request = (HttpServletRequest) data.get("request");
		request.setCharacterEncoding("utf-8");
		String method = (String) data.get("method");
		String page = "";

		if (method.equals("GET")) {
			page = "signUp.jsp";
		} else {
			HttpSession session = request.getSession();
			MemberVO newMember = doHandle(request);

			if (newMember != null) {
				service.signUpMember(newMember);
				session.setAttribute("message", "sign up SUCCESSFULLY from SignUpController");
				page = "redirect:" + request.getContextPath() + "/signin.do";
			} else {
				session.setAttribute("message", "id or email is DUPLICATED from SignUpController");
				page = "redirect:" + request.getContextPath() + "/signup.do";
			}
		}

		return page;
	}

	private MemberVO doHandle(HttpServletRequest request) {
		MemberVO member = null;

		// id 중복체크
		int result_id = service.idDupCheck(request.getParameter("id"));
		request.setAttribute("idDup", result_id); // 중복 건수: 0 초과이면 중복있음.

		// email 중복체크
		String fullemail = request.getParameter("email")+"@"+request.getParameter("email-list");  //full이메일 
		
		int result_em = service.emailDupCheck(fullemail);
		request.setAttribute("emailDup", result_em); // 중복 건수: 0 초과이면 중복있음.
		
		String pwd = request.getParameter("pw2");
		//비밀번호 암호화
		Encrypt en = new Encrypt();
		String en_pwd = en.getEncrypt(pwd);
		
	
		if (result_id <= 0 && result_em <= 0) {
			// 중복체크 검사 통과한 경우
			member = new MemberVO();
			member.setMember_id(request.getParameter("id"));
			member.setMember_pwd(en_pwd);
			member.setMember_name(request.getParameter("username"));
			member.setMember_email(fullemail);
			
			System.out.println("-----------가입한 회원 정보------------");
			System.out.println("memberid : " + member.getMember_id());
			System.out.println("memberpwd : " + member.getMember_pwd());
			System.out.println("membername : " + member.getMember_name());
			System.out.println("memberemail : " + member.getMember_email());
		} else {
			System.out.println("아이디 및 비밀번호 중복검사를 진행해주세요..");
		}
		return member;
	}

}
