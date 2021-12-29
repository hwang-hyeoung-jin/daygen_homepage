package daygen.web;

import com.google.common.base.Strings;
import grinbi.configurations.SessionListener;
import grinbi.message.MessageSourceWrapper;
import grinbi.utility.SessionCookieUtil;
import grinbi.validation.annotation.Roles;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping(value = "/admin")
public class AdminController {
    @Autowired
    private MessageSourceWrapper messageSourceWrapper;

    @RequestMapping(value = "/default.do", method = RequestMethod.GET)
    public String index_default(ServletRequest request) throws Exception {
        return "admin/index";
    }

    @Roles("Admin")
    @RequestMapping(value = "/index.do", method = RequestMethod.GET)
    public String index(ServletRequest request) throws Exception {
        String pageid = request.getParameter("pageid");
        if (Strings.isNullOrEmpty(pageid)) {
            return "redirect:/admin/index.do?pageid=b_01";
        } else {
            return ".admin_" + pageid.charAt(0) + "/" + pageid.substring(2);
        }
    }

    @RequestMapping(value = "/logoutPage.do", method = RequestMethod.GET)
    public String logoutPage(HttpServletRequest request) throws Exception {
        SessionCookieUtil.removeSessionAttribute(request, this.messageSourceWrapper.getMessage("session.name"));
        SessionCookieUtil.removeSessionAttribute(request, "roleList");
        SessionListener.logout();
        return "redirect:/admin/default.do";
    }
}
