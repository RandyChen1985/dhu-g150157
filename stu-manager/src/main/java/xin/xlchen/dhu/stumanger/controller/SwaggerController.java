package xin.xlchen.dhu.stumanger.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import xin.xlchen.dhu.stumanger.model.MCourse;
import xin.xlchen.dhu.stumanger.model.MLogs;
import xin.xlchen.dhu.stumanger.model.MResult;
import xin.xlchen.dhu.stumanger.model.MStudent;
import xin.xlchen.dhu.stumanger.model.MTerm;
import xin.xlchen.dhu.stumanger.model.MUser;
import xin.xlchen.dhu.stumanger.service.CourseService;
import xin.xlchen.dhu.stumanger.service.LogsService;
import xin.xlchen.dhu.stumanger.service.StudentService;
import xin.xlchen.dhu.stumanger.service.TermService;
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
	
	@Autowired
	private StudentService studentService;
	
	@Autowired
	private TermService termService;

	@Autowired
	private CourseService courseService;
	
	
	
	/////////////////////// 账号数据 //////////////////////////////
	/**
     *获取所有账号
     * @return
     */
    @ApiOperation(value="获取所有账号",notes="requires noting")
    @RequestMapping(value="/getUsers",method=RequestMethod.GET)
    public List<MUser> getUsers(){
       return userService.getAllUserInfo();
    }

    /**
     * 按账号名获取账号对象
     * @param name
     * @return
     */
    @ApiOperation(value="按账号名获取账号对象",notes="requires the username of user")
    @RequestMapping(value="/getUserByName/{username}",method=RequestMethod.GET)
    public MUser getUserByName(@PathVariable String username){
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
        MUser user = new MUser();
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
    	MUser user = new MUser();
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
    	MUser user = new MUser();
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
    
	/////////////////////// 日志数据 //////////////////////////////
    
	/**
     *获取所有日志
     * @return
     */
    @ApiOperation(value="获取所有日志",notes="requires noting")
    @RequestMapping(value="/getLogs",method=RequestMethod.GET)
    public List<MLogs> getLogs(){
       return logsService.getAllLogs();
    }
    
	/////////////////////// 学生基本信息管理数据 //////////////////////////////
	/**
     *获取所有学生
     * @return
     */
    @ApiOperation(value="获取所有学生",notes="requires noting")
    @RequestMapping(value="/getStudents",method=RequestMethod.GET)
    public List<MStudent> getStudents(){
       return studentService.getAllStudent();
    }
    
    /**
     * 添加学生对象
     * @param name
     * @return
     */
    @ApiOperation(value="添加学生数据",notes="需要学生id,姓名,身份证...")
    @RequestMapping(value="/addStudent",method=RequestMethod.POST)
    public MResult addStudent(@RequestParam String studentId,
    		@RequestParam String stuName,
    		@RequestParam int stuGendar,
    		@RequestParam String mobile,
    		@RequestParam String idcard,
    		@RequestParam String stuBirth){
    	//构建对象
        MStudent student = new MStudent();
        student.setStudentId(studentId);
        student.setStuName(stuName);
        student.setStuGendar(stuGendar);
        student.setMobile(mobile);
        student.setIdcard(idcard);
        student.setStuBirth(stuBirth);
    	return studentService.addStudent(student);
    }
    
    /**
     * 编辑学生对象
     * @param name
     * @return
     */
    @ApiOperation(value="编辑学生数据",notes="需要学生id,姓名,身份证...")
    @RequestMapping(value="/editStudent",method=RequestMethod.POST)
    public MResult editStudent(@RequestParam String studentId,
    		@RequestParam String stuName,
    		@RequestParam int stuGendar,
    		@RequestParam String mobile,
    		@RequestParam String idcard,
    		@RequestParam String stuBirth){
    	//构建对象
        MStudent student = new MStudent();
        student.setStudentId(studentId);
        student.setStuName(stuName);
        student.setStuGendar(stuGendar);
        student.setMobile(mobile);
        student.setIdcard(idcard);
        student.setStuBirth(stuBirth);
    	return studentService.editStudent(student);
    }
    
    /**
     * 按学生编号删除学生对象
     * @param name
     * @return
     */
    @ApiOperation(value="按学生编号删除学生对象",notes="requires the studentId of Student")
    @RequestMapping(value="/deleteStudentById/{studentId}",method=RequestMethod.POST)
    public MResult deleteStudentById(@PathVariable String studentId){
    	MResult result =  studentService.deleteUserInfo(studentId);
        return result;
    }
    
	/////////////////////// 学年基础管理数据 //////////////////////////////
    /**
     *获取所有学年基础数据
     * @return
     */
    @ApiOperation(value="获取所有学年基础数据",notes="requires noting")
    @RequestMapping(value="/getTerms",method=RequestMethod.GET)
    public List<MTerm> getTerms(){
       return termService.findAllTerms();
    }
    
    /**
     * 添加学年基础数据对象
     * @return
     */
    @ApiOperation(value="添加学年基础数据",notes="需要学年编号,名称等...")
    @RequestMapping(value="/addTerm",method=RequestMethod.POST)
    public MResult addTerm(@RequestParam String termId,
    		@RequestParam String termName,
    		@RequestParam String termNotes,HttpServletRequest request){
    	////
		String createUser = "N/A";
		MUser user = (MUser)request.getSession().getAttribute("user");
		if (user != null) {
			createUser = user.getUsername() + "(" + user.getRealname() + ")";
		}
    	//构建对象
        MTerm mterm = new MTerm();
        mterm.setTermId(termId);
        mterm.setTermName(termName);
        mterm.setTermNotes(termNotes);
        mterm.setCreateUser(createUser);
    	return termService.addTerm(mterm);
    }
    
    /**
     * 编辑学学年基础
     * @return
     */
    @ApiOperation(value="编辑学年基础数据",notes="需要学年编号,名称等...")
    @RequestMapping(value="/editTerm",method=RequestMethod.POST)
    public MResult editTerm(@RequestParam String termId,
    		@RequestParam String termName,
    		@RequestParam String termNotes,HttpServletRequest request){
    	///
		String createUser = "N/A";
		MUser user = (MUser)request.getSession().getAttribute("user");
		if (user != null) {
			createUser = user.getUsername() + "(" + user.getRealname() + ")";
		}
    	//构建对象
        MTerm mterm = new MTerm();
        mterm.setTermId(termId);
        mterm.setTermName(termName);
        mterm.setTermNotes(termNotes);
        mterm.setCreateUser(createUser);
    	return termService.editTerm(mterm);
    }
    
    /**
     * 按学年编号删除学年对象
     * @param name
     * @return
     */
    @ApiOperation(value="按学年编号删除学年对象",notes="requires the studentId of Student")
    @RequestMapping(value="/deleteTermById/{termId}",method=RequestMethod.POST)
    public MResult deleteTermById(@PathVariable String termId){
    	MResult result =  termService.deleteTerm(termId);
        return result;
    }
    
	/////////////////////// 课程基础管理数据 //////////////////////////////
	/**
	*获取所有课程基础数据
	* @return
	*/
	@ApiOperation(value="获取所有课程基础数据",notes="requires noting")
	@RequestMapping(value="/getCourses",method=RequestMethod.GET)
	public List<MCourse> getCourses(){
		return courseService.findAllCourses();
	}
	
	/**
	* 添加课程基础数据对象
	* @return
	*/
	@ApiOperation(value="添加课程基础数据",notes="需要课程编号,名称等...")
	@RequestMapping(value="/addCourse",method=RequestMethod.POST)
	public MResult addCourse(@RequestParam String courseName,
		@RequestParam String courseNotes,HttpServletRequest request){
		String createUser = "N/A";
		MUser user = (MUser)request.getSession().getAttribute("user");
		if (user != null) {
			createUser = user.getUsername() + "(" + user.getRealname() + ")";
		}
		
		//构建对象
		MCourse mcourse = new MCourse();
		mcourse.setCourseName(courseName);
		mcourse.setCourseNotes(courseNotes);
		mcourse.setCreateUser(createUser);
		return courseService.addCourse(mcourse);
	}
	
	/**
	* 编辑学课程基础
	* @return
	*/
	@ApiOperation(value="编辑课程基础数据",notes="需要课程编号,名称等...")
	@RequestMapping(value="/editCourse",method=RequestMethod.POST)
	public MResult editCourse(@RequestParam String courseId,
		@RequestParam String courseName,@RequestParam String courseNotes,HttpServletRequest request){
		///
		String createUser = "N/A";
		MUser user = (MUser)request.getSession().getAttribute("user");
		if (user != null) {
			createUser = user.getUsername() + "(" + user.getRealname() + ")";
		}
		//构建对象
		MCourse mcourse = new MCourse();
		mcourse.setCourseId(courseId);
		mcourse.setCourseName(courseName);
		mcourse.setCourseNotes(courseNotes);
		mcourse.setCreateUser(createUser);
		return courseService.editCourse(mcourse);
	}
	
	/**
	* 按课程编号删除课程对象
	* @param name
	* @return
	*/
	@ApiOperation(value="按课程编号删除课程对象",notes="requires the studentId of Student")
	@RequestMapping(value="/deleteCourseById/{courseId}",method=RequestMethod.POST)
	public MResult deleteCourseById(@PathVariable String courseId){
		MResult result =  courseService.deleteCourse(courseId);
		return result;
	}
}
