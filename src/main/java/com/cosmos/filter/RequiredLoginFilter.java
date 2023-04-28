package com.cosmos.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cosmos.vo.MemberVO;

// 로그인이 필요한 페이지
@WebFilter("*.do")
public class RequiredLoginFilter extends HttpFilter implements Filter {
       
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	// 생성자
    public RequiredLoginFilter() {
        super();
    }

    // 소멸
	public void destroy() {
	}

	// 실제 구현 로직
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest)request;
		HttpServletResponse res = (HttpServletResponse)response;
		
		// 현재 요청 페이지
		String uri = req.getRequestURI();
		
		// 로그인이 필요한 페이지
		String joinStudy = "/cosmos/joinstudy.do"; // 스터디 가입
		String createStudy = "/cosmos/creategroup.do"; // 스터디 생성
		String myStudy = "/cosmos/mystudy.do"; // 내 스터디
		
		if(uri.equals(joinStudy) || uri.equals(createStudy) || uri.equals(myStudy)) {
			// 로그인 여부 확인
			HttpSession session = req.getSession();
			MemberVO loginUser = (MemberVO)session.getAttribute("user");
			if(loginUser==null) {
				res.sendRedirect("/cosmos/signin.do");
				return;
			}
		}
		chain.doFilter(request, response);
	}

}
