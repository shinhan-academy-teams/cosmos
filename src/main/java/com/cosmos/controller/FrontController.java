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

import com.cosmos.controller.members.FindIdController;
import com.cosmos.controller.members.FindPwdController;
import com.cosmos.controller.members.SignInController;
import com.cosmos.controller.members.SignOutController;
import com.cosmos.controller.members.SignUpController;
import com.cosmos.controller.mypage.MyPageController;
import com.cosmos.controller.mypage.UpdatePwdController;
import com.cosmos.controller.study.CreateCodeController;
import com.cosmos.controller.study.CreateGroupController;
import com.cosmos.controller.study.CreateQuizController;
import com.cosmos.controller.study.GroupSearchController;
import com.cosmos.controller.study.JoinStudyController;
import com.cosmos.controller.study.MyStudyController;
import com.cosmos.controller.study.ShowCodeController;
import com.cosmos.controller.study.StudyGroupController;
import com.cosmos.controller.study.StudyIntroduceController;
import com.cosmos.controller.study.StudyMainController;

@WebServlet("*.do")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String path = request.getServletPath();
		CommonControllerInterface controller = null;
		Map<String, Object> data = new HashMap<>();
		data.put("method", request.getMethod()); // get인지 post인지 모르니까 받아옴
		data.put("request", request);

		switch (path) {
		/*
		 * 회원가입,로그인,로그아웃,계정찾기
		 * */
		// 회원 가입
		case "/signup.do":
			controller = new SignUpController();
			break;
		// 로그인
		case "/signin.do":
			controller = new SignInController();
			break;
		// 로그아웃
		case "/signout.do":
			controller = new SignOutController();
			break;
		// 아이디 찾기
		case "/findid.do":
			controller = new FindIdController();
			break;
		// 비밀번호 찾기
		case "/findpwd.do":
			controller = new FindPwdController();
			break;
			
		/*
		 * 마이페이지
		 * */
		// 마이페이지
		case "/mypage.do":
			controller = new MyPageController();
			break;
		// 비밀번호 변경
		case "/updatepwd.do":
			controller = new UpdatePwdController();
			break;
			
		
		/*
		* 스터디
		* */	
		// 스터디 그룹 목록 보기
		case "/studygroup.do":
			controller = new StudyGroupController();
			break;
		// 스터디 검색하기
		case "/search.do":
			controller = new GroupSearchController();
			break;
		// 스터디 모집 정보 상세 보기
		case "/studyintro.do":
			controller = new StudyIntroduceController();
			break;
		// 스터디 가입
		case "/joinstudy.do":
			controller = new JoinStudyController();
			break;
		// 스터디 생성
		case "/creategroup.do":
			controller = new CreateGroupController();
			break;
		//데일리 문제 생성
		case "/createQuiz.do":
			controller = new CreateQuizController();
			break;
			
			
		/*
		 * 여기서부터 메인 스터디 관련 페이지
		 */
			
		// 내 스터디
		case "/mystudy.do":
			controller = new MyStudyController();
			break;
		// 내 스터디에서 공부 시작
		case "/studymain.do":
			controller = new StudyMainController();
			break;
		//코드 추가
		case "/createcode.do":
			controller = new CreateCodeController();
			break;
		//코드 보기
		case "/showcode.do":
			controller = new ShowCodeController();
			break;
		default:
			break;
		}
		String page = null;
		try {
			page = controller.execute(data);
		} catch (Exception e) {
			e.printStackTrace();
		}

		if (page.contains("redirect:")) {
			response.sendRedirect(page.substring(9));
		} else if(page.contains("responseBody:")) {
			response.setCharacterEncoding("utf-8");
			response.getWriter().append(page.substring(13));
		} else {
			RequestDispatcher rd;
			rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}

	}

}
