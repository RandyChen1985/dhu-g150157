package xin.xlchen.dhu.stumanger.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import xin.xlchen.dhu.stumanger.mapper.ScoreMapper;
import xin.xlchen.dhu.stumanger.model.MResult;
import xin.xlchen.dhu.stumanger.model.MScore;


@Service
public class ScoreService {

    @Autowired
    private ScoreMapper scoreMapper;
    
    /**
     * 获取所有学生分数数据
     * @return
     */
    public List<MScore> findAllScores(){
    	return scoreMapper.findAllScores();
    }
    
    /**
     * 查询单个指定的分数对象
     * @param termId
     * @param courseId
     * @param stuId
     * @return
     */
    private MScore getMScoreByPkInfo(String termId,String courseId,String stuId) {
    	List<MScore> list = findAllScores();
    	if (list != null ) {
    		for(MScore score : list) {
    			if(score.getTermId().equalsIgnoreCase(termId)
    					&& score.getCourseId().equalsIgnoreCase(courseId)
    					&& score.getStudentId().equalsIgnoreCase(stuId)) {
    				return score;
    			}
    		}
    	} 
    	return null;
    }
    
    /**
     * 添加学生的分数信息
     * @param score
     * @return
     */
    public MResult addStudentScore(MScore score){
    	MResult mResult = new MResult();
    	try {
    		MScore tempMScore = getMScoreByPkInfo(score.getTermId(),score.getCourseId(),score.getStudentId());
    		//判断学生分数对象是否已存在
    		if (tempMScore != null) {
    			mResult.setSuccess(false);
    			mResult.setErrorMsg("学生分数对象["+tempMScore.getStuName()+"]已经存在,无需重复添加!");
    		} else {
    			//编辑
    			scoreMapper.addStudentScore(score);
    		}
		} catch (Exception e) {
			mResult.setSuccess(false);
			mResult.setErrorMsg(e.getMessage());
		}
        return mResult;
    }
    
    /**
     * 修改学生的分数信息
     * @param score
     * @return
     */
    public MResult editStudentScore(MScore score){
    	MResult mResult = new MResult();
    	try {
    		//编辑
			scoreMapper.editStudentScore(score);
    	} catch (Exception e) {
    		mResult.setSuccess(false);
    		mResult.setErrorMsg(e.getMessage());
    	}
    	return mResult;
    }
}
