package com.example.moggojiserver.repository;

import com.example.moggojiserver.model.UserItem;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface UserRepository extends JpaRepository<UserItem, Long> {
    Optional<UserItem> findById(String id);
}
