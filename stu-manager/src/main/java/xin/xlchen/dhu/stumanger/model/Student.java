/****************************************************************
 *  系统名称  ： 'stu-manager'
 *  文件名    ： Student.java
 * **************************************************************
 *  注意： 本内容仅限于DUH-G150157使用，禁止转发
 ****************************************************************/
package xin.xlchen.dhu.stumanger.model;

import java.io.Serializable;

/**
 * 类说明
 * @简述： 学生对象
 * @作者： 陈小龙
 * @版本： 1.0
 * @邮箱： cexlong@163.com
 * @修改时间：2016-12-3 上午9:46:03
 */
public class Student implements Serializable{
	private static final long serialVersionUID = -5434084974146824071L;

	private String studentId;	//学生编号
	private String stuName;		//学生姓名
	private int stuGendar;	    //0:未知-待确认 , 1:男, 2:女
	private String stuBirth;	//出生年月 YYYY-MM-DD
	private String mobile;		//手机号码
	private String idcard;		//身份证
	private String createTime;  //添加时间
	private String updateTime;	//更新时间
	public String getStudentId() {
		return studentId;
	}
	public void setStudentId(String studentId) {
		this.studentId = studentId;
	}
	public String getStuName() {
		return stuName;
	}
	public void setStuName(String stuName) {
		this.stuName = stuName;
	}
	public int getStuGendar() {
		return stuGendar;
	}
	public void setStuGendar(int stuGendar) {
		this.stuGendar = stuGendar;
	}
	public String getStuBirth() {
		return stuBirth;
	}
	public void setStuBirth(String stuBirth) {
		this.stuBirth = stuBirth;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getIdcard() {
		return idcard;
	}
	public void setIdcard(String idcard) {
		this.idcard = idcard;
	}
	public String getCreateTime() {
		return createTime;
	}
	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}
	public String getUpdateTime() {
		return updateTime;
	}
	public void setUpdateTime(String updateTime) {
		this.updateTime = updateTime;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "Student [studentId=" + studentId + ", stuName=" + stuName
				+ ", stuGendar=" + stuGendar + ", stuBirth=" + stuBirth
				+ ", mobile=" + mobile + ", idcard=" + idcard + ", createTime="
				+ createTime + ", updateTime=" + updateTime + "]";
	}
}
