/****************************************************************
 *  系统名称  ： 'stu-manager'
 *  文件名    ： MResult.java
 * **************************************************************
 *  注意： 本内容仅限于DUH-G150157使用，禁止转发
 ****************************************************************/
package xin.xlchen.dhu.stumanger.model;

import java.io.Serializable;

/**
 * 类说明
 * @简述： 操作结果
 * @作者： 陈小龙
 * @版本： 1.0
 * @邮箱： cexlong@163.com
 * @修改时间：2016-11-29 上午8:35:02
 */
public class MResult implements Serializable {
	private static final long serialVersionUID = 4479007985464777849L;
	private boolean success = true; //是否成功
	private String errorMsg = "操作成功!"; //错误消息
	public boolean isSuccess() {
		return success;
	}
	public void setSuccess(boolean success) {
		this.success = success;
	}
	public String getErrorMsg() {
		return errorMsg;
	}
	public void setErrorMsg(String errorMsg) {
		this.errorMsg = errorMsg;
	}
	@Override
	public String toString() {
		return "MResult [success=" + success + ", errorMsg=" + errorMsg + "]";
	}
}
