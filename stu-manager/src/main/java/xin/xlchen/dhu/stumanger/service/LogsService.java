package xin.xlchen.dhu.stumanger.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import xin.xlchen.dhu.stumanger.mapper.LogsMapper;
import xin.xlchen.dhu.stumanger.model.Logs;


@Service
public class LogsService {
	private static Logger logger = Logger.getLogger(LogsService.class);
    @Autowired
    private LogsMapper logsMapper;
    
    /**
     * 获取所有操作日志
     * @return
     */
    public List<Logs> getAllLogs(){
    	//查询数据
    	return logsMapper.findAllLogs();
    }

    /**
     * 保存日志
     * @param logs
     */
    public void saveLogs(Logs logs) {
    	logsMapper.saveLogs(logs);
    	logger.info("[saveLogs]日志保存成功,logs:" + logs.toString());
    }
}
