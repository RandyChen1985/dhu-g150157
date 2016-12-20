package xin.xlchen.dhu.stumanger.mapper;

import java.util.List;

import xin.xlchen.dhu.stumanger.model.MScore;


public interface ScoreMapper {
    public List<MScore> findAllScores();
    //添加学生分数
    public void addStudentScore(MScore score);
    //修改学生分数
    public void editStudentScore(MScore score);
}
