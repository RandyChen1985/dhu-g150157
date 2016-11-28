package xin.xlchen.dhu.stumanger.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import xin.xlchen.dhu.stumanger.mapper.UserMapper;
import xin.xlchen.dhu.stumanger.model.User;


@Service
public class UserService {

    @Autowired
    private UserMapper userMapper;

    public User getUserInfo(String username){
    	//构建参数
    	Map<String, String> params = new HashMap<String, String>();
    	params.put("username", username);
    	//查询数据
        User user=userMapper.findUserInfoByUserName(params);
        return user;
    }
    
    /**
     * 获取所有用户数据
     * @return
     */
    public List<User> getAllUserInfo(){
    	//查询数据
    	List<User> userList=userMapper.findAllUserInfo();
    	return userList;
    }

}
