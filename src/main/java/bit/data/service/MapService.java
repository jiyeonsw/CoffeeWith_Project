package bit.data.service;

import bit.data.dao.MapDaoInter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MapService implements MapServiceInter{

    @Autowired
    MapDaoInter mapdao;


}
