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
import com.cosmos.controller.study.common.CreateGroupController;
import com.cosmos.controller.study.common.GroupSearchController;
import com.cosmos.controller.study.common.JoinStudyController;
import com.cosmos.controller.study.common.StudyGroupController;
import com.cosmos.controller.study.common.StudyIntroduceController;
import com.cosmos.controller.study.mystudy.CreateCodeController;
import com.cosmos.controller.study.mystudy.CreateQuizController;
import com.cosmos.controller.study.mystudy.LeaveStudyController;
import com.cosmos.controller.study.mystudy.MarkcodeController;
import com.cosmos.controller.study.mystudy.MyStudyListController;
import com.cosmos.controller.study.mystudy.CommentsController;
import com.cosmos.controller.study.mystudy.MyStudyMainController;
import com.cosmos.controller.study.mystudy.ShowCodeController;

@WebServlet("*.do")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String path = request.getServletPath();
		CommonControllerInterface controller = null;
		Map<String, Object> data = new HashMap<>();
		data.put("method", request.getMethod());
		data.put("request", request);

		switch (path) {
		/*
		 * 회원가입,로그인,로그아웃,계정찾기
		 */
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
		 */
		// 마이페이지 메인
		case "/mypage.do":
			controller = new MyPageController();
			break;
		// 비밀번호 변경
		case "/updatepwd.do":
			controller = new UpdatePwdController();
			break;

		/*
		 * 스터디(공통)
		 */
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
		// 스터디 만들기
		case "/creategroup.do":
			controller = new CreateGroupController();
			break;
		// 스터디 나가기
		case "/leavestudy.do":
			controller = new LeaveStudyController();
			break;

		/*
		 * 스터디(개인)
		 */
		// 내가 속한 스터디 목록
		case "/mystudy.do":
			controller = new MyStudyListController();
			break;
		// 선택한 내 스터디 메인
		case "/studymain.do":
			controller = new MyStudyMainController();
			break;
		// 데일리 문제 생성
		case "/createQuiz.do":
			controller = new CreateQuizController();
			break;
		// 코드 제출
		case "/createcode.do":
			controller = new CreateCodeController();
			break;
		// 다른 사람 코드 보기
		case "/showcode.do":
			controller = new ShowCodeController();
			break;
		// 코드 좋아요 누르기
		case "/markcode.do":
			controller = new MarkcodeController();
			break;
		// 댓글 작성
		case "/createcomments.do":
			controller = new CommentsController();
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
		
		// 새로운 페이지로 redirect
		if (page.contains("redirect:")) {
			response.sendRedirect(page.substring(9));
		// ajax로 처리후 메세지 값 넘겨주기
		} else if (page.contains("responseBody:")) {
			response.setCharacterEncoding("utf-8");
			response.getWriter().append(page.substring(13));
		// 지정한 jsp파일로 forward
		} else {
			RequestDispatcher rd;
			rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}
	}
}
