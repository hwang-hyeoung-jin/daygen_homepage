package daygen.web.admin;

import com.google.common.base.Strings;
import daygen.model.Logical.LoginModel;
import daygen.model.physical.UserModel;
import daygen.service.admin.UserService;
import grinbi.common.model.JsonObject;
import grinbi.configurations.SessionListener;
import grinbi.message.MessageSourceWrapper;
import grinbi.monitoring.annotation.Logger;
import grinbi.utility.SessionCookieUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.net.URLDecoder;

@Controller
@RequestMapping(value = "/admin")
public class UserController {
    @Autowired
    private MessageSourceWrapper messageSourceWrapper;
    @Autowired
    private UserService userService;

    @ResponseBody
    @RequestMapping(value = "/login.do", method = RequestMethod.POST)
    public JsonObject login(@Valid LoginModel loginModel, Errors errors, HttpServletRequest request, HttpSession session) throws Exception {

        JsonObject jo = new JsonObject();

        SessionCookieUtil.removeSessionAttribute(request, this.messageSourceWrapper.getMessage("session.name"));
        SessionCookieUtil.removeSessionAttribute(request, "roleList");

        if (loginModel.getUserid().equals("admin") && loginModel.getPassword().equals("a896390607c6fbcb58d1ba5236def8eded48916e65fa03a050a4120e0192b94c")) {
            SessionListener.login(loginModel.getUserid());
            UserModel userModel = new UserModel();
            userModel.setUserid(loginModel.getUserid());
            userModel.setPassword(loginModel.getPassword());
            session.setAttribute(this.messageSourceWrapper.getMessage("session.name"), userModel);
            jo.IsSucceed = true;
            jo.RedirectUrl = "/admin/index.do?pageid=b_01";

            // 로그인 후에 반드시 한번 호출해 주어야 한다.
            this.userService.getRoles();
        } else {
            jo.IsSucceed = false;
            jo.Message = "로그인에 실패 하였습니다.<br/>아이디 혹은 비밀번호를 확인 하세요.";
        }
        return jo;
    }

    @ResponseBody
    @RequestMapping(value = "/logout.do", method = RequestMethod.POST)
    public JsonObject logout(HttpServletRequest request) throws Exception {
        JsonObject jo = new JsonObject();
        SessionCookieUtil.removeSessionAttribute(request, this.messageSourceWrapper.getMessage("session.name"));
        SessionCookieUtil.removeSessionAttribute(request, "roleList");
        jo.IsSucceed = true;
        SessionListener.logout();
        return jo;
    }
}
