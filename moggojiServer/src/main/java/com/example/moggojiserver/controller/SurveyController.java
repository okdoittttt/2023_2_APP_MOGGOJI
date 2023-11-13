package com.example.moggojiserver.controller;

import com.example.moggojiserver.model.SurveyItem;
import com.example.moggojiserver.repository.SurveyRepository;
import com.example.moggojiserver.service.SurveyService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;

@RestController
@RequiredArgsConstructor
@RequestMapping("/survey")
public class SurveyController {

    // 추후 세부 작업에 사용
    private final SurveyService surveyService;

    @Autowired
    private SurveyRepository surveyRepository;

    @GetMapping(value = "getAllSurvey")
    public List<SurveyItem> getAllSurvey() {
        return surveyRepository.findAll();
    }

    @PostMapping("addSurvey")
    public SurveyItem addSurvey(@Valid @RequestBody SurveyItem dto) {
        return surveyRepository.save(dto);
    }

    @GetMapping(value = "getSurveyByNumber/{survey_number}")
    public List<SurveyItem> findSurveyByNumber(@PathVariable int survey_number) {
        List<SurveyItem> surveyItems = surveyRepository.findById(survey_number);

        return surveyItems;
    }
}
