/****************************************************************
 *  系统名称  ： 'stu-manager'
 *  文件名    ： SystemManageController.java
 * **************************************************************
 *  注意： 本内容仅限于DUH-G150157使用，禁止转发
 ****************************************************************/
package xin.xlchen.dhu.stumanger.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 类说明
 * @简述： 系统管理相关业务控制
 * @作者： 陈小龙
 * @版本： 1.0
 * @邮箱： cexlong@163.com
 * @修改时间：2016-11-26 下午10:20:53
 */
@Controller
@ComponentScan
public class SystemManageController {
	private static Logger logger = Logger.getLogger(SystemManageController.class);
	
    /**
     * 账号管理页面
     * @param model
     * @param request
     * @return
     */
    @RequestMapping(value={"/admin/sysadmin/accountpage"})
   	public String openAccountpage(ModelMap model, HttpServletRequest request) {
    	logger.info("[openAccountpage]打开账号管理界面!");
   		return "sysadmin/accountpage";
    }
}
