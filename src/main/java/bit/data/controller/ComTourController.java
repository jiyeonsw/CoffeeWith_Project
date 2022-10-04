package bit.data.controller;

import bit.data.dto.ComTourDto;
import bit.data.service.ComTourServiceInter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/comtour")
public class ComTourController {
    @Autowired
    ComTourServiceInter comTourService;

    @GetMapping("/list")
    public String comtourlist(){
        return "/bit/comtour/comtour_list";
    }

    @GetMapping("/form")
    public String comtourform(){
        return "/bit/comtour/comtour_form";
    }

    @PostMapping("/insert")
    public String insert(ComTourDto dto){
        System.out.println(dto);
        comTourService.insertComTour(dto);

        return "redirect:list";
    }
}
