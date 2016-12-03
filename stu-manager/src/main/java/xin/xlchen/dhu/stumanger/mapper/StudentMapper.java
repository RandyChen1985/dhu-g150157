/****************************************************************
 *  系统名称  ： 'stu-manager'
 *  文件名    ： StudentMapper.java
 * **************************************************************
 *  注意： 本内容仅限于DUH-G150157使用，禁止转发
 ****************************************************************/
package xin.xlchen.dhu.stumanger.mapper;

import java.util.List;
import java.util.Map;

import xin.xlchen.dhu.stumanger.model.Student;

/**
 * 类说明
 * @作者： 陈小龙
 * @版本： 1.0
 * @邮箱： cexlong@163.com
 * @修改时间：2016-12-3 上午10:02:22
 */
public interface StudentMapper {
	public Student findStudentById(Map<String, String> params);
	public List<Student> findAllStudent();
	public void deleteStudent(Map<String, String> params);
    public void addStudent(Student student);
    public void editStudent(Student student);
}
