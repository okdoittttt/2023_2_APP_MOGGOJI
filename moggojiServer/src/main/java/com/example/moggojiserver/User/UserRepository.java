package com.example.moggojiserver.User;

import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<UserItem, Long> {
    UserItem findById(String id);
}
