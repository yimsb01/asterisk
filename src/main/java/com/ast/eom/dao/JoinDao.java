package com.ast.eom.dao;

import java.util.List;
import java.util.Map;
import com.ast.eom.domain.Member;
import com.ast.eom.domain.Parents;
import com.ast.eom.domain.WantedLesson;

public interface JoinDao {
  int insert(Member member) throws Exception;
  int teacherInsert(Map<String, Object> params) throws Exception;
  int parentsInsert(Parents joinedParents);
  int studentInsert(Map<String, Object> params);
  int checkOverId(String id) throws Exception;
  int checkOverEmail(String email) throws Exception;
  int checkOverTel(String tel) throws Exception;
  int updateCheck(String key) throws Exception;
  int checkOverAccountNo(String accountno) throws Exception;
  int insertForStudentAndTeacher(Member member);
  int wantedLessonFotStudentInsert(WantedLesson wantedLesson);
  int teacherSchoolsInsert(Map<String, Object> schoolParams);
  int teacherSubjectInsert(Map<String, Object> subjectParams);
  int bindStudentAndParents(Map<String, Object> parentsMap);
  List<Member> checkOverChildId(String id);
  boolean checkOverKey(String key);
}