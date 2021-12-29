package daygen.web;

import grinbi.message.MessageSourceWrapper;
import grinbi.utility.SessionCookieUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping(value = "/common")
public class CommonController {

    @Autowired
    private MessageSourceWrapper messageSourceWrapper;

    @RequestMapping(value = "/editor.do", method = RequestMethod.GET)
    public String editor(ServletRequest request) throws Exception {
        request.setAttribute("MaxLength", this.messageSourceWrapper.getMessage("file.maxLength"));
        request.setAttribute("Category", "Editor");
        request.setAttribute("textareaName", request.getParameter("textareaName"));
        request.setAttribute("UploadPath", this.messageSourceWrapper.getMessage("file.uploadPath"));
        return "include/editor";
    }

    @RequestMapping(value = "/error/403.do", method = RequestMethod.GET)
    public String error_403(HttpServletRequest request) throws Exception {
        String prefix = "";
        if (request.getServerName().indexOf("m.") >= 0) {
            prefix = "/mobile/";
        } else {
            prefix = "/web/";
        }
        if (SessionCookieUtil.getSession("locale") != null && SessionCookieUtil.getSession("locale").equals("en")) {
            return prefix + "en/error/403";
        } else {
            return prefix + "ko/error/403";
        }
    }

    @RequestMapping(value = "/error/404.do", method = RequestMethod.GET)
    public String error_404(HttpServletRequest request) throws Exception {
        String prefix = "";
        if (request.getServerName().indexOf("m.") >= 0) {
            prefix = "/mobile/";
        } else {
            prefix = "/web/";
        }
        if (SessionCookieUtil.getSession("locale") != null && SessionCookieUtil.getSession("locale").equals("en")) {
            return prefix + "en/error/404";
        } else {
            return prefix + "ko/error/404";
        }
    }

    @RequestMapping(value = "/error/405.do", method = RequestMethod.GET)
    public String error_405(HttpServletRequest request) throws Exception {
        String prefix = "";
        if (request.getServerName().indexOf("m.") >= 0) {
            prefix = "/mobile/";
        } else {
            prefix = "/web/";
        }
        if (SessionCookieUtil.getSession("locale") != null && SessionCookieUtil.getSession("locale").equals("en")) {
            return prefix + "en/error/405";
        } else {
            return prefix + "ko/error/405";
        }
    }

    @RequestMapping(value = "/error/500.do", method = RequestMethod.GET)
    public String error_500(HttpServletRequest request) throws Exception {
        String prefix = "";
        if (request.getServerName().indexOf("m.") >= 0) {
            prefix = "/mobile/";
        } else {
            prefix = "/web/";
        }
        if (SessionCookieUtil.getSession("locale") != null && SessionCookieUtil.getSession("locale").equals("en")) {
            return prefix + "en/error/500";
        } else {
            return prefix + "ko/error/500";
        }
    }
}
