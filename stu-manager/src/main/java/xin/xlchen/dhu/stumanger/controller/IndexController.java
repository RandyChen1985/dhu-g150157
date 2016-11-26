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

import xin.xlchen.dhu.stumanger.model.User;
import xin.xlchen.dhu.stumanger.service.UserService;
import xin.xlchen.dhu.stumanger.service.util.StuManagerUtils;

@Controller
@ComponentScan
public class IndexController {
	private static Logger logger = Logger.getLogger(IndexController.class);
	@Value("${application.xiaolong:Hello World}")
	private String message = "Hello World";
	
	@Autowired
	private UserService userService;
    
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
    	logger.info("[logincheck]username:" + username);
    	logger.info("[logincheck]password md5:" + StuManagerUtils.md5Password(password));
    	//
    	User user = userService.getUserInfo(username, StuManagerUtils.md5Password(password));
    	if (user != null && user.getName().trim().equalsIgnoreCase(username)) {
    		logger.info("[logincheck]登录验证成功," + user.toString());
    		model.addAttribute("user", user);
    		///记录登录信息到会话
    		request.getSession().setAttribute("user", user);
    		
    		/////跳转到主页面
    		try {
				response.sendRedirect("/admin/main");
			} catch (IOException e) {
			}
    	} else {
    		//登录失败,重定向到登录页面
    		logger.info("[logincheck]登录验证失败!!!");
    		model.put("errMsg", "账号名或密码验证错误,登录失败!");
    	   	return "login";
    	}
    	 return "";
    }
    
    /**
     * 打开主界面
     * @param model
     * @param request
     * @return
     */
    @RequestMapping(value={"/admin/main"})
   	public String mainpage(ModelMap model, HttpServletRequest request) {
         model.put("message", this.message);
   		return "mainhome";
   	}
}
