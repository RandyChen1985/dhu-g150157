/****************************************************************
 *  系统名称  ： 'stu-manager'
 *  文件名    ： MTerm.java
 * **************************************************************
 *  注意： 本内容仅限于DUH-G150157使用，禁止转发
 ****************************************************************/
package xin.xlchen.dhu.stumanger.model;

import java.io.Serializable;

/**
 * 类说明
 * @简述： 学年对象
 * @作者： 陈小龙
 * @版本： 1.0
 * @邮箱： cexlong@163.com
 * @修改时间：2016-12-19 下午4:08:58
 */
public class MTerm implements Serializable {
	private static final long serialVersionUID = -264638061643533246L;
	private String termId;		//学年ID
	private String termName;	//学年名称
	private String termNotes;	//学年备注
	private String createTime;	//添加时间
	private String createUser;	//添加人
	public String getTermId() {
		return termId;
	}
	public void setTermId(String termId) {
		this.termId = termId;
	}
	public String getTermName() {
		return termName;
	}
	public void setTermName(String termName) {
		this.termName = termName;
	}
	public String getTermNotes() {
		return termNotes;
	}
	public void setTermNotes(String termNotes) {
		this.termNotes = termNotes;
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
		return "MTerm [termId=" + termId + ", termName=" + termName
				+ ", termNotes=" + termNotes + ", createTime=" + createTime
				+ ", createUser=" + createUser + "]";
	}
	
}
