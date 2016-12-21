/****************************************************************
 *  系统名称  ： 'stu-manager'
 *  文件名    ： StuReportController.java
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
 * @简述： 报表模块相关业务控制
 * @作者： 陈小龙
 * @版本： 1.0
 * @邮箱： cexlong@163.com
 * @修改时间：2016-11-26 下午10:20:53
 */
@Controller
@ComponentScan
public class StuReportController {
	private static Logger logger = Logger.getLogger(StuReportController.class);
    
    /**
     * 学籍#课程分数报表页面
     * @param model
     * @param request
     * @return
     */
    @RequestMapping(value={"/admin/sturpt/termCourseScore"})
    public String openTermCourseScorepage(ModelMap model, HttpServletRequest request) {
    	logger.info("[openTermCourseScorepage]学籍#课程分数报表页面!");
    	return "reports/rptScore";
    }
    
   
}
