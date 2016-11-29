package xin.xlchen.dhu.stumanger.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import xin.xlchen.dhu.stumanger.model.Logs;
import xin.xlchen.dhu.stumanger.model.MResult;
import xin.xlchen.dhu.stumanger.model.User;
import xin.xlchen.dhu.stumanger.service.LogsService;
import xin.xlchen.dhu.stumanger.service.UserService;

import com.wordnik.swagger.annotations.ApiOperation;

@RestController
@RequestMapping(value="/admin/service")
public class SwaggerController {


    /*
     *  http://localhost:8080/swagger/index.html
     */
	@Autowired
	private UserService userService;
  
	@Autowired
	private LogsService logsService;
	
	/**
     *获取所有账号
     * @return
     */
    @ApiOperation(value="获取所有账号",notes="requires noting")
    @RequestMapping(value="/getUsers",method=RequestMethod.GET)
    public List<User> getUsers(){
       return userService.getAllUserInfo();
    }

    /**
     * 按账号名获取账号对象
     * @param name
     * @return
     */
    @ApiOperation(value="按账号名获取账号对象",notes="requires the username of user")
    @RequestMapping(value="/getUserByName/{username}",method=RequestMethod.GET)
    public User getUserByName(@PathVariable String username){
        return userService.getUserInfo(username);
    }
    
    /**
     * 添加账号对象
     * @param name
     * @return
     */
    @ApiOperation(value="添加账号数据",notes="需要账号名,密码,真实姓名,用户类别(0:普通用户,1:管理员)")
    @RequestMapping(value="/addUser",method=RequestMethod.POST)
    public MResult addUser(@RequestParam String username,@RequestParam String realname,@RequestParam String user_type,@RequestParam String password){
        User user = new User();
        user.setUsername(username);
        user.setRealname(realname);
        user.setUser_type(user_type);
        user.setPassword(password);
    	return userService.addUser(user);
    }
    
    /**
     * 编辑账号对象
     * @param name
     * @return
     */
    @ApiOperation(value="编辑账号数据",notes="需要账号名,真实姓名,用户类别(0:普通用户,1:管理员)")
    @RequestMapping(value="/editUser",method=RequestMethod.POST)
    public MResult editUser(@RequestParam String username,@RequestParam String realname,@RequestParam String user_type){
    	User user = new User();
    	user.setUsername(username);
    	user.setRealname(realname);
    	user.setUser_type(user_type);
    	return userService.editUser(user);
    }
    
    /**
     * 更新账号密码
     * @param username
     * @param password
     * @return
     */
    @ApiOperation(value="更新账号密码",notes="需要账号名,密码")
    @RequestMapping(value="/updateUserPasswd",method=RequestMethod.POST)
    public MResult updateUserPasswd(@RequestParam String username,@RequestParam String newpassword){
    	User user = new User();
    	user.setUsername(username);
    	user.setPassword(newpassword);
    	return userService.updateUserPasswd(user);
    }
    
    /**
     * 按账号名删除账号对象
     * @param name
     * @return
     */
    @ApiOperation(value="按账号名删除账号对象",notes="requires the username of user")
    @RequestMapping(value="/deleteUserByName/{username}",method=RequestMethod.POST)
    public MResult deleteUserByName(@PathVariable String username){
    	MResult result =  userService.deleteUserInfo(username);
        return result;
    }
    
	/**
     *获取所有日志
     * @return
     */
    @ApiOperation(value="获取所有日志",notes="requires noting")
    @RequestMapping(value="/getLogs",method=RequestMethod.GET)
    public List<Logs> getLogs(){
       return logsService.getAllLogs();
    }
}
