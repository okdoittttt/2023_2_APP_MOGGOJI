package com.example.moggojiserver.User;

import org.apache.catalina.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<UserItem, Long> {
    UserItem findByEmail(String Email);
//    UserItem findByEmailAndPassword(String email, String pwd);
}
