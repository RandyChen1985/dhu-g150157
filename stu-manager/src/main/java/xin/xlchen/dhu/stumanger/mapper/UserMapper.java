package xin.xlchen.dhu.stumanger.mapper;

import java.util.Map;

import xin.xlchen.dhu.stumanger.model.User;


public interface UserMapper {
    public User findUserInfoByUserName(Map<String, String> params);
    public User findAllUserInfo();
}
