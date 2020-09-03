package cn.lanpangtou.web;

import cn.lanpangtou.service.UploadService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.util.DigestUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;

@RestController
@RequestMapping("upload")
public class UploadController {

    @Autowired
    private UploadService uploadService;

    @RequestMapping("image")
    public @ResponseBody String uploadImage(MultipartFile file) throws IOException {
        System.out.println(file);
        System.out.println(file instanceof MultipartFile);
        return uploadService.uploadImage(file);

    }


}
