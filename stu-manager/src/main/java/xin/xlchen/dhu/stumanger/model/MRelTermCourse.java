/****************************************************************
 *  系统名称  ： 'stu-manager'
 *  文件名    ： MRelTermCourse.java
 * **************************************************************
 *  注意： 本内容仅限于DUH-G150157使用，禁止转发
 ****************************************************************/
package xin.xlchen.dhu.stumanger.model;

import java.io.Serializable;

/**
 * 类说明
 * @作者： 陈小龙
 * @版本： 1.0
 * @邮箱： cexlong@163.com
 * @修改时间：2016-12-20 上午9:37:01
 */
public class MRelTermCourse implements Serializable {
	private static final long serialVersionUID = 8846393698337658981L;
	private String termId;
	private String courseId;
	public String getTermId() {
		return termId;
	}
	public void setTermId(String termId) {
		this.termId = termId;
	}
	public String getCourseId() {
		return courseId;
	}
	public void setCourseId(String courseId) {
		this.courseId = courseId;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "MRelTermCourse [termId=" + termId + ", courseId=" + courseId
				+ "]";
	}
}
