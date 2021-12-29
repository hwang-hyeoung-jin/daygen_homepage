package daygen.service.admin.impl;

import com.google.common.base.Strings;
import daygen.data.admin.UserData;
import daygen.model.Logical.LoginModel;
import daygen.model.physical.RoleModel;
import daygen.model.physical.UserModel;
import daygen.service.admin.UserService;
import grinbi.membership.AbstractUserModel;
import grinbi.message.MessageSourceWrapper;
import grinbi.utility.bean.DynamicBeanProvider;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;

import java.util.ArrayList;
import java.util.List;

@Primary
@Service
public class UserServiceImpl implements UserService {

    @Autowired
    UserData userData;

    @Override
    public Boolean isAuthenticated() {
        MessageSourceWrapper messageSourceWrapper = (MessageSourceWrapper) DynamicBeanProvider.getBean("messageSourceWrapper");
        String sessionName = messageSourceWrapper.getMessage("session.name");

        if (RequestContextHolder.getRequestAttributes() == null) {
            return false;
        } else {
            return RequestContextHolder.getRequestAttributes().getAttribute(sessionName, RequestAttributes.SCOPE_SESSION) != null;
        }
    }

    public List<RoleModel> getRoles() {

        MessageSourceWrapper messageSourceWrapper = (MessageSourceWrapper) DynamicBeanProvider.getBean("messageSourceWrapper");
        String sessionName = messageSourceWrapper.getMessage("session.name");

        if (this.isAuthenticated()) {
            List<RoleModel> list = new ArrayList<>();
            RoleModel roleModel = new RoleModel();
            roleModel.setRoleNm("Admin");
            roleModel.setRolePid(1);
            list.add(roleModel);
            return list;
        } else {
            return null;
        }
    }


    @Override
    public boolean isInRoles(String roleNames, String userName) {
        return true;
    }

    @Override
    public boolean isInRoles(String roleNames) {
        return true;
    }

    @Override
    public AbstractUserModel getUser(String s) {
        MessageSourceWrapper messageSourceWrapper = (MessageSourceWrapper) DynamicBeanProvider.getBean("messageSourceWrapper");
        String sessionName = messageSourceWrapper.getMessage("session.name");

        if (this.isAuthenticated()) {
            if (RequestContextHolder.getRequestAttributes().getAttribute(sessionName, RequestAttributes.SCOPE_SESSION) instanceof UserModel) {
                return (UserModel) RequestContextHolder.getRequestAttributes().getAttribute(sessionName, RequestAttributes.SCOPE_SESSION);
            } else {
                return null;
            }
        } else {
            return null;
        }
    }

    @Override
    public AbstractUserModel getUser() {
        UserModel model = new UserModel();
        model.setUserid("admin");
        return model;
    }
}
