package com.my.test.common.interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.my.test.member.vo.MemberVO;

public class AuthenticationInterceptor implements HandlerInterceptor {
	private static final Logger logger = LoggerFactory.getLogger(AuthenticationInterceptor.class);

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		// 요청URL분석
		String uri = request.getRequestURI();
		String contextPath = request.getContextPath();
		String reqURI = uri.substring(contextPath.length());

		MemberVO memberVO = (MemberVO) request.getSession().getAttribute("member");
		if (memberVO == null || memberVO.getId().isEmpty()) {

			logger.info("인터셉터 작동");
			response.sendRedirect(request.getContextPath() + "/loginFrm?reqURI=" + reqURI);
			return false;
		}

		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		logger.info("LoginInterceptor.postHandle");
		HandlerInterceptor.super.postHandle(request, response, handler, modelAndView);
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		logger.info("LoginInterceptor.afterCompletion");
		HandlerInterceptor.super.afterCompletion(request, response, handler, ex);
	}
}
