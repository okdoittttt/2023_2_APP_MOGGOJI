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
import org.springframework.web.multipart.MultipartFile;


@Service
@RequiredArgsConstructor
public class UserService {

    private final UserRepository userRepository;

    // encoded password save (아마 hash 값인듯?)
    private final BCryptPasswordEncoder encoder;

    @Value("1q2w3e4r")
    private String key;
    private Long expireTimeMs = 1000 * 60 * 60l;

    // Image Path
//    @Value("${}")
//    private String uploadDir;

    public String join(String id, String pwd, String email, String name, String gender, int age) {

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
                .name(name)
                .gender(gender)
                .age(age)
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
        String token = JwtTokenUtil.createToken(selectedUser.getNumber(), selectedUser.getId(), selectedUser.getEmail(), selectedUser.getName(), selectedUser.getGender(), selectedUser.getAge(), selectedUser.getImageNumber(), key,  expireTimeMs);

        return token;
    }

    public String updateImgid(String userId, long imgId) {
        UserItem user = userRepository.findById(userId)
                .orElseThrow(() -> new AppException(ErrorCode.USERNAME_NOTFOUND, userId));

        user.setImageNumber(imgId);
        userRepository.save(user);

        return "유저 이미지 업데이트 완료";
    }
}
