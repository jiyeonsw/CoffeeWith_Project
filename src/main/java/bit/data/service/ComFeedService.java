package bit.data.service;

import bit.data.dao.ComFeedDaoInter;
import bit.data.dto.ComFeedDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class ComFeedService implements ComFeedServiceInter{

    @Autowired
    ComFeedDaoInter daoInter;
    @Override
    public int selectMaxNum() {
        return daoInter.selectMaxNum();
    }

    @Override
    public int selectTotalCount(String searchColumn, String searchWord) {
        Map<String, String> map=new HashMap<>();
        map.put("searchcolumn",searchColumn);
        map.put("searchword",searchWord);
        return daoInter.selectTotalCount(map);
    }

    @Override
    public ComFeedDto selectFeed(int num) {
        return daoInter.selectFeed(num);
    }

    @Override
    public List<ComFeedDto> searchFeedByTag(String searchColumn, String searchWord) {
        Map<String, String> map=new HashMap<>();
        map.put("searchcolumn",searchColumn);
        map.put("searchword",searchWord);
        return daoInter.searchFeedByTag(map);
    }

    @Override
    public void insertFeed(ComFeedDto dto) {
        daoInter.insertFeed(dto);
    }

    @Override
    public void updateFeed(ComFeedDto dto) {
        daoInter.updateFeed(dto);
    }

    @Override
    public void deleteFeed(int num) {
        daoInter.deleteFeed(num);
    }

    @Override
    public void updateLikes(int num) {
        daoInter.updateLikes(num);
    }
}
