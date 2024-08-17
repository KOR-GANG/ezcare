package com.ezcare.biz;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import java.io.File;
import java.io.IOException;
import java.util.List;

@Controller
public class UploadController {

    @RequestMapping("/upload")
    public String uploadPage() {
        return "upload";
    }

    @PostMapping("/upload")
    public String uploadFiles(MultipartHttpServletRequest request, Model model) {
        List<MultipartFile> files = request.getFiles("files");
        String uploadDir = request.getSession().getServletContext().getRealPath("/resources/dicomFiles/");
        //C:\DEV\eclipse-workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\Project\resources\dicomFiles
        System.out.println("Upload directory: " + uploadDir);
        
        File dir = new File(uploadDir);
        if (!dir.exists()) {
            dir.mkdirs();
        }

        try {
            for (MultipartFile file : files) {
                String filePath = uploadDir + file.getOriginalFilename();
                File dest = new File(filePath);
                file.transferTo(dest);
            }
            model.addAttribute("message", "Files uploaded successfully!");
        } catch (IOException e) {
            e.printStackTrace();
            model.addAttribute("message", "Failed to upload files.");
        }

        return "test3";
    }
}