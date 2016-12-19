package xin.xlchen.dhu.stumanger.mapper;

import java.util.List;
import java.util.Map;

import xin.xlchen.dhu.stumanger.model.MUser;


public interface UserMapper {
    public MUser findUserInfoByUserName(Map<String, String> params);
    public List<MUser> findAllUserInfo();
    public void updateLastLoginInfo(Map<String, String> params);
    public void deleteUserInfo(Map<String, String> params);
    public void addUser(MUser user);
    public void editUser(MUser user);
    public void updateUserPasswd(MUser user);
}
