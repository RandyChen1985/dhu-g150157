package xin.xlchen.dhu.stumanger.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import xin.xlchen.dhu.stumanger.model.Logs;
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
    @ApiOperation(value="按账号名获取账号对象",notes="requires the id of user")
    @RequestMapping(value="/getUserByName/{username}",method=RequestMethod.GET)
    public User getUserByName(@PathVariable String username){
        return userService.getUserInfo(username);
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
