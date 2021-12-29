package daygen.web;

import grinbi.utility.SessionCookieUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.ServletRequest;

@Controller
@RequestMapping(value = "/")
public class IndexController {

    @RequestMapping(method = RequestMethod.GET)
    public String index_default(ServletRequest request) throws Exception {
        String prefix = "";
        if (request.getServerName().indexOf("m.") >= 0) {
            prefix = "/mobile/";
        } else {
            prefix = "/web/";
        }
        return prefix + "ko/index";
    }
}
