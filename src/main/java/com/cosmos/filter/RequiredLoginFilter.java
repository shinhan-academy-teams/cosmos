package com.cosmos.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
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
		String joinStudy = "/cosmos/joinstudy.do";
		if(uri.equals(joinStudy)) {
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

	// 필터 생성
	public void init(FilterConfig fConfig) throws ServletException {
	}

}