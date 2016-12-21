/****************************************************************
 *  系统名称  ： 'stu-manager'
 *  文件名    ： MRptTermCourseScore.java
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
 * @修改时间：2016-12-21 上午9:32:07
 */
public class MRptTermCourseScore implements Serializable {
	private static final long serialVersionUID = 9142046479260063823L;
	private String termCourse;
	private String score;
	private String cnt;
	public String getTermCourse() {
		return termCourse;
	}
	public void setTermCourse(String termCourse) {
		this.termCourse = termCourse;
	}
	public String getScore() {
		return score + "分";
	}
	public void setScore(String score) {
		this.score = score;
	}
	public String getCnt() {
		return cnt;
	}
	public void setCnt(String cnt) {
		this.cnt = cnt;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "MRptTermCourseScore [termCourse=" + termCourse + ", score="
				+ score + ", cnt=" + cnt + "]";
	}
	
}
