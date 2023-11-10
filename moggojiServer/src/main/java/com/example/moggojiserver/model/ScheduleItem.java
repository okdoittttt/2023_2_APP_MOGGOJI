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

    public ScheduleItem() {
    }

//    ========================================================================================================

    public long getNumber() {
        return number;
    }

    public String getTitle() {
        return title;
    }

    public String getWriter() {
        return writer;
    }

    public String getLocation() {
        return location;
    }

    public Date getDate() {
        return date;
    }

    public void setNumber(long number) {
        this.number = number;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public void setWriter(String writer) {
        this.writer = writer;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getFee() {
        return fee;
    }

    public void setFee(int fee) {
        this.fee = fee;
    }
}
