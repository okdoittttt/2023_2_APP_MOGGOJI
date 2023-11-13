package com.example.moggojiserver.model;

import lombok.*;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Builder
@Entity
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class SurveyItem {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long survey_number;

    private int survey_type;        // 동의 또는 비동의 설문 조사 = 1, OX 설문 조사 = 2
    private String survey_title;    // 설문 제목
    private String survey_creator;  // 설문 작성자

    // 최대 개수는 15개로 설정
    private String content1;
    private String content2;
    private String content3;
    private String content4;
    private String content5;
    private String content6;
    private String content7;
    private String content8;
    private String content9;
    private String content10;
    private String content11;
    private String content12;
    private String content13;
    private String content14;
    private String content15;
}
