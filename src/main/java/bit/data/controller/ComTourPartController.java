package bit.data.controller;


import bit.data.dto.ComTourAnsDto;
import bit.data.dto.ComTourPartDto;
import bit.data.service.ComTourPartServiceInter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class ComTourPartController {
    @Autowired
    ComTourPartServiceInter partService;

    @PostMapping("/part/insert")
    public String insert(ComTourPartDto dto) {
        System.out.println(dto.getTr_id());
        System.out.println(dto.getUr_id());
        partService.insertPart(dto);


        return "/bit/comtour/comtour_list";
    }
}
