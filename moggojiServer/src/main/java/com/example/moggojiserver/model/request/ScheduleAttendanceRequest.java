package com.example.moggojiserver.model.request;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@AllArgsConstructor
@Getter
@Setter
public class ScheduleAttendanceRequest {
    public long number;
    private String title;
    private String writer;
    private String location;
    private Date date;
    private String content;
    private int fee;

    private String participantName1;
    private String participantName2;
    private String participantName3;
    private String participantName4;
    private String participantName5;
    private String participantName6;
    private String participantName7;
    private String participantName8;
    private String participantName9;
    private String participantName10;
}
