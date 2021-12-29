package daygen.filter;

import grinbi.message.MessageSourceWrapper;
import grinbi.utility.SessionCookieUtil;
import grinbi.utility.bean.DynamicBeanProvider;
import grinbi.utility.context.CurrentContext;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

public class RedirecFilter implements Filter {
	protected FilterConfig config;
	private String token = null;

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		this.config = config;
	}

	@Override
	public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain)
			throws IOException, ServletException {

		HttpServletRequest request = (HttpServletRequest) servletRequest;
		if (request.getMethod().equals("GET")) {
			if (request.getRequestURI().indexOf("/mobile/") >= 0 || request.getRequestURI().indexOf("/web/") >= 0
					|| request.getRequestURI().indexOf("/admin/") >= 0
					|| request.getRequestURI().indexOf("/common/") >= 0
					|| request.getRequestURI().indexOf("/file/") >= 0
					|| request.getRequestURI().indexOf("/frontbbs/") >= 0
					|| request.getRequestURI().indexOf("/frontparmacy/") >= 0) {
				filterChain.doFilter(request, servletResponse);
			} else {
				if (request.getRequestURI().indexOf("/en/") >= 0) {
					SessionCookieUtil.setSession("locale", "en");
				} else {
					SessionCookieUtil.setSession("locale", "ko");
				}

				if (request.getServerName().indexOf("m.") >= 0) {
					request.getRequestDispatcher("/mobile" + request.getRequestURI()).forward(request, servletResponse);
				} else {
					request.getRequestDispatcher("/web" + request.getRequestURI()).forward(request, servletResponse);
				}
			}
		} else {
			filterChain.doFilter(request, servletResponse);
		}
	}

	@Override
	public void destroy() {

	}
}
