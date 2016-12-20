package xin.xlchen.dhu.stumanger.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import xin.xlchen.dhu.stumanger.mapper.TermMapper;
import xin.xlchen.dhu.stumanger.model.MCourse;
import xin.xlchen.dhu.stumanger.model.MRelTermCourse;
import xin.xlchen.dhu.stumanger.model.MResult;
import xin.xlchen.dhu.stumanger.model.MTerm;


@Service
public class TermService {

    @Autowired
    private TermMapper termMapper;
    
    /**
     * 根据学年ID获取对象
     * @param termId
     * @return
     */
    public MTerm getTermbyId(String termId){
        return termMapper.getTermbyId(termId);
    }
    
    /**
     * 获取所有学年数据
     * @return
     */
    public List<MTerm> findAllTerms(){
    	return termMapper.findAllTerms();
    }

    /**
     * 根据termId删除对象
     * @param termId
     * @return
     */
    public MResult deleteTerm(String termId){
    	MResult mResult = new MResult();
    	try {
    		if (termMapper.getUsedTermCount(termId) > 0) {
    			///学籍已在使用中,不允许删除
    			mResult.setSuccess(false);
    			mResult.setErrorMsg("学籍已在使用中,不允许删除!");
    		} else {
	        	//删除数据
	        	termMapper.deleteTerm(termId);
	            //
	            mResult.setSuccess(true);
    		}
		} catch (Exception e) {
			mResult.setSuccess(false);
			mResult.setErrorMsg(e.getMessage());
		}
        return mResult;
    }
    
    
    /**
     * 添加学年对象
     * @param term
     * @return
     */
    public MResult addTerm(MTerm term){
    	MResult mResult = new MResult();
    	try {
    		//判断学年是否已存在
    		if (getTermbyId(term.getTermId()) != null) {
    			mResult.setSuccess(false);
    			mResult.setErrorMsg("学年["+term.getTermId()+"]已经存在,不能重复添加!");
    		} else {
    			//添加
    			termMapper.addTerm(term);
    		}
		} catch (Exception e) {
			mResult.setSuccess(false);
			mResult.setErrorMsg(e.getMessage());
		}
        return mResult;
    }
    
    /**
     * 编辑学年对象
     * @param term
     * @return
     */
    public MResult editTerm(MTerm term){
    	MResult mResult = new MResult();
    	try {
    		//判断学年对象是否已存在
    		if (getTermbyId(term.getTermId())  == null) {
    			mResult.setSuccess(false);
    			mResult.setErrorMsg("学年对象["+term.getTermId()+"]已经不存在!");
    		} else {
    			//编辑
    			termMapper.editTerm(term);
    		}
		} catch (Exception e) {
			mResult.setSuccess(false);
			mResult.setErrorMsg(e.getMessage());
		}
        return mResult;
    }
    
    /**
     * 查询指定学期已分配的课程列表
     * @return
     */
    public List<MCourse> getCourseInTerm(String termId){
    	return termMapper.getCourseInTerm(termId);
    }
    
    /**
     * 查询指定学期未分配的课程列表
     * @return
     */
    public List<MCourse> getCourseNotInTerm(String termId){
    	return termMapper.getCourseNotInTerm(termId);
    }
    
    
    /**
     * 学籍添加课程
     * @param mRelTermCourse
     */
    public MResult addTermCourse(MRelTermCourse mRelTermCourse) {
     	MResult mResult = new MResult();
    	try {
    		termMapper.addTermCourse(mRelTermCourse);
		} catch (Exception e) {
			mResult.setSuccess(false);
			mResult.setErrorMsg(e.getMessage());
		}
        return mResult;
    }
    
    /**
     * 学籍删除课程
     * @param mRelTermCourse
     */
    public MResult removeTermCourse(MRelTermCourse mRelTermCourse) {
      	MResult mResult = new MResult();
    	try {
    		termMapper.removeTermCourse(mRelTermCourse);
		} catch (Exception e) {
			mResult.setSuccess(false);
			mResult.setErrorMsg(e.getMessage());
		}
        return mResult;
    }
}
