package com.example.moggojiserver.controller;

import com.example.moggojiserver.model.ScheduleItem;
import com.example.moggojiserver.repository.ScheduleRepository;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping(path = "/schedule")
public class ScheduleController {

    @Autowired
    private ScheduleRepository scheduleRepository;

    @GetMapping(produces="application/json; charset=utf8")
    public List<ScheduleItem> getSchedule() {
        return scheduleRepository.findAll();
    }

    @PostMapping(value = "/addSchedule")
    public ScheduleItem addTask(@Valid @RequestBody ScheduleItem scheduleItem) {
        System.out.print(scheduleItem);
        return scheduleRepository.save(scheduleItem);
    }

}
