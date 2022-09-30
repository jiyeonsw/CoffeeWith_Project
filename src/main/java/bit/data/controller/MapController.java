package bit.data.controller;

import bit.data.dto.CafeDto;
import bit.data.service.CafeServiceInter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/map")
public class MapController {

    @Autowired
    CafeServiceInter cafeService;
    @GetMapping("/mainmap")
    public String mainmap()
    {
        return "/bit/map/mainmap";
    }

    @GetMapping("/list")
    public List<CafeDto>list()
    {
        return cafeService.selectAllCafe();
    }
}