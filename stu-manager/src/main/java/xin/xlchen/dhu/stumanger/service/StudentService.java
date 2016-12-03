package xin.xlchen.dhu.stumanger.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import xin.xlchen.dhu.stumanger.mapper.StudentMapper;
import xin.xlchen.dhu.stumanger.model.MResult;
import xin.xlchen.dhu.stumanger.model.Student;


@Service
public class StudentService {

    @Autowired
    private StudentMapper studentMapper;
    
    /**
     * 获取所有学生数据
     * @return
     */
    public List<Student> getAllStudent(){
    	//查询数据
    	List<Student> studentList=studentMapper.findAllStudent();
    	return studentList;
    }
    
    /**
     * 根据ID获取学生对象
     * @param studentId
     * @return
     */
    public Student getStudentById(String studentId){
    	//构建参数
    	Map<String, String> params = new HashMap<String, String>();
    	params.put("studentId", studentId);
    	//查询数据
        Student student=studentMapper.findStudentById(params);
        return student;
    }
    
    /**
     * 根据studentId删除学生对象
     * @param studentId
     * @return
     */
    public MResult deleteUserInfo(String studentId){
    	MResult mResult = new MResult();
    	try {
	        	//构建参数
	        	Map<String, String> params = new HashMap<String, String>();
	        	params.put("studentId", studentId);
	        	//删除数据
	            studentMapper.deleteStudent(params);
	            //
	            mResult.setSuccess(true);
		} catch (Exception e) {
			mResult.setSuccess(false);
			mResult.setErrorMsg(e.getMessage());
		}
        return mResult;
    }
    
    
    /**
     * 添加学生
     * @param user
     * @return
     */
    public MResult addStudent(Student student){
    	MResult mResult = new MResult();
    	try {
    		//判断用户是否已存在
    		if (getStudentById(student.getStudentId()) != null) {
    			mResult.setSuccess(false);
    			mResult.setErrorMsg("学生编号["+student.getStudentId()+"]已经存在,不能重复添加!");
    		} else {
    			//添加
    			studentMapper.addStudent(student);
    		}
		} catch (Exception e) {
			mResult.setSuccess(false);
			mResult.setErrorMsg(e.getMessage());
		}
        return mResult;
    }
    
    /**
     * 编辑学生
     * @param user
     * @return
     */
    public MResult editStudent(Student student){
    	MResult mResult = new MResult();
    	try {
    		//判断用户是否已存在
    		if (getStudentById(student.getStudentId()) == null) {
    			mResult.setSuccess(false);
    			mResult.setErrorMsg("学生编号["+student.getStudentId()+"]已经不存在!");
    		} else {
    			//编辑
    			studentMapper.editStudent(student);
    		}
		} catch (Exception e) {
			mResult.setSuccess(false);
			mResult.setErrorMsg(e.getMessage());
		}
        return mResult;
    }
}
