package com.example.moggojiserver.repository;

import com.example.moggojiserver.model.NoticeItem;
import org.springframework.data.jpa.repository.JpaRepository;

public interface NoticeRepository extends JpaRepository<NoticeItem, Long> {
}
