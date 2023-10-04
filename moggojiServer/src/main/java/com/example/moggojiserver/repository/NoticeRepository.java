package com.example.moggojiserver.repository;

import com.example.moggojiserver.model.NoticeItem;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface NoticeRepository extends JpaRepository<NoticeItem, Long> {

    List<NoticeItem> findByCategory(String category);
}
