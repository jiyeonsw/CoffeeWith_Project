package bit.data.controller;


import bit.data.dto.ComTourAnsDto;
import bit.data.service.ComTourAnsServiceInter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@Controller
public class ComTourAnsController {
    @Autowired
    ComTourAnsServiceInter ansService;


    @PostMapping("/answer1/insert")
    public String insert(ComTourAnsDto dto) {
      ansService.insertAns(dto);
      int a = dto.getTm_id();
      System.out.println(a);
        return "/bit/comtour/comtour_list";
    }

    @GetMapping("/answer1/list")
    @ResponseBody
    public List<ComTourAnsDto> list(int tr_id)
    {
        System.out.println(ansService.getAllAnsList(tr_id));
        return ansService.getAllAnsList(tr_id);
    }

}
