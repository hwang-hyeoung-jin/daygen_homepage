package daygen.model.physical;

import com.google.gson.Gson;
import grinbi.membership.AbstractUserModel;
import grinbi.validation.annotation.CustomDataType;
import grinbi.validation.annotation.Password;
import grinbi.validation.annotation.Required;
import lombok.Data;

@Data
public class UserModel extends AbstractUserModel {
    private int rowNum;
    private int userPid;
    @Password(modeType = Password.PasswordModeType.ThreeWays)
    private String password;

    private int rolePid;
}
