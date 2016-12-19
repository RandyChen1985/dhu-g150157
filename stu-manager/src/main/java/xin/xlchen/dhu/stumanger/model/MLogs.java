/****************************************************************
 *  系统名称  ： 'stu-manager'
 *  文件名    ： Logs.java
 * **************************************************************
 *  注意： 本内容仅限于DUH-G150157使用，禁止转发
 ****************************************************************/
package xin.xlchen.dhu.stumanger.model;

import java.io.Serializable;

/**
 * 类说明
 * @简述： 操作日志表
 * @作者： 陈小龙
 * @版本： 1.0
 * @邮箱： cexlong@163.com
 * @修改时间：2016-11-28 下午8:45:47
 */
public class MLogs implements Serializable {
	private static final long serialVersionUID = 5812838750368940740L;
	private String id; 
	private String username;	//账号名
	private String logtype;		//日志类别
	private int logstatus;		//状态,0:成功,1:失败
	private String logip;		//登录IP
	private String logtime;		//登录时间
	private String notes;		//备注
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getLogtype() {
		return logtype;
	}
	public void setLogtype(String logtype) {
		this.logtype = logtype;
	}
	public int getLogstatus() {
		return logstatus;
	}
	public void setLogstatus(int logstatus) {
		this.logstatus = logstatus;
	}
	public String getLogip() {
		return logip;
	}
	public void setLogip(String logip) {
		this.logip = logip;
	}
	public String getLogtime() {
		return logtime;
	}
	public void setLogtime(String logtime) {
		this.logtime = logtime;
	}
	public String getNotes() {
		return notes;
	}
	public void setNotes(String notes) {
		this.notes = notes;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "Logs [id=" + id + ", username=" + username + ", logtype="
				+ logtype + ", logstatus=" + logstatus + ", logip=" + logip
				+ ", logtime=" + logtime + ", notes=" + notes + "]";
	}
}
