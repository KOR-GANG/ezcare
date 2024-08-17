package com.ezcare.biz;

import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

//import com.ezcare.biz.sick.SickVO;


@Controller
public class HomeController {
   
   @RequestMapping("/")
   public String login() {
      return "login";
   }   
   @RequestMapping("/myPage")
   public String myPage() {
      return "myPage";
   }
  
   @RequestMapping("/patientChart")
   public String patientChart() {
      return "patientChart";
   }
   
   @RequestMapping("/test")
   public String test() {
      return "test";
   }
   
   @RequestMapping("/test2")
   public String test2() {
	   return "test2";
   }
   
   @RequestMapping("/test3")
   public String test3() {
      return "test3";
   }
   
   @RequestMapping("/test4")
   public String test4() {
      return "test4";
   }
   
   @RequestMapping("/testInput")
   public String testInput() {
      return "testInput";
   }
}