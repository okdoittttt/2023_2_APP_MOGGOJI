package com.example.moggojiserver.Task;

import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<UserItem, Long> {
}
