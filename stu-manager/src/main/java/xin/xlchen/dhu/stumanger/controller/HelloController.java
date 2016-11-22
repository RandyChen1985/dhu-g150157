package xin.xlchen.dhu.stumanger.controller;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@ComponentScan
public class HelloController {
	
	@Value("${application.xiaolong:Hello World}")
	private String message = "Hello World";

    @RequestMapping("/hello")
    public String greeting(@RequestParam(value="name", required=false, defaultValue="World") String name, Model model) {
        model.addAttribute("name", name);
        return "hello";
    }
    
    
    @RequestMapping(value={"/test"})
	public String index(ModelMap model, HttpServletRequest request) {
    	 model.put("time", new Date());
         model.put("message", this.message);
		return "aaa";
	}
}
