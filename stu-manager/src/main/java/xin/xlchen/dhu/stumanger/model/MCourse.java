/****************************************************************
 *  系统名称  ： 'stu-manager'
 *  文件名    ： MCourse.java
 * **************************************************************
 *  注意： 本内容仅限于DUH-G150157使用，禁止转发
 ****************************************************************/
package xin.xlchen.dhu.stumanger.model;

import java.io.Serializable;

/**
 * 类说明
 * @简述： 课程管理
 * @作者： 陈小龙
 * @版本： 1.0
 * @邮箱： cexlong@163.com
 * @修改时间：2016-12-19 下午4:15:24
 */
public class MCourse implements Serializable {
	private static final long serialVersionUID = -7341994640773379195L;
	private String courseId;		//课程编号
	private String courseName;		//课程名称
	private String courseNotes;		//课程备注
	private String createTime;		//添加时间
	private String createUser;		//添加人
	public String getCourseId() {
		return courseId;
	}
	public void setCourseId(String courseId) {
		this.courseId = courseId;
	}
	public String getCourseName() {
		return courseName;
	}
	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}
	public String getCourseNotes() {
		return courseNotes;
	}
	public void setCourseNotes(String courseNotes) {
		this.courseNotes = courseNotes;
	}
	public String getCreateTime() {
		return createTime;
	}
	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}
	public String getCreateUser() {
		return createUser;
	}
	public void setCreateUser(String createUser) {
		this.createUser = createUser;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "MCourse [courseId=" + courseId + ", courseName=" + courseName
				+ ", courseNotes=" + courseNotes + ", createTime=" + createTime
				+ ", createUser=" + createUser + "]";
	}
	
}
