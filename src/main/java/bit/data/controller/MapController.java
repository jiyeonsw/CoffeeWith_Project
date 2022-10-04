package bit.data.controller;

import bit.data.dto.CafeDto;
import bit.data.service.CafeServiceInter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/map")
public class MapController {

    @Autowired
    CafeServiceInter cafeService;

    @GetMapping("/mainmap")
    public String mainmap(Model model) {
        List<CafeDto> list = cafeService.selectAllCafe();
        model.addAttribute("list", list);
        return "/bit/map/mainmap";
    }

    @GetMapping("/list")
    public String list(Model model) {
        return "/bit/map/mainmap";
    }

    @GetMapping("/searchword")
    @ResponseBody
    public List<CafeDto> searchcafe(@RequestParam(value = "searchword", required = false) String sw) {
        List<CafeDto> list =cafeService.selectSearchCafe(sw);
        return list;
    }
}