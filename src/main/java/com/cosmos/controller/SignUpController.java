package com.cosmos.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.cosmos.model.members.SignUpService;
import com.cosmos.vo.MemberVO;

public class SignUpController implements CommonControllerInterface {
	SignUpService service = new SignUpService();
	@Override
	public String execute(Map<String, Object> data) throws Exception {
		HttpServletRequest request = (HttpServletRequest)data.get("request");
		request.setCharacterEncoding("utf-8");
		
		int result = service.signUpMember(doHandle(request));
		
		return "index.jsp";
	}


	


	private MemberVO doHandle(HttpServletRequest request) {
		MemberVO member = new MemberVO();
		
		//id 중복체크
		int result_id = service.idDupCheck("id");
		if(result_id>0) {
			request.setAttribute("idDup",1);
		}
		
		//email 중복체크
		int result_em = service.emailDupCheck("email");
		if(result_em>0) {
			request.setAttribute("emailDup",1);
		}
		
		if(result_id<=0 && result_em<=0) {
			//중복체크 검사 통과한 경우
			member.setMember_id(request.getParameter("id"));
			member.setMember_pwd(request.getParameter("pw1"));
			member.setMember_name(request.getParameter("username"));
			member.setMember_email(request.getParameter("email"));
		
		
			System.out.println("-----------가입한 회원 정보------------");
			System.out.println("memberid : "+ member.getMember_id());
			System.out.println("memberpwd : "+ member.getMember_pwd());
			System.out.println("membername : "+member.getMember_name());
			System.out.println("memberemail : "+member.getMember_email());
		}else {
			System.out.println("아이디 및 비밀번호 중복검사를 진행해주세요..");
		}
		return member;
	}



}
