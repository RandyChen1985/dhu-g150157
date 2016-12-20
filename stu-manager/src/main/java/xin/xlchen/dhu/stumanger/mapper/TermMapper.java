package xin.xlchen.dhu.stumanger.mapper;

import java.util.List;

import xin.xlchen.dhu.stumanger.model.MCourse;
import xin.xlchen.dhu.stumanger.model.MRelTermCourse;
import xin.xlchen.dhu.stumanger.model.MTerm;


public interface TermMapper {
    public List<MTerm> findAllTerms();
    public MTerm getTermbyId(String termId);
    public void addTerm(MTerm term);
    public void editTerm(MTerm term);
    public void deleteTerm(String termId);
    ///
    public List<MCourse> getCourseInTerm(String termId);
    public List<MCourse> getCourseNotInTerm(String termId);
    public int getUsedTermCount(String termId);
    
    ////
    public void addTermCourse(MRelTermCourse mRelTermCourse);
    public void removeTermCourse(MRelTermCourse mRelTermCourse);
}
