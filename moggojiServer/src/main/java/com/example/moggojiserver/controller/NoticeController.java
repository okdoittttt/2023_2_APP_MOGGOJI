package com.example.moggojiserver.controller;

import com.example.moggojiserver.model.NoticeItem;
import com.example.moggojiserver.repository.NoticeRepository;
import javax.validation.Valid;
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

    @GetMapping(value = "getNoticeByCategory/{category}")
    public List<NoticeItem> findNoticeByCategory(@PathVariable String category) {
        System.out.println(category);
        List<NoticeItem> notices = noticeRepository.findByCategory(category);

        return notices;
    }


}
