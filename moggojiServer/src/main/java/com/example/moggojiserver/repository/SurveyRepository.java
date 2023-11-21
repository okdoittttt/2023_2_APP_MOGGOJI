package com.example.moggojiserver.repository;

import com.example.moggojiserver.model.SurveyItem;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface SurveyRepository extends JpaRepository<SurveyItem, Long> {
    List<SurveyItem> findBySurveyType(int surveyType);
    long countBySurveyType(int surveyType);
}
