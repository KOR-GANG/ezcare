package com.ezcare.biz;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

@Controller
public class DicomController {

    @Value("${dicom.folder.path}")
    private String dicomFolderPath;

    @GetMapping("/dicomFiles")
    public String getDicomFiles(Model model) {
        File folder = new File(dicomFolderPath);
        File[] listOfFiles = folder.listFiles();
        List<String> fileNames = new ArrayList<>();

        if (listOfFiles != null) {
            for (File file : listOfFiles) {
                if (file.isFile() && file.getName().endsWith(".dcm")) { // DICOM 파일 필터링
                    fileNames.add(file.getName());
                }
            }
        }

        model.addAttribute("fileNames", fileNames);
        return "dicomViewer";
    }
}