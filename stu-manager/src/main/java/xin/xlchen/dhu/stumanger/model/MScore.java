/****************************************************************
 *  系统名称  ： 'stu-manager'
 *  文件名    ： MScore.java
 * **************************************************************
 *  注意： 本内容仅限于DUH-G150157使用，禁止转发
 ****************************************************************/
package xin.xlchen.dhu.stumanger.model;

import java.io.Serializable;

/**
 * 类说明
 * @简述： 学生分数信息
 * @作者： 陈小龙
 * @版本： 1.0
 * @邮箱： cexlong@163.com
 * @修改时间：2016-12-20 下午8:35:46
 */
public class MScore implements Serializable {
	private static final long serialVersionUID = 3636350492684069025L;
	private String termName;		//学籍名称
	private String courseName;		//课程名称
	private String stuName;			//学生姓名
	private int score;				//分数信息
	private String createTime;		//添加时间
	private String createUser;		//添加人
	private String courseId;		//课程ID
	private String studentId;		//学生ID
	private String termId;			//学籍ID
	public String getTermName() {
		return termName;
	}
	public void setTermName(String termName) {
		this.termName = termName;
	}
	public String getCourseName() {
		return courseName;
	}
	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}
	public String getStuName() {
		return stuName;
	}
	public void setStuName(String stuName) {
		this.stuName = stuName;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
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
	public String getCourseId() {
		return courseId;
	}
	public void setCourseId(String courseId) {
		this.courseId = courseId;
	}
	public String getStudentId() {
		return studentId;
	}
	public void setStudentId(String studentId) {
		this.studentId = studentId;
	}
	public String getTermId() {
		return termId;
	}
	public void setTermId(String termId) {
		this.termId = termId;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "MScore [termName=" + termName + ", courseName=" + courseName
				+ ", stuName=" + stuName + ", score=" + score + ", createTime="
				+ createTime + ", createUser=" + createUser + ", courseId="
				+ courseId + ", studentId=" + studentId + ", termId=" + termId
				+ "]";
	}
}
