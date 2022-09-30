package bit.data.controller;

import bit.data.service.MapServiceInter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping ("/map")
public class MapController {

    @Autowired
    MapServiceInter mapservice;

    @GetMapping("/mainmap")
    public String mainmap()
    {
        return "/bit/map/mainmap";
    }

}