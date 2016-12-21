package xin.xlchen.dhu.stumanger.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import xin.xlchen.dhu.stumanger.mapper.ReportMapper;
import xin.xlchen.dhu.stumanger.model.MRptTermCourseScore;


@Service
public class ReportService {

    @Autowired
    private ReportMapper reportMapper;
    
    
    /**
     * 获取所有学籍#课程分数分布
     * @return
     */
    public List<MRptTermCourseScore> findRptTermCourseScores(){
    	return reportMapper.findRptTermCourseScores();
    }

   
}
