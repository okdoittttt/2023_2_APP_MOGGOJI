package com.example.moggojiserver.controller;

import com.example.moggojiserver.model.AnswerItem;
import com.example.moggojiserver.repository.AnswerRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;
import java.util.Optional;

@RestController
@RequiredArgsConstructor
@RequestMapping("/answer")
public class AnserController {

    @Autowired
    private AnswerRepository answerRepository;

    @GetMapping(value = "/getAllAnswer")
    public List<AnswerItem> getAllAnser() {
        return answerRepository.findAll();
    }


    @PostMapping("/addAnswer")
    public AnswerItem addAnswer(@Valid @RequestBody AnswerItem dto) {
        return answerRepository.save(dto);
    }

    @GetMapping(value = "/getMyanswerByName/{respondent}")
    public Optional<AnswerItem> findMyanswerByName(@PathVariable String respondent) {
        Optional<AnswerItem> answerItems = answerRepository.findById(respondent);

        return answerItems;
    }
}
