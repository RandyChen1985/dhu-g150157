package xin.xlchen.dhu.stumanger.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import xin.xlchen.dhu.stumanger.mapper.UserMapper;
import xin.xlchen.dhu.stumanger.model.MResult;
import xin.xlchen.dhu.stumanger.model.User;
import xin.xlchen.dhu.stumanger.util.StuManagerUtils;


@Service
public class UserService {

    @Autowired
    private UserMapper userMapper;
    
    /**
     * 根据账号名获取用户对象
     * @param username
     * @return
     */
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

    /**
     * 更新最后登录信息
     * @param username
     * @param lastloginip
     */
    public void updateLastLoginInfo(String username,String lastloginip){
    	//构建参数
    	Map<String, String> params = new HashMap<String, String>();
    	params.put("username", username);
    	params.put("lastloginip", lastloginip);
    	//更新数据
        userMapper.updateLastLoginInfo(params);
    }
    
    /**
     * 根据账号名删除用户对象
     * @param username
     * @return
     */
    public MResult deleteUserInfo(String username){
    	MResult mResult = new MResult();
    	try {
    		if (username != null && username.equalsIgnoreCase("admin")) {
    			///admin账号不允许删除
    			mResult.setSuccess(false);
    			mResult.setErrorMsg("admin账号不允许删除!");
    		} else {
	        	//构建参数
	        	Map<String, String> params = new HashMap<String, String>();
	        	params.put("username", username);
	        	//删除数据
	            userMapper.deleteUserInfo(params);
	            //
	            mResult.setSuccess(true);
    		}
		} catch (Exception e) {
			mResult.setSuccess(false);
			mResult.setErrorMsg(e.getMessage());
		}
        return mResult;
    }
    
    
    /**
     * 添加用户
     * @param user
     * @return
     */
    public MResult addUser(User user){
    	MResult mResult = new MResult();
    	try {
    		//判断用户是否已存在
    		if (getUserInfo(user.getUsername()) != null) {
    			mResult.setSuccess(false);
    			mResult.setErrorMsg("账号["+user.getUsername()+"]已经存在,不能重复添加!");
    		} else {
    			//对密码字段加密
    			user.setPassword(StuManagerUtils.md5Password(user.getPassword()));
    			//添加
    			userMapper.addUser(user);
    		}
		} catch (Exception e) {
			mResult.setSuccess(false);
			mResult.setErrorMsg(e.getMessage());
		}
        return mResult;
    }
    
    /**
     * 编辑用户
     * @param user
     * @return
     */
    public MResult editUser(User user){
    	MResult mResult = new MResult();
    	try {
    		//判断用户是否已存在
    		if (getUserInfo(user.getUsername()) == null) {
    			mResult.setSuccess(false);
    			mResult.setErrorMsg("账号["+user.getUsername()+"]已经不存在!");
    		} else {
    			//编辑
    			userMapper.editUser(user);
    		}
		} catch (Exception e) {
			mResult.setSuccess(false);
			mResult.setErrorMsg(e.getMessage());
		}
        return mResult;
    }
    
    /**
     * 更新用户密码
     * @param user
     * @return
     */
    public MResult updateUserPasswd(User user){
    	MResult mResult = new MResult();
    	try {
    		//判断用户是否已存在
    		if (getUserInfo(user.getUsername()) == null) {
    			mResult.setSuccess(false);
    			mResult.setErrorMsg("账号["+user.getUsername()+"]已经不存在!");
    		} else {
    			//对密码字段加密
    			user.setPassword(StuManagerUtils.md5Password(user.getPassword()));
    			//更新账号密码
    			userMapper.updateUserPasswd(user);
    		}
    	} catch (Exception e) {
    		mResult.setSuccess(false);
    		mResult.setErrorMsg(e.getMessage());
    	}
    	return mResult;
    }
}
