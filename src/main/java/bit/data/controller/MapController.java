package bit.data.controller;

import bit.data.dto.CafeDto;
import bit.data.service.CafeServiceInter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/map")
public class MapController {

    @Autowired
    CafeServiceInter cafeService;
    @GetMapping("/mainmap")
    public String mainmap(Model model)
    {
        List<CafeDto> list=cafeService.selectAllCafe();
        System.out.println(list.size());
        model.addAttribute("list",list);
        return "/bit/map/mainmap";
    }

    @GetMapping("/list")
    public String list(Model model)
    {
        return "/bit/map/mainmap";
    }
}