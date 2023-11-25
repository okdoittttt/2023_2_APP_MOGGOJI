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
public class AnswerItem {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long number;

    private long surveyNumber;
    private int surveyType;
    private String surveyCreator;
    private String respondent;
    private String surveyTitle;


    private int answer1;
    private int answer2;
    private int answer3;
    private int answer4;
    private int answer5;
    private int answer6;
    private int answer7;
    private int answer8;
    private int answer9;
    private int answer10;
    private int answer11;
    private int answer12;
    private int answer13;
    private int answer14;
    private int answer15;
}
