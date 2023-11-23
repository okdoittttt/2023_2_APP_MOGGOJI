package com.example.moggojiserver.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.validation.constraints.NotNull;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;

import java.util.Date;


@Data
@Getter
@Setter
@Entity
public class ScheduleItem {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    public long number;

    @NotNull(message = "Title is required")
    private String title;

    @NotNull(message = "Writer is required")
    private String writer;

    @NotNull(message = "Location is required")
    private String location;

    @NotNull(message = "Date is required")
    private Date date;

    @NotNull(message = "content is required")
    private String content;

    @NotNull(message = "fee is required")
    private int fee;

    private String participantName;

    private String paricipiantList;
}
