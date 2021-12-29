package daygen.service.admin;

import daygen.model.Logical.LoginModel;
import daygen.model.physical.RoleModel;
import grinbi.membership.MembershipService;

import java.util.List;

public interface UserService extends MembershipService {

    List<RoleModel> getRoles();
}
