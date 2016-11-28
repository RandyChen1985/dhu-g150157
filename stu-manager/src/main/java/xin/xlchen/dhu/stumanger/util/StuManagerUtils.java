/****************************************************************
 *  系统名称  ： 'stu-manager'
 *  文件名    ： StuManagerUtils.java
 * **************************************************************
 *  注意： 本内容仅限于DUH-G150157使用，禁止转发
 ****************************************************************/
package xin.xlchen.dhu.stumanger.util;

import org.apache.commons.codec.digest.DigestUtils;

/**
 * 类说明
 * @简述： 工具类
 * @作者： 陈小龙
 * @版本： 1.0
 * @邮箱： cexlong@163.com
 * @修改时间：2016-11-26 下午2:16:47
 */
public class StuManagerUtils {

	/**
	 * 双md5加密密码
	 * @param password
	 * @return
	 */
	public static String md5Password(String password) {
		return DigestUtils.md5Hex(DigestUtils.md5Hex(password));
	}
}
