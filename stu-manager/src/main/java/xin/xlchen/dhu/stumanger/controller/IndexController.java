package xin.xlchen.dhu.stumanger.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import xin.xlchen.dhu.stumanger.model.MLogs;
import xin.xlchen.dhu.stumanger.model.MUser;
import xin.xlchen.dhu.stumanger.service.LogsService;
import xin.xlchen.dhu.stumanger.service.UserService;
import xin.xlchen.dhu.stumanger.util.StuManagerConstants;
import xin.xlchen.dhu.stumanger.util.StuManagerUtils;

@Controller
@ComponentScan
public class IndexController {
	private static Logger logger = Logger.getLogger(IndexController.class);
	
	@Value("${application.version:unkonwn}")
	private String version = ""; //版本号,从配置中读取
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private LogsService logsService;
    
    /**
     * 初始默认首页-登录
     * @param model
     * @param request
     * @return
     */
    @RequestMapping(value={"/index"})
   	public String index(ModelMap model, HttpServletRequest request) {
   		return "login";
    }
    
    /**
     * toLogin 登录验证
     * @param name
     * @param model
     * @return
     */
    @RequestMapping("/logincheck")
    public String logincheck(@RequestParam(value="username", required=true) String username,@RequestParam(value="password", required=true) String password, ModelMap model, HttpServletRequest request,HttpServletResponse response) {
        //收到登录请求
    	String myPasswdMd5 = StuManagerUtils.md5Password(password);
    	String loginIp = StuManagerUtils.getIpAddress(request);
    	logger.info("[logincheck]username:" + username);
    	logger.info("[logincheck]password md5:" + myPasswdMd5);
    	//
    	MUser user = userService.getUserInfo(username);
    	if (user != null && user.getUsername().trim().equalsIgnoreCase(username)
    					 && user.getPassword().trim().equalsIgnoreCase(myPasswdMd5)) {
    		logger.info("[logincheck]登录验证成功," + user.toString());
    		model.addAttribute("user", user);
    		///记录登录信息到会话
    		request.getSession().setAttribute("user", user);
    		
    		//记录登录成功日志
    		MLogs logs = new MLogs();
    		logs.setUsername(username);
    		logs.setLogstatus(StuManagerConstants.opp_status_ok);
    		logs.setLogtype(StuManagerConstants.logtype_login);
    		logs.setLogip(loginIp);
    		logs.setNotes("登录成功!!");
    		logsService.saveLogs(logs);
    		
    		//保存最后登录信息
    		userService.updateLastLoginInfo(username, loginIp);
    		
    		/////跳转到主页面
    		try {
				response.sendRedirect("/admin/main");
			} catch (IOException e) {
			}
    	} else {
    		String notes = "";
    		if (user == null) {
    			notes = "账号名" + username + "不存在!!";
    		} else {
    			notes = "密码错误!";
    		}
    		//记录登录失败日志
    		MLogs logs = new MLogs();
    		logs.setUsername(username);
    		logs.setLogstatus(StuManagerConstants.opp_statuc_fail);
    		logs.setLogtype(StuManagerConstants.logtype_login);
    		logs.setLogip(loginIp);
    		logs.setNotes(notes);
    		logsService.saveLogs(logs);
    		
    		//登录失败,重定向到登录页面
    		logger.info("[logincheck]登录验证失败!!!");
    		model.put("errMsg", "账号名或密码验证错误,登录失败!");
    	   	return "login";
    	}
    	 return "";
    }
    
    /**
     * 登出系统
     * @param model
     * @param request
     * @return
     */
    @RequestMapping(value={"/logout"})
   	public String logout(@RequestParam(value="username", required=true) String username,ModelMap model,HttpServletRequest request) {
    	logger.info("[mainpage]用户 " + username + " 已经登出系统!");
    	//清空session会话
    	request.getSession().invalidate();
    	
		//记录登出成功日志
		MLogs logs = new MLogs();
		logs.setUsername(username);
		logs.setLogstatus(StuManagerConstants.opp_status_ok);
		logs.setLogtype(StuManagerConstants.logtype_logout);
		logs.setLogip(StuManagerUtils.getIpAddress(request));
		logs.setNotes(username + "退出系统成功!!");
		logsService.saveLogs(logs);
		
    	//返回到登录界面
    	model.put("errMsg", "你已经安全的退出系统!");
   		return "login";
    }
    
    /**
     * 打开主界面
     * @param model
     * @param request
     * @return
     */
    @RequestMapping(value={"/admin/main"})
   	public String mainpage(ModelMap model, HttpServletRequest request) {
    	//判断是否已登录
    	MUser user = (MUser)request.getSession().getAttribute("user");
    	if (user == null) {
    		//用户未登录或会话过期
    		logger.info("[mainpage]用户未登录或会话过期,跳转到登录界面!");
    		model.put("errMsg", "用户未登录或会话过期,请重新登录!");
    		//
    		request.getSession().invalidate(); //session失效
    		return "login";
    	} else {
    		//正常已经登录的用户
    		model.put("version", version);
	   		return "mainhome";
    	}
   	}
}
