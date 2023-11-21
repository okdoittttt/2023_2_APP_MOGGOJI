package com.example.moggojiserver.repository;

import com.example.moggojiserver.model.ScheduleItem;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface ScheduleRepository extends JpaRepository<ScheduleItem, Long> {

    Optional<ScheduleItem> findById(long number);
    List<ScheduleItem> findByParticipantName(String participantName);
}
