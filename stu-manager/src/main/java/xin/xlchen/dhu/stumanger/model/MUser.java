package xin.xlchen.dhu.stumanger.model;

import java.io.Serializable;

public class MUser implements Serializable {
	private static final long serialVersionUID = -4173839866076450913L;
	private String id;
    private String username;
    private String realname;
    private String user_type;
    private String password;
    private String create_time;
    private String lastloginip;
    private String lastlogin_time;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getUser_type() {
		return user_type;
	}
	public void setUser_type(String user_type) {
		this.user_type = user_type;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getCreate_time() {
		return create_time;
	}
	public void setCreate_time(String create_time) {
		this.create_time = create_time;
	}
	public String getLastloginip() {
		return lastloginip;
	}
	public void setLastloginip(String lastloginip) {
		this.lastloginip = lastloginip;
	}
	public String getLastlogin_time() {
		return lastlogin_time;
	}
	public void setLastlogin_time(String lastlogin_time) {
		this.lastlogin_time = lastlogin_time;
	}
	public String getRealname() {
		return realname;
	}
	public void setRealname(String realname) {
		this.realname = realname;
	}
	@Override
	public String toString() {
		return "User [id=" + id + ", username=" + username + ", realname="
				+ realname + ", user_type=" + user_type + ", password="
				+ password + ", create_time=" + create_time + ", lastloginip="
				+ lastloginip + ", lastlogin_time=" + lastlogin_time + "]";
	}
}
