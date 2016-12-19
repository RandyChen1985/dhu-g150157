/****************************************************************
 *  系统名称  ： 'stu-manager'
 *  文件名    ： LogsMapper.java
 * **************************************************************
 *  注意： 本内容仅限于DUH-G150157使用，禁止转发
 ****************************************************************/
package xin.xlchen.dhu.stumanger.mapper;

import java.util.List;

import xin.xlchen.dhu.stumanger.model.MLogs;

/**
 * 类说明
 * @简述： 日志表DAO
 * @作者： 陈小龙
 * @版本： 1.0
 * @邮箱： cexlong@163.com
 * @修改时间：2016-11-28 下午8:49:42
 */
public interface LogsMapper {
	 public List<MLogs> findAllLogs();
	 public void saveLogs(MLogs logs);
}
