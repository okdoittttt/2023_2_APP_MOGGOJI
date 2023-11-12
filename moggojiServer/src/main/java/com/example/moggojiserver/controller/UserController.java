package com.example.moggojiserver.controller;

import com.example.moggojiserver.model.UserJoinRequest;
import com.example.moggojiserver.model.UserLoginRequest;
import com.example.moggojiserver.repository.UserRepository;
import com.example.moggojiserver.service.UserService;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequiredArgsConstructor
@RequestMapping("/users")
public class UserController {

    private final UserService userService;

    @PostMapping("/register")
    public ResponseEntity<String> join(@Valid @RequestBody UserJoinRequest dto) {

        userService.join(dto.getId(), dto.getPwd(), dto.getEmail(), dto.getName(), dto.getGender(), dto.getAge());
        return ResponseEntity.ok().body("회원가입 성공");
    }

    @PostMapping("/login")
    public ResponseEntity<String> login(@Valid @RequestBody UserLoginRequest dto) {

        String token = userService.login(dto.getId(), dto.getPwd());
        return ResponseEntity.ok().body(token);
    }
    @PostMapping("/logout")
    public ResponseEntity<String> logout(HttpServletRequest request) {
        // 세션 무효화
        SecurityContextHolder.clearContext();
        return ResponseEntity.ok().body("로그아웃 성공");
    }

//    // 클라이언트에서 토큰을 어떻게 전달하는지에 따라 수정이 필요할 수 있습니다.
//    private String extractTokenFromRequest(HttpServletRequest request) {
//        // 헤더나 쿠키 등에서 토큰을 추출하는 코드를 작성하세요.
//        // 예시: request.getHeader("Authorization");
//        return "yourToken";
//    }
}
