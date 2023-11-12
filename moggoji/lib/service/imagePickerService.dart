import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

import 'globals.dart';

class ImagePickerService {

  ImagePicker picker = ImagePicker();

  Future<void> pickImage(String userId) async {
    final XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);
    print(pickedFile);

    if (pickedFile != null) {
      // 멀티파트 요청을 생성
      var request = http.MultipartRequest('POST', Uri.parse(imageAddURL));
      request.headers.addAll(headers);

      // 이미지 파일을 추가
      var fileStream = http.ByteStream(Stream.castFrom(pickedFile.openRead()));
      var length = await pickedFile.length();
      var multipartFile = http.MultipartFile(
        'image',
        fileStream,
        length,
        filename: pickedFile.path,
      );

      // userId 파라미터를 추가
      request.fields['id'] = userId;

      // 파일 및 파라미터를 요청에 추가
      request.files.add(multipartFile);

      // 요청 전송
      var response = await http.Response.fromStream(await request.send());

      // 서버 응답 확인
      if (response.statusCode == 200) {
        print('Uploaded!');
      } else {
        print('Failed to upload: ${response.statusCode}');
      }
    }
  }
}