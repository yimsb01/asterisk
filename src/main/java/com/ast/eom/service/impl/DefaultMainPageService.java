package com.ast.eom.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ast.eom.dao.AdminDao;
import com.ast.eom.dao.MainPageDao;
import com.ast.eom.domain.Lesson;
import com.ast.eom.domain.Member;
import com.ast.eom.service.MainPageService;

@Service
public class DefaultMainPageService implements MainPageService {
  
  @Autowired
  MainPageDao mainPageDao;
  @Autowired
  AdminDao adminDao;
  
  @Override
  public Map<String, Object> getReviews() throws Exception {
    Map<String, Object> reviewMap = new HashMap<>();
    List<Lesson> randomLessons = mainPageDao.getRandomLessons();
    List<Member> randomMembers = new ArrayList<>();
    
    for (Lesson lesson : randomLessons) {
      randomMembers.add(adminDao.getMember(lesson.getStudentNo()));
      
      if (lesson.getSubjectNo() % 3 == 1)
        lesson.setSubjectName("국어");
      else if (lesson.getSubjectNo() % 3 == 2)
        lesson.setSubjectName("영어");
      else if (lesson.getSubjectNo() % 3 == 0)
        lesson.setSubjectName("수학");
      
      if (lesson.getSubjectNo() <= 3)
        lesson.setSchoolName("초등");
      else if (lesson.getSubjectNo() <= 6)
        lesson.setSchoolName("중등");
      else if (lesson.getSubjectNo() <= 9)
        lesson.setSchoolName("고등");
      
    }
    
    
    reviewMap.put("randomLessons", randomLessons);
    reviewMap.put("randomMembers", randomMembers);
    
    return reviewMap;
  }
}
