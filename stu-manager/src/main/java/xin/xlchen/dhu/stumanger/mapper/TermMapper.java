package xin.xlchen.dhu.stumanger.mapper;

import java.util.List;

import xin.xlchen.dhu.stumanger.model.MTerm;


public interface TermMapper {
    public List<MTerm> findAllTerms();
    public MTerm getTermbyId(String termId);
    public void addTerm(MTerm term);
    public void editTerm(MTerm term);
    public void deleteTerm(String termId);
}
