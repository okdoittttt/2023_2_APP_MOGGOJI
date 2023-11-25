package com.example.moggojiserver.repository;

import com.example.moggojiserver.model.AnswerItem;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;
import java.util.List;

public interface AnswerRepository extends JpaRepository<AnswerItem, String> {
    Optional<AnswerItem> findById(String respondent);

    List<AnswerItem> findAllBySurveyNumber(long surveyNumber);

}
