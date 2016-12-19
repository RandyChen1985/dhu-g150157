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
 * @简述： 教务管理相关业务控制
 * @作者： 陈小龙
 * @版本： 1.0
 * @邮箱： cexlong@163.com
 * @修改时间：2016-11-26 下午10:20:53
 */
@Controller
@ComponentScan
public class StuManageController {
	private static Logger logger = Logger.getLogger(StuManageController.class);
	
    /**
     * 学生管理页面
     * @param model
     * @param request
     * @return
     */
    @RequestMapping(value={"/admin/stuadmin/studentpage"})
   	public String openStudentpage(ModelMap model, HttpServletRequest request) {
    	logger.info("[openStudentpage]打开学生管理界面!");
   		return "stuadmin/studentpage";
    }
    
    /**
     * 学籍管理页面
     * @param model
     * @param request
     * @return
     */
    @RequestMapping(value={"/admin/stuadmin/termpage"})
    public String openTermpage(ModelMap model, HttpServletRequest request) {
    	logger.info("[openTermpage]打开学籍管理界面!");
    	return "stuadmin/termpage";
    }
    
    /**
     * 课程管理页面
     * @param model
     * @param request
     * @return
     */
    @RequestMapping(value={"/admin/stuadmin/coursepage"})
    public String openCoursepage(ModelMap model, HttpServletRequest request) {
    	logger.info("[openCoursepage]打开课程管理界面!");
    	return "stuadmin/coursepage";
    }
}
