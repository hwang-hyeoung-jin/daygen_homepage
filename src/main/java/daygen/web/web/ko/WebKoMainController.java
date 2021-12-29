package daygen.web.web.ko;

import com.google.common.base.Strings;
import grinbi.message.MessageSourceWrapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.ServletRequest;

@Controller
@RequestMapping(value = "/web/ko")
public class WebKoMainController {
    @Autowired
    private MessageSourceWrapper messageSourceWrapper;

    @RequestMapping(value = "/default.do", method = RequestMethod.GET)
    public String index_default(ServletRequest request) throws Exception {
        return "web/ko/index";
    }

    @RequestMapping(value = "/index.do", method = RequestMethod.GET)
    public String index(ServletRequest request) throws Exception {
        String pageid = request.getParameter("pageid");
        if (Strings.isNullOrEmpty(pageid)) {
            return "redirect:/ko/index.do?pageid=a_01_01";
        } else {
            return ".web_ko_" + pageid.charAt(0) + "/" + pageid;
        }
    }
}