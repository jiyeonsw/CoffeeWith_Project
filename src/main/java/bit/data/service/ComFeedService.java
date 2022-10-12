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
    public ComFeedDto selectFeed(int fd_id) {
        return daoInter.selectFeed(fd_id);
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
    public void deleteFeed(int fd_id) {
        daoInter.deleteFeed(fd_id);
    }

    @Override
    public void updateLikes(int fd_id) {
        daoInter.updateLikes(fd_id);
    }

    @Override
    public void insertPhoto(ComFeedDto dto) {
        daoInter.insertPhoto(dto);
    }
}
