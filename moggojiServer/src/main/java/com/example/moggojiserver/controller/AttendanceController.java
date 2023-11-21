package com.example.moggojiserver.controller;

import com.example.moggojiserver.model.ScheduleItem;
import com.example.moggojiserver.repository.ScheduleRepository;
import com.example.moggojiserver.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.Random;

@RestController
@RequiredArgsConstructor
@RequestMapping("/attendance")
public class AttendanceController {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private ScheduleRepository scheduleRepository;

    private int randomNumber;
    // 출석 체크에 필요한 랜덤한 3자리 숫자 반환
    @GetMapping("generateNumber")
    public int generateNumber() {
        Random random = new Random();

        randomNumber = random.nextInt(900)+100; // 100부터 999까지 랜덤한 숫자 생성

        return randomNumber;
    }

    @PostMapping("/checkNumber/{postNumber}")
    public boolean checkNumber(@PathVariable int postNumber){
        return postNumber == randomNumber;
    }

    @PostMapping("recordName/{id}/{userName}")
    public ResponseEntity<String> recordName(@PathVariable long id, @PathVariable String userName) {
        ScheduleItem scheduleItem = scheduleRepository.findById(id).orElseThrow(() -> new RuntimeException("해당 id가 존재하지 않음."));

        // 현재 참가자 값 가져오기
        String currentParticipantName = scheduleItem.getParticipantName();

        // 새로운 참가자 이름을 기존 참가지 뒤에 더하기
        String updatedParticipantName = currentParticipantName + ", " + userName;

        scheduleItem.setParticipantName(updatedParticipantName);

        scheduleRepository.save(scheduleItem);

        return ResponseEntity.ok("참가 인원 업데이트 완료");
    }


}
