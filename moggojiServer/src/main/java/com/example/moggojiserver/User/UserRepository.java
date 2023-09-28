package com.example.moggojiserver.User;

import org.apache.catalina.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface UserRepository extends JpaRepository<UserItem, Long> {

    List<UserItem> findByEmail(String email);
}
