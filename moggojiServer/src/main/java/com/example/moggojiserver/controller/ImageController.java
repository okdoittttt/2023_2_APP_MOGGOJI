package com.example.moggojiserver.controller;

import com.example.moggojiserver.model.Image;
import com.example.moggojiserver.service.ImageService;
import com.example.moggojiserver.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.sql.rowset.serial.SerialException;
import java.io.IOException;
import java.sql.Blob;
import java.sql.SQLException;

@RestController
@RequestMapping(path = "/image")
public class ImageController {

    @Autowired
    private ImageService imageService;

    @Autowired
    private UserService userService;

    // display image
    @GetMapping("/display/{id}")
    public ResponseEntity<byte[]> displayImage(@PathVariable long id) throws IOException, SQLException
    {
        Image image = imageService.viewById(id);
        byte [] imageBytes = null;
        imageBytes = image.getImage().getBytes(1,(int) image.getImage().length());
        return ResponseEntity.ok().contentType(MediaType.IMAGE_JPEG).body(imageBytes);
    }

    // add image - post
    @PostMapping("/add")
    public String addImagePost(HttpServletRequest request,@RequestParam("id") String id ,@RequestParam("image") MultipartFile file) throws IOException, SerialException, SQLException
    {
        byte[] bytes = file.getBytes();
        Blob blob = new javax.sql.rowset.serial.SerialBlob(bytes);

        Image image = new Image();
        image.setImage(blob);
        long imgId = imageService.create(image);

        userService.updateImgid(id, imgId);

        return "redirect:/";
    }
}
