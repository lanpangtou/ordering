package cn.lanpangtou.service.impl;
import cn.lanpangtou.service.UploadService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.net.URL;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.Arrays;
import java.util.List;

@Service
public class UploadServiceImpl implements UploadService {

    //允许上传的图片类型
    private static final List<String> ALLOW_TYPES = Arrays.asList("image/jpeg","image/bmp","image/png");
    public String uploadImage(MultipartFile file) throws IOException{
        //保存
            //校验文件类型
            String contentType = file.getContentType();
            if(!ALLOW_TYPES.contains(contentType)){
                throw new IOException();
            }
            //校验文件内容
            BufferedImage image = ImageIO.read(file.getInputStream());
            if (image == null){
                throw new IOException();
            }
        //image保存路径
        String classpath = this.getClass().getResource("/").getPath().replaceFirst("/", "");
        String docRoot = classpath.replaceAll("WEB-INF/classes/", "img");
        //保存

        File dest = new File(docRoot,file.getOriginalFilename());
        file.transferTo(dest);
        //返回路径
        return "http://localhost:8080/img/"+file.getOriginalFilename();

    }

}
