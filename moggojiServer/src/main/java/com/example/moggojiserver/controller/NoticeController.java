package com.example.moggojiserver.controller;

import com.example.moggojiserver.model.NoticeItem;
import com.example.moggojiserver.repository.NoticeRepository;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping(path = "/notice")
public class NoticeController {

    @Autowired
    private NoticeRepository noticeRepository;

    @GetMapping(produces = "application/json; charset=utf8")
    public List<NoticeItem> getNotice() { return noticeRepository.findAll(); }

    @PostMapping(value = "/addNotice")
    public NoticeItem addNotice(@Valid @RequestBody NoticeItem noticeItem) {
        return noticeRepository.save(noticeItem);
    }


}
