package xin.xlchen.dhu.stumanger.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import xin.xlchen.dhu.stumanger.mapper.CourseMapper;
import xin.xlchen.dhu.stumanger.model.MCourse;
import xin.xlchen.dhu.stumanger.model.MResult;


@Service
public class CourseService {

    @Autowired
    private CourseMapper courseMapper;
    
    /**
     * 根据课程ID获取对象
     * @param courseId
     * @return
     */
    public MCourse getCoursebyId(String courseId){
        return courseMapper.getCoursebyId(courseId);
    }
    
    /**
     * 获取所有课程数据
     * @return
     */
    public List<MCourse> findAllCourses(){
    	return courseMapper.findAllCourses();
    }

    /**
     * 根据courseId删除对象
     * @param courseId
     * @return
     */
    public MResult deleteCourse(String courseId){
    	MResult mResult = new MResult();
    	try {
    		if (courseMapper.getUsedCourseCount(courseId) > 0) {
    			///课程已在使用中,不允许删除
    			mResult.setSuccess(false);
    			mResult.setErrorMsg("课程已在使用中,不允许删除!");
    		} else {
	        	//删除数据
	        	courseMapper.deleteCourse(courseId);
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
     * 添加课程对象
     * @param course
     * @return
     */
    public MResult addCourse(MCourse course){
    	MResult mResult = new MResult();
    	try {
    		//判断课程是否已存在
    		if (getCoursebyId(course.getCourseId()) != null) {
    			mResult.setSuccess(false);
    			mResult.setErrorMsg("课程["+course.getCourseId()+"]已经存在,不能重复添加!");
    		} else {
    			//添加
    			courseMapper.addCourse(course);
    		}
		} catch (Exception e) {
			mResult.setSuccess(false);
			mResult.setErrorMsg(e.getMessage());
		}
        return mResult;
    }
    
    /**
     * 编辑课程对象
     * @param course
     * @return
     */
    public MResult editCourse(MCourse course){
    	MResult mResult = new MResult();
    	try {
    		//判断课程对象是否已存在
    		if (getCoursebyId(course.getCourseId())  == null) {
    			mResult.setSuccess(false);
    			mResult.setErrorMsg("课程对象["+course.getCourseId()+"]已经不存在!");
    		} else {
    			//编辑
    			courseMapper.editCourse(course);
    		}
		} catch (Exception e) {
			mResult.setSuccess(false);
			mResult.setErrorMsg(e.getMessage());
		}
        return mResult;
    }
}
