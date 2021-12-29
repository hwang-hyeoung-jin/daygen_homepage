package daygen.model.Logical;

import grinbi.validation.annotation.Required;
import lombok.Data;

public class LoginModel {

    @Required
    private String userid;
    @Required
    private String password;
    private String returnUrl;
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getReturnUrl() {
		return returnUrl;
	}
	public void setReturnUrl(String returnUrl) {
		this.returnUrl = returnUrl;
	}
}
