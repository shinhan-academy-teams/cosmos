package com.cosmos.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("*.do")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path = request.getServletPath();
		CommonControllerInterface controller = null;
		Map<String, Object> data = new HashMap<>();
		data.put("method", request.getMethod());  //get인지 post인지 모르니까 받아옴
		data.put("request", request);
		
		switch(path) {
		// 회원 가입
		case "/signup.do":
			controller = new SignUpController();
			break;
		//로그인
		case "/signin.do":
			controller = new SignInController();
			break;
		//로그아웃
		case "/signout.do":
			controller = new SignOutController();
			break;
		//아이디 찾기
		case "/findid.do":
			controller = new FindIdController();
			break;
		//비밀번호 찾기
		case "/findpwd.do":
			controller = new FindPwdController();
			break;			
		// 스터디 그룹 목록 보기
		case "/studygroup.do":
			controller = new StudyGroupController();
			break;
		// 스터디명으로 검색하기
		case "/search.do":
			controller = new GroupSearchController();
			break;
		default:
			break;
		}
		String page = null;
		try {
			page = controller.execute(data);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		RequestDispatcher rd;
		rd = request.getRequestDispatcher(page);
		rd.forward(request, response);
		
	}

	
	

}
