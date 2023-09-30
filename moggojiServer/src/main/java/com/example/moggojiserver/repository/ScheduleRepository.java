package com.example.moggojiserver.repository;

import com.example.moggojiserver.model.ScheduleItem;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ScheduleRepository extends JpaRepository<ScheduleItem, Long> {
}
