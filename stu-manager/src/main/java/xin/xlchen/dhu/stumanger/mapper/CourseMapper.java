package xin.xlchen.dhu.stumanger.mapper;

import java.util.List;

import xin.xlchen.dhu.stumanger.model.MCourse;


public interface CourseMapper {
    public List<MCourse> findAllCourses();
    public MCourse getCoursebyId(String courseId);
    public void addCourse(MCourse course);
    public void editCourse(MCourse course);
    public void deleteCourse(String courseId);
}
