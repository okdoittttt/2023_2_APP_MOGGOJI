package com.example.moggojiserver.service;

import com.example.moggojiserver.model.UserItem;
import com.example.moggojiserver.repository.UserRepository;
import com.example.moggojiserver.exception.AppException;
import com.example.moggojiserver.exception.ErrorCode;
import com.example.moggojiserver.utils.JwtTokenUtil;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;


@Service
@RequiredArgsConstructor
public class UserService {

    private final UserRepository userRepository;

    // encoded password save (아마 hash 값인듯?)
    private final BCryptPasswordEncoder encoder;

    @Value("${jwt.secret-key}")
    private String key;
    private Long expireTimeMs = 1000 * 60 * 60l;

    public String join(String id, String pwd, String email) {

        // userName 중복 체크
        userRepository.findById(id)
                .ifPresent(user -> {
                    throw new AppException(ErrorCode.USERNAME_DUPLICATED, id + "이 존재 합니다.");
                });

        // 저장
        UserItem user = UserItem.builder()
                .id(id)
                .pwd(encoder.encode(pwd))
                .email((email))
                .build();
        userRepository.save(user);

        return "SUCCESS";
    }

    public String login(String id, String pwd) {
        // userName invalid
        UserItem selectedUser = userRepository.findById(id)
                .orElseThrow(() ->new AppException(ErrorCode.USERNAME_NOTFOUND, id + "이 없습니다."));

        // password incorrect
        if(!encoder.matches(pwd, selectedUser.getPwd())) {
            throw new AppException(ErrorCode.INVALID_PASSWORD, "패스워드를 잘 못 입력했습니다.");
        }

        // Generate Token
        String token = JwtTokenUtil.createToken(selectedUser.getId(), selectedUser.getEmail(), key,  expireTimeMs);

        return token;
    }
}
