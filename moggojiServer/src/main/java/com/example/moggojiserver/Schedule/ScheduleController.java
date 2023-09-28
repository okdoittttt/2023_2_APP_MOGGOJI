package com.example.moggojiserver.Schedule;

import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping(path = "/schedule")
public class ScheduleController {

    @Autowired
    private ScheduleRepository scheduleRepository;

    @GetMapping
    public List<ScheduleItem> getSchedule() {
        return scheduleRepository.findAll();
    }

    @PostMapping(value = "/addTask")
    public ScheduleItem addTask(@Valid @RequestBody ScheduleItem scheduleItem) {
        System.out.print(scheduleItem);
        return scheduleRepository.save(scheduleItem);
    }

}
